package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.storage.library.AdobeAssetProduct;
import com.adobe.creativesdk.foundation.adobeinternal.storage.library.AdobeAssetProductFolder;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetErrorCode;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolderOrderBy;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolderOrderDirection;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibrary;
import com.adobe.creativesdk.foundation.storage.AdobeAssetPackage;
import com.adobe.creativesdk.foundation.storage.IAdobeAssetFolderNextPageCallback;
import com.adobe.creativesdk.foundation.storage.IAdobeRequestCompletionCallback;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;

public class AdobeAssetDataSource
  implements IAdobeAssetDataSource
{
  private static int kAssetDataSourceItemsPerPageLimit = 20;
  private AdobeCloud _cloud;
  ArrayList<AdobeAsset> data;
  AdobeAssetDataSourceType dataSourceType;
  private IAdobeAssetDataSourceDelegate delegate;
  boolean loadingItems;
  boolean loadingItemsFromScratch;
  private AdobeAssetFolder targetFolder;
  
  public AdobeAssetDataSource(AdobeAssetDataSourceType paramAdobeAssetDataSourceType, AdobeCloud paramAdobeCloud)
  {
    dataSourceType = paramAdobeAssetDataSourceType;
    _cloud = paramAdobeCloud;
  }
  
  public ArrayList<AdobeAsset> assetsToDisplay()
  {
    return data;
  }
  
  public int getCount()
  {
    if (data != null) {
      return data.size();
    }
    return 0;
  }
  
  public IAdobeAssetDataSourceDelegate getDelegate()
  {
    return delegate;
  }
  
  public AdobeAssetFolder getTargetFolder()
  {
    return targetFolder;
  }
  
  public boolean loadItemsFromScratch()
  {
    return loadItemsFromScratch(true);
  }
  
  public boolean loadItemsFromScratch(boolean paramBoolean)
  {
    if (loadingItems) {
      return false;
    }
    if (targetFolder != null)
    {
      loadingItemsFromScratch = paramBoolean;
      if (paramBoolean)
      {
        targetFolder.resetPagingOrderedByField(AdobeAssetFolderOrderBy.ADOBE_ASSET_FOLDER_ORDER_BY_MODIFIED, AdobeAssetFolderOrderDirection.ADOBE_ASSET_FOLDER_ORDER_DESCENDING);
        localObject = getDelegate();
        if (localObject != null) {
          ((IAdobeAssetDataSourceDelegate)localObject).willLoadDataFromScratch();
        }
      }
      if (targetFolder.hasNextPage())
      {
        localObject = getDelegate();
        if (localObject != null) {
          ((IAdobeAssetDataSourceDelegate)localObject).willLoadNextPageForExistingPackage();
        }
        return loadNextPage();
      }
      localObject = getDelegate();
      if (localObject != null) {
        ((IAdobeAssetDataSourceDelegate)localObject).didFinishLoading();
      }
      return true;
    }
    Object localObject = AdobeAssetProduct.AdobeAssetProductUndefined;
    if (dataSourceType.equals(AdobeAssetDataSourceType.AdobeAssetDataSourceDraw)) {
      localObject = AdobeAssetProduct.AdobeAssetProductDraw;
    }
    for (;;)
    {
      targetFolder = AdobeAssetProductFolder.getRootForProduct((AdobeAssetProduct)localObject, _cloud);
      if (paramBoolean)
      {
        localObject = getDelegate();
        if (localObject != null) {
          ((IAdobeAssetDataSourceDelegate)localObject).willLoadDataFromScratch();
        }
      }
      return loadNextPage();
      if (dataSourceType.equals(AdobeAssetDataSourceType.AdobeAssetDataSourceSketches)) {
        localObject = AdobeAssetProduct.AdobeAssetProductSketch;
      } else if (dataSourceType.equals(AdobeAssetDataSourceType.AdobeAssetDataSourceLine)) {
        localObject = AdobeAssetProduct.AdobeAssetProductLine;
      } else if (dataSourceType.equals(AdobeAssetDataSourceType.AdobeAssetDataSourceLibrary)) {
        localObject = AdobeAssetProduct.AdobeAssetProductLibrary;
      } else if (dataSourceType.equals(AdobeAssetDataSourceType.AdobeAssetDataSourcePSMix)) {
        localObject = AdobeAssetProduct.AdobeAssetProductPSMix;
      } else if (dataSourceType.equals(AdobeAssetDataSourceType.AdobeAssetDataSourceCompositions)) {
        localObject = AdobeAssetProduct.AdobeAssetProductComposition;
      }
    }
  }
  
  public boolean loadNextPage()
  {
    if (loadingItems) {}
    Object localObject;
    do
    {
      return false;
      if (targetFolder.hasNextPage()) {
        break;
      }
      localObject = getDelegate();
    } while (localObject == null);
    ((IAdobeAssetDataSourceDelegate)localObject).didFinishLoading();
    return false;
    loadingItems = true;
    int i = 0;
    if (0 == 0) {
      i = kAssetDataSourceItemsPerPageLimit;
    }
    for (;;)
    {
      localObject = new IAdobeAssetFolderNextPageCallback()
      {
        final ArrayList<AdobeAsset> newData = new ArrayList();
        final int[] numberProcessed = { 0 };
        
        private void allItemsLoaded()
        {
          Collections.sort(newData, new Comparator()
          {
            public int compare(AdobeAsset paramAnonymous2AdobeAsset1, AdobeAsset paramAnonymous2AdobeAsset2)
            {
              paramAnonymous2AdobeAsset1 = ((AdobeAssetPackage)paramAnonymous2AdobeAsset1).getModificationDate();
              return ((AdobeAssetPackage)paramAnonymous2AdobeAsset2).getModificationDate().compareTo(paramAnonymous2AdobeAsset1);
            }
          });
          if (val$weakThis.get()).loadingItemsFromScratch)
          {
            val$weakThis.get()).data.clear();
            val$weakThis.get()).loadingItemsFromScratch = false;
          }
          val$weakThis.get()).data.addAll(newData);
          IAdobeAssetDataSourceDelegate localIAdobeAssetDataSourceDelegate = getDelegate();
          if (localIAdobeAssetDataSourceDelegate != null) {
            localIAdobeAssetDataSourceDelegate.didLoadMoreDataWithCount(val$weakThis.get()).data.size());
          }
          if (localIAdobeAssetDataSourceDelegate != null) {
            localIAdobeAssetDataSourceDelegate.didFinishLoading();
          }
          val$weakThis.get()).loadingItems = false;
        }
        
        public void onCompletion(final ArrayList<AdobeAsset> paramAnonymousArrayList, int paramAnonymousInt)
        {
          if (val$weakThis.get()).data == null) {
            val$weakThis.get()).data = new ArrayList(paramAnonymousInt);
          }
          if (paramAnonymousArrayList.size() == 0)
          {
            localObject1 = getDelegate();
            if (localObject1 != null) {
              ((IAdobeAssetDataSourceDelegate)localObject1).didFinishLoading();
            }
            val$weakThis.get()).data.clear();
            val$weakThis.get()).loadingItems = false;
          }
          Object localObject1 = paramAnonymousArrayList.iterator();
          while (((Iterator)localObject1).hasNext())
          {
            Object localObject2 = (AdobeAsset)((Iterator)localObject1).next();
            if ((localObject2 instanceof AdobeAssetPackage))
            {
              localObject2 = (AdobeAssetPackage)localObject2;
              ((AdobeAssetPackage)localObject2).loadMetadata(new IAdobeRequestCompletionCallback()new IAdobeGenericErrorCallback
              {
                public void onCompletion()
                {
                  newData.add(val$packageObj);
                  int[] arrayOfInt = numberProcessed;
                  arrayOfInt[0] += 1;
                  if (paramAnonymousArrayList.size() == numberProcessed[0]) {
                    AdobeAssetDataSource.1.this.allItemsLoaded();
                  }
                }
              }, new IAdobeGenericErrorCallback()
              {
                public void onError(AdobeCSDKException paramAnonymous2AdobeCSDKException)
                {
                  Object localObject = numberProcessed;
                  localObject[0] += 1;
                  localObject = getDelegate();
                  if ((paramAnonymous2AdobeCSDKException instanceof AdobeAssetException))
                  {
                    AdobeAssetException localAdobeAssetException = (AdobeAssetException)paramAnonymous2AdobeCSDKException;
                    if (localAdobeAssetException.getErrorCode().getValue() == 404) {
                      break label90;
                    }
                    if (localObject != null) {
                      ((IAdobeAssetDataSourceDelegate)localObject).didFailToLoadMoreDataWithError(localAdobeAssetException);
                    }
                  }
                  for (;;)
                  {
                    if (paramAnonymousArrayList.size() == numberProcessed[0]) {
                      AdobeAssetDataSource.1.this.allItemsLoaded();
                    }
                    return;
                    label90:
                    AdobeLogger.log(Level.ERROR, "AdobeAssetDataSource.loadNextPage", String.format("Failed to load the package metadata: %s", new Object[] { paramAnonymous2AdobeCSDKException.getMessage() }));
                  }
                }
              });
            }
          }
        }
        
        public void onError(AdobeAssetException paramAnonymousAdobeAssetException)
        {
          IAdobeAssetDataSourceDelegate localIAdobeAssetDataSourceDelegate = getDelegate();
          if (localIAdobeAssetDataSourceDelegate != null)
          {
            localIAdobeAssetDataSourceDelegate.didFailToLoadMoreDataWithError(paramAnonymousAdobeAssetException);
            localIAdobeAssetDataSourceDelegate.didFinishLoading();
          }
          val$weakThis.get()).loadingItems = false;
          AdobeLogger.log(Level.ERROR, "AdobeAssetDataSource.loadNextPage", String.format("Failed to list product packages: %s", new Object[] { paramAnonymousAdobeAssetException.getMessage() }));
        }
      };
      targetFolder.getNextPage(i, (IAdobeAssetFolderNextPageCallback)localObject);
      return true;
      if ((targetFolder instanceof AdobeAssetLibrary)) {
        i = ((AdobeAssetLibrary)targetFolder).count();
      }
    }
  }
  
  public void loadNextPageOfData()
  {
    loadNextPage();
  }
  
  public void resetDelegate()
  {
    setDelegate(null);
  }
  
  public void setDelegate(IAdobeAssetDataSourceDelegate paramIAdobeAssetDataSourceDelegate)
  {
    delegate = paramIAdobeAssetDataSourceDelegate;
  }
}
