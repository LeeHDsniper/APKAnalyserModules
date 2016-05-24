package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import com.adobe.creativesdk.foundation.storage.AdobePhotoAsset;
import com.adobe.creativesdk.foundation.storage.AdobePhotoAssetRendition;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCatalog;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCatalog.AdobePhotoCatalogType;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCollection;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCollection.AdobePhotoCollectionFlag;
import com.adobe.creativesdk.foundation.storage.AdobePhotoCollection.AdobePhotoCollectionSort;
import com.adobe.creativesdk.foundation.storage.AdobePhotoException;
import com.adobe.creativesdk.foundation.storage.AdobePhotoPage;
import com.adobe.creativesdk.foundation.storage.IAdobeGenericRequestCallback;
import com.adobe.creativesdk.foundation.storage.IAdobePhotoAssetsListRequestCompletionHandler;
import java.util.ArrayList;
import java.util.Map;

public class AdobePhotoCollectionsDataSource
  implements IAdobeAssetDataSource
{
  private AdobePhotoCatalog _catalog = null;
  private boolean _catalogLoaded = false;
  private AdobeCloud _cloud;
  private ArrayList<AdobePhotoCollection> _collections = null;
  private boolean _collectionsLoaded = false;
  private IAdobePhotoCollectionsDataSourceDelegate _delegate = null;
  private boolean _emptyCatalog = false;
  private boolean _initialQueryRequested = false;
  private String _lastCollectionNameRequested = null;
  private boolean _queryForMoreData = false;
  
  public AdobePhotoCollectionsDataSource(IAdobePhotoCollectionsDataSourceDelegate paramIAdobePhotoCollectionsDataSourceDelegate, AdobeCloud paramAdobeCloud)
  {
    _delegate = paramIAdobePhotoCollectionsDataSourceDelegate;
    _catalog = null;
    _catalogLoaded = false;
    _queryForMoreData = false;
    _collectionsLoaded = false;
    _initialQueryRequested = false;
    _lastCollectionNameRequested = null;
    _emptyCatalog = false;
    _collections = null;
    _cloud = paramAdobeCloud;
  }
  
  public static void getRenditionForCollection(AdobePhotoCollection paramAdobePhotoCollection, final IAdobeGenericRequestCallback<byte[], AdobePhotoException> paramIAdobeGenericRequestCallback)
  {
    if (paramAdobePhotoCollection.getCoverAsset() != null)
    {
      Object localObject = paramAdobePhotoCollection.getCoverAsset().getRenditions();
      if (((Map)localObject).get("thumbnail2x") != null)
      {
        localObject = (AdobePhotoAssetRendition)((Map)localObject).get("thumbnail2x");
        paramAdobePhotoCollection.getCoverAsset().downloadRendition((AdobePhotoAssetRendition)localObject, paramIAdobeGenericRequestCallback);
        return;
      }
      paramIAdobeGenericRequestCallback.onCompletion(null);
      return;
    }
    paramAdobePhotoCollection.listAssetsOnPage(null, AdobePhotoCollection.AdobePhotoCollectionSort.ADOBE_PHOTO_COLLECTION_SORT_BY_DATE, 1, AdobePhotoCollection.AdobePhotoCollectionFlag.ADOBE_PHOTO_COLLECTION_FLAG_ALL, new IAdobePhotoAssetsListRequestCompletionHandler()new IAdobeGenericErrorCallback
    {
      public void onCompletion(ArrayList<AdobePhotoAsset> paramAnonymousArrayList, AdobePhotoPage paramAnonymousAdobePhotoPage1, AdobePhotoPage paramAnonymousAdobePhotoPage2)
      {
        if ((paramAnonymousArrayList != null) && (paramAnonymousArrayList.size() >= 1))
        {
          paramAnonymousAdobePhotoPage1 = (AdobePhotoAsset)paramAnonymousArrayList.get(0);
          val$collection.setCoverAsset(paramAnonymousAdobePhotoPage1);
          paramAnonymousAdobePhotoPage2 = paramAnonymousAdobePhotoPage1.getRenditions();
          if (paramAnonymousAdobePhotoPage2.get("thumbnail2x") == null) {
            break label86;
          }
          paramAnonymousAdobePhotoPage1.downloadRendition((AdobePhotoAssetRendition)paramAnonymousAdobePhotoPage2.get("thumbnail2x"), paramIAdobeGenericRequestCallback);
        }
        for (;;)
        {
          if ((paramAnonymousArrayList != null) && (paramAnonymousArrayList.size() == 0)) {
            paramIAdobeGenericRequestCallback.onCompletion(null);
          }
          return;
          label86:
          paramIAdobeGenericRequestCallback.onCompletion(null);
        }
      }
    }, new IAdobeGenericErrorCallback()
    {
      public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException)
      {
        val$downloadRenditionCallback.onError((AdobePhotoException)paramAnonymousAdobeCSDKException);
      }
    });
  }
  
  private void loadCollectionsAfterName(final String paramString, final IAdobeGenericCompletionCallback<ArrayList<AdobePhotoCollection>> paramIAdobeGenericCompletionCallback, final IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    if (!_queryForMoreData) {}
    do
    {
      return;
      _queryForMoreData = false;
      if ((!_initialQueryRequested) || (_lastCollectionNameRequested != null)) {
        break;
      }
      _queryForMoreData = true;
    } while (paramIAdobeGenericCompletionCallback == null);
    paramIAdobeGenericCompletionCallback.onCompletion(null);
    return;
    _catalog.listCollectionsAfterName(paramString, 20, false, new IAdobeGenericCompletionCallback()new IAdobeGenericErrorCallback
    {
      public void onCompletion(ArrayList<AdobePhotoCollection> paramAnonymousArrayList)
      {
        AdobePhotoCollectionsDataSource.access$702(AdobePhotoCollectionsDataSource.this, true);
        AdobePhotoCollectionsDataSource.access$802(AdobePhotoCollectionsDataSource.this, paramString);
        if (paramIAdobeGenericCompletionCallback != null) {
          paramIAdobeGenericCompletionCallback.onCompletion(paramAnonymousArrayList);
        }
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
        AdobeLogger.log(Level.ERROR, AdobePhotoCollectionsDataSource.class.getSimpleName(), "Failed to retrieve the collection");
      }
    });
  }
  
  private void loadFirstPage()
  {
    if (_delegate != null) {
      _delegate.willLoadFirstPage();
    }
    _queryForMoreData = true;
    _collectionsLoaded = false;
    _initialQueryRequested = false;
    _lastCollectionNameRequested = null;
    if (_queryForMoreData) {
      AdobeLogger.log(Level.DEBUG, AdobePhotoCollectionsDataSource.class.getSimpleName(), "Show first page of collections.");
    }
    loadCollectionsAfterName(null, new IAdobeGenericCompletionCallback()new IAdobeGenericErrorCallback
    {
      public void onCompletion(ArrayList<AdobePhotoCollection> paramAnonymousArrayList)
      {
        if (paramAnonymousArrayList != null)
        {
          AdobePhotoCollectionsDataSource.access$402(AdobePhotoCollectionsDataSource.this, paramAnonymousArrayList);
          paramAnonymousArrayList = AdobePhotoCollectionsDataSource.this;
          if (_collections.size() != 0) {
            break label71;
          }
        }
        label71:
        for (boolean bool = true;; bool = false)
        {
          AdobePhotoCollectionsDataSource.access$502(paramAnonymousArrayList, bool);
          AdobePhotoCollectionsDataSource.access$602(AdobePhotoCollectionsDataSource.this, true);
          if (_delegate != null) {
            _delegate.loadFirstPageSucceeded();
          }
          return;
        }
      }
    }, new IAdobeGenericErrorCallback()
    {
      public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException)
      {
        AdobePhotoCollectionsDataSource.access$602(AdobePhotoCollectionsDataSource.this, true);
        if (_delegate != null) {
          _delegate.loadFirstPageFailed(paramAnonymousAdobeCSDKException);
        }
      }
    });
  }
  
  public ArrayList<AdobePhotoCollection> getCollections()
  {
    return _collections;
  }
  
  public int getCount()
  {
    if (_collections != null) {
      return _collections.size();
    }
    return 0;
  }
  
  public void loadCatalog()
  {
    if (_collections != null) {
      _collections.clear();
    }
    if (_delegate != null) {
      _delegate.willLoadCatalog();
    }
    AdobePhotoCatalog.listCatalogOfType(AdobePhotoCatalog.AdobePhotoCatalogType.AdobePhotoCatalogTypeLightroom, _cloud, new IAdobeGenericCompletionCallback()new IAdobeGenericErrorCallback
    {
      public void onCompletion(ArrayList<AdobePhotoCatalog> paramAnonymousArrayList)
      {
        if (paramAnonymousArrayList.size() > 1) {
          AdobeLogger.log(Level.WARN, AdobePhotoCollectionsDataSource.class.getSimpleName(), "More than one catalog was unexpected.");
        }
        for (;;)
        {
          AdobePhotoCollectionsDataSource.access$002(AdobePhotoCollectionsDataSource.this, (AdobePhotoCatalog)paramAnonymousArrayList.get(0));
          AdobePhotoCollectionsDataSource.access$102(AdobePhotoCollectionsDataSource.this, true);
          if (_delegate != null) {
            _delegate.loadCatalogSucceeded(_catalog);
          }
          AdobePhotoCollectionsDataSource.this.loadFirstPage();
          return;
          AdobeLogger.log(Level.DEBUG, AdobePhotoCollectionsDataSource.class.getSimpleName(), "Loaded photo catalog.");
        }
      }
    }, new IAdobeGenericErrorCallback()
    {
      public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException)
      {
        AdobeLogger.log(Level.ERROR, AdobePhotoCollectionsDataSource.class.getSimpleName(), "Failed to retrive the catalog.");
        if (_delegate != null) {
          _delegate.loadCatalogFailed(paramAnonymousAdobeCSDKException);
        }
      }
    });
  }
  
  public boolean loadItemsFromScratch()
  {
    loadCatalog();
    return true;
  }
  
  public void loadNextPageOfData()
  {
    if (_collectionsLoaded) {
      return;
    }
    if (_queryForMoreData) {
      AdobeLogger.log(Level.DEBUG, AdobePhotoCollectionsDataSource.class.getSimpleName(), "Show next page of collections.");
    }
    if (_delegate != null) {
      _delegate.willLoadNextPage();
    }
    loadCollectionsAfterName(_lastCollectionNameRequested, new IAdobeGenericCompletionCallback()new IAdobeGenericErrorCallback
    {
      public void onCompletion(ArrayList<AdobePhotoCollection> paramAnonymousArrayList)
      {
        if (paramAnonymousArrayList != null)
        {
          _collections.addAll(paramAnonymousArrayList);
          AdobePhotoCollectionsDataSource.access$602(AdobePhotoCollectionsDataSource.this, true);
        }
        for (;;)
        {
          if (_delegate != null) {
            _delegate.loadNextPageOfDataSucceeded();
          }
          paramAnonymousArrayList = new AdobeNotification(AdobeInternalNotificationID.AdobePhotoCollectionsDataSourceDidLoadNewPageNotification, null);
          AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(paramAnonymousArrayList);
          return;
          AdobePhotoCollectionsDataSource.access$902(AdobePhotoCollectionsDataSource.this, true);
        }
      }
    }, new IAdobeGenericErrorCallback()
    {
      public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException)
      {
        AdobePhotoCollectionsDataSource.access$602(AdobePhotoCollectionsDataSource.this, true);
        if (_delegate != null) {
          _delegate.loadNextPageOfDataFailed(paramAnonymousAdobeCSDKException);
        }
        AdobeLogger.log(Level.ERROR, AdobePhotoCollectionsDataSource.class.getSimpleName(), "Failed to get more collctions");
      }
    });
  }
  
  public void resetDelegate()
  {
    setDataSourceDelegate(null);
  }
  
  public void setDataSourceDelegate(IAdobePhotoCollectionsDataSourceDelegate paramIAdobePhotoCollectionsDataSourceDelegate)
  {
    _delegate = paramIAdobePhotoCollectionsDataSourceDelegate;
  }
}
