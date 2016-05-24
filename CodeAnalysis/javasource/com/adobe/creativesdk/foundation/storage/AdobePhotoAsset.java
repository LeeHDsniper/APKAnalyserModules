package com.adobe.creativesdk.foundation.storage;

import android.os.Handler;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCache;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCacheHandler;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCacheHitLocation;
import com.adobe.creativesdk.foundation.internal.cache.AdobeCommonCacheOptions;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpTaskHandle;
import com.adobe.creativesdk.foundation.internal.net.IAdobeNetworkHttpTaskHandleListener;
import com.adobe.creativesdk.foundation.internal.photo.util.AdobePhotoUtils;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageUtils;
import com.adobe.creativesdk.foundation.internal.storage.photo.AdobePhotoSession;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException.AdobeNetworkErrorCode;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.net.URI;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobePhotoAsset
  extends AdobePhoto
  implements Externalizable
{
  private AdobePhotoCatalog _catalog;
  private String _contentType;
  private IAdobeNetworkHttpTaskHandleListener _downloadProgressListener = null;
  private AdobeNetworkHttpTaskHandle _downloadRequestHandle = null;
  private AdobePhotoAssetRevision _latestRevision;
  private JSONObject _metadata;
  private String _name;
  private String _order;
  private IAdobeNetworkHttpTaskHandleListener _progressListener = null;
  private Map<String, AdobePhotoAssetRendition> _renditions;
  private AdobePhotoAssetRevision _revision;
  private long _size;
  private AdobePhotoAssetType _type;
  private AdobeNetworkHttpTaskHandle _uploadRequestHandle = null;
  
  public AdobePhotoAsset() {}
  
  public AdobePhotoAsset(String paramString1, String paramString2, AdobePhotoCatalog paramAdobePhotoCatalog)
  {
    String str = paramString2;
    if (paramString2 == null) {
      str = AdobePhotoUtils.generateGUID();
    }
    _GUID = str;
    _href = ("/v1.0/catalogs/" + paramAdobePhotoCatalog.getGUID() + "/assets/" + str);
    _catalog = paramAdobePhotoCatalog;
    _cloud = paramAdobePhotoCatalog.getCloud();
    _name = paramString1;
    _order = null;
    _renditions = new HashMap();
    _metadata = new JSONObject();
    _type = null;
  }
  
  void addRenditionLink(JSONObject paramJSONObject, AdobePhotoAssetRendition.AdobePhotoAssetRenditionType paramAdobePhotoAssetRenditionType, Map<String, AdobePhotoAssetRendition> paramMap, String paramString)
  {
    if (paramJSONObject != null) {
      paramMap.put(paramString, new AdobePhotoAssetRendition(URI.create(paramJSONObject.optString("href", null)), paramAdobePhotoAssetRenditionType));
    }
  }
  
  public void cancelDownloadRequest()
  {
    if (_downloadRequestHandle != null)
    {
      if (_downloadProgressListener != null)
      {
        _downloadRequestHandle.unregisterListener(_downloadProgressListener);
        _downloadProgressListener = null;
      }
      _downloadRequestHandle.cancel();
      _downloadRequestHandle = null;
    }
  }
  
  public void downloadRendition(final AdobePhotoAssetRendition paramAdobePhotoAssetRendition, final IAdobeGenericRequestCallback<byte[], AdobePhotoException> paramIAdobeGenericRequestCallback)
  {
    if (_revision == null) {}
    for (Object localObject = "(null)";; localObject = _revision.getGUID())
    {
      final String str = String.format("%s_%s_%s", new Object[] { paramAdobePhotoAssetRendition.getGUID(), localObject, Integer.valueOf(paramAdobePhotoAssetRendition.getType().getValue()) });
      AdobeCommonCacheHandler local22 = new AdobeCommonCacheHandler()
      {
        public void onHit(byte[] paramAnonymousArrayOfByte, AdobeCommonCacheHitLocation paramAnonymousAdobeCommonCacheHitLocation)
        {
          paramIAdobeGenericRequestCallback.onCompletion(paramAnonymousArrayOfByte);
        }
        
        public void onMiss()
        {
          AdobePhotoAsset.access$102(AdobePhotoAsset.this, null);
          AdobePhotoAsset.access$202(AdobePhotoAsset.this, new IAdobeNetworkHttpTaskHandleListener()
          {
            public void onProgressNotification(double paramAnonymous2Double)
            {
              val$downloadRenditionCallback.onProgress(paramAnonymous2Double);
            }
          });
          IAdobeGenericCompletionCallback local2 = new IAdobeGenericCompletionCallback()
          {
            public void onCompletion(byte[] paramAnonymous2ArrayOfByte)
            {
              handleCommonDownloadCompletionBookKeeping();
              val$downloadRenditionCallback.onCompletion(paramAnonymous2ArrayOfByte);
              if (!AdobeCommonCache.getSharedInstance().addData(paramAnonymous2ArrayOfByte, _GUID, val$cacheKey, EnumSet.of(AdobeCommonCacheOptions.AdobeCommonCacheKeepInMemoryCache, AdobeCommonCacheOptions.AdobeCommonCacheKeepOnDiskCache), "com.adobe.cc.photo")) {
                AdobeLogger.log(Level.ERROR, AdobePhotoAsset.class.getSimpleName(), "Request for cache com.adobe.cc.photo ended in Error");
              }
            }
          };
          IAdobeGenericErrorCallback local3 = new IAdobeGenericErrorCallback()
          {
            public void onError(AdobeCSDKException paramAnonymous2AdobeCSDKException)
            {
              handleCommonUploadCompletionBookKeeping();
              if ((paramAnonymous2AdobeCSDKException instanceof AdobeNetworkException))
              {
                if (((AdobeNetworkException)paramAnonymous2AdobeCSDKException).getErrorCode() == AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorCancelled)
                {
                  val$downloadRenditionCallback.onCancellation();
                  return;
                }
                AdobeLogger.log(Level.INFO, AdobePhotoAsset.class.getSimpleName(), "Failed to download data for photo asset " + _name);
                return;
              }
              if ((paramAnonymous2AdobeCSDKException instanceof AdobePhotoException))
              {
                val$downloadRenditionCallback.onError((AdobePhotoException)paramAnonymous2AdobeCSDKException);
                return;
              }
              AdobeLogger.log(Level.ERROR, AdobePhotoAsset.class.getSimpleName(), "Failed to download data for photo asset " + _name);
            }
          };
          if (getSession() == null) {
            return;
          }
          AdobePhotoAsset.access$102(AdobePhotoAsset.this, getSession().downloadRendition(paramAdobePhotoAssetRendition, AdobePhotoAsset.this, local2, local3));
          _downloadRequestHandle.registerListener(_downloadProgressListener);
        }
      };
      paramAdobePhotoAssetRendition = null;
      try
      {
        localObject = new Handler();
        paramAdobePhotoAssetRendition = (AdobePhotoAssetRendition)localObject;
      }
      catch (Exception localException)
      {
        for (;;) {}
      }
      if (!AdobeCommonCache.getSharedInstance().getDataFromGUID(_GUID, str, EnumSet.of(AdobeCommonCacheOptions.AdobeCommonCacheKeepInMemoryCache), "com.adobe.cc.photo", local22, paramAdobePhotoAssetRendition))
      {
        AdobeLogger.log(Level.ERROR, AdobePhotoAsset.class.getSimpleName(), "Request for cache com.adobe.cc.photoended in Error");
        paramIAdobeGenericRequestCallback.onError(new AdobePhotoException(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_FILE_READ_FAILURE));
      }
      return;
    }
  }
  
  public JSONObject getMetadata()
  {
    return _metadata;
  }
  
  public String getName()
  {
    return _name;
  }
  
  public Map<String, AdobePhotoAssetRendition> getRenditions()
  {
    return _renditions;
  }
  
  void handleCommonDownloadCompletionBookKeeping()
  {
    if (_downloadRequestHandle != null) {
      _downloadRequestHandle.unregisterListener(_downloadProgressListener);
    }
    _downloadRequestHandle = null;
    _downloadProgressListener = null;
  }
  
  void handleCommonUploadCompletionBookKeeping()
  {
    if (_uploadRequestHandle != null) {
      _uploadRequestHandle.unregisterListener(_progressListener);
    }
    _uploadRequestHandle = null;
    _progressListener = null;
  }
  
  public boolean isEqualToAsset(AdobePhotoAsset paramAdobePhotoAsset)
  {
    return (_GUID.equals(_GUID)) && (_catalog.isEqualToCatalog(_catalog));
  }
  
  public void readExternal(ObjectInput paramObjectInput)
    throws IOException, ClassNotFoundException
  {
    super.readExternal(paramObjectInput);
    _name = ((String)paramObjectInput.readObject());
    _catalog = ((AdobePhotoCatalog)paramObjectInput.readObject());
    _contentType = ((String)paramObjectInput.readObject());
    try
    {
      _metadata = new JSONObject((String)paramObjectInput.readObject());
      _latestRevision = ((AdobePhotoAssetRevision)paramObjectInput.readObject());
      _revision = ((AdobePhotoAssetRevision)paramObjectInput.readObject());
      _renditions = ((Map)paramObjectInput.readObject());
      _order = ((String)paramObjectInput.readObject());
      _size = paramObjectInput.readLong();
      _type = AdobePhotoAssetType.values()[paramObjectInput.readInt()];
      return;
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        AdobeLogger.log(Level.DEBUG, "AdobePhotoAsset.readExternal", localJSONException.getMessage());
      }
    }
  }
  
  public boolean updateFromDictionary(JSONObject paramJSONObject, AdobePhotoCatalog paramAdobePhotoCatalog)
    throws AdobePhotoException
  {
    if (paramJSONObject.optString("id", null) != null) {
      _internalID = paramJSONObject.optString("id", null);
    }
    if (paramJSONObject.optString("_id", null) != null) {
      _GUID = paramJSONObject.optString("_id", null);
    }
    if (paramJSONObject.opt("created") != null) {
      _creationDate = AdobeStorageUtils.convertStringToDate(paramJSONObject.optString("created"));
    }
    if (paramJSONObject.opt("updated") != null) {
      _modificationDate = AdobeStorageUtils.convertStringToDate(paramJSONObject.optString("updated"));
    }
    if ((_modificationDate == null) && (_creationDate != null)) {
      _modificationDate = _creationDate;
    }
    _catalog = paramAdobePhotoCatalog;
    _cloud = paramAdobePhotoCatalog.getCloud();
    paramAdobePhotoCatalog = paramJSONObject.optString("subtype", null);
    if ((paramAdobePhotoCatalog != null) && (paramAdobePhotoCatalog.equals("jpeg"))) {
      _type = AdobePhotoAssetType.AdobePhotoAssetTypeImage;
    }
    if (paramJSONObject.optString("order", null) != null) {
      _order = paramJSONObject.optString("order", null);
    }
    _metadata = paramJSONObject.optJSONObject("payload");
    if (_metadata != null)
    {
      paramAdobePhotoCatalog = _metadata.optJSONObject("importSource");
      if (paramAdobePhotoCatalog != null)
      {
        _name = paramAdobePhotoCatalog.optString("fileName", null);
        _size = paramAdobePhotoCatalog.optLong("fileSize");
        _contentType = paramAdobePhotoCatalog.optString("contentType", null);
      }
      paramJSONObject = paramJSONObject.optJSONObject("links");
      if (paramJSONObject == null) {
        break label510;
      }
      paramAdobePhotoCatalog = paramJSONObject.optJSONObject("self");
      if (paramAdobePhotoCatalog != null) {
        _href = paramAdobePhotoCatalog.optString("href", null);
      }
      paramAdobePhotoCatalog = paramJSONObject.optJSONObject("/rels/latest_revision");
      if (paramAdobePhotoCatalog != null)
      {
        _latestRevision = new AdobePhotoAssetRevision(paramAdobePhotoCatalog.optString("href", null), false);
        _revision = _latestRevision;
      }
      paramAdobePhotoCatalog = paramJSONObject.optJSONObject("/rels/master");
      if ((paramAdobePhotoCatalog != null) && (_contentType == null)) {
        _contentType = paramAdobePhotoCatalog.optString("content_type", null);
      }
      paramAdobePhotoCatalog = new HashMap();
      addRenditionLink(paramJSONObject.optJSONObject("/rels/rendition_type/144h"), AdobePhotoAssetRendition.AdobePhotoAssetRenditionType.ADOBE_PHOTO_ASSET_RENDITION_TYPE_IMAGE_THUMBNAIL, paramAdobePhotoCatalog, "144h");
      addRenditionLink(paramJSONObject.optJSONObject("/rels/rendition_type/thumbnail2x"), AdobePhotoAssetRendition.AdobePhotoAssetRenditionType.ADOBE_PHOTO_ASSET_RENDITION_TYPE_IMAGE_THUMBNAIL_2X, paramAdobePhotoCatalog, "thumbnail2x");
      addRenditionLink(paramJSONObject.optJSONObject("/rels/rendition_type/2048"), AdobePhotoAssetRendition.AdobePhotoAssetRenditionType.ADOBE_PHOTO_ASSET_RENDITION_TYPE_IMAGE_2048, paramAdobePhotoCatalog, "2048");
      addRenditionLink(paramJSONObject.optJSONObject("/rels/rendition_type/1024"), AdobePhotoAssetRendition.AdobePhotoAssetRenditionType.ADOBE_PHOTO_ASSET_RENDITION_TYPE_IMAGE_1024, paramAdobePhotoCatalog, "1024");
      addRenditionLink(paramJSONObject.optJSONObject("/rels/rendition_type/fullsize"), AdobePhotoAssetRendition.AdobePhotoAssetRenditionType.ADOBE_PHOTO_ASSET_RENDITION_TYPE_IMAGE_FULL_SIZE, paramAdobePhotoCatalog, "fullsize");
      addRenditionLink(paramJSONObject.optJSONObject("/rels/rendition_type/favorite"), AdobePhotoAssetRendition.AdobePhotoAssetRenditionType.ADOBE_PHOTO_ASSET_RENDITION_TYPE_IMAGE_FAVORITE, paramAdobePhotoCatalog, "favorite");
      addRenditionLink(paramJSONObject.optJSONObject("/rels/rendition_type/preview"), AdobePhotoAssetRendition.AdobePhotoAssetRenditionType.ADOBE_PHOTO_ASSET_RENDITION_TYPE_IMAGE_PREVIEW, paramAdobePhotoCatalog, "preview");
      _renditions = paramAdobePhotoCatalog;
    }
    for (;;)
    {
      return true;
      _metadata = new JSONObject();
      break;
      label510:
      AdobeLogger.log(Level.WARN, AdobePhotoAsset.class.getSimpleName(), "Asset doesn't have any links.");
      _href = null;
    }
  }
  
  public void writeExternal(ObjectOutput paramObjectOutput)
    throws IOException
  {
    super.writeExternal(paramObjectOutput);
    paramObjectOutput.writeObject(_name);
    paramObjectOutput.writeObject(_catalog);
    paramObjectOutput.writeObject(_contentType);
    paramObjectOutput.writeObject(_metadata.toString());
    paramObjectOutput.writeObject(_latestRevision);
    paramObjectOutput.writeObject(_revision);
    paramObjectOutput.writeObject(_renditions);
    paramObjectOutput.writeObject(_order);
    paramObjectOutput.writeLong(_size);
    paramObjectOutput.writeInt(_type.getValue());
  }
  
  public static enum AdobePhotoAssetType
  {
    AdobePhotoAssetTypeImage(0);
    
    private int _val;
    
    private AdobePhotoAssetType(int paramInt)
    {
      _val = paramInt;
    }
    
    public int getValue()
    {
      return _val;
    }
  }
}
