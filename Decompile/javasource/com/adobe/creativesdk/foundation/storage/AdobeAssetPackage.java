package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXException;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXManifest;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpRequestMethod;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpResponse;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageOrderByProperty;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageOrderRelation;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResource;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceCollection;
import com.adobe.creativesdk.foundation.internal.storage.model.services.AdobeStorageSession;
import com.adobe.creativesdk.foundation.internal.storage.model.services.AdobeStorageSession.IStorageResponseCallback;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageUtils;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException;
import java.lang.ref.WeakReference;
import java.net.URI;
import java.util.HashMap;

public class AdobeAssetPackage
  extends AdobeAssetFolder
{
  private AdobeStorageResourceCollection asrCollection;
  private AdobeDCXManifest manifest;
  private boolean metadataLoaded;
  
  protected AdobeAssetPackage()
  {
    metadataLoaded = false;
  }
  
  protected AdobeAssetPackage(AdobeStorageResourceCollection paramAdobeStorageResourceCollection, AdobeStorageOrderByProperty paramAdobeStorageOrderByProperty, AdobeStorageOrderRelation paramAdobeStorageOrderRelation, URI paramURI)
  {
    asrCollection = paramAdobeStorageResourceCollection;
    GUID = internalID;
    href = href;
    etag = etag;
    name = name;
    parentHref = paramURI;
    creationDate = AdobeStorageUtils.convertStringToDate(created);
    modificationDate = AdobeStorageUtils.convertStringToDate(modified);
    if ((creationDate == null) && (modificationDate != null)) {
      creationDate = modificationDate;
    }
    asrCollection.setOrderBy(paramAdobeStorageOrderByProperty);
    asrCollection.setOrder(paramAdobeStorageOrderRelation);
  }
  
  public AdobeAssetPackage(AdobeStorageResourceCollection paramAdobeStorageResourceCollection1, AdobeStorageResourceCollection paramAdobeStorageResourceCollection2) {}
  
  public AdobeStorageResourceCollection getAsrCollection()
  {
    return asrCollection;
  }
  
  public AdobeDCXManifest getManifest()
  {
    return manifest;
  }
  
  public boolean isMetadataLoaded()
  {
    return metadataLoaded;
  }
  
  void loadDCXManifest(final IAdobeGenericCompletionCallback<AdobeDCXManifest> paramIAdobeGenericCompletionCallback, final IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    AdobeStorageResource localAdobeStorageResource = new AdobeStorageResource();
    href = URI.create(String.format("%s%s", new Object[] { href, "manifest" }));
    AdobeStorageSession localAdobeStorageSession = getSession();
    if (localAdobeStorageSession == null) {
      return;
    }
    localAdobeStorageSession.getResponseFor(localAdobeStorageSession.requestFor(localAdobeStorageResource, AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET, null, false), null, null, new AdobeStorageSession.IStorageResponseCallback()
    {
      public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        if (paramAnonymousAdobeNetworkHttpResponse.getStatusCode() == 404)
        {
          paramAnonymousAdobeNetworkHttpResponse = String.format("The requested manifest for package %s not found. This is most likely due to an empty asset package (no manifest).", new Object[] { ((AdobeAssetPackage)val$weakThis.get()).getDescription() });
          if (paramIAdobeGenericErrorCallback != null)
          {
            paramAnonymousAdobeNetworkHttpResponse = new HashMap();
            paramAnonymousAdobeNetworkHttpResponse = new AdobeAssetException(AdobeAssetErrorCode.AdobeAssetErrorFileReadFailure, paramAnonymousAdobeNetworkHttpResponse);
            paramIAdobeGenericErrorCallback.onError(paramAnonymousAdobeNetworkHttpResponse);
            return;
          }
          AdobeLogger.log(Level.ERROR, "AdobeAssetPackage.loadDCXManifest", paramAnonymousAdobeNetworkHttpResponse);
          return;
        }
        try
        {
          paramAnonymousAdobeNetworkHttpResponse = new AdobeDCXManifest(paramAnonymousAdobeNetworkHttpResponse.getDataString());
          paramIAdobeGenericErrorCallback.onError(paramAnonymousAdobeNetworkHttpResponse);
        }
        catch (AdobeDCXException paramAnonymousAdobeNetworkHttpResponse)
        {
          try
          {
            val$weakThis.get()).GUID = paramAnonymousAdobeNetworkHttpResponse.getCompositeId();
            val$weakThis.get()).name = paramAnonymousAdobeNetworkHttpResponse.getName();
            if (paramIAdobeGenericCompletionCallback != null) {
              paramIAdobeGenericCompletionCallback.onCompletion(paramAnonymousAdobeNetworkHttpResponse);
            }
            return;
          }
          catch (AdobeDCXException paramAnonymousAdobeNetworkHttpResponse)
          {
            for (;;) {}
          }
          paramAnonymousAdobeNetworkHttpResponse = paramAnonymousAdobeNetworkHttpResponse;
        }
      }
      
      public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
      {
        paramIAdobeGenericErrorCallback.onError(paramAnonymousAdobeNetworkException);
      }
      
      public void onProgress(double paramAnonymousDouble) {}
    });
  }
  
  public void loadMetadata(final IAdobeRequestCompletionCallback paramIAdobeRequestCompletionCallback, final IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    if (isMetadataLoaded())
    {
      paramIAdobeRequestCompletionCallback.onCompletion();
      return;
    }
    loadDCXManifest(new IAdobeGenericCompletionCallback()new IAdobeGenericErrorCallback
    {
      public void onCompletion(AdobeDCXManifest paramAnonymousAdobeDCXManifest)
      {
        AdobeAssetPackage.access$002((AdobeAssetPackage)val$weakThis.get(), paramAnonymousAdobeDCXManifest);
        AdobeAssetPackage.access$102((AdobeAssetPackage)val$weakThis.get(), true);
        paramIAdobeRequestCompletionCallback.onCompletion();
      }
    }, new IAdobeGenericErrorCallback()
    {
      public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException)
      {
        AdobeLogger.log(Level.ERROR, "AdobeAssetPackage.loadMetadata", String.format("Failed to get the manifest for %s.", new Object[] { GUID }));
        paramIAdobeGenericErrorCallback.onError(paramAnonymousAdobeCSDKException);
      }
    });
  }
  
  public void reloadMetadata(IAdobeRequestCompletionCallback paramIAdobeRequestCompletionCallback, IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    metadataLoaded = false;
    loadMetadata(paramIAdobeRequestCompletionCallback, paramIAdobeGenericErrorCallback);
  }
  
  protected AdobeStorageResourceCollection resourceCollection()
  {
    if (asrCollection != null)
    {
      asrCollection = AdobeStorageResourceCollection.collectionFromHref(href);
      asrCollection.name = name;
      asrCollection.internalID = GUID;
      asrCollection.href = href;
      asrCollection.etag = etag;
      asrCollection.setCloud(getCloud());
    }
    return asrCollection;
  }
  
  protected void setCloud(AdobeCloud paramAdobeCloud)
  {
    mCloud = paramAdobeCloud;
  }
}
