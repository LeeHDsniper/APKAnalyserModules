package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXComponent;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXManifest;
import com.adobe.creativesdk.foundation.internal.storage.asset.AdobeAssetPSMixPage;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceCollection;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import java.util.ArrayList;
import java.util.Iterator;

public class AdobeAssetPSMixFile
  extends AdobeAssetPackagePages
{
  public AdobeAssetPSMixFile() {}
  
  public AdobeAssetPSMixFile(AdobeStorageResourceCollection paramAdobeStorageResourceCollection1, AdobeStorageResourceCollection paramAdobeStorageResourceCollection2)
  {
    super(paramAdobeStorageResourceCollection1, paramAdobeStorageResourceCollection2);
  }
  
  public boolean equals(Object paramObject)
  {
    if ((paramObject instanceof AdobeAssetPSMixFile)) {
      return super.equals(paramObject);
    }
    return false;
  }
  
  public void loadMetadata(final IAdobeRequestCompletionCallback paramIAdobeRequestCompletionCallback, IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    super.loadMetadata(new IAdobeRequestCompletionCallback()
    {
      public void onCompletion()
      {
        Object localObject;
        ArrayList localArrayList;
        int i;
        if (jdField_this.getManifest() != null)
        {
          localObject = jdField_this.getManifest().getComponents();
          localArrayList = new ArrayList();
          i = 0;
          localObject = ((ArrayList)localObject).iterator();
        }
        for (;;)
        {
          if (((Iterator)localObject).hasNext())
          {
            AdobeDCXComponent localAdobeDCXComponent = (AdobeDCXComponent)((Iterator)localObject).next();
            if ((localAdobeDCXComponent.getRelationship() != null) && (localAdobeDCXComponent.getRelationship().equals("rendition")) && (localAdobeDCXComponent != null)) {
              localArrayList.add(new AdobeAssetPSMixPage(localAdobeDCXComponent.getName(), i, localAdobeDCXComponent, jdField_this));
            }
          }
          else
          {
            if (localArrayList.size() > 0) {
              jdField_thispages = localArrayList;
            }
            if (paramIAdobeRequestCompletionCallback != null) {
              paramIAdobeRequestCompletionCallback.onCompletion();
            }
            return;
            localObject = null;
            break;
          }
          i += 1;
        }
      }
    }, paramIAdobeGenericErrorCallback);
  }
}
