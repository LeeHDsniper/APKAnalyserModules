package com.adobe.creativesdk.foundation.internal.storage.model.services;

import android.os.Handler;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.auth.AdobeUXAuthManagerRestricted;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudEndpoint;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudServiceSession;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudServiceType;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeEntitlementServices;
import com.adobe.creativesdk.foundation.adobeinternal.net.AdobeNetworkReachability;
import com.adobe.creativesdk.foundation.auth.AdobeAuthException;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIdentityManagementService;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthKeychain;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCache;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCachePolicies;
import com.adobe.creativesdk.foundation.internal.cache.AdobeInvalidCacheSettingsException;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpRequest;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpRequestMethod;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpResponse;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpService;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpTaskHandle;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkRequestPriority;
import com.adobe.creativesdk.foundation.internal.net.IAdobeNetworkCompletionHandler;
import com.adobe.creativesdk.foundation.internal.net.IAdobeNetworkHttpTaskHandleListener;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStoragePagingMode;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResource;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceCollection;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceItem;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageErrorUtils;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageLastPathComponentUtil;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageUtils;
import com.adobe.creativesdk.foundation.internal.storage.model.util.ParsingDataException;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException.AdobeNetworkErrorCode;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetErrorCode;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import com.adobe.creativesdk.foundation.storage.IAdobeProgressCallback;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONObject;

public class AdobeStorageSession
  extends AdobeCloudServiceSession
{
  private static Map<AdobeNetworkHttpRequest, AdobeNetworkHttpTaskHandle> requestMap;
  protected boolean _cacheConfigured;
  
  static
  {
    if (!AdobeStorageSession.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  public AdobeStorageSession(AdobeCloudEndpoint paramAdobeCloudEndpoint)
  {
    super(paramAdobeCloudEndpoint);
    setUpService();
    setDisconnectionNotifier(AdobeInternalNotificationID.AdobeStorageServiceDisconnectedNotification);
    setupOngoingConnectionTimer(15L, false);
    requestMap = new HashMap();
  }
  
  private AdobeNetworkException checkEntitlements()
  {
    AdobeNetworkException localAdobeNetworkException = null;
    int i = 1;
    if (isPrivateService()) {
      if (!AdobeEntitlementServices.getSharedServices().hasAccessToPrivateStorageServices()) {
        i = 0;
      }
    }
    for (;;)
    {
      if (i == 0) {
        localAdobeNetworkException = new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorNotEntitledToService);
      }
      return localAdobeNetworkException;
      if (!AdobeEntitlementServices.getSharedServices().hasAccessToPublicStorageServices()) {
        i = 1;
      }
    }
  }
  
  protected static AdobeCloudEndpoint getServiceEndpoint()
  {
    String str = null;
    Object localObject = AdobeAuthIdentityManagementService.getSharedInstance().getEnvironment();
    switch (60.$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment[localObject.ordinal()])
    {
    default: 
      AdobeLogger.log(Level.ERROR, AdobeStorageSession.class.getSimpleName(), "An undefined authentication endpoint has been specified.");
    }
    for (;;)
    {
      try
      {
        localObject = new AdobeCloudEndpoint("files", new URL(str), AdobeCloudServiceType.AdobeCloudServiceTypeStorage);
      }
      catch (MalformedURLException localMalformedURLException1)
      {
        return null;
      }
      try
      {
        ((AdobeCloudEndpoint)localObject).addServiceSchemaId("assets", new URL(str));
        ((AdobeCloudEndpoint)localObject).addServiceSchemaId("libraries", new URL(str));
        return localObject;
      }
      catch (MalformedURLException localMalformedURLException2) {}
      str = "https://cc-api-storage.adobe.io";
      continue;
      str = "https://cc-api-storage-stage.adobe.io";
      continue;
      str = "https://cc-api-storage-labs.adobe.io";
    }
    return localObject;
  }
  
  public static AdobeCloudServiceSession getSessionForCloudEndpoint(AdobeCloudEndpoint paramAdobeCloudEndpoint)
  {
    AdobeCloudEndpoint localAdobeCloudEndpoint = paramAdobeCloudEndpoint;
    if (paramAdobeCloudEndpoint == null)
    {
      if (AdobeUXAuthManagerRestricted.getSharedAuthManagerRestricted().isAdobeApplication()) {
        return null;
      }
      localAdobeCloudEndpoint = getServiceEndpoint();
    }
    return new AdobeStorageSession(localAdobeCloudEndpoint);
  }
  
  private AdobeNetworkHttpRequest moveAssetUtil(String paramString, AdobeAsset paramAdobeAsset, final IAdobeStorageSessionEditCallback paramIAdobeStorageSessionEditCallback)
  {
    if (paramAdobeAsset == null) {}
    try
    {
      paramIAdobeStorageSessionEditCallback.onError(AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorBadRequest, null));
      return null;
    }
    catch (URISyntaxException paramString)
    {
      for (;;)
      {
        Object localObject;
        paramAdobeAsset = AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorBadRequest, null);
        paramString.printStackTrace();
        paramIAdobeStorageSessionEditCallback.onError(paramAdobeAsset);
        return null;
        paramString = new URI(((AdobeNetworkHttpService)localObject).baseURL().toString() + paramString + "?invocation_mode=async");
        continue;
        ((AdobeNetworkHttpRequest)localObject).setRequestProperty("Content-Type", "*/*");
      }
    }
    catch (MalformedURLException paramString)
    {
      for (;;)
      {
        paramAdobeAsset = AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorBadRequest, null);
        paramString.printStackTrace();
        paramIAdobeStorageSessionEditCallback.onError(paramAdobeAsset);
      }
    }
    localObject = getServiceForSchemaId("files");
    if (isPrivateService())
    {
      paramString = new URI(((AdobeNetworkHttpService)localObject).baseURL().toString() + paramString);
      paramString = paramString.toURL();
      localObject = new AdobeNetworkHttpRequest();
      ((AdobeNetworkHttpRequest)localObject).setUrl(paramString);
      if (!isPrivateService()) {
        ((AdobeNetworkHttpRequest)localObject).addQueryParameters("invocation_mode", "async");
      }
      ((AdobeNetworkHttpRequest)localObject).setRequestProperty("Link", String.format("<%s>;rel=self", new Object[] { paramAdobeAsset.getHref().toString() }));
      if (!(paramAdobeAsset instanceof AdobeAssetFolder)) {
        break label245;
      }
      ((AdobeNetworkHttpRequest)localObject).setRequestProperty("Content-Type", "application/vnd.adobe.directory+json");
      ((AdobeNetworkHttpRequest)localObject).setRequestMethod(AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodPUT);
      getResponseFor((AdobeNetworkHttpRequest)localObject, null, null, new IStorageResponseCallback()
      {
        public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          if (paramAnonymousAdobeNetworkHttpResponse.getStatusCode() == 200) {
            paramIAdobeStorageSessionEditCallback.onComplete();
          }
          while (paramAnonymousAdobeNetworkHttpResponse.getStatusCode() != 202) {
            return;
          }
          new AdobeStorageAsyncResponseHandler(1L, jdField_this, new IAdobeStorageAsyncResponseHandlerCallback()
          {
            public void onComplete(AdobeNetworkHttpResponse paramAnonymous2AdobeNetworkHttpResponse)
            {
              val$editAssetCallback.onComplete();
            }
            
            public void onError(AdobeNetworkHttpResponse paramAnonymous2AdobeNetworkHttpResponse)
            {
              val$editAssetCallback.onError(getAssetErrorFromResponse(paramAnonymous2AdobeNetworkHttpResponse));
            }
            
            public void onError(AdobeNetworkException paramAnonymous2AdobeNetworkException)
            {
              val$editAssetCallback.onError(getStorageError(paramAnonymous2AdobeNetworkException));
            }
          }).startMonitoringServiceEndPoint(paramAnonymousAdobeNetworkHttpResponse);
        }
        
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          paramAnonymousAdobeNetworkException = getStorageError(paramAnonymousAdobeNetworkException);
          paramIAdobeStorageSessionEditCallback.onError(paramAnonymousAdobeNetworkException);
        }
        
        public void onProgress(double paramAnonymousDouble) {}
      });
      return localObject;
    }
  }
  
  private AdobeNetworkHttpRequest requestRenditionFor(AdobeStorageResourceItem paramAdobeStorageResourceItem, String paramString1, int paramInt1, int paramInt2, String paramString2)
  {
    localAdobeNetworkHttpRequest3 = null;
    for (;;)
    {
      try
      {
        AdobeNetworkHttpService localAdobeNetworkHttpService = getServiceForSchemaId("files");
        if (paramInt1 <= 0) {
          continue;
        }
        localObject = ";size=" + paramInt1;
        localObject = String.format("%s/:rendition;page=%d%s", new Object[] { href, Integer.valueOf(paramInt2), localObject });
        localObject = new URI(localAdobeNetworkHttpService.baseURL().toString() + (String)localObject).toURL();
      }
      catch (URISyntaxException localURISyntaxException)
      {
        Object localObject;
        localURISyntaxException.printStackTrace();
        AdobeLogger.log(Level.INFO, "AssetStorage.requestRendition", "URISyntaxException");
        AdobeNetworkHttpRequest localAdobeNetworkHttpRequest1 = localAdobeNetworkHttpRequest3;
        continue;
      }
      catch (MalformedURLException localMalformedURLException)
      {
        AdobeLogger.log(Level.INFO, "AssetStorage.requestRendition", "MalformedURLException");
        AdobeNetworkHttpRequest localAdobeNetworkHttpRequest2 = localAdobeNetworkHttpRequest3;
        continue;
        paramAdobeStorageResourceItem = etag;
        continue;
      }
      localAdobeNetworkHttpRequest3 = new AdobeNetworkHttpRequest();
      localAdobeNetworkHttpRequest3.setUrl((URL)localObject);
      localAdobeNetworkHttpRequest3.setRequestMethod(AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET);
      if (paramString2 != null)
      {
        if (etag != null) {
          continue;
        }
        paramAdobeStorageResourceItem = "*";
        localAdobeNetworkHttpRequest3.setRequestProperty(paramString2, paramAdobeStorageResourceItem);
      }
      localAdobeNetworkHttpRequest3.setRequestProperty("Accept", paramString1);
      return localAdobeNetworkHttpRequest3;
      localObject = "";
    }
  }
  
  private AdobeNetworkHttpRequest requestVideoMetadataFor(AdobeStorageResourceItem paramAdobeStorageResourceItem, String paramString)
  {
    Object localObject1 = null;
    Object localObject2 = getServiceForSchemaId("files");
    try
    {
      String str = String.format("%s/:rendition", new Object[] { href });
      localObject2 = new URI(((AdobeNetworkHttpService)localObject2).baseURL().toString() + str).toURL();
      localObject1 = localObject2;
    }
    catch (URISyntaxException localURISyntaxException)
    {
      for (;;)
      {
        localURISyntaxException.printStackTrace();
        AdobeLogger.log(Level.INFO, "AssetStorage.requestRendition", "URISyntaxException");
      }
    }
    catch (MalformedURLException localMalformedURLException)
    {
      for (;;)
      {
        AdobeLogger.log(Level.INFO, "AssetStorage.requestRendition", "MalformedURLException");
        continue;
        paramAdobeStorageResourceItem = etag;
      }
    }
    localObject2 = new AdobeNetworkHttpRequest();
    ((AdobeNetworkHttpRequest)localObject2).setUrl(localObject1);
    ((AdobeNetworkHttpRequest)localObject2).setRequestMethod(AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET);
    if (paramString != null)
    {
      if (etag == null)
      {
        paramAdobeStorageResourceItem = "*";
        ((AdobeNetworkHttpRequest)localObject2).setRequestProperty(paramString, paramAdobeStorageResourceItem);
      }
    }
    else
    {
      ((AdobeNetworkHttpRequest)localObject2).setRequestProperty("Accept", "application/vnd.adobe.ccv.videometadata");
      return localObject2;
    }
  }
  
  public void cancelRequest(AdobeNetworkHttpRequest paramAdobeNetworkHttpRequest)
  {
    if (requestMap.containsKey(paramAdobeNetworkHttpRequest))
    {
      ((AdobeNetworkHttpTaskHandle)requestMap.get(paramAdobeNetworkHttpRequest)).cancel();
      requestMap.remove(paramAdobeNetworkHttpRequest);
    }
  }
  
  public AdobeNetworkHttpRequest createDirectory(AdobeStorageResourceCollection paramAdobeStorageResourceCollection, IAdobeStorageCollectionRequestCompletionHandler paramIAdobeStorageCollectionRequestCompletionHandler)
  {
    try
    {
      Handler localHandler = new Handler();
      return createDirectory(paramAdobeStorageResourceCollection, paramIAdobeStorageCollectionRequestCompletionHandler, localHandler);
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Object localObject = null;
      }
    }
  }
  
  public AdobeNetworkHttpRequest createDirectory(final AdobeStorageResourceCollection paramAdobeStorageResourceCollection, final IAdobeStorageCollectionRequestCompletionHandler paramIAdobeStorageCollectionRequestCompletionHandler, Handler paramHandler)
  {
    AdobeNetworkHttpRequest localAdobeNetworkHttpRequest = requestFor(paramAdobeStorageResourceCollection, AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodPUT, null, true);
    getResponseFor(localAdobeNetworkHttpRequest, null, null, new IStorageResponseCallback()
    {
      public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        int i = paramAnonymousAdobeNetworkHttpResponse.getStatusCode();
        if ((i == 200) || (i == 201))
        {
          paramAnonymousAdobeNetworkHttpResponse = paramAnonymousAdobeNetworkHttpResponse.getHeaders();
          if (paramAnonymousAdobeNetworkHttpResponse != null)
          {
            if (paramAnonymousAdobeNetworkHttpResponse.containsKey("etag")) {
              paramAdobeStorageResourceCollectionetag = ((String)((List)paramAnonymousAdobeNetworkHttpResponse.get("etag")).get(0));
            }
            if (paramAnonymousAdobeNetworkHttpResponse.containsKey("x-resource-id")) {
              paramAdobeStorageResourceCollectioninternalID = ((String)((List)paramAnonymousAdobeNetworkHttpResponse.get("x-resource-id")).get(0));
            }
            if (paramAnonymousAdobeNetworkHttpResponse.containsKey("date"))
            {
              paramAdobeStorageResourceCollectioncreated = ((String)((List)paramAnonymousAdobeNetworkHttpResponse.get("date")).get(0));
              paramAdobeStorageResourceCollectionmodified = ((String)((List)paramAnonymousAdobeNetworkHttpResponse.get("date")).get(0));
            }
          }
          paramIAdobeStorageCollectionRequestCompletionHandler.onComplete(paramAdobeStorageResourceCollection);
          return;
        }
        paramAnonymousAdobeNetworkHttpResponse = getAssetErrorFromResponse(paramAnonymousAdobeNetworkHttpResponse, null);
        paramIAdobeStorageCollectionRequestCompletionHandler.onError(paramAnonymousAdobeNetworkHttpResponse);
      }
      
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        paramAnonymousAdobeNetworkException = getStorageError(paramAnonymousAdobeNetworkException);
        paramIAdobeStorageCollectionRequestCompletionHandler.onError(paramAnonymousAdobeNetworkException);
      }
      
      public void onProgress(double paramAnonymousDouble) {}
    }, paramHandler);
    return localAdobeNetworkHttpRequest;
  }
  
  public AdobeNetworkHttpRequest eraseAsset(AdobeAsset paramAdobeAsset, IAdobeStorageSessionEditCallback paramIAdobeStorageSessionEditCallback)
  {
    Object localObject = paramAdobeAsset.getHref().toString();
    localObject = ((String)localObject).substring(((String)localObject).substring(0, ((String)localObject).length() - 1).lastIndexOf("/") + 1);
    String str = "/archive/" + (String)localObject;
    localObject = str;
    if (str.endsWith("/")) {
      localObject = str.substring(0, str.length() - 1);
    }
    return moveAssetUtil((String)localObject, paramAdobeAsset, paramIAdobeStorageSessionEditCallback);
  }
  
  AdobeAssetException getAssetErrorFromResponse(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse)
  {
    return getAssetErrorFromResponse(paramAdobeNetworkHttpResponse, null);
  }
  
  AdobeAssetException getAssetErrorFromResponse(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse, String paramString)
  {
    Object localObject = null;
    AdobeNetworkReachability localAdobeNetworkReachability = null;
    if (paramAdobeNetworkHttpResponse == null) {
      paramString = AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorCancelled, null, null, -1, null);
    }
    for (;;)
    {
      localObject = paramString;
      if (paramString == null) {
        localObject = AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorUnexpectedResponse, paramAdobeNetworkHttpResponse.getUrl(), paramAdobeNetworkHttpResponse.getDataBytes(), paramAdobeNetworkHttpResponse.getStatusCode(), paramAdobeNetworkHttpResponse.getHeaders());
      }
      return localObject;
      if (paramAdobeNetworkHttpResponse.getStatusCode() == 412)
      {
        paramString = AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorConflictingChanges, paramAdobeNetworkHttpResponse.getUrl(), paramAdobeNetworkHttpResponse.getDataBytes(), paramAdobeNetworkHttpResponse.getStatusCode(), paramAdobeNetworkHttpResponse.getHeaders());
      }
      else if (paramAdobeNetworkHttpResponse.getStatusCode() == 507)
      {
        paramString = AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorExceededQuota, paramAdobeNetworkHttpResponse.getUrl(), paramAdobeNetworkHttpResponse.getDataBytes(), paramAdobeNetworkHttpResponse.getStatusCode(), paramAdobeNetworkHttpResponse.getHeaders());
      }
      else if (paramAdobeNetworkHttpResponse.getStatusCode() == 415)
      {
        paramString = AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorUnsupportedMedia, paramAdobeNetworkHttpResponse.getUrl(), paramAdobeNetworkHttpResponse.getDataBytes(), paramAdobeNetworkHttpResponse.getStatusCode(), paramAdobeNetworkHttpResponse.getHeaders());
      }
      else
      {
        paramString = localAdobeNetworkReachability;
        if (paramAdobeNetworkHttpResponse.getStatusCode() == 404)
        {
          paramString = localAdobeNetworkReachability;
          if (AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext() != null)
          {
            localAdobeNetworkReachability = AdobeNetworkReachability.createAndGetNetworkReachability();
            localAdobeNetworkReachability.startNotification(AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext());
            paramString = (String)localObject;
            if (!localAdobeNetworkReachability.isOnline()) {
              paramString = AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorOffline, paramAdobeNetworkHttpResponse.getUrl(), paramAdobeNetworkHttpResponse.getDataBytes(), paramAdobeNetworkHttpResponse.getStatusCode(), paramAdobeNetworkHttpResponse.getHeaders());
            }
            localAdobeNetworkReachability.stopNotification();
          }
        }
      }
    }
  }
  
  public AdobeNetworkHttpRequest getDirectory(AdobeStorageResourceCollection paramAdobeStorageResourceCollection, AdobeStoragePagingMode paramAdobeStoragePagingMode, IAdobeStorageCollectionRequestCompletionHandler paramIAdobeStorageCollectionRequestCompletionHandler)
  {
    try
    {
      Handler localHandler = new Handler();
      return getDirectory(paramAdobeStorageResourceCollection, paramAdobeStoragePagingMode, paramIAdobeStorageCollectionRequestCompletionHandler, localHandler);
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Object localObject = null;
      }
    }
  }
  
  public AdobeNetworkHttpRequest getDirectory(final AdobeStorageResourceCollection paramAdobeStorageResourceCollection, final AdobeStoragePagingMode paramAdobeStoragePagingMode, final IAdobeStorageCollectionRequestCompletionHandler paramIAdobeStorageCollectionRequestCompletionHandler, Handler paramHandler)
  {
    int i;
    label35:
    AdobeNetworkHttpRequestMethod localAdobeNetworkHttpRequestMethod;
    if (paramAdobeStoragePagingMode == AdobeStoragePagingMode.AdobeStorageFirstPage)
    {
      paramAdobeStorageResourceCollection.resetPageIndex();
      if ((etag == null) || (paramAdobeStorageResourceCollection.getChildren() == null) || (paramAdobeStoragePagingMode != AdobeStoragePagingMode.AdobeStorageFirstPage)) {
        break label145;
      }
      i = 1;
      localAdobeNetworkHttpRequestMethod = AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET;
      if (i == 0) {
        break label151;
      }
    }
    label145:
    label151:
    for (Object localObject = "If-None-Match";; localObject = null)
    {
      localObject = requestFor(paramAdobeStorageResourceCollection, localAdobeNetworkHttpRequestMethod, (String)localObject, false, null, true);
      getResponseFor((AdobeNetworkHttpRequest)localObject, null, null, new IStorageResponseCallback()
      {
        public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          boolean bool = false;
          int i = paramAnonymousAdobeNetworkHttpResponse.getStatusCode();
          if ((i == 200) || (i == 304))
          {
            if (i != 304) {
              try
              {
                AdobeStorageResourceCollection localAdobeStorageResourceCollection = paramAdobeStorageResourceCollection;
                String str = paramAnonymousAdobeNetworkHttpResponse.getDataString();
                if (paramAdobeStoragePagingMode == AdobeStoragePagingMode.AdobeStorageNextPageAppend) {
                  bool = true;
                }
                localAdobeStorageResourceCollection.updateFromData(str, bool);
                if ((paramAnonymousAdobeNetworkHttpResponse.getHeaders() != null) && (paramAnonymousAdobeNetworkHttpResponse.getHeaders().containsKey("x-children-next-start"))) {
                  paramAdobeStorageResourceCollection.setNextStartIndex((String)((List)paramAnonymousAdobeNetworkHttpResponse.getHeaders().get("x-children-next-start")).get(0));
                }
                for (;;)
                {
                  paramIAdobeStorageCollectionRequestCompletionHandler.onComplete(paramAdobeStorageResourceCollection);
                  return;
                  paramAdobeStorageResourceCollection.setNextStartIndex(null);
                }
                paramAnonymousAdobeNetworkHttpResponse = getAssetErrorFromResponse(paramAnonymousAdobeNetworkHttpResponse, null);
              }
              catch (ParsingDataException paramAnonymousAdobeNetworkHttpResponse)
              {
                paramAnonymousAdobeNetworkHttpResponse = paramAnonymousAdobeNetworkHttpResponse.getError();
                paramIAdobeStorageCollectionRequestCompletionHandler.onError(paramAnonymousAdobeNetworkHttpResponse);
                return;
              }
            }
          }
          else {
            paramIAdobeStorageCollectionRequestCompletionHandler.onError(paramAnonymousAdobeNetworkHttpResponse);
          }
        }
        
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          paramAnonymousAdobeNetworkException = getStorageError(paramAnonymousAdobeNetworkException);
          paramIAdobeStorageCollectionRequestCompletionHandler.onError(paramAnonymousAdobeNetworkException);
        }
        
        public void onProgress(double paramAnonymousDouble) {}
      }, paramHandler);
      return localObject;
      if ((paramAdobeStoragePagingMode == AdobeStoragePagingMode.AdobeStorageNextPageAppend) || (paramAdobeStoragePagingMode == AdobeStoragePagingMode.AdobeStorageNextPageReplace)) {
        AdobeLogger.log(Level.ERROR, "StorageSession.getDirectory", "Unexpected Paging mode");
      }
      if (!paramAdobeStorageResourceCollection.isComplete()) {
        AdobeLogger.log(Level.ERROR, "StorageSession.getDirectory", "Specified Paging mode should only be used with an incomplete collection that was populated by a previous request");
      }
      paramAdobeStorageResourceCollection.setStartIndex(paramAdobeStorageResourceCollection.getNextStartIndex());
      break;
      i = 0;
      break label35;
    }
  }
  
  public AdobeNetworkHttpRequest getFile(final AdobeStorageResourceItem paramAdobeStorageResourceItem, final IAdobeStorageResourceRequestCompletionHandler paramIAdobeStorageResourceRequestCompletionHandler, Handler paramHandler, final String paramString)
  {
    AdobeNetworkHttpRequestMethod localAdobeNetworkHttpRequestMethod = AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET;
    if (etag == null) {}
    for (Object localObject = null;; localObject = "If-None-Match")
    {
      localObject = requestFor(paramAdobeStorageResourceItem, localAdobeNetworkHttpRequestMethod, (String)localObject, false);
      ((AdobeNetworkHttpRequest)localObject).setRequestProperty("Accept-Encoding", "");
      paramIAdobeStorageResourceRequestCompletionHandler = new IStorageResponseCallback()
      {
        public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          int i = paramAnonymousAdobeNetworkHttpResponse.getStatusCode();
          if ((i == 200) || (i == 304))
          {
            if ((paramAdobeStorageResourceItem.getPath() == null) && (paramString == null)) {
              paramAdobeStorageResourceItem.setData(paramAnonymousAdobeNetworkHttpResponse.getDataBytes());
            }
            Map localMap = paramAnonymousAdobeNetworkHttpResponse.getHeaders();
            if (localMap != null)
            {
              if (localMap.containsKey("etag")) {
                paramAdobeStorageResourceItemetag = ((String)((List)localMap.get("etag")).get(0));
              }
              if ((paramAdobeStorageResourceItem.getVersion() == null) && (localMap.containsKey("x-latest-version"))) {
                paramAdobeStorageResourceItem.setVersion(Integer.valueOf(Integer.parseInt((String)((List)localMap.get("x-latest-version")).get(0))));
              }
              if (localMap.containsKey("content-md5")) {
                paramAdobeStorageResourceItem.setMd5((String)((List)localMap.get("content-md5")).get(0));
              }
              if (localMap.containsKey("x-resource-id")) {
                paramAdobeStorageResourceIteminternalID = ((String)((List)localMap.get("x-resource-id")).get(0));
              }
            }
            if (i != 304) {
              paramAdobeStorageResourceItem.setLength(Integer.valueOf(paramAnonymousAdobeNetworkHttpResponse.getBytesReceived()));
            }
            paramIAdobeStorageResourceRequestCompletionHandler.onComplete(paramAdobeStorageResourceItem);
            return;
          }
          paramAnonymousAdobeNetworkHttpResponse = getAssetErrorFromResponse(paramAnonymousAdobeNetworkHttpResponse, paramAdobeStorageResourceItem.getPath());
          paramIAdobeStorageResourceRequestCompletionHandler.onError(paramAnonymousAdobeNetworkHttpResponse);
        }
        
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          paramAnonymousAdobeNetworkException = getStorageError(paramAnonymousAdobeNetworkException);
          paramIAdobeStorageResourceRequestCompletionHandler.onError(paramAnonymousAdobeNetworkException);
        }
        
        public void onProgress(double paramAnonymousDouble)
        {
          paramIAdobeStorageResourceRequestCompletionHandler.onProgress(paramAnonymousDouble);
        }
      };
      if (paramString != null) {
        break;
      }
      getResponseFor((AdobeNetworkHttpRequest)localObject, paramAdobeStorageResourceItem.getPath(), null, paramIAdobeStorageResourceRequestCompletionHandler, paramHandler);
      return localObject;
    }
    getResponseFor((AdobeNetworkHttpRequest)localObject, paramString, null, paramIAdobeStorageResourceRequestCompletionHandler, paramHandler);
    return localObject;
  }
  
  public AdobeNetworkHttpRequest getFile(AdobeStorageResourceItem paramAdobeStorageResourceItem, IAdobeStorageResourceRequestCompletionHandler paramIAdobeStorageResourceRequestCompletionHandler, String paramString)
  {
    try
    {
      Handler localHandler = new Handler();
      return getFile(paramAdobeStorageResourceItem, paramIAdobeStorageResourceRequestCompletionHandler, localHandler, paramString);
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Object localObject = null;
      }
    }
  }
  
  public void getQuotaInformationOnCompletion(final IAdobeStorageSessionQuotaCallback paramIAdobeStorageSessionQuotaCallback, final Handler paramHandler)
  {
    if (AdobeUXAuthManagerRestricted.getSharedAuthManagerRestricted().checkAndCallErrorIfInvalidAccessToken(new IAdobeGenericErrorCallback()
    {
      public void onError(final AdobeAuthException paramAnonymousAdobeAuthException)
      {
        if (paramHandler != null) {
          paramHandler.post(new Runnable()
          {
            public void run()
            {
              if (val$completionHandler != null) {
                val$completionHandler.onError(paramAnonymousAdobeAuthException);
              }
            }
          });
        }
        while (paramIAdobeStorageSessionQuotaCallback == null) {
          return;
        }
        paramIAdobeStorageSessionQuotaCallback.onError(paramAnonymousAdobeAuthException);
      }
    }, "Getting the quota requires an authenticated user.")) {
      return;
    }
    Object localObject1 = null;
    try
    {
      localObject2 = getServiceForURI("/profile/quota");
      localObject2 = new URL(((AdobeNetworkHttpService)localObject2).baseURL().toString() + "/profile/quota");
      localObject1 = localObject2;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      Object localObject2;
      for (;;) {}
    }
    localObject2 = new AdobeNetworkHttpRequest();
    ((AdobeNetworkHttpRequest)localObject2).setUrl(localObject1);
    ((AdobeNetworkHttpRequest)localObject2).setRequestMethod(AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET);
    getResponseFor((AdobeNetworkHttpRequest)localObject2, null, null, new IStorageResponseCallback()
    {
      public void onComplete(final AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        Object localObject;
        if (paramAnonymousAdobeNetworkHttpResponse.getStatusCode() == 200)
        {
          localObject = AdobeStorageUtils.JSONObjectWithData(paramAnonymousAdobeNetworkHttpResponse.getDataString());
          if (localObject == null) {
            break label99;
          }
          paramAnonymousAdobeNetworkHttpResponse = Double.valueOf(((JSONObject)localObject).optDouble("storage_used"));
          localDouble = Double.valueOf(((JSONObject)localObject).optDouble("storage_available"));
          localObject = Double.valueOf(((JSONObject)localObject).optDouble("storage_quota"));
          if (paramIAdobeStorageSessionQuotaCallback != null)
          {
            if (paramHandler == null) {
              break label86;
            }
            paramHandler.post(new Runnable()
            {
              public void run()
              {
                val$completionHandler.onCompletion(paramAnonymousAdobeNetworkHttpResponse, localDouble, val$total);
              }
            });
          }
        }
        label86:
        label99:
        while (paramIAdobeStorageSessionQuotaCallback == null)
        {
          final Double localDouble;
          return;
          paramIAdobeStorageSessionQuotaCallback.onCompletion(paramAnonymousAdobeNetworkHttpResponse, localDouble, (Number)localObject);
          return;
        }
        if (paramHandler != null)
        {
          paramHandler.post(new Runnable()
          {
            public void run()
            {
              val$completionHandler.onError(new AdobeAssetException(AdobeAssetErrorCode.AdobeAssetErrorUnexpectedResponse));
            }
          });
          return;
        }
        paramIAdobeStorageSessionQuotaCallback.onError(new AdobeAssetException(AdobeAssetErrorCode.AdobeAssetErrorUnexpectedResponse));
      }
      
      public void onError(final AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        paramAnonymousAdobeNetworkException = getStorageError(paramAnonymousAdobeNetworkException);
        if (paramIAdobeStorageSessionQuotaCallback != null)
        {
          if (paramHandler != null) {
            paramHandler.post(new Runnable()
            {
              public void run()
              {
                val$completionHandler.onError(paramAnonymousAdobeNetworkException);
              }
            });
          }
        }
        else {
          return;
        }
        paramIAdobeStorageSessionQuotaCallback.onError(paramAnonymousAdobeNetworkException);
      }
      
      public void onProgress(double paramAnonymousDouble) {}
    }, paramHandler);
  }
  
  public AdobeNetworkHttpTaskHandle getRendition(AdobeStorageResourceItem paramAdobeStorageResourceItem, int paramInt1, String paramString, int paramInt2, IAdobeStorageDataRequestCompletionHandler paramIAdobeStorageDataRequestCompletionHandler)
  {
    try
    {
      Handler localHandler = new Handler();
      return getRendition(paramAdobeStorageResourceItem, paramInt1, paramString, paramInt2, paramIAdobeStorageDataRequestCompletionHandler, localHandler);
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Object localObject = null;
      }
    }
  }
  
  public AdobeNetworkHttpTaskHandle getRendition(final AdobeStorageResourceItem paramAdobeStorageResourceItem, int paramInt1, String paramString, int paramInt2, final IAdobeStorageDataRequestCompletionHandler paramIAdobeStorageDataRequestCompletionHandler, Handler paramHandler)
  {
    if (etag == null) {}
    for (String str = null;; str = "If-None-Match")
    {
      paramString = requestRenditionFor(paramAdobeStorageResourceItem, paramString, paramInt1, paramInt2, str);
      paramIAdobeStorageDataRequestCompletionHandler = new IStorageResponseCallback()
      {
        public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          int i = paramAnonymousAdobeNetworkHttpResponse.getStatusCode();
          if ((i == 200) || (i == 304))
          {
            paramIAdobeStorageDataRequestCompletionHandler.onComplete(paramAnonymousAdobeNetworkHttpResponse.getDataBytes());
            return;
          }
          paramAnonymousAdobeNetworkHttpResponse = getAssetErrorFromResponse(paramAnonymousAdobeNetworkHttpResponse, paramAdobeStorageResourceItem.getPath());
          paramIAdobeStorageDataRequestCompletionHandler.onError(paramAnonymousAdobeNetworkHttpResponse);
        }
        
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          paramAnonymousAdobeNetworkException = getStorageError(paramAnonymousAdobeNetworkException);
          paramIAdobeStorageDataRequestCompletionHandler.onError(paramAnonymousAdobeNetworkException);
        }
        
        public void onProgress(double paramAnonymousDouble)
        {
          paramIAdobeStorageDataRequestCompletionHandler.onProgress(paramAnonymousDouble);
        }
      };
      return getResponseFor(paramString, paramAdobeStorageResourceItem.getPath(), null, paramIAdobeStorageDataRequestCompletionHandler, paramHandler);
    }
  }
  
  public AdobeNetworkHttpTaskHandle getResponseFor(AdobeNetworkHttpRequest paramAdobeNetworkHttpRequest, String paramString, byte[] paramArrayOfByte, IStorageResponseCallback paramIStorageResponseCallback)
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
  
  public AdobeNetworkHttpTaskHandle getResponseFor(final AdobeNetworkHttpRequest paramAdobeNetworkHttpRequest, String paramString, byte[] paramArrayOfByte, final IStorageResponseCallback paramIStorageResponseCallback, Handler paramHandler)
  {
    AdobeNetworkHttpService localAdobeNetworkHttpService = getServiceForURI(paramAdobeNetworkHttpRequest.getUrl().toString());
    if (localAdobeNetworkHttpService == null)
    {
      if (paramIStorageResponseCallback != null)
      {
        paramAdobeNetworkHttpRequest = new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorNoCloudSpecified);
        if (paramHandler != null) {
          paramHandler.post(new Runnable()
          {
            public void run()
            {
              paramIStorageResponseCallback.onError(paramAdobeNetworkHttpRequest);
            }
          });
        }
      }
      for (;;)
      {
        return null;
        paramIStorageResponseCallback.onError(paramAdobeNetworkHttpRequest);
        continue;
        AdobeLogger.log(Level.ERROR, AdobeStorageSession.class.getSimpleName(), "Adobe cloud not specified.");
      }
    }
    Object localObject = checkEntitlements();
    if (localObject != null)
    {
      if (paramIStorageResponseCallback != null) {
        if (paramHandler != null) {
          paramHandler.post(new Runnable()
          {
            public void run()
            {
              paramIStorageResponseCallback.onError(val$entitlementError);
            }
          });
        }
      }
      for (;;)
      {
        return null;
        paramIStorageResponseCallback.onError((AdobeNetworkException)localObject);
        continue;
        AdobeLogger.log(Level.ERROR, getClass().getSimpleName(), "Entitlement Check failed", (AdobeCSDKException)localObject);
      }
    }
    localObject = new IAdobeNetworkCompletionHandler()
    {
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        paramIStorageResponseCallback.onError(paramAnonymousAdobeNetworkException);
      }
      
      public void onSuccess(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        AdobeStorageSession.requestMap.remove(paramAdobeNetworkHttpRequest);
        paramIStorageResponseCallback.onComplete(paramAnonymousAdobeNetworkHttpResponse);
      }
    };
    localAdobeNetworkHttpService.setAccessToken(AdobeAuthIdentityManagementService.getSharedInstance().getAccessToken());
    if (paramString == null)
    {
      if (paramArrayOfByte != null) {
        paramAdobeNetworkHttpRequest.setBody(paramArrayOfByte);
      }
      paramString = localAdobeNetworkHttpService.getResponseForDataRequest(paramAdobeNetworkHttpRequest, AdobeNetworkRequestPriority.NORMAL, (IAdobeNetworkCompletionHandler)localObject, paramHandler);
    }
    for (;;)
    {
      requestMap.put(paramAdobeNetworkHttpRequest, paramString);
      paramString.registerListener(new IAdobeNetworkHttpTaskHandleListener()
      {
        public void onProgressNotification(double paramAnonymousDouble)
        {
          paramIStorageResponseCallback.onProgress(paramAnonymousDouble);
        }
      });
      return paramString;
      if (paramAdobeNetworkHttpRequest.getRequestMethod() == AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET) {
        paramString = localAdobeNetworkHttpService.getResponseForDownloadRequest(paramAdobeNetworkHttpRequest, paramString, AdobeNetworkRequestPriority.NORMAL, (IAdobeNetworkCompletionHandler)localObject, paramHandler);
      } else if (paramAdobeNetworkHttpRequest.getRequestMethod() == AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodHEAD) {
        paramString = localAdobeNetworkHttpService.getResponseForDataRequest(paramAdobeNetworkHttpRequest, AdobeNetworkRequestPriority.NORMAL, (IAdobeNetworkCompletionHandler)localObject, paramHandler);
      } else {
        paramString = localAdobeNetworkHttpService.getResponseForUploadRequest(paramAdobeNetworkHttpRequest, paramString, AdobeNetworkRequestPriority.NORMAL, (IAdobeNetworkCompletionHandler)localObject, paramHandler);
      }
    }
  }
  
  protected AdobeNetworkHttpService getServiceForURI(String paramString)
  {
    AdobeNetworkHttpService localAdobeNetworkHttpService = getServiceForSchemaId("files");
    Object localObject = null;
    try
    {
      URL localURL = new URL(paramString);
      localObject = localURL;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      label103:
      for (;;) {}
    }
    if (localObject != null) {
      if (((URL)localObject).getPath() != null)
      {
        paramString = ((URL)localObject).getPath();
        localObject = paramString;
        if (!paramString.startsWith("/")) {
          localObject = String.format("/%s", new Object[] { paramString });
        }
        if (!((String)localObject).startsWith("/archive")) {
          break label103;
        }
        localObject = getServiceForSchemaId("archive");
        paramString = (String)localObject;
        if (localObject == null) {
          paramString = getServiceForSchemaId(null);
        }
      }
    }
    do
    {
      return paramString;
      break;
      break;
      if (((String)localObject).startsWith("/assets/adobe-libraries")) {
        return getServiceForSchemaId("libraries");
      }
      paramString = localAdobeNetworkHttpService;
    } while (!((String)localObject).startsWith("/assets"));
    return getServiceForSchemaId("assets");
  }
  
  AdobeAssetException getStorageError(AdobeNetworkException paramAdobeNetworkException)
  {
    Object localObject2 = null;
    if (paramAdobeNetworkException.getErrorCode() == AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorOffline) {
      return AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorOffline, null, null, -1, null);
    }
    if (paramAdobeNetworkException.getErrorCode() == AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorNotEntitledToService) {
      return AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorNotEntitledToService, null, null, -1, null);
    }
    if (paramAdobeNetworkException.getErrorCode() == AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorTimeout) {
      return AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorTimeout, null, null, -1, null);
    }
    Object localObject1 = localObject2;
    if (paramAdobeNetworkException.getData() != null)
    {
      localObject1 = localObject2;
      if (paramAdobeNetworkException.getData().containsKey("Response")) {
        localObject1 = (AdobeNetworkHttpResponse)paramAdobeNetworkException.getData().get("Response");
      }
    }
    return getAssetErrorFromResponse((AdobeNetworkHttpResponse)localObject1, null);
  }
  
  public AdobeNetworkHttpRequest getVideoMetadata(AdobeStorageResourceItem paramAdobeStorageResourceItem, String paramString, IAdobeStorageDataRequestCompletionHandler paramIAdobeStorageDataRequestCompletionHandler)
  {
    try
    {
      Handler localHandler = new Handler();
      return getVideoMetadata(paramAdobeStorageResourceItem, paramString, paramIAdobeStorageDataRequestCompletionHandler, localHandler);
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Object localObject = null;
      }
    }
  }
  
  public AdobeNetworkHttpRequest getVideoMetadata(final AdobeStorageResourceItem paramAdobeStorageResourceItem, String paramString, final IAdobeStorageDataRequestCompletionHandler paramIAdobeStorageDataRequestCompletionHandler, Handler paramHandler)
  {
    if ((!paramString.equals("application/vnd.adobe.ccv.videometadata")) && (!paramString.startsWith("video/")))
    {
      paramIAdobeStorageDataRequestCompletionHandler.onError(new AdobeAssetException(AdobeAssetErrorCode.AdobeAssetErrorUnsupportedMedia));
      return null;
    }
    if (etag != null) {}
    for (paramString = "If-None-Match";; paramString = null)
    {
      paramString = requestVideoMetadataFor(paramAdobeStorageResourceItem, paramString);
      getResponseFor(paramString, null, null, new IStorageResponseCallback()
      {
        public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          int i = paramAnonymousAdobeNetworkHttpResponse.getStatusCode();
          if ((i == 200) || (i == 304) || (i == 415))
          {
            paramIAdobeStorageDataRequestCompletionHandler.onComplete(paramAnonymousAdobeNetworkHttpResponse.getDataBytes());
            return;
          }
          paramAnonymousAdobeNetworkHttpResponse = getAssetErrorFromResponse(paramAnonymousAdobeNetworkHttpResponse, paramAdobeStorageResourceItem.getPath());
          paramIAdobeStorageDataRequestCompletionHandler.onError(paramAnonymousAdobeNetworkHttpResponse);
        }
        
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          paramAnonymousAdobeNetworkException = getStorageError(paramAnonymousAdobeNetworkException);
          paramIAdobeStorageDataRequestCompletionHandler.onError(paramAnonymousAdobeNetworkException);
        }
        
        public void onProgress(double paramAnonymousDouble)
        {
          paramIAdobeStorageDataRequestCompletionHandler.onProgress(paramAnonymousDouble);
        }
      }, paramHandler);
      return paramString;
    }
  }
  
  protected boolean isCacheConfigured()
  {
    return _cacheConfigured;
  }
  
  public AdobeNetworkHttpRequest moveAsset(String paramString, AdobeAsset paramAdobeAsset, IAdobeStorageSessionEditCallback paramIAdobeStorageSessionEditCallback)
  {
    String str2 = paramAdobeAsset.getName();
    String str1 = paramString;
    if (paramString.endsWith("/")) {
      str1 = paramString.substring(0, paramString.length() - 1);
    }
    paramString = AdobeAsset.getValidatedAssetName(str2);
    return moveAssetUtil(str1 + "/" + paramString, paramAdobeAsset, paramIAdobeStorageSessionEditCallback);
  }
  
  public AdobeNetworkHttpRequest renameAsset(AdobeAsset paramAdobeAsset, String paramString, IAdobeStorageSessionEditCallback paramIAdobeStorageSessionEditCallback)
  {
    String str2 = paramAdobeAsset.getParentHref().toString();
    Object localObject = null;
    String str1 = AdobeAsset.getValidatedAssetName(paramString);
    if (str1 == null)
    {
      paramIAdobeStorageSessionEditCallback.onError(AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorBadRequest, null));
      return null;
    }
    paramString = (String)localObject;
    if ((paramAdobeAsset instanceof AdobeAssetFile))
    {
      String str3 = paramAdobeAsset.getName();
      int i = str3.lastIndexOf(".");
      paramString = (String)localObject;
      if (i != -1) {
        paramString = str3.substring(i);
      }
    }
    localObject = str1;
    if (paramString != null) {
      localObject = str1.concat(paramString);
    }
    return moveAssetUtil(str2.concat((String)localObject), paramAdobeAsset, paramIAdobeStorageSessionEditCallback);
  }
  
  public AdobeNetworkHttpRequest requestFor(AdobeStorageResource paramAdobeStorageResource, AdobeNetworkHttpRequestMethod paramAdobeNetworkHttpRequestMethod, String paramString, boolean paramBoolean)
  {
    return requestFor(paramAdobeStorageResource, paramAdobeNetworkHttpRequestMethod, paramString, paramBoolean, null, false);
  }
  
  public AdobeNetworkHttpRequest requestFor(AdobeStorageResource paramAdobeStorageResource, AdobeNetworkHttpRequestMethod paramAdobeNetworkHttpRequestMethod, String paramString, boolean paramBoolean1, ArrayList<String> paramArrayList, boolean paramBoolean2)
  {
    for (;;)
    {
      try
      {
        localObject1 = getServiceForURI(href.toString());
        Object localObject2 = new URI(AdobeStorageLastPathComponentUtil.getRelativeTo(href.toString(), ((AdobeNetworkHttpService)localObject1).baseURL().toString()));
        paramBoolean2 = isCollection;
        String str = paramAdobeNetworkHttpRequestMethod.toString();
        localObject1 = localObject2;
        if (paramBoolean2)
        {
          localObject1 = localObject2;
          if (str.equals("AdobeNetworkHttpRequestMethodGET"))
          {
            str = ((AdobeStorageResourceCollection)paramAdobeStorageResource).getPercentEncodedQuery();
            localObject1 = localObject2;
            if (!str.isEmpty()) {
              localObject1 = new URI(((URI)localObject2).toString() + "?" + str);
            }
          }
        }
        localObject2 = ((URI)localObject1).toURL();
        localObject1 = new AdobeNetworkHttpRequest();
        ((AdobeNetworkHttpRequest)localObject1).setUrl((URL)localObject2);
        ((AdobeNetworkHttpRequest)localObject1).setRequestMethod(paramAdobeNetworkHttpRequestMethod);
        if (paramString != null)
        {
          if (etag != null) {
            continue;
          }
          paramAdobeNetworkHttpRequestMethod = "*";
          ((AdobeNetworkHttpRequest)localObject1).setRequestProperty(paramString, paramAdobeNetworkHttpRequestMethod);
        }
        if ((!paramBoolean1) || (type == null)) {
          continue;
        }
        ((AdobeNetworkHttpRequest)localObject1).setRequestProperty("Content-Type", type);
      }
      catch (MalformedURLException paramAdobeStorageResource)
      {
        Object localObject1;
        paramAdobeStorageResource.printStackTrace();
        return null;
      }
      catch (URISyntaxException paramAdobeStorageResource)
      {
        paramAdobeStorageResource.printStackTrace();
        continue;
        if (paramArrayList == null) {
          continue;
        }
        paramAdobeNetworkHttpRequestMethod = "";
        int i = 0;
        continue;
      }
      if (i >= paramArrayList.size()) {
        continue;
      }
      paramAdobeNetworkHttpRequestMethod = paramAdobeNetworkHttpRequestMethod + (String)paramArrayList.get(i) + ",";
      i += 1;
      continue;
      paramAdobeNetworkHttpRequestMethod = etag;
    }
    ((AdobeNetworkHttpRequest)localObject1).setRequestProperty("X-Update", paramAdobeNetworkHttpRequestMethod.substring(0, paramAdobeNetworkHttpRequestMethod.length() - 1));
    if ((paramArrayList != null) && (paramArrayList.contains("X-Ordinal"))) {
      ((AdobeNetworkHttpRequest)localObject1).setRequestProperty("X-Ordinal", Long.toString(ordinal));
    }
    return localObject1;
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
      AdobeCommonCache.getSharedInstance().configureCache("com.adobe.cc.storage", 100, 1.34217728E8D, localEnumSet);
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
    if (AdobeCommonCache.getSharedInstance().doesCacheExist("com.adobe.cc.storage"))
    {
      AdobeCommonCache.getSharedInstance().printStatistics("com.adobe.cc.storage");
      if (!AdobeCommonCache.getSharedInstance().removeCache("com.adobe.cc.storage")) {
        AdobeLogger.log(Level.ERROR, AdobeStorageSession.class.getSimpleName(), "Removal of cache failed");
      }
    }
    _cacheConfigured = false;
  }
  
  public static abstract interface IStorageResponseCallback
    extends IAdobeProgressCallback
  {
    public abstract void onComplete(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse);
    
    public abstract void onError(AdobeNetworkException paramAdobeNetworkException);
  }
}
