package com.adobe.creativesdk.foundation.internal.storage.photo;

import android.os.Handler;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudEndpoint;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudServiceSession;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudServiceType;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeEntitlementServices;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIMSEnvironment;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIdentityManagementService;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthKeychain;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCache;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCachePolicies;
import com.adobe.creativesdk.foundation.internal.cache.AdobeInvalidCacheSettingsException;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpRequest;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpRequestMethod;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpResponse;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpService;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpTaskHandle;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkRequestPriority;
import com.adobe.creativesdk.foundation.internal.net.IAdobeNetworkCompletionHandler;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.photo.util.AdobePhotoErrUtils;
import com.adobe.creativesdk.foundation.internal.photo.util.AdobePhotoUtils;
import com.adobe.creativesdk.foundation.internal.storage.model.services.AdobeStorageSession;
import com.adobe.creativesdk.foundation.internal.storage.model.services.AdobeStorageSession.IStorageResponseCallback;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageLastPathComponentUtil;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException.AdobeNetworkErrorCode;
import com.adobe.creativesdk.foundation.storage.AdobePhotoAsset;
import com.adobe.creativesdk.foundation.storage.AdobePhotoAssetRendition;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCatalog;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCatalog.AdobePhotoCatalogType;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCollection;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCollection.AdobePhotoCollectionFlag;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCollection.AdobePhotoCollectionSort;
import com.adobe.creativesdk.foundation.storage.AdobePhotoErrorCode;
import com.adobe.creativesdk.foundation.storage.AdobePhotoException;
import com.adobe.creativesdk.foundation.storage.AdobePhotoPage;
import com.adobe.creativesdk.foundation.storage.IAdobePhotoAssetsListRequestCompletionHandler;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobePhotoSession
  extends AdobeCloudServiceSession
{
  private static Map<AdobeNetworkHttpRequest, AdobeNetworkHttpTaskHandle> requestMap;
  protected boolean _cacheConfigured;
  
  public AdobePhotoSession(AdobeCloudEndpoint paramAdobeCloudEndpoint)
  {
    super(paramAdobeCloudEndpoint);
    setUpService();
    setDisconnectionNotifier(AdobeInternalNotificationID.AdobePhotoServiceDisconnectedNotification);
    setupOngoingConnectionTimer(15L, false);
    requestMap = new HashMap();
  }
  
  private AdobeNetworkException checkEntitlements()
  {
    Object localObject2 = null;
    AdobeEntitlementServices localAdobeEntitlementServices = AdobeEntitlementServices.getSharedServices();
    Object localObject1 = localObject2;
    if (localAdobeEntitlementServices.getServices() != null)
    {
      localObject1 = localObject2;
      if (localAdobeEntitlementServices.getServices().optJSONObject("lightroom") != null)
      {
        localObject1 = localObject2;
        if (!localAdobeEntitlementServices.getServices().optJSONObject("lightroom").optBoolean("entitled")) {
          localObject1 = new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorNotEntitledToService);
        }
      }
    }
    return localObject1;
  }
  
  private AdobePhotoException getPhotoErrorFromResponse(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse)
  {
    Object localObject;
    if (paramAdobeNetworkHttpResponse == null)
    {
      localObject = null;
      return localObject;
    }
    AdobePhotoException localAdobePhotoException = null;
    int i = paramAdobeNetworkHttpResponse.getStatusCode();
    if (i == 412) {
      localAdobePhotoException = AdobePhotoErrUtils.createPhotoError(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_CONFLICTING_CHANGES, paramAdobeNetworkHttpResponse.getUrl(), paramAdobeNetworkHttpResponse.getDataBytes(), paramAdobeNetworkHttpResponse.getStatusCode(), paramAdobeNetworkHttpResponse.getHeaders());
    }
    for (;;)
    {
      localObject = localAdobePhotoException;
      if (localAdobePhotoException != null) {
        break;
      }
      return AdobePhotoErrUtils.createPhotoError(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE, paramAdobeNetworkHttpResponse.getUrl(), paramAdobeNetworkHttpResponse.getDataBytes(), paramAdobeNetworkHttpResponse.getStatusCode(), paramAdobeNetworkHttpResponse.getHeaders());
      if (i == 507) {
        localAdobePhotoException = AdobePhotoErrUtils.createPhotoError(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_EXCEEDED_QUOTA, paramAdobeNetworkHttpResponse.getUrl(), paramAdobeNetworkHttpResponse.getDataBytes(), paramAdobeNetworkHttpResponse.getStatusCode(), paramAdobeNetworkHttpResponse.getHeaders());
      } else if (i == 415) {
        localAdobePhotoException = AdobePhotoErrUtils.createPhotoError(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_UNSUPPORTED_MEDIA, paramAdobeNetworkHttpResponse.getUrl(), paramAdobeNetworkHttpResponse.getDataBytes(), paramAdobeNetworkHttpResponse.getStatusCode(), paramAdobeNetworkHttpResponse.getHeaders());
      }
    }
  }
  
  private AdobeNetworkHttpTaskHandle getResponseFor(final AdobeNetworkHttpRequest paramAdobeNetworkHttpRequest, String paramString, byte[] paramArrayOfByte, final AdobeStorageSession.IStorageResponseCallback paramIStorageResponseCallback, Handler paramHandler)
  {
    AdobeNetworkHttpService localAdobeNetworkHttpService = getService();
    if (localAdobeNetworkHttpService == null)
    {
      if (paramIStorageResponseCallback != null)
      {
        paramAdobeNetworkHttpRequest = new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorNoCloudSpecified);
        if (paramHandler != null)
        {
          paramHandler.post(new Runnable()
          {
            public void run()
            {
              paramIStorageResponseCallback.onError(paramAdobeNetworkHttpRequest);
            }
          });
          return null;
        }
        paramIStorageResponseCallback.onError(paramAdobeNetworkHttpRequest);
        return null;
      }
      AdobeLogger.log(Level.ERROR, AdobeStorageSession.class.getSimpleName(), "Adobe cloud not specified.");
      return null;
    }
    final AdobeNetworkException localAdobeNetworkException = checkEntitlements();
    if (localAdobeNetworkException != null)
    {
      if (paramIStorageResponseCallback != null)
      {
        if (paramHandler != null)
        {
          paramHandler.post(new Runnable()
          {
            public void run()
            {
              paramIStorageResponseCallback.onError(localAdobeNetworkException);
            }
          });
          return null;
        }
        paramIStorageResponseCallback.onError(localAdobeNetworkException);
        return null;
      }
      AdobeLogger.log(Level.ERROR, getClass().getSimpleName(), "Entitlement Check failed", localAdobeNetworkException);
      return null;
    }
    paramIStorageResponseCallback = new IAdobeNetworkCompletionHandler()
    {
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        paramIStorageResponseCallback.onError(paramAnonymousAdobeNetworkException);
      }
      
      public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        AdobePhotoSession.requestMap.remove(paramAdobeNetworkHttpRequest);
        paramIStorageResponseCallback.onComplete(paramAnonymousAdobeNetworkHttpResponse);
      }
    };
    if (paramString == null)
    {
      paramAdobeNetworkHttpRequest.setBody(paramArrayOfByte);
      paramString = localAdobeNetworkHttpService.getResponseForDataRequest(paramAdobeNetworkHttpRequest, AdobeNetworkRequestPriority.NORMAL, paramIStorageResponseCallback, paramHandler);
    }
    for (;;)
    {
      requestMap.put(paramAdobeNetworkHttpRequest, paramString);
      return paramString;
      if (paramAdobeNetworkHttpRequest.getRequestMethod() == AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET) {
        paramString = localAdobeNetworkHttpService.getResponseForDownloadRequest(paramAdobeNetworkHttpRequest, paramString, AdobeNetworkRequestPriority.NORMAL, paramIStorageResponseCallback, paramHandler);
      } else {
        paramString = localAdobeNetworkHttpService.getResponseForUploadRequest(paramAdobeNetworkHttpRequest, paramString, AdobeNetworkRequestPriority.NORMAL, paramIStorageResponseCallback, paramHandler);
      }
    }
  }
  
  private AdobeNetworkHttpResponse getResponseFromError(AdobeNetworkException paramAdobeNetworkException)
  {
    if ((paramAdobeNetworkException.getData() == null) || (!paramAdobeNetworkException.getData().containsKey("Response"))) {
      return null;
    }
    return (AdobeNetworkHttpResponse)paramAdobeNetworkException.getData().get("Response");
  }
  
  protected static AdobeCloudEndpoint getServiceEndpoint()
  {
    Object localObject = null;
    AdobeAuthIMSEnvironment localAdobeAuthIMSEnvironment = AdobeAuthIdentityManagementService.getSharedInstance().getEnvironment();
    switch (92.$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment[localAdobeAuthIMSEnvironment.ordinal()])
    {
    default: 
      AdobeLogger.log(Level.ERROR, AdobePhotoSession.class.getSimpleName(), "An undefined authentication endpoint has been specified.");
    }
    for (;;)
    {
      try
      {
        localObject = new AdobeCloudEndpoint(null, new URL((String)localObject), AdobeCloudServiceType.AdobeCloudServiceTypePhoto);
        return localObject;
      }
      catch (MalformedURLException localMalformedURLException) {}
      localObject = "https://photo-api.adobe.io";
      continue;
      localObject = "https://photo-api-stage.adobe.io";
      continue;
      localObject = "https://api.oznext.com";
    }
    return null;
  }
  
  public static AdobeCloudServiceSession getSessionForCloudEndpoint(AdobeCloudEndpoint paramAdobeCloudEndpoint)
  {
    AdobeCloudEndpoint localAdobeCloudEndpoint = paramAdobeCloudEndpoint;
    if (paramAdobeCloudEndpoint == null) {
      localAdobeCloudEndpoint = getServiceEndpoint();
    }
    return new AdobePhotoSession(localAdobeCloudEndpoint);
  }
  
  private AdobePhotoPage parseNavigationLink(String paramString)
    throws AdobeCSDKException
  {
    if (paramString == null) {
      throw new AdobePhotoException(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE);
    }
    Matcher localMatcher = Pattern.compile("((captured|updated|order)_(before|after|since))=([a-zA-Z_0-9-:.%]+)", 2).matcher(paramString);
    if (localMatcher.find()) {
      return new AdobePhotoPage(paramString.substring(localMatcher.start(), localMatcher.end()));
    }
    throw new AdobePhotoException(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE);
  }
  
  public AdobeNetworkHttpTaskHandle downloadRendition(AdobePhotoAssetRendition paramAdobePhotoAssetRendition, final AdobePhotoAsset paramAdobePhotoAsset, final IAdobeGenericCompletionCallback<byte[]> paramIAdobeGenericCompletionCallback, final IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    Object localObject = getService();
    if (localObject == null)
    {
      if (paramIAdobeGenericErrorCallback != null)
      {
        paramAdobePhotoAssetRendition = new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorNoCloudSpecified);
        if (paramIAdobeGenericErrorCallback != null) {
          paramIAdobeGenericErrorCallback.onError(paramAdobePhotoAssetRendition);
        }
        return null;
      }
      AdobeLogger.log(Level.ERROR, AdobeStorageSession.class.getSimpleName(), "Adobe cloud not specified.");
      return null;
    }
    paramAdobePhotoAssetRendition = AdobeStorageLastPathComponentUtil.getRelativeTo(paramAdobePhotoAssetRendition.getDataPath().getPath(), ((AdobeNetworkHttpService)localObject).getBaseURL().toString());
    try
    {
      paramAdobePhotoAssetRendition = new URI(paramAdobePhotoAssetRendition).toURL();
      localObject = new AdobeNetworkHttpRequest();
      ((AdobeNetworkHttpRequest)localObject).setUrl(paramAdobePhotoAssetRendition);
      ((AdobeNetworkHttpRequest)localObject).setRequestMethod(AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET);
      paramAdobePhotoAssetRendition = getResponseFor((AdobeNetworkHttpRequest)localObject, null, null, new AdobeStorageSession.IStorageResponseCallback()
      {
        public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          AdobePhotoException localAdobePhotoException = null;
          if (paramAnonymousAdobeNetworkHttpResponse.getStatusCode() == 200) {
            AdobeLogger.log(Level.INFO, "PhotoSession:downloadRendition", String.format("Rendition retrieve for asset %s", new Object[] { paramAdobePhotoAsset.getName() }));
          }
          while (localAdobePhotoException == null)
          {
            paramIAdobeGenericCompletionCallback.onCompletion(paramAnonymousAdobeNetworkHttpResponse.getDataBytes());
            return;
            localAdobePhotoException = AdobePhotoSession.this.getPhotoErrorFromResponse(paramAnonymousAdobeNetworkHttpResponse);
          }
          paramIAdobeGenericErrorCallback.onError(localAdobePhotoException);
        }
        
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          AdobeNetworkHttpResponse localAdobeNetworkHttpResponse = AdobePhotoSession.this.getResponseFromError(paramAnonymousAdobeNetworkException);
          if (localAdobeNetworkHttpResponse != null) {
            paramAnonymousAdobeNetworkException = AdobePhotoSession.this.getPhotoErrorFromResponse(localAdobeNetworkHttpResponse);
          }
          for (;;)
          {
            paramIAdobeGenericErrorCallback.onError(paramAnonymousAdobeNetworkException);
            return;
            if (paramAnonymousAdobeNetworkException.getErrorCode() == AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorNotEntitledToService) {
              paramAnonymousAdobeNetworkException = new AdobePhotoException(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_NOT_ENTITLED_TO_SERVICE, paramAnonymousAdobeNetworkException.getData(), null);
            } else {
              paramAnonymousAdobeNetworkException = new AdobePhotoException(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE, paramAnonymousAdobeNetworkException.getData(), null);
            }
          }
        }
        
        public void onProgress(double paramAnonymousDouble) {}
      });
      return paramAdobePhotoAssetRendition;
    }
    catch (URISyntaxException paramAdobePhotoAssetRendition)
    {
      return null;
    }
    catch (MalformedURLException paramAdobePhotoAssetRendition) {}
    return null;
  }
  
  public AdobeNetworkHttpTaskHandle getAssetCountInCollection(AdobePhotoCollection paramAdobePhotoCollection, final IAdobeGenericCompletionCallback<Integer> paramIAdobeGenericCompletionCallback, final IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    Object localObject = getService();
    if (localObject == null)
    {
      if (paramIAdobeGenericErrorCallback != null)
      {
        paramAdobePhotoCollection = new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorNoCloudSpecified);
        if (paramIAdobeGenericErrorCallback != null) {
          paramIAdobeGenericErrorCallback.onError(paramAdobePhotoCollection);
        }
      }
      for (;;)
      {
        return null;
        AdobeLogger.log(Level.ERROR, AdobeStorageSession.class.getSimpleName(), "Adobe cloud not specified.");
      }
    }
    paramAdobePhotoCollection = AdobeStorageLastPathComponentUtil.getRelativeTo(String.format("%s/assets/count", new Object[] { paramAdobePhotoCollection.getHref() }), ((AdobeNetworkHttpService)localObject).getBaseURL().toString());
    try
    {
      paramAdobePhotoCollection = new URI(paramAdobePhotoCollection).toURL();
      localObject = new AdobeNetworkHttpRequest();
      ((AdobeNetworkHttpRequest)localObject).setUrl(paramAdobePhotoCollection);
      ((AdobeNetworkHttpRequest)localObject).setRequestMethod(AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET);
      paramAdobePhotoCollection = getResponseFor((AdobeNetworkHttpRequest)localObject, null, null, new AdobeStorageSession.IStorageResponseCallback()
      {
        public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          localObject1 = null;
          int i = paramAnonymousAdobeNetworkHttpResponse.getStatusCode();
          localObject3 = null;
          AdobeNetworkHttpResponse localAdobeNetworkHttpResponse;
          if (i == 200)
          {
            localAdobeNetworkHttpResponse = null;
            try
            {
              paramAnonymousAdobeNetworkHttpResponse = AdobePhotoUtils.JSONObjectWithData(paramAnonymousAdobeNetworkHttpResponse.getDataString());
              localAdobeNetworkHttpResponse = paramAnonymousAdobeNetworkHttpResponse;
              paramAnonymousAdobeNetworkHttpResponse = (AdobeNetworkHttpResponse)localObject1;
            }
            catch (AdobePhotoException paramAnonymousAdobeNetworkHttpResponse)
            {
              for (;;) {}
            }
            localObject1 = localObject3;
            localObject2 = paramAnonymousAdobeNetworkHttpResponse;
            if (localAdobeNetworkHttpResponse == null) {}
          }
          for (;;)
          {
            try
            {
              localObject1 = new Integer(localAdobeNetworkHttpResponse.getInt("total_count"));
              localObject2 = paramAnonymousAdobeNetworkHttpResponse;
            }
            catch (JSONException localJSONException)
            {
              localObject1 = localObject3;
              localObject2 = paramAnonymousAdobeNetworkHttpResponse;
              continue;
            }
            if (localObject2 != null) {
              continue;
            }
            paramIAdobeGenericCompletionCallback.onCompletion(localObject1);
            return;
            localObject2 = AdobePhotoSession.this.getPhotoErrorFromResponse(paramAnonymousAdobeNetworkHttpResponse);
            localObject1 = localObject3;
          }
          paramIAdobeGenericErrorCallback.onError(localObject2);
        }
        
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          AdobeNetworkHttpResponse localAdobeNetworkHttpResponse = AdobePhotoSession.this.getResponseFromError(paramAnonymousAdobeNetworkException);
          if (localAdobeNetworkHttpResponse != null) {
            paramAnonymousAdobeNetworkException = AdobePhotoSession.this.getPhotoErrorFromResponse(localAdobeNetworkHttpResponse);
          }
          for (;;)
          {
            paramIAdobeGenericErrorCallback.onError(paramAnonymousAdobeNetworkException);
            return;
            if (paramAnonymousAdobeNetworkException.getErrorCode() == AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorNotEntitledToService) {
              paramAnonymousAdobeNetworkException = new AdobePhotoException(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_NOT_ENTITLED_TO_SERVICE, paramAnonymousAdobeNetworkException.getData(), null);
            } else {
              paramAnonymousAdobeNetworkException = new AdobePhotoException(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE, paramAnonymousAdobeNetworkException.getData(), null);
            }
          }
        }
        
        public void onProgress(double paramAnonymousDouble) {}
      });
      return paramAdobePhotoCollection;
    }
    catch (URISyntaxException paramAdobePhotoCollection)
    {
      return null;
    }
    catch (MalformedURLException paramAdobePhotoCollection)
    {
      for (;;) {}
    }
  }
  
  public AdobeNetworkHttpTaskHandle getResponseFor(AdobeNetworkHttpRequest paramAdobeNetworkHttpRequest, String paramString, byte[] paramArrayOfByte, AdobeStorageSession.IStorageResponseCallback paramIStorageResponseCallback)
  {
    try
    {
      Handler localHandler = new Handler();
      return getResponseFor(paramAdobeNetworkHttpRequest, paramString, paramArrayOfByte, paramIStorageResponseCallback, localHandler);
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Object localObject = null;
      }
    }
  }
  
  protected boolean isCacheConfigured()
  {
    return _cacheConfigured;
  }
  
  public AdobeNetworkHttpTaskHandle listAssetsInCollection(final AdobePhotoCollection paramAdobePhotoCollection, AdobePhotoPage paramAdobePhotoPage, AdobePhotoCollection.AdobePhotoCollectionSort paramAdobePhotoCollectionSort, AdobePhotoCollection.AdobePhotoCollectionFlag paramAdobePhotoCollectionFlag, int paramInt, final IAdobePhotoAssetsListRequestCompletionHandler paramIAdobePhotoAssetsListRequestCompletionHandler, final IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    if (paramInt > 500)
    {
      paramAdobePhotoCollection = new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorBadRequest);
      AdobeLogger.log(Level.ERROR, "PhotoSession:ListAssetsInCollection", "The limit cannot be greater than 500.");
      paramIAdobeGenericErrorCallback.onError(paramAdobePhotoCollection);
      return null;
    }
    final AdobeNetworkHttpService localAdobeNetworkHttpService = getService();
    if (localAdobeNetworkHttpService == null)
    {
      if (paramIAdobeGenericErrorCallback != null)
      {
        paramAdobePhotoCollection = new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorNoCloudSpecified);
        if (paramIAdobeGenericErrorCallback != null) {
          paramIAdobeGenericErrorCallback.onError(paramAdobePhotoCollection);
        }
      }
      for (;;)
      {
        return null;
        AdobeLogger.log(Level.ERROR, AdobeStorageSession.class.getSimpleName(), "Adobe cloud not specified.");
      }
    }
    String str = "";
    if (paramAdobePhotoPage != null)
    {
      str = String.format("&%s", new Object[] { paramAdobePhotoPage.getKey() });
      paramAdobePhotoCollectionSort = "";
      paramAdobePhotoPage = null;
      switch (92.$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobePhotoCollection$AdobePhotoCollectionFlag[paramAdobePhotoCollectionFlag.ordinal()])
      {
      }
    }
    for (;;)
    {
      if (paramAdobePhotoPage != null) {
        paramAdobePhotoCollectionSort = String.format("&flag=%s", new Object[] { paramAdobePhotoPage });
      }
      paramAdobePhotoPage = AdobeStorageLastPathComponentUtil.getRelativeTo(String.format("%s/assets?limit=%d%s%s", new Object[] { paramAdobePhotoCollection.getHref(), Integer.valueOf(paramInt), str, paramAdobePhotoCollectionSort }), localAdobeNetworkHttpService.getBaseURL().toString());
      try
      {
        paramAdobePhotoPage = new URI(paramAdobePhotoPage).toURL();
        paramAdobePhotoCollectionSort = new AdobeNetworkHttpRequest();
        paramAdobePhotoCollectionSort.setUrl(paramAdobePhotoPage);
        paramAdobePhotoCollectionSort.setRequestMethod(AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET);
        paramAdobePhotoCollection = getResponseFor(paramAdobePhotoCollectionSort, null, null, new AdobeStorageSession.IStorageResponseCallback()
        {
          /* Error */
          public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
          {
            // Byte code:
            //   0: aconst_null
            //   1: astore 8
            //   3: aload_1
            //   4: invokevirtual 51	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse:getStatusCode	()I
            //   7: istore_2
            //   8: aconst_null
            //   9: astore 19
            //   11: aconst_null
            //   12: astore 17
            //   14: aconst_null
            //   15: astore 7
            //   17: aconst_null
            //   18: astore 18
            //   20: aconst_null
            //   21: astore 16
            //   23: aconst_null
            //   24: astore 14
            //   26: aconst_null
            //   27: astore 4
            //   29: aconst_null
            //   30: astore 15
            //   32: aconst_null
            //   33: astore 13
            //   35: new 53	java/util/ArrayList
            //   38: dup
            //   39: invokespecial 54	java/util/ArrayList:<init>	()V
            //   42: astore 20
            //   44: iload_2
            //   45: sipush 200
            //   48: if_icmpne +656 -> 704
            //   51: aconst_null
            //   52: astore 12
            //   54: aload_1
            //   55: invokevirtual 58	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse:getDataString	()Ljava/lang/String;
            //   58: invokestatic 64	com/adobe/creativesdk/foundation/internal/photo/util/AdobePhotoUtils:JSONObjectWithData	(Ljava/lang/String;)Lorg/json/JSONObject;
            //   61: astore_1
            //   62: aload_1
            //   63: astore 12
            //   65: aload 8
            //   67: astore 11
            //   69: aload 12
            //   71: ifnull +612 -> 683
            //   74: aload 13
            //   76: astore_3
            //   77: aload 19
            //   79: astore_1
            //   80: aload 14
            //   82: astore 9
            //   84: aload 17
            //   86: astore 5
            //   88: aload 15
            //   90: astore 10
            //   92: aload 18
            //   94: astore 6
            //   96: aload 12
            //   98: ldc 66
            //   100: invokevirtual 72	org/json/JSONObject:has	(Ljava/lang/String;)Z
            //   103: ifeq +311 -> 414
            //   106: aload 14
            //   108: astore 9
            //   110: aload 17
            //   112: astore 5
            //   114: aload 15
            //   116: astore 10
            //   118: aload 18
            //   120: astore 6
            //   122: aload 12
            //   124: ldc 66
            //   126: invokevirtual 75	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
            //   129: astore 7
            //   131: aload 13
            //   133: astore_3
            //   134: aload 19
            //   136: astore_1
            //   137: aload 7
            //   139: ifnull +275 -> 414
            //   142: aload 16
            //   144: astore 4
            //   146: aload 14
            //   148: astore 9
            //   150: aload 17
            //   152: astore 5
            //   154: aload 15
            //   156: astore 10
            //   158: aload 18
            //   160: astore 6
            //   162: aload 7
            //   164: ldc 77
            //   166: invokevirtual 72	org/json/JSONObject:has	(Ljava/lang/String;)Z
            //   169: ifeq +105 -> 274
            //   172: aload 16
            //   174: astore 4
            //   176: aload 14
            //   178: astore 9
            //   180: aload 17
            //   182: astore 5
            //   184: aload 15
            //   186: astore 10
            //   188: aload 18
            //   190: astore 6
            //   192: aload 7
            //   194: ldc 77
            //   196: invokevirtual 75	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
            //   199: ifnull +75 -> 274
            //   202: aload 16
            //   204: astore 4
            //   206: aload 14
            //   208: astore 9
            //   210: aload 17
            //   212: astore 5
            //   214: aload 15
            //   216: astore 10
            //   218: aload 18
            //   220: astore 6
            //   222: aload 7
            //   224: ldc 77
            //   226: invokevirtual 75	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
            //   229: ldc 79
            //   231: invokevirtual 72	org/json/JSONObject:has	(Ljava/lang/String;)Z
            //   234: ifeq +40 -> 274
            //   237: aload 14
            //   239: astore 9
            //   241: aload 17
            //   243: astore 5
            //   245: aload 15
            //   247: astore 10
            //   249: aload 18
            //   251: astore 6
            //   253: aload_0
            //   254: getfield 25	com/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49:this$0	Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;
            //   257: aload 7
            //   259: ldc 77
            //   261: invokevirtual 75	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
            //   264: ldc 79
            //   266: invokevirtual 83	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
            //   269: invokestatic 87	com/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession:access$200	(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
            //   272: astore 4
            //   274: aload 13
            //   276: astore_3
            //   277: aload 4
            //   279: astore_1
            //   280: aload 14
            //   282: astore 9
            //   284: aload 4
            //   286: astore 5
            //   288: aload 15
            //   290: astore 10
            //   292: aload 4
            //   294: astore 6
            //   296: aload 7
            //   298: ldc 89
            //   300: invokevirtual 72	org/json/JSONObject:has	(Ljava/lang/String;)Z
            //   303: ifeq +111 -> 414
            //   306: aload 13
            //   308: astore_3
            //   309: aload 4
            //   311: astore_1
            //   312: aload 14
            //   314: astore 9
            //   316: aload 4
            //   318: astore 5
            //   320: aload 15
            //   322: astore 10
            //   324: aload 4
            //   326: astore 6
            //   328: aload 7
            //   330: ldc 89
            //   332: invokevirtual 75	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
            //   335: ifnull +79 -> 414
            //   338: aload 13
            //   340: astore_3
            //   341: aload 4
            //   343: astore_1
            //   344: aload 14
            //   346: astore 9
            //   348: aload 4
            //   350: astore 5
            //   352: aload 15
            //   354: astore 10
            //   356: aload 4
            //   358: astore 6
            //   360: aload 7
            //   362: ldc 89
            //   364: invokevirtual 75	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
            //   367: ldc 79
            //   369: invokevirtual 72	org/json/JSONObject:has	(Ljava/lang/String;)Z
            //   372: ifeq +42 -> 414
            //   375: aload 14
            //   377: astore 9
            //   379: aload 4
            //   381: astore 5
            //   383: aload 15
            //   385: astore 10
            //   387: aload 4
            //   389: astore 6
            //   391: aload_0
            //   392: getfield 25	com/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49:this$0	Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;
            //   395: aload 7
            //   397: ldc 89
            //   399: invokevirtual 75	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
            //   402: ldc 79
            //   404: invokevirtual 83	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
            //   407: invokestatic 87	com/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession:access$200	(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
            //   410: astore_3
            //   411: aload 4
            //   413: astore_1
            //   414: aload_3
            //   415: astore 9
            //   417: aload_1
            //   418: astore 5
            //   420: aload 8
            //   422: astore 11
            //   424: aload_3
            //   425: astore 4
            //   427: aload_1
            //   428: astore 7
            //   430: aload_3
            //   431: astore 10
            //   433: aload_1
            //   434: astore 6
            //   436: aload 12
            //   438: ldc 91
            //   440: invokevirtual 72	org/json/JSONObject:has	(Ljava/lang/String;)Z
            //   443: ifeq +240 -> 683
            //   446: aload_3
            //   447: astore 9
            //   449: aload_1
            //   450: astore 5
            //   452: aload_3
            //   453: astore 10
            //   455: aload_1
            //   456: astore 6
            //   458: aload 12
            //   460: ldc 91
            //   462: invokevirtual 95	org/json/JSONObject:getJSONArray	(Ljava/lang/String;)Lorg/json/JSONArray;
            //   465: astore 12
            //   467: aload 8
            //   469: astore 11
            //   471: aload_3
            //   472: astore 4
            //   474: aload_1
            //   475: astore 7
            //   477: aload 12
            //   479: ifnull +204 -> 683
            //   482: iconst_0
            //   483: istore_2
            //   484: aload_3
            //   485: astore 9
            //   487: aload_1
            //   488: astore 5
            //   490: aload 8
            //   492: astore 11
            //   494: aload_3
            //   495: astore 4
            //   497: aload_1
            //   498: astore 7
            //   500: aload_3
            //   501: astore 10
            //   503: aload_1
            //   504: astore 6
            //   506: iload_2
            //   507: aload 12
            //   509: invokevirtual 100	org/json/JSONArray:length	()I
            //   512: if_icmpge +171 -> 683
            //   515: aload_3
            //   516: astore 9
            //   518: aload_1
            //   519: astore 5
            //   521: aload_3
            //   522: astore 10
            //   524: aload_1
            //   525: astore 6
            //   527: aload 12
            //   529: iload_2
            //   530: invokevirtual 103	org/json/JSONArray:getJSONObject	(I)Lorg/json/JSONObject;
            //   533: astore 4
            //   535: aload 4
            //   537: ifnull +124 -> 661
            //   540: aload_3
            //   541: astore 9
            //   543: aload_1
            //   544: astore 5
            //   546: aload_3
            //   547: astore 10
            //   549: aload_1
            //   550: astore 6
            //   552: new 105	com/adobe/creativesdk/foundation/storage/AdobePhotoAsset
            //   555: dup
            //   556: invokespecial 106	com/adobe/creativesdk/foundation/storage/AdobePhotoAsset:<init>	()V
            //   559: astore 7
            //   561: aload_3
            //   562: astore 9
            //   564: aload_1
            //   565: astore 5
            //   567: aload_3
            //   568: astore 10
            //   570: aload_1
            //   571: astore 6
            //   573: aload 7
            //   575: aload_0
            //   576: getfield 27	com/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49:val$collection	Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
            //   579: invokevirtual 112	com/adobe/creativesdk/foundation/storage/AdobePhotoCollection:getCloud	()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
            //   582: invokevirtual 116	com/adobe/creativesdk/foundation/storage/AdobePhotoAsset:setCloud	(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
            //   585: aload_3
            //   586: astore 9
            //   588: aload_1
            //   589: astore 5
            //   591: aload_3
            //   592: astore 10
            //   594: aload_1
            //   595: astore 6
            //   597: aload 7
            //   599: aload_0
            //   600: getfield 29	com/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49:val$service	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
            //   603: invokevirtual 122	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService:getBaseURL	()Ljava/net/URL;
            //   606: invokevirtual 127	java/net/URL:toString	()Ljava/lang/String;
            //   609: invokevirtual 131	com/adobe/creativesdk/foundation/storage/AdobePhotoAsset:setBaseHref	(Ljava/lang/String;)V
            //   612: aload_3
            //   613: astore 9
            //   615: aload_1
            //   616: astore 5
            //   618: aload_3
            //   619: astore 10
            //   621: aload_1
            //   622: astore 6
            //   624: aload 7
            //   626: aload 4
            //   628: aload_0
            //   629: getfield 27	com/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49:val$collection	Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
            //   632: invokevirtual 135	com/adobe/creativesdk/foundation/storage/AdobePhotoCollection:getCatalog	()Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
            //   635: invokevirtual 139	com/adobe/creativesdk/foundation/storage/AdobePhotoAsset:updateFromDictionary	(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)Z
            //   638: ifeq +23 -> 661
            //   641: aload_3
            //   642: astore 9
            //   644: aload_1
            //   645: astore 5
            //   647: aload_3
            //   648: astore 10
            //   650: aload_1
            //   651: astore 6
            //   653: aload 20
            //   655: aload 7
            //   657: invokevirtual 143	java/util/ArrayList:add	(Ljava/lang/Object;)Z
            //   660: pop
            //   661: iload_2
            //   662: iconst_1
            //   663: iadd
            //   664: istore_2
            //   665: goto -181 -> 484
            //   668: astore 8
            //   670: goto -605 -> 65
            //   673: astore 11
            //   675: aload 5
            //   677: astore 7
            //   679: aload 9
            //   681: astore 4
            //   683: aload 11
            //   685: ifnonnull +32 -> 717
            //   688: aload_0
            //   689: getfield 31	com/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49:val$completionCallback	Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;
            //   692: aload 20
            //   694: aload 7
            //   696: aload 4
            //   698: invokeinterface 149 4 0
            //   703: return
            //   704: aload_0
            //   705: getfield 25	com/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49:this$0	Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;
            //   708: aload_1
            //   709: invokestatic 153	com/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession:access$000	(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
            //   712: astore 11
            //   714: goto -31 -> 683
            //   717: aload_0
            //   718: getfield 33	com/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49:val$errorCallback	Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;
            //   721: aload 11
            //   723: invokeinterface 159 2 0
            //   728: return
            //   729: astore_1
            //   730: aload 8
            //   732: astore 11
            //   734: aload 10
            //   736: astore 4
            //   738: aload 6
            //   740: astore 7
            //   742: goto -59 -> 683
            // Local variable table:
            //   start	length	slot	name	signature
            //   0	745	0	this	49
            //   0	745	1	paramAnonymousAdobeNetworkHttpResponse	AdobeNetworkHttpResponse
            //   7	658	2	i	int
            //   76	572	3	localObject1	Object
            //   27	710	4	localObject2	Object
            //   86	590	5	localObject3	Object
            //   94	645	6	localObject4	Object
            //   15	726	7	localObject5	Object
            //   1	490	8	localObject6	Object
            //   668	63	8	localAdobePhotoException1	AdobePhotoException
            //   82	598	9	localObject7	Object
            //   90	645	10	localObject8	Object
            //   67	426	11	localObject9	Object
            //   673	11	11	localAdobeCSDKException	AdobeCSDKException
            //   712	21	11	localAdobePhotoException2	AdobePhotoException
            //   52	476	12	localObject10	Object
            //   33	306	13	localObject11	Object
            //   24	352	14	localObject12	Object
            //   30	354	15	localObject13	Object
            //   21	182	16	localObject14	Object
            //   12	230	17	localObject15	Object
            //   18	232	18	localObject16	Object
            //   9	126	19	localObject17	Object
            //   42	651	20	localArrayList	ArrayList
            // Exception table:
            //   from	to	target	type
            //   54	62	668	com/adobe/creativesdk/foundation/storage/AdobePhotoException
            //   96	106	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   122	131	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   162	172	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   192	202	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   222	237	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   253	274	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   296	306	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   328	338	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   360	375	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   391	411	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   436	446	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   458	467	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   506	515	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   527	535	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   552	561	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   573	585	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   597	612	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   624	641	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   653	661	673	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
            //   96	106	729	org/json/JSONException
            //   122	131	729	org/json/JSONException
            //   162	172	729	org/json/JSONException
            //   192	202	729	org/json/JSONException
            //   222	237	729	org/json/JSONException
            //   253	274	729	org/json/JSONException
            //   296	306	729	org/json/JSONException
            //   328	338	729	org/json/JSONException
            //   360	375	729	org/json/JSONException
            //   391	411	729	org/json/JSONException
            //   436	446	729	org/json/JSONException
            //   458	467	729	org/json/JSONException
            //   506	515	729	org/json/JSONException
            //   527	535	729	org/json/JSONException
            //   552	561	729	org/json/JSONException
            //   573	585	729	org/json/JSONException
            //   597	612	729	org/json/JSONException
            //   624	641	729	org/json/JSONException
            //   653	661	729	org/json/JSONException
          }
          
          public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
          {
            AdobeNetworkHttpResponse localAdobeNetworkHttpResponse = AdobePhotoSession.this.getResponseFromError(paramAnonymousAdobeNetworkException);
            if (localAdobeNetworkHttpResponse != null) {
              paramAnonymousAdobeNetworkException = AdobePhotoSession.this.getPhotoErrorFromResponse(localAdobeNetworkHttpResponse);
            }
            for (;;)
            {
              paramIAdobeGenericErrorCallback.onError(paramAnonymousAdobeNetworkException);
              return;
              if (paramAnonymousAdobeNetworkException.getErrorCode() == AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorNotEntitledToService) {
                paramAnonymousAdobeNetworkException = new AdobePhotoException(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_NOT_ENTITLED_TO_SERVICE, paramAnonymousAdobeNetworkException.getData(), null);
              } else {
                paramAnonymousAdobeNetworkException = new AdobePhotoException(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE, paramAnonymousAdobeNetworkException.getData(), null);
              }
            }
          }
          
          public void onProgress(double paramAnonymousDouble) {}
        });
        return paramAdobePhotoCollection;
      }
      catch (URISyntaxException paramAdobePhotoCollection)
      {
        return null;
      }
      catch (MalformedURLException paramAdobePhotoCollection)
      {
        for (;;) {}
      }
      if (paramAdobePhotoCollectionSort != AdobePhotoCollection.AdobePhotoCollectionSort.ADOBE_PHOTO_COLLECTION_SORT_BY_CUSTOM_ORDER) {
        break;
      }
      str = "&order_after=-";
      break;
      paramAdobePhotoPage = null;
      continue;
      paramAdobePhotoPage = "pick";
      continue;
      paramAdobePhotoPage = "unflagged";
      continue;
      paramAdobePhotoPage = "reject";
    }
  }
  
  public AdobeNetworkHttpTaskHandle listCatalogsOfType(final AdobePhotoCatalog.AdobePhotoCatalogType paramAdobePhotoCatalogType, final AdobeCloud paramAdobeCloud, final IAdobeGenericCompletionCallback<ArrayList<AdobePhotoCatalog>> paramIAdobeGenericCompletionCallback, final IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    Object localObject1 = "all";
    switch (92.$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobePhotoCatalog$AdobePhotoCatalogType[paramAdobePhotoCatalogType.ordinal()])
    {
    }
    for (;;)
    {
      Object localObject2 = "";
      if (localObject1 != null) {
        localObject2 = String.format("subtype=%s", new Object[] { localObject1 });
      }
      localObject1 = AdobeStorageLastPathComponentUtil.getRelativeTo(String.format("/v1.0/catalogs?%s", new Object[] { localObject2 }), getService().getBaseURL().toString());
      try
      {
        localObject1 = new URI((String)localObject1).toURL();
        localObject2 = new AdobeNetworkHttpRequest();
        ((AdobeNetworkHttpRequest)localObject2).setUrl((URL)localObject1);
        ((AdobeNetworkHttpRequest)localObject2).setRequestMethod(AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET);
        paramAdobePhotoCatalogType = getResponseFor((AdobeNetworkHttpRequest)localObject2, null, null, new AdobeStorageSession.IStorageResponseCallback()
        {
          public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
          {
            Object localObject1 = null;
            Object localObject3;
            if (paramAnonymousAdobeNetworkHttpResponse.getStatusCode() == 200)
            {
              localObject3 = null;
              try
              {
                paramAnonymousAdobeNetworkHttpResponse = AdobePhotoUtils.JSONObjectWithData(paramAnonymousAdobeNetworkHttpResponse.getDataString());
                localObject3 = paramAnonymousAdobeNetworkHttpResponse;
                paramAnonymousAdobeNetworkHttpResponse = (AdobeNetworkHttpResponse)localObject1;
              }
              catch (AdobePhotoException paramAnonymousAdobeNetworkHttpResponse)
              {
                for (;;) {}
                i = 0;
              }
              if (localObject3 != null)
              {
                try
                {
                  localObject3 = ((JSONObject)localObject3).getJSONArray("catalogs");
                  if ((((JSONArray)localObject3).length() != 0) || (paramAdobePhotoCatalogType != AdobePhotoCatalog.AdobePhotoCatalogType.AdobePhotoCatalogTypeLightroom)) {
                    break label117;
                  }
                  localObject1 = new AdobePhotoCatalog("lightroom", null, paramAdobeCloud, AdobePhotoCatalog.AdobePhotoCatalogType.AdobePhotoCatalogTypeLightroom);
                  val$catalogs.add(localObject1);
                  localObject1 = paramAnonymousAdobeNetworkHttpResponse;
                }
                catch (JSONException localJSONException)
                {
                  for (;;)
                  {
                    AdobeLogger.log(Level.DEBUG, "AdobePhotoSession.listCatalogsOfType", localJSONException.getMessage());
                    localObject2 = paramAnonymousAdobeNetworkHttpResponse;
                  }
                }
                if (localObject1 != null) {
                  break label291;
                }
                paramIAdobeGenericCompletionCallback.onCompletion(val$catalogs);
                return;
              }
            }
            for (;;)
            {
              label117:
              int i;
              localObject1 = paramAnonymousAdobeNetworkHttpResponse;
              if (i >= ((JSONArray)localObject3).length()) {
                break;
              }
              JSONObject localJSONObject = ((JSONArray)localObject3).getJSONObject(i);
              if ((localJSONObject != null) && ((localJSONObject instanceof JSONObject)))
              {
                localObject1 = new AdobePhotoCatalog(null, null, paramAdobeCloud);
                ((AdobePhotoCatalog)localObject1).setHref(jdField_this.getService().getBaseURL().toString());
                int j = 0;
                try
                {
                  boolean bool = ((AdobePhotoCatalog)localObject1).updateFromDictionary(localJSONObject);
                  j = bool;
                }
                catch (AdobePhotoException localAdobePhotoException)
                {
                  for (;;)
                  {
                    AdobeLogger.log(Level.DEBUG, "AdobePhotoSession.listCatalogsOfType", localAdobePhotoException.getMessage());
                  }
                }
                if (j != 0)
                {
                  val$catalogs.add(localObject1);
                  break label303;
                  Object localObject2 = paramAnonymousAdobeNetworkHttpResponse;
                  if (localObject3 != null) {
                    break;
                  }
                  localObject2 = new AdobePhotoException(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_MISSING_JSON_DATA);
                  break;
                  localObject2 = AdobePhotoSession.this.getPhotoErrorFromResponse(paramAnonymousAdobeNetworkHttpResponse);
                  break;
                  label291:
                  paramIAdobeGenericErrorCallback.onError(localObject2);
                  return;
                }
              }
              label303:
              i += 1;
            }
          }
          
          public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
          {
            AdobeNetworkHttpResponse localAdobeNetworkHttpResponse = AdobePhotoSession.this.getResponseFromError(paramAnonymousAdobeNetworkException);
            if (localAdobeNetworkHttpResponse != null) {
              paramAnonymousAdobeNetworkException = AdobePhotoSession.this.getPhotoErrorFromResponse(localAdobeNetworkHttpResponse);
            }
            for (;;)
            {
              paramIAdobeGenericErrorCallback.onError(paramAnonymousAdobeNetworkException);
              return;
              if (paramAnonymousAdobeNetworkException.getErrorCode() == AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorNotEntitledToService) {
                paramAnonymousAdobeNetworkException = new AdobePhotoException(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_NOT_ENTITLED_TO_SERVICE, paramAnonymousAdobeNetworkException.getData(), null);
              } else {
                paramAnonymousAdobeNetworkException = new AdobePhotoException(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE, paramAnonymousAdobeNetworkException.getData(), null);
              }
            }
          }
          
          public void onProgress(double paramAnonymousDouble) {}
        });
        return paramAdobePhotoCatalogType;
      }
      catch (MalformedURLException paramAdobePhotoCatalogType)
      {
        return null;
      }
      catch (URISyntaxException paramAdobePhotoCatalogType)
      {
        for (;;) {}
      }
      localObject1 = "lightroom%3BX-lightroom";
    }
  }
  
  public AdobeNetworkHttpTaskHandle listCollectionsInCatalog(final AdobePhotoCatalog paramAdobePhotoCatalog, final String paramString, int paramInt, final IAdobeGenericCompletionCallback<ArrayList<AdobePhotoCollection>> paramIAdobeGenericCompletionCallback, final IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    paramString = getService();
    if (paramString == null)
    {
      if (paramIAdobeGenericErrorCallback != null)
      {
        paramAdobePhotoCatalog = new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorNoCloudSpecified);
        if (paramIAdobeGenericErrorCallback != null) {
          paramIAdobeGenericErrorCallback.onError(paramAdobePhotoCatalog);
        }
      }
      for (;;)
      {
        return null;
        AdobeLogger.log(Level.ERROR, AdobeStorageSession.class.getSimpleName(), "Adobe cloud not specified.");
      }
    }
    Object localObject = AdobeStorageLastPathComponentUtil.getRelativeTo(String.format("%s/albums", new Object[] { paramAdobePhotoCatalog.getHref() }), paramString.getBaseURL().toString());
    try
    {
      localObject = new URI((String)localObject).toURL();
      AdobeNetworkHttpRequest localAdobeNetworkHttpRequest = new AdobeNetworkHttpRequest();
      localAdobeNetworkHttpRequest.setUrl((URL)localObject);
      localAdobeNetworkHttpRequest.setRequestMethod(AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET);
      paramAdobePhotoCatalog = getResponseFor(localAdobeNetworkHttpRequest, null, null, new AdobeStorageSession.IStorageResponseCallback()
      {
        public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          Object localObject3 = null;
          Object localObject1 = null;
          ArrayList localArrayList = new ArrayList();
          int i = paramAnonymousAdobeNetworkHttpResponse.getStatusCode();
          if (i == 200) {
            localObject3 = null;
          }
          try
          {
            paramAnonymousAdobeNetworkHttpResponse = AdobePhotoUtils.JSONObjectWithData(paramAnonymousAdobeNetworkHttpResponse.getDataString());
            localObject3 = paramAnonymousAdobeNetworkHttpResponse;
            paramAnonymousAdobeNetworkHttpResponse = (AdobeNetworkHttpResponse)localObject1;
          }
          catch (AdobePhotoException paramAnonymousAdobeNetworkHttpResponse)
          {
            for (;;) {}
          }
          localObject1 = paramAnonymousAdobeNetworkHttpResponse;
          if (localObject3 != null) {}
          for (;;)
          {
            Object localObject2;
            try
            {
              localObject3 = ((JSONObject)localObject3).getJSONArray("albums");
              i = 0;
              localObject1 = paramAnonymousAdobeNetworkHttpResponse;
              if (i < ((JSONArray)localObject3).length())
              {
                JSONObject localJSONObject = ((JSONArray)localObject3).getJSONObject(i);
                if ((localJSONObject == null) || (!(localJSONObject instanceof JSONObject))) {
                  break label264;
                }
                localObject1 = new AdobePhotoCollection();
                ((AdobePhotoCollection)localObject1).setCloud(paramAdobePhotoCatalog.getCloud());
                ((AdobePhotoCollection)localObject1).setBaseHref(paramString.getBaseURL().toString());
                int j = 0;
                try
                {
                  boolean bool = ((AdobePhotoCollection)localObject1).updateFromDictionary(localJSONObject, paramAdobePhotoCatalog);
                  j = bool;
                }
                catch (AdobePhotoException localAdobePhotoException)
                {
                  AdobeLogger.log(Level.DEBUG, "AdobePhotoSession.listCollectionsInCatalog", localAdobePhotoException.getMessage());
                  continue;
                }
                if (j == 0) {
                  break label264;
                }
                localArrayList.add(localObject1);
              }
            }
            catch (JSONException localJSONException)
            {
              localObject2 = paramAnonymousAdobeNetworkHttpResponse;
            }
            while (localObject2 == null)
            {
              paramIAdobeGenericCompletionCallback.onCompletion(localArrayList);
              return;
              if ((paramAdobePhotoCatalog.getType() == AdobePhotoCatalog.AdobePhotoCatalogType.AdobePhotoCatalogTypeLightroom) && (!paramAdobePhotoCatalog.isInSync()))
              {
                localObject2 = localObject3;
                if (i == 404) {}
              }
              else
              {
                localObject2 = AdobePhotoSession.this.getPhotoErrorFromResponse(paramAnonymousAdobeNetworkHttpResponse);
              }
            }
            paramIAdobeGenericErrorCallback.onError(localObject2);
            return;
            label264:
            i += 1;
          }
        }
        
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          AdobeNetworkHttpResponse localAdobeNetworkHttpResponse = AdobePhotoSession.this.getResponseFromError(paramAnonymousAdobeNetworkException);
          if (localAdobeNetworkHttpResponse != null) {
            paramAnonymousAdobeNetworkException = AdobePhotoSession.this.getPhotoErrorFromResponse(localAdobeNetworkHttpResponse);
          }
          for (;;)
          {
            paramIAdobeGenericErrorCallback.onError(paramAnonymousAdobeNetworkException);
            return;
            if (paramAnonymousAdobeNetworkException.getErrorCode() == AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorNotEntitledToService) {
              paramAnonymousAdobeNetworkException = new AdobePhotoException(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_NOT_ENTITLED_TO_SERVICE, paramAnonymousAdobeNetworkException.getData(), null);
            } else {
              paramAnonymousAdobeNetworkException = new AdobePhotoException(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE, paramAnonymousAdobeNetworkException.getData(), null);
            }
          }
        }
        
        public void onProgress(double paramAnonymousDouble) {}
      });
      return paramAdobePhotoCatalog;
    }
    catch (URISyntaxException paramAdobePhotoCatalog)
    {
      return null;
    }
    catch (MalformedURLException paramAdobePhotoCatalog)
    {
      for (;;) {}
    }
  }
  
  public void setUpService()
  {
    String str = AdobeAuthKeychain.getSharedKeychain().getAdobeID();
    EnumSet localEnumSet;
    if ((!isCacheConfigured()) && (str != null) && (str.length() > 0))
    {
      localEnumSet = EnumSet.of(AdobeCommonCachePolicies.AdobeCommonCacheEvictionLRU);
      str = null;
    }
    try
    {
      AdobeCommonCache.getSharedInstance().configureCache("com.adobe.cc.photo", 100, 1.34217728E8D, localEnumSet);
      if (str != null)
      {
        _cacheConfigured = true;
        return;
      }
    }
    catch (AdobeInvalidCacheSettingsException localAdobeInvalidCacheSettingsException)
    {
      for (;;) {}
      AdobeLogger.log(Level.ERROR, AdobeStorageSession.class.getSimpleName(), null, localAdobeInvalidCacheSettingsException);
    }
  }
  
  public void tearDownService()
  {
    super.tearDownService();
    if (AdobeCommonCache.getSharedInstance().doesCacheExist("com.adobe.cc.photo"))
    {
      AdobeCommonCache.getSharedInstance().printStatistics("com.adobe.cc.photo");
      if (!AdobeCommonCache.getSharedInstance().removeCache("com.adobe.cc.photo")) {
        AdobeLogger.log(Level.ERROR, AdobeStorageSession.class.getSimpleName(), "Removal of cache failed");
      }
    }
    _cacheConfigured = false;
  }
}
