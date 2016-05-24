package com.adobe.creativesdk.foundation.storage;

import android.os.Handler;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeEntitlementServices;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCache;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCacheHandler;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCacheHitLocation;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCacheOptions;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpRequest;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpTaskHandle;
import com.adobe.creativesdk.foundation.internal.storage.AdobeAssetFileInternal;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceCollection;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceItem;
import com.adobe.creativesdk.foundation.internal.storage.model.services.AdobeStorageSession;
import com.adobe.creativesdk.foundation.internal.storage.model.services.IAdobeStorageDataRequestCompletionHandler;
import com.adobe.creativesdk.foundation.internal.storage.model.services.IAdobeStorageResourceRequestCompletionHandler;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageAssetFileInfo;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageUtils;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLDecoder;
import java.util.Date;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeAssetFile
  extends AdobeAsset
{
  public static final AdobeAssetImageDimensions THUMBNAIL_SIZED_RENDITION = new AdobeAssetImageDimensions(250.0F, 250.0F);
  protected transient AdobeStorageResourceItem asrItem;
  protected int currentVersion;
  protected transient AdobeNetworkHttpRequest dataRequest;
  protected long fileSize;
  protected String md5Hash;
  protected JSONObject optionalMetadata;
  protected boolean pendingRendRequestCancellation;
  protected transient AdobeNetworkHttpTaskHandle renditionRequest;
  protected String type;
  
  protected AdobeAssetFile()
  {
    pendingRendRequestCancellation = false;
  }
  
  protected AdobeAssetFile(AdobeStorageResourceItem paramAdobeStorageResourceItem, AdobeStorageResourceCollection paramAdobeStorageResourceCollection)
  {
    asrItem = paramAdobeStorageResourceItem;
    GUID = internalID;
    href = href;
    etag = etag;
    name = name;
    mCloud = paramAdobeStorageResourceItem.getCloud();
    parentHref = href;
    creationDate = AdobeStorageUtils.convertStringToDate(created);
    modificationDate = AdobeStorageUtils.convertStringToDate(modified);
    type = type;
    pendingRendRequestCancellation = false;
    if ((type != null) && (type.startsWith("application/vnd.adobe.file+json")) && (paramAdobeStorageResourceItem.getOptionalMetadata().has("content-type"))) {
      if (!type.equals("application/vnd.adobe.file+json")) {
        AdobeLogger.log(Level.WARN, "AdobeAssetFile", "Ignoring additional information in type: " + type);
      }
    }
    try
    {
      type = paramAdobeStorageResourceItem.getOptionalMetadata().getString("content-type");
      if (paramAdobeStorageResourceItem.getLength() != null) {
        fileSize = paramAdobeStorageResourceItem.getLength().intValue();
      }
      md5Hash = paramAdobeStorageResourceItem.getMd5();
      optionalMetadata = paramAdobeStorageResourceItem.getOptionalMetadata();
      return;
    }
    catch (JSONException paramAdobeStorageResourceCollection)
    {
      for (;;)
      {
        paramAdobeStorageResourceCollection.printStackTrace();
      }
    }
  }
  
  static AdobeAssetFile AdobeAssetFileFromInfo(AdobeStorageAssetFileInfo paramAdobeStorageAssetFileInfo)
  {
    AdobeAssetFileInternal localAdobeAssetFileInternal = new AdobeAssetFileInternal();
    GUID = GUID;
    href = href;
    parentHref = parentHref;
    etag = etag;
    name = name;
    creationDate = creationDate;
    modificationDate = modificationDate;
    type = type;
    md5Hash = md5Hash;
    fileSize = fileSize;
    currentVersion = currentVersion;
    optionalMetadata = paramAdobeStorageAssetFileInfo.getOptionalMetadata();
    hlsHref = hlsHref;
    return localAdobeAssetFileInternal;
  }
  
  private String cacheGUID()
  {
    String str = resourceIteminternalID;
    Object localObject = str;
    if (str == null)
    {
      localObject = href.getPath().split("/");
      localObject = localObject[(localObject.length - 1)];
    }
    return localObject;
  }
  
  private String cacheKey(AdobeAssetFileRenditionType paramAdobeAssetFileRenditionType, AdobeAssetImageDimensions paramAdobeAssetImageDimensions, int paramInt)
  {
    return String.format("%d_%d-%d-%d", new Object[] { Integer.valueOf(paramAdobeAssetFileRenditionType.getIntVal()), Integer.valueOf((int)width), Integer.valueOf((int)height), Integer.valueOf(paramInt) });
  }
  
  private void getRenditionFromServerWithType(final AdobeAssetFileRenditionType paramAdobeAssetFileRenditionType, final AdobeAssetImageDimensions paramAdobeAssetImageDimensions, final int paramInt, final IAdobeGenericRequestCallback<byte[], AdobeAssetException> paramIAdobeGenericRequestCallback)
  {
    String str;
    float f;
    switch (13.$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFileRenditionType[paramAdobeAssetFileRenditionType.ordinal()])
    {
    default: 
      str = "image/jpeg";
      if (height > width)
      {
        f = height;
        label55:
        paramAdobeAssetFileRenditionType = new IAdobeStorageDataRequestCompletionHandler()
        {
          public void onComplete(byte[] paramAnonymousArrayOfByte)
          {
            renditionRequest = null;
            if (paramAnonymousArrayOfByte != null)
            {
              if (AdobeCommonCache.getSharedInstance().addData(paramAnonymousArrayOfByte, AdobeAssetFile.this.cacheGUID(), AdobeAssetFile.this.cacheKey(paramAdobeAssetFileRenditionType, paramAdobeAssetImageDimensions, paramInt), EnumSet.of(AdobeCommonCacheOptions.AdobeCommonCacheKeepInMemoryCache, AdobeCommonCacheOptions.AdobeCommonCacheKeepOnDiskCache), "com.adobe.cc.storage")) {
                break label97;
              }
              AdobeLogger.log(Level.ERROR, "AdobeAssetFile:getRenditionFromServer", String.format("Adding to caches is failed for %s", new Object[] { href }));
            }
            for (;;)
            {
              paramIAdobeGenericRequestCallback.onCompletion(paramAnonymousArrayOfByte);
              return;
              label97:
              if (md5Hash != null)
              {
                HashMap localHashMap = new HashMap();
                localHashMap.put("md5", md5Hash);
                localHashMap.put("modified", modificationDate);
                localHashMap.put("etag", etag);
                AdobeCommonCache.getSharedInstance().addDictionary(localHashMap, AdobeAssetFile.this.cacheGUID(), "modified-data", EnumSet.of(AdobeCommonCacheOptions.AdobeCommonCacheKeepInMemoryCache, AdobeCommonCacheOptions.AdobeCommonCacheKeepOnDiskCache), "com.adobe.cc.storage");
              }
            }
          }
          
          public void onError(AdobeAssetException paramAnonymousAdobeAssetException)
          {
            if ((paramAnonymousAdobeAssetException != null) && (paramAnonymousAdobeAssetException.getErrorCode() == AdobeAssetErrorCode.AdobeAssetErrorCancelled))
            {
              paramAnonymousAdobeAssetException = "Renditon Request for " + href + "has been cancelled";
              AdobeLogger.log(Level.INFO, "AssetFile.getRendition", paramAnonymousAdobeAssetException);
              paramIAdobeGenericRequestCallback.onCancellation();
            }
            while (paramAnonymousAdobeAssetException == null) {
              return;
            }
            String str = "Renditon Request for " + href + "ended in error";
            AdobeLogger.log(Level.INFO, "AssetFile.getRendition", str, paramAnonymousAdobeAssetException);
            paramIAdobeGenericRequestCallback.onError(paramAnonymousAdobeAssetException);
          }
          
          public void onProgress(double paramAnonymousDouble)
          {
            paramIAdobeGenericRequestCallback.onProgress(paramAnonymousDouble);
          }
        };
        paramAdobeAssetImageDimensions = getSession();
        if (pendingRendRequestCancellation) {
          break label137;
        }
        if (paramAdobeAssetImageDimensions == null) {
          break label132;
        }
      }
      break;
    }
    label132:
    for (paramAdobeAssetFileRenditionType = paramAdobeAssetImageDimensions.getRendition(resourceItem(), (int)f, str, paramInt, paramAdobeAssetFileRenditionType);; paramAdobeAssetFileRenditionType = null)
    {
      renditionRequest = paramAdobeAssetFileRenditionType;
      return;
      str = "image/png";
      break;
      str = "image/pdf";
      break;
      f = width;
      break label55;
    }
    label137:
    paramIAdobeGenericRequestCallback.onCancellation();
    pendingRendRequestCancellation = false;
  }
  
  private void getRenditionWithTypeForData(final AdobeAssetFileRenditionType paramAdobeAssetFileRenditionType, final AdobeAssetImageDimensions paramAdobeAssetImageDimensions, final int paramInt, final IAdobeGenericRequestCallback<byte[], AdobeAssetException> paramIAdobeGenericRequestCallback)
  {
    final Object local1outerClass = new Object()
    {
      Handler handler = null;
    };
    try
    {
      handler = new Handler();
      AdobeCommonCacheHandler local7 = new AdobeCommonCacheHandler()
      {
        public void onHit(final byte[] paramAnonymousArrayOfByte, AdobeCommonCacheHitLocation paramAnonymousAdobeCommonCacheHitLocation)
        {
          paramAnonymousArrayOfByte = new AdobeCommonCacheHandler()
          {
            public void onHit(Map<String, Object> paramAnonymous2Map, AdobeCommonCacheHitLocation paramAnonymous2AdobeCommonCacheHitLocation)
            {
              paramAnonymous2Map = (String)paramAnonymous2Map.get("md5");
              if ((paramAnonymous2Map != null) && (paramAnonymous2Map.equals(md5Hash)))
              {
                val$dataDelegate.onCompletion(paramAnonymousArrayOfByte);
                return;
              }
              AdobeCommonCache.getSharedInstance().removeSetWithGUID(AdobeAssetFile.this.cacheGUID(), "com.adobe.cc.storage");
              AdobeAssetFile.this.getRenditionFromServerWithType(val$type, val$dimensions, val$page, val$dataDelegate);
            }
            
            public void onMiss()
            {
              AdobeAssetFile.this.getRenditionFromServerWithType(val$type, val$dimensions, val$page, val$dataDelegate);
            }
          };
          AdobeCommonCache.getSharedInstance().getDictionaryFromGUID(AdobeAssetFile.this.cacheGUID(), "modified-data", EnumSet.of(AdobeCommonCacheOptions.AdobeCommonCacheKeepInMemoryCache), "com.adobe.cc.storage", paramAnonymousArrayOfByte, local1outerClasshandler);
        }
        
        public void onMiss()
        {
          AdobeAssetFile.this.getRenditionFromServerWithType(paramAdobeAssetFileRenditionType, paramAdobeAssetImageDimensions, paramInt, paramIAdobeGenericRequestCallback);
        }
      };
      if (!AdobeCommonCache.getSharedInstance().getDataFromGUID(cacheGUID(), cacheKey(paramAdobeAssetFileRenditionType, paramAdobeAssetImageDimensions, paramInt), EnumSet.of(AdobeCommonCacheOptions.AdobeCommonCacheKeepInMemoryCache), "com.adobe.cc.storage", local7, handler))
      {
        AdobeLogger.log(Level.ERROR, "AdobeAssetFile:GetRenditionFromCache", String.format("Rendition request for %s ended in error.", new Object[] { href }));
        paramIAdobeGenericRequestCallback.onError(null);
      }
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
  }
  
  private void getVideoMetadata(final IAdobeGenericCompletionCallback<JSONObject> paramIAdobeGenericCompletionCallback, final IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    paramIAdobeGenericCompletionCallback = new IAdobeStorageDataRequestCompletionHandler()
    {
      public void onComplete(byte[] paramAnonymousArrayOfByte)
      {
        if (paramAnonymousArrayOfByte != null)
        {
          JSONObject localJSONObject = AdobeStorageUtils.JSONObjectWithData(new String(paramAnonymousArrayOfByte));
          paramIAdobeGenericCompletionCallback.onCompletion(localJSONObject);
          if (!AdobeCommonCache.getSharedInstance().addData(paramAnonymousArrayOfByte, AdobeAssetFile.this.cacheGUID(), "video-data", EnumSet.of(AdobeCommonCacheOptions.AdobeCommonCacheKeepInMemoryCache, AdobeCommonCacheOptions.AdobeCommonCacheKeepOnDiskCache), "com.adobe.cc.storage")) {
            AdobeLogger.log(Level.ERROR, "AdobeAssetFile:getVideoMetadata", String.format("Adding to caches is failed for %s", new Object[] { href }));
          }
        }
      }
      
      public void onError(AdobeAssetException paramAnonymousAdobeAssetException)
      {
        paramIAdobeGenericErrorCallback.onError(paramAnonymousAdobeAssetException);
      }
      
      public void onProgress(double paramAnonymousDouble) {}
    };
    paramIAdobeGenericErrorCallback = getSession();
    if (paramIAdobeGenericErrorCallback == null) {
      return;
    }
    paramIAdobeGenericErrorCallback.getVideoMetadata(resourceItem(), type, paramIAdobeGenericCompletionCallback);
  }
  
  public void cancelDataRequest()
  {
    AdobeStorageSession localAdobeStorageSession = getSession();
    if (localAdobeStorageSession == null) {
      return;
    }
    localAdobeStorageSession.cancelRequest(dataRequest);
  }
  
  public void cancelRenditionRequest()
  {
    if (renditionRequest != null)
    {
      renditionRequest.cancel();
      return;
    }
    pendingRendRequestCancellation = true;
  }
  
  public void downloadAssetFile(URI paramURI, IAdobeGenericRequestCallback<Boolean, AdobeAssetException> paramIAdobeGenericRequestCallback)
  {
    downloadAssetFileForPage(paramURI, 0, paramIAdobeGenericRequestCallback);
  }
  
  public void downloadAssetFileForPage(URI paramURI, final int paramInt, final IAdobeGenericRequestCallback<Boolean, AdobeAssetException> paramIAdobeGenericRequestCallback)
  {
    paramIAdobeGenericRequestCallback = new IAdobeStorageResourceRequestCompletionHandler()
    {
      public void onComplete(AdobeStorageResourceItem paramAnonymousAdobeStorageResourceItem)
      {
        dataRequest = null;
        if (paramAnonymousAdobeStorageResourceItem != null) {
          paramIAdobeGenericRequestCallback.onCompletion(Boolean.valueOf(true));
        }
      }
      
      public void onError(AdobeAssetException paramAnonymousAdobeAssetException)
      {
        if ((paramAnonymousAdobeAssetException != null) && (paramAnonymousAdobeAssetException.getErrorCode() == AdobeAssetErrorCode.AdobeAssetErrorCancelled))
        {
          paramAnonymousAdobeAssetException = "Data Request for page " + paramInt + " in " + href + "has been cancelled";
          AdobeLogger.log(Level.INFO, "AssetFile.getPage", paramAnonymousAdobeAssetException);
          paramIAdobeGenericRequestCallback.onCancellation();
        }
        while (paramAnonymousAdobeAssetException == null) {
          return;
        }
        String str = "Data Request for page " + paramInt + " in " + href + "ended in error";
        AdobeLogger.log(Level.INFO, "AssetFile.getPage", str, paramAnonymousAdobeAssetException);
        paramIAdobeGenericRequestCallback.onError(paramAnonymousAdobeAssetException);
      }
      
      public void onProgress(double paramAnonymousDouble)
      {
        paramIAdobeGenericRequestCallback.onProgress(paramAnonymousDouble);
      }
    };
    AdobeStorageSession localAdobeStorageSession = getSession();
    if (localAdobeStorageSession == null) {
      return;
    }
    dataRequest = localAdobeStorageSession.getFile(resourceItem(), paramIAdobeGenericRequestCallback, paramURI.getPath());
  }
  
  public int getCurrentVersion()
  {
    return currentVersion;
  }
  
  public long getFileSize()
  {
    return fileSize;
  }
  
  public String getMd5Hash()
  {
    return md5Hash;
  }
  
  public JSONObject getOptionalMetadata()
  {
    return optionalMetadata;
  }
  
  public void getRenditionWithType(AdobeAssetFileRenditionType paramAdobeAssetFileRenditionType, AdobeAssetImageDimensions paramAdobeAssetImageDimensions, int paramInt, IAdobeGenericRequestCallback<byte[], AdobeAssetException> paramIAdobeGenericRequestCallback)
  {
    boolean bool = AdobeEntitlementServices.getSharedServices().isEntitledToService("ccv", getCloud());
    Object localObject;
    AdobeCommonCacheHandler local6;
    if ((type.equals("application/vnd.adobe.ccv.videometadata")) || (type.startsWith("video/")))
    {
      localObject = (AdobeAssetFileInternal)this;
      if (bool)
      {
        local6 = new AdobeCommonCacheHandler()
        {
          public void onHit(byte[] paramAnonymousArrayOfByte, AdobeCommonCacheHitLocation paramAnonymousAdobeCommonCacheHitLocation)
          {
            JSONObject localJSONObject = AdobeStorageUtils.JSONObjectWithData(new String(paramAnonymousArrayOfByte));
            paramAnonymousAdobeCommonCacheHitLocation = localJSONObject.optString("hls_playlist", null);
            int j = 1;
            paramAnonymousArrayOfByte = paramAnonymousAdobeCommonCacheHitLocation;
            int i = j;
            if (paramAnonymousAdobeCommonCacheHitLocation != null) {}
            try
            {
              paramAnonymousArrayOfByte = URLDecoder.decode(paramAnonymousAdobeCommonCacheHitLocation, "UTF-8");
              paramAnonymousAdobeCommonCacheHitLocation = paramAnonymousArrayOfByte;
            }
            catch (UnsupportedEncodingException paramAnonymousArrayOfByte)
            {
              label189:
              do
              {
                for (;;)
                {
                  long l;
                  Matcher localMatcher;
                  paramAnonymousArrayOfByte.printStackTrace();
                  continue;
                  i = 0;
                  paramAnonymousArrayOfByte = paramAnonymousAdobeCommonCacheHitLocation;
                }
              } while ((val$fileInternal.hlsHref != null) && (val$fileInternal.hlsHref.equals(paramAnonymousArrayOfByte)));
              val$fileInternal.hlsHref = localJSONObject.optString("hls_playlist", null);
              val$fileInternal._videDuration = localJSONObject.optInt("duration", 0);
            }
            l = new Date().getTime() / 1000L;
            localMatcher = Pattern.compile("~exp=(\\d+)~", 2).matcher(paramAnonymousAdobeCommonCacheHitLocation);
            paramAnonymousArrayOfByte = paramAnonymousAdobeCommonCacheHitLocation;
            i = j;
            if (localMatcher.find())
            {
              if (l >= Long.parseLong(paramAnonymousAdobeCommonCacheHitLocation.substring(localMatcher.start() + 5, localMatcher.end() - 1)))
              {
                paramAnonymousArrayOfByte = null;
                i = j;
              }
            }
            else
            {
              if (i == 0) {
                break label189;
              }
              AdobeCommonCache.getSharedInstance().removeItemWithGUID(jdField_this.cacheGUID(), "video-data", "com.adobe.cc.storage");
              val$fileInternal.hlsHref = null;
              paramAnonymousArrayOfByte = new IAdobeGenericCompletionCallback()
              {
                public void onCompletion(JSONObject paramAnonymous2JSONObject)
                {
                  val$fileInternal.hlsHref = paramAnonymous2JSONObject.optString("hls_playlist", null);
                  val$fileInternal._videDuration = paramAnonymous2JSONObject.optInt("duration", 0);
                }
              };
              paramAnonymousAdobeCommonCacheHitLocation = new IAdobeGenericErrorCallback()
              {
                public void onError(AdobeCSDKException paramAnonymous2AdobeCSDKException)
                {
                  AdobeLogger.log(Level.ERROR, "AdobeGetRendition:for video", String.format("Failed to get video metadata for %s: %s", new Object[] { val$that.name, paramAnonymous2AdobeCSDKException }));
                }
              };
              jdField_this.getVideoMetadata(paramAnonymousArrayOfByte, paramAnonymousAdobeCommonCacheHitLocation);
              return;
            }
          }
          
          public void onMiss()
          {
            IAdobeGenericCompletionCallback local3 = new IAdobeGenericCompletionCallback()
            {
              public void onCompletion(JSONObject paramAnonymous2JSONObject)
              {
                val$fileInternal.hlsHref = paramAnonymous2JSONObject.optString("hls_playlist", null);
                val$fileInternal._videDuration = paramAnonymous2JSONObject.optInt("duration", 0);
              }
            };
            IAdobeGenericErrorCallback local4 = new IAdobeGenericErrorCallback()
            {
              public void onError(AdobeCSDKException paramAnonymous2AdobeCSDKException)
              {
                AdobeLogger.log(Level.ERROR, "AdobeGetRendition:for video", String.format("Failed to get video metadata for %s: %s", new Object[] { val$that.name, paramAnonymous2AdobeCSDKException }));
              }
            };
            jdField_this.getVideoMetadata(local3, local4);
          }
        };
        localObject = null;
      }
    }
    else
    {
      try
      {
        Handler localHandler = new Handler();
        localObject = localHandler;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          AdobeLogger.log(Level.ERROR, "GetRendition", "failure:handler creation failed");
        }
      }
      if (!AdobeCommonCache.getSharedInstance().getDataFromGUID(cacheGUID(), "video-data", EnumSet.of(AdobeCommonCacheOptions.AdobeCommonCacheKeepInMemoryCache), "com.adobe.cc.storage", local6, (Handler)localObject))
      {
        AdobeLogger.log(Level.ERROR, "AdobeAssetFile:GetRenditionFromCache", String.format("Rendition request for %s ended in error.", new Object[] { href }));
        paramIAdobeGenericRequestCallback.onError(null);
      }
    }
    for (;;)
    {
      getRenditionWithTypeForData(paramAdobeAssetFileRenditionType, paramAdobeAssetImageDimensions, paramInt, paramIAdobeGenericRequestCallback);
      return;
      hlsHref = null;
    }
  }
  
  public void getRenditionWithType(AdobeAssetFileRenditionType paramAdobeAssetFileRenditionType, AdobeAssetImageDimensions paramAdobeAssetImageDimensions, IAdobeGenericRequestCallback<byte[], AdobeAssetException> paramIAdobeGenericRequestCallback)
  {
    getRenditionWithType(paramAdobeAssetFileRenditionType, paramAdobeAssetImageDimensions, 0, paramIAdobeGenericRequestCallback);
  }
  
  public String getType()
  {
    return type;
  }
  
  protected AdobeStorageResourceItem resourceItem()
  {
    if (asrItem == null)
    {
      asrItem = AdobeStorageResourceItem.resourceFromHref(href);
      asrItem.name = name;
      asrItem.etag = etag;
      asrItem.internalID = GUID;
      asrItem.setMd5(md5Hash);
    }
    return asrItem;
  }
}
