package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXComponent;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXManifest;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXManifestNode;
import com.adobe.creativesdk.foundation.internal.storage.asset.AdobeAssetLinePage;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceCollection;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;

public class AdobeAssetLineFile
  extends AdobeAssetPackagePages
{
  public AdobeAssetLineFile() {}
  
  public AdobeAssetLineFile(AdobeStorageResourceCollection paramAdobeStorageResourceCollection1, AdobeStorageResourceCollection paramAdobeStorageResourceCollection2)
  {
    super(paramAdobeStorageResourceCollection1, paramAdobeStorageResourceCollection2);
  }
  
  public boolean equals(Object paramObject)
  {
    if ((paramObject instanceof AdobeAssetLineFile)) {
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
        if (jdField_this.getManifest() != null) {}
        ArrayList localArrayList;
        for (LinkedHashMap localLinkedHashMap = jdField_this.getManifest().getAllChildren();; localLinkedHashMap = null)
        {
          localArrayList = new ArrayList();
          int i = 0;
          if (localLinkedHashMap == null) {
            break;
          }
          Iterator localIterator1 = localLinkedHashMap.entrySet().iterator();
          while (localIterator1.hasNext())
          {
            Object localObject = (Map.Entry)localIterator1.next();
            String str1 = (String)((Map.Entry)localObject).getKey();
            localObject = (AdobeDCXManifestNode)((Map.Entry)localObject).getValue();
            String str2 = ((AdobeDCXManifestNode)localObject).getName();
            localObject = jdField_this.getManifest().getComponentsOfChild((AdobeDCXManifestNode)localObject);
            str1 = null;
            Iterator localIterator2 = ((ArrayList)localObject).iterator();
            do
            {
              localObject = str1;
              if (!localIterator2.hasNext()) {
                break;
              }
              localObject = (AdobeDCXComponent)localIterator2.next();
            } while ((((AdobeDCXComponent)localObject).getRelationship() == null) || (!((AdobeDCXComponent)localObject).getRelationship().equals("rendition")));
            if (localObject != null)
            {
              localObject = new AdobeAssetLinePage(str2, i, (AdobeDCXComponent)localObject, jdField_this);
              i += 1;
              localArrayList.add(localObject);
            }
          }
        }
        if (localArrayList.size() > 0)
        {
          jdField_thispages = localArrayList;
          if ((localLinkedHashMap != null) && (localLinkedHashMap.size() <= 2)) {
            jdField_thisname = ((AdobeAssetFile)jdField_thispages.get(0)).getName();
          }
        }
        if (paramIAdobeRequestCompletionCallback != null) {
          paramIAdobeRequestCompletionCallback.onCompletion();
        }
      }
    }, paramIAdobeGenericErrorCallback);
  }
}
