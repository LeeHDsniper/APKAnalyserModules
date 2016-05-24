package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonLearnedSettings;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXAssetBrowserCommonTypes.AdobePhotoSortType;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import com.adobe.creativesdk.foundation.storage.AdobePhotoAsset;
import com.adobe.creativesdk.foundation.storage.AdobePhotoAssetRendition;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCollection;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCollection.AdobePhotoCollectionFlag;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCollection.AdobePhotoCollectionSort;
import com.adobe.creativesdk.foundation.storage.AdobePhotoException;
import com.adobe.creativesdk.foundation.storage.AdobePhotoPage;
import com.adobe.creativesdk.foundation.storage.IAdobeGenericRequestCallback;
import com.adobe.creativesdk.foundation.storage.IAdobePhotoAssetsListRequestCompletionHandler;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;

public class AdobePhotoAssetsDataSource
  implements IAdobeAssetDataSource
{
  private ArrayList<AdobePhotoAsset> _assets;
  private boolean _assetsLoaded;
  private AdobePhotoCollection _collection;
  private IAdobePhotoAssetsDataSourceDelegate _delegate;
  private boolean _emptyCollection;
  private boolean _initialQueryRequested;
  private AdobePhotoPage _nextRequestedPage;
  private boolean _queryForMoreData;
  private AdobeUXAssetBrowserCommonTypes.AdobePhotoSortType _sortType;
  private int _totalNumberOfPhotos;
  private HashSet<String> _uniqueAssets;
  
  public AdobePhotoAssetsDataSource(AdobePhotoCollection paramAdobePhotoCollection, IAdobePhotoAssetsDataSourceDelegate paramIAdobePhotoAssetsDataSourceDelegate)
  {
    _delegate = paramIAdobePhotoAssetsDataSourceDelegate;
    _sortType = AdobeCommonLearnedSettings.lastCollectionSortType();
    _collection = paramAdobePhotoCollection;
    _assetsLoaded = false;
    _queryForMoreData = false;
    _initialQueryRequested = false;
    _emptyCollection = false;
    _nextRequestedPage = null;
    _totalNumberOfPhotos = 0;
    _assets = null;
    _uniqueAssets = null;
  }
  
  private boolean appendAssets(ArrayList<AdobePhotoAsset> paramArrayList)
  {
    boolean bool = false;
    float f = 0.0F;
    if (paramArrayList == null) {
      return false;
    }
    Iterator localIterator = paramArrayList.iterator();
    while (localIterator.hasNext())
    {
      AdobePhotoAsset localAdobePhotoAsset = (AdobePhotoAsset)localIterator.next();
      if (!_uniqueAssets.contains(localAdobePhotoAsset.getGUID())) {
        _assets.add(localAdobePhotoAsset);
      } else {
        f += 1.0F;
      }
    }
    if (_totalNumberOfPhotos == 0) {
      _totalNumberOfPhotos = _assets.size();
    }
    if (f / paramArrayList.size() >= 0.7D)
    {
      AdobeLogger.log(Level.WARN, AdobePhotoAssetsDataSource.class.getSimpleName(), "More than 70% of the last page had duplicate values. Pulling the next page.");
      bool = true;
      _queryForMoreData = true;
      loadNextPageOfData();
    }
    return bool;
  }
  
  public static void getRenditionForAsset(AdobePhotoAsset paramAdobePhotoAsset, IAdobeGenericRequestCallback<byte[], AdobePhotoException> paramIAdobeGenericRequestCallback)
  {
    Map localMap = paramAdobePhotoAsset.getRenditions();
    if (localMap.get("thumbnail2x") != null)
    {
      paramAdobePhotoAsset.downloadRendition((AdobePhotoAssetRendition)localMap.get("thumbnail2x"), paramIAdobeGenericRequestCallback);
      return;
    }
    paramIAdobeGenericRequestCallback.onCompletion(null);
  }
  
  private void loadAssetsOnPage(AdobePhotoPage paramAdobePhotoPage, AdobeUXAssetBrowserCommonTypes.AdobePhotoSortType paramAdobePhotoSortType, final IAdobeGenericCompletionCallback<ArrayList<AdobePhotoAsset>> paramIAdobeGenericCompletionCallback, final IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    if (!_queryForMoreData) {}
    do
    {
      return;
      _queryForMoreData = false;
      if ((!_initialQueryRequested) || (_nextRequestedPage != null)) {
        break;
      }
      _queryForMoreData = true;
    } while (paramIAdobeGenericCompletionCallback == null);
    paramIAdobeGenericCompletionCallback.onCompletion(null);
    return;
    AdobePhotoCollection.AdobePhotoCollectionSort localAdobePhotoCollectionSort = AdobePhotoCollection.AdobePhotoCollectionSort.ADOBE_PHOTO_COLLECTION_SORT_BY_DATE;
    if (paramAdobePhotoSortType == AdobeUXAssetBrowserCommonTypes.AdobePhotoSortType.ADOBE_PHOTO_SORT_TYPE_CUSTOM) {
      localAdobePhotoCollectionSort = AdobePhotoCollection.AdobePhotoCollectionSort.ADOBE_PHOTO_COLLECTION_SORT_BY_CUSTOM_ORDER;
    }
    _collection.listAssetsOnPage(paramAdobePhotoPage, localAdobePhotoCollectionSort, 20, AdobePhotoCollection.AdobePhotoCollectionFlag.ADOBE_PHOTO_COLLECTION_FLAG_ALL, new IAdobePhotoAssetsListRequestCompletionHandler()new IAdobeGenericErrorCallback
    {
      public void onCompletion(ArrayList<AdobePhotoAsset> paramAnonymousArrayList, AdobePhotoPage paramAnonymousAdobePhotoPage1, AdobePhotoPage paramAnonymousAdobePhotoPage2)
      {
        AdobePhotoAssetsDataSource.access$602(AdobePhotoAssetsDataSource.this, true);
        if (_nextRequestedPage == null)
        {
          AdobePhotoAssetsDataSource.access$702(AdobePhotoAssetsDataSource.this, paramAnonymousAdobePhotoPage2);
          if (paramIAdobeGenericCompletionCallback != null) {
            paramIAdobeGenericCompletionCallback.onCompletion(paramAnonymousArrayList);
          }
        }
        do
        {
          do
          {
            return;
            if (((paramAnonymousAdobePhotoPage2 == null) || (paramAnonymousAdobePhotoPage2.isEqualToPage(_nextRequestedPage))) && (paramAnonymousAdobePhotoPage2 != null)) {
              break;
            }
            if ((paramAnonymousAdobePhotoPage1 == null) && (paramAnonymousAdobePhotoPage2 == null)) {
              AdobeLogger.log(Level.ERROR, AdobePhotoAssetsDataSource.class.getSimpleName(), "Unexpected state returned from server: no paging history.");
            }
            AdobePhotoAssetsDataSource.access$702(AdobePhotoAssetsDataSource.this, paramAnonymousAdobePhotoPage2);
          } while (paramIAdobeGenericCompletionCallback == null);
          paramIAdobeGenericCompletionCallback.onCompletion(paramAnonymousArrayList);
          return;
          AdobePhotoAssetsDataSource.access$702(AdobePhotoAssetsDataSource.this, null);
        } while (paramIAdobeGenericCompletionCallback == null);
        paramIAdobeGenericCompletionCallback.onCompletion(null);
      }
    }, new IAdobeGenericErrorCallback()
    {
      public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException)
      {
        if (paramIAdobeGenericErrorCallback != null)
        {
          paramIAdobeGenericErrorCallback.onError(paramAnonymousAdobeCSDKException);
          return;
        }
        AdobeLogger.log(Level.ERROR, AdobePhotoAssetsDataSource.class.getSimpleName(), "Failed to retrieve the assets.");
      }
    });
  }
  
  public ArrayList<AdobePhotoAsset> getAssets()
  {
    return _assets;
  }
  
  public int getCount()
  {
    if (_assets != null) {
      return _assets.size();
    }
    return 0;
  }
  
  public int getTotalAssetsCount()
  {
    return _totalNumberOfPhotos;
  }
  
  public boolean hasMorePages()
  {
    return (!_initialQueryRequested) || (_nextRequestedPage != null);
  }
  
  public void loadFirstPage()
  {
    if (_assets != null) {
      _assets.clear();
    }
    if (_delegate != null) {
      _delegate.willLoadFirstPage();
    }
    _assetsLoaded = false;
    _queryForMoreData = true;
    _initialQueryRequested = false;
    _emptyCollection = false;
    _nextRequestedPage = null;
    _totalNumberOfPhotos = 0;
    Level localLevel = Level.DEBUG;
    String str2 = AdobePhotoAssetsDataSource.class.getSimpleName();
    StringBuilder localStringBuilder = new StringBuilder().append("Show first page for photos with sorting by ");
    if (_sortType == AdobeUXAssetBrowserCommonTypes.AdobePhotoSortType.ADOBE_PHOTO_SORT_TYPE_TIME) {}
    for (String str1 = "time";; str1 = "custom order")
    {
      AdobeLogger.log(localLevel, str2, str1);
      _collection.assetCount(new IAdobeGenericCompletionCallback()new IAdobeGenericErrorCallback
      {
        public void onCompletion(Integer paramAnonymousInteger)
        {
          AdobePhotoAssetsDataSource.access$002(AdobePhotoAssetsDataSource.this, paramAnonymousInteger.intValue());
        }
      }, new IAdobeGenericErrorCallback()
      {
        public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException) {}
      });
      loadAssetsOnPage(null, _sortType, new IAdobeGenericCompletionCallback()new IAdobeGenericErrorCallback
      {
        public void onCompletion(ArrayList<AdobePhotoAsset> paramAnonymousArrayList)
        {
          if (paramAnonymousArrayList != null)
          {
            Object localObject = AdobePhotoAssetsDataSource.this;
            if (paramAnonymousArrayList.size() == 0) {}
            for (boolean bool = true;; bool = false)
            {
              AdobePhotoAssetsDataSource.access$102((AdobePhotoAssetsDataSource)localObject, bool);
              AdobePhotoAssetsDataSource.access$202(AdobePhotoAssetsDataSource.this, paramAnonymousArrayList);
              if (_totalNumberOfPhotos == 0) {
                AdobePhotoAssetsDataSource.access$002(AdobePhotoAssetsDataSource.this, _assets.size());
              }
              AdobePhotoAssetsDataSource.access$302(AdobePhotoAssetsDataSource.this, new HashSet(_assets.size()));
              paramAnonymousArrayList = _assets.iterator();
              while (paramAnonymousArrayList.hasNext())
              {
                localObject = (AdobePhotoAsset)paramAnonymousArrayList.next();
                _uniqueAssets.add(((AdobePhotoAsset)localObject).getGUID());
              }
            }
          }
          AdobePhotoAssetsDataSource.access$102(AdobePhotoAssetsDataSource.this, true);
          AdobePhotoAssetsDataSource.access$402(AdobePhotoAssetsDataSource.this, true);
          if (_delegate != null) {
            _delegate.loadFirstPageSucceeded();
          }
        }
      }, new IAdobeGenericErrorCallback()
      {
        public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException)
        {
          AdobePhotoAssetsDataSource.access$402(AdobePhotoAssetsDataSource.this, true);
          if (_delegate != null) {
            _delegate.loadFirstPageFailed(paramAnonymousAdobeCSDKException);
          }
        }
      });
      return;
    }
  }
  
  public boolean loadItemsFromScratch()
  {
    loadFirstPage();
    return true;
  }
  
  public void loadNextPageOfData()
  {
    if (_assetsLoaded) {
      return;
    }
    Level localLevel;
    String str2;
    StringBuilder localStringBuilder;
    if (_queryForMoreData)
    {
      localLevel = Level.DEBUG;
      str2 = AdobePhotoAssetsDataSource.class.getSimpleName();
      localStringBuilder = new StringBuilder().append("Show first page for photos with sorting by ");
      if (_sortType != AdobeUXAssetBrowserCommonTypes.AdobePhotoSortType.ADOBE_PHOTO_SORT_TYPE_TIME) {
        break label112;
      }
    }
    label112:
    for (String str1 = "time";; str1 = "custom order")
    {
      AdobeLogger.log(localLevel, str2, str1);
      if (_delegate != null) {
        _delegate.willLoadNextPage();
      }
      loadAssetsOnPage(_nextRequestedPage, _sortType, new IAdobeGenericCompletionCallback()new IAdobeGenericErrorCallback
      {
        public void onCompletion(ArrayList<AdobePhotoAsset> paramAnonymousArrayList)
        {
          if (!AdobePhotoAssetsDataSource.this.appendAssets(paramAnonymousArrayList)) {
            AdobePhotoAssetsDataSource.access$402(AdobePhotoAssetsDataSource.this, true);
          }
          for (;;)
          {
            if (_delegate != null) {
              _delegate.loadNextPageSucceeded();
            }
            paramAnonymousArrayList = new AdobeNotification(AdobeInternalNotificationID.AdobePhotoAssetsDataSourceDidLoadNewPageNotification, null);
            AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(paramAnonymousArrayList);
            return;
            AdobePhotoAssetsDataSource.access$902(AdobePhotoAssetsDataSource.this, true);
          }
        }
      }, new IAdobeGenericErrorCallback()
      {
        public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException)
        {
          AdobePhotoAssetsDataSource.access$402(AdobePhotoAssetsDataSource.this, true);
          if (_delegate != null) {
            _delegate.loadNextPageFailed(paramAnonymousAdobeCSDKException);
          }
          AdobeLogger.log(Level.ERROR, AdobePhotoAssetsDataSource.class.getSimpleName(), "Failed to get more assets");
        }
      });
      return;
    }
  }
  
  public void resetDelegate()
  {
    setDataSourceDelegate(null);
  }
  
  public void setDataSourceDelegate(IAdobePhotoAssetsDataSourceDelegate paramIAdobePhotoAssetsDataSourceDelegate)
  {
    _delegate = paramIAdobePhotoAssetsDataSourceDelegate;
  }
}
