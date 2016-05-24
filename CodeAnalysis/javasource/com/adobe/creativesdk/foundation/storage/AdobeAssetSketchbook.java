package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXComponent;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXManifest;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXManifestNode;
import com.adobe.creativesdk.foundation.internal.storage.asset.AdobeAssetSketchbookPage;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceCollection;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;

public class AdobeAssetSketchbook
  extends AdobeAssetPackagePages
{
  public AdobeAssetSketchbook() {}
  
  public AdobeAssetSketchbook(AdobeStorageResourceCollection paramAdobeStorageResourceCollection1, AdobeStorageResourceCollection paramAdobeStorageResourceCollection2)
  {
    super(paramAdobeStorageResourceCollection1, paramAdobeStorageResourceCollection2);
  }
  
  public boolean equals(Object paramObject)
  {
    if ((paramObject instanceof AdobeAssetSketchbook)) {
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
        ArrayList localArrayList1;
        int j;
        ArrayList localArrayList2;
        Object localObject2;
        Object localObject3;
        for (Object localObject1 = jdField_this.getManifest().getAllChildren();; localObject1 = null)
        {
          localArrayList1 = new ArrayList();
          if (localObject1 == null) {
            break label242;
          }
          j = ((LinkedHashMap)localObject1).size();
          localArrayList2 = new ArrayList(j);
          localObject1 = ((LinkedHashMap)localObject1).entrySet().iterator();
          while (((Iterator)localObject1).hasNext())
          {
            localObject2 = (Map.Entry)((Iterator)localObject1).next();
            localObject3 = (String)((Map.Entry)localObject2).getKey();
            localObject2 = (AdobeDCXManifestNode)((Map.Entry)localObject2).getValue();
            localArrayList2.add((int)((AdobeDCXManifestNode)localObject2).getAbsoluteIndex(), localObject2);
          }
        }
        int i = 0;
        while (i < j)
        {
          localObject3 = (AdobeDCXManifestNode)localArrayList2.get(i);
          localObject1 = jdField_this.getManifest().getComponentsOfChild((AdobeDCXManifestNode)localObject3);
          localObject2 = null;
          Iterator localIterator = ((ArrayList)localObject1).iterator();
          do
          {
            localObject1 = localObject2;
            if (!localIterator.hasNext()) {
              break;
            }
            localObject1 = (AdobeDCXComponent)localIterator.next();
          } while ((((AdobeDCXComponent)localObject1).getRelationship() == null) || (!((AdobeDCXComponent)localObject1).getRelationship().equals("rendition")));
          if (localObject1 != null) {
            localArrayList1.add(new AdobeAssetSketchbookPage(((AdobeDCXManifestNode)localObject3).getName(), i, (AdobeDCXComponent)localObject1, jdField_this));
          }
          i += 1;
        }
        label242:
        if (localArrayList1.size() > 0) {
          jdField_thispages = localArrayList1;
        }
        if (paramIAdobeRequestCompletionCallback != null) {
          paramIAdobeRequestCompletionCallback.onCompletion();
        }
      }
    }, paramIAdobeGenericErrorCallback);
  }
}
