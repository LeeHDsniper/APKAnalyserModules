package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.Context;
import android.os.Handler;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.ViewGroup;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageAssetSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageDataSource;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageSortIndexCollation;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavBaseCommandData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavToAssetFolderData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.upload.AdobeAssetViewListBaseUploadAssetCellView;
import com.adobe.creativesdk.foundation.internal.storage.controllers.upload.AdobeCCFilesUploadAssetData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.upload.AdobeCCFilesUploadSession;
import com.adobe.creativesdk.foundation.internal.storage.controllers.upload.AdobeUploadThumbnailMgr;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageUtils;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.internal.utils.AdobeUxUtilMainUIThreadHandler;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetErrorCode;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFileRenditionType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import com.adobe.creativesdk.foundation.storage.IAdobeGenericRequestCallback;
import java.lang.ref.WeakReference;
import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Observable;
import java.util.Observer;
import org.json.JSONObject;

public abstract class AdobeAssetsViewCCFilesBaseListViewController
  extends AdobeAssetsViewBaseRecyclerViewController
{
  private AdobeAssetsViewContainerConfiguration _assetViewerConfiguration;
  protected AdobeStorageDataSource _ccfilesDataSource;
  private UploadRelatedData _uploadTrackingnData;
  
  public AdobeAssetsViewCCFilesBaseListViewController(Context paramContext)
  {
    super(paramContext);
  }
  
  private void fetchUploadAssetThumbnail(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData, final IAdobeGenericRequestCallback<byte[], AdobeCSDKException> paramIAdobeGenericRequestCallback)
  {
    AdobeUploadThumbnailMgr.getInstance().getThumbnail((AdobeCCFilesUploadAssetData)paramAdobeAssetsViewCellAssetData, new IAdobeGenericCompletionCallback()
    {
      public void onCompletion(byte[] paramAnonymousArrayOfByte)
      {
        if (paramAnonymousArrayOfByte != null)
        {
          paramIAdobeGenericRequestCallback.onCompletion(paramAnonymousArrayOfByte);
          return;
        }
        paramAnonymousArrayOfByte = new AdobeAssetException(AdobeAssetErrorCode.AdobeAssetErrorUnsupportedMedia);
        paramIAdobeGenericRequestCallback.onError(paramAnonymousArrayOfByte);
      }
    });
  }
  
  private boolean isAssetALocalUpload(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
  {
    return paramAdobeAssetsViewCellAssetData instanceof AdobeCCFilesUploadAssetData;
  }
  
  protected void attachBaseAdapterToListView(RecyclerView.Adapter paramAdapter)
  {
    _assetsItemsAdapter = ((CCFilesAssetsListViewBaseAdapter)paramAdapter);
    _recyclerView.setAdapter(_assetsItemsAdapter.getRealAdapter());
    attachScrollListenerToListView();
    _assetsItemsAdapter.notifyDataSetChanged();
  }
  
  void cancelThumbnailRenditionRequestOfAsset(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
  {
    if ((originalAsset instanceof AdobeAssetFile)) {
      ((AdobeAssetFile)originalAsset).cancelRenditionRequest();
    }
  }
  
  public void cleanUpUploadRelatedSetup()
  {
    if (_uploadTrackingnData == null) {
      return;
    }
    ((LocalAssetsUploadCCAssetsCombinedAdapter)_assetsItemsAdapter).resetSelf();
    AdobeUxUtilMainUIThreadHandler.getHandler().post(new Runnable()
    {
      public void run()
      {
        attachBaseAdapterToListView(_uploadTrackingnData._originalAssetsAdapter);
        AdobeAssetsViewCCFilesBaseListViewController.access$002(AdobeAssetsViewCCFilesBaseListViewController.this, null);
      }
    });
  }
  
  protected abstract LocalAssetsUploadCCAssetsCombinedAdapter createUploadCombinedAdapter();
  
  protected AdobeAssetViewNavigateCommands.NavBaseCommandData getFolderNavigationCommand(AdobeAsset paramAdobeAsset)
  {
    AdobeAssetViewNavigateCommands.NavToAssetFolderData localNavToAssetFolderData = new AdobeAssetViewNavigateCommands.NavToAssetFolderData();
    collectionHref = ((AdobeAssetFolder)paramAdobeAsset).getHref().toString();
    dataSourceType = AdobeAssetDataSourceType.AdobeAssetDataSourceFiles;
    return localNavToAssetFolderData;
  }
  
  public boolean getSelectionOverallVisibility()
  {
    return AdobeStorageAssetSelectionState.isMultiSelectModeActive();
  }
  
  public void handleAssetCellSelectionToggle(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView)
  {
    if (!paramAdobeAssetViewListBaseCellView.hasValidThumbnailRendition()) {}
    do
    {
      return;
      int i = paramAdobeAssetViewListBaseCellView.getPosition();
      localObject = (AdobeAsset)_assetsItemsAdapter.getItem(i).originalAsset;
    } while ((localObject == null) || (!AdobeStorageAssetSelectionState.isMultiSelectModeActive()));
    Object localObject = (AdobeAssetFile)localObject;
    if (paramAdobeAssetViewListBaseCellView.isMarkedSelected())
    {
      paramAdobeAssetViewListBaseCellView.markSelected(false);
      AdobeStorageAssetSelectionState.removeSelectedAsset((AdobeAssetFile)localObject);
      return;
    }
    paramAdobeAssetViewListBaseCellView.markSelected(true);
    AdobeStorageAssetSelectionState.addSelectedAsset((AdobeAssetFile)localObject);
  }
  
  protected void handleListItemClick(int paramInt)
  {
    AdobeAssetsViewCellAssetData localAdobeAssetsViewCellAssetData = _assetsItemsAdapter.getItem(paramInt);
    AdobeAsset localAdobeAsset = (AdobeAsset)originalAsset;
    if (localAdobeAsset == null) {}
    do
    {
      return;
      if ((localAdobeAsset instanceof AdobeAssetFolder))
      {
        ((IAdobeAssetContainerListViewDelegate)_parentContainer.get()).navigateToCollection(getFolderNavigationCommand(localAdobeAsset));
        return;
      }
    } while (shouldFilterOutAsset(localAdobeAssetsViewCellAssetData));
    ((IAdobeAssetContainerListViewDelegate)_parentContainer.get()).handleAssetClickAction(originalAsset);
  }
  
  protected void handleListItemLongClick(int paramInt)
  {
    AdobeAsset localAdobeAsset = (AdobeAsset)_assetsItemsAdapter.getItem(paramInt).originalAsset;
    if (localAdobeAsset == null) {
      return;
    }
    ((IAdobeAssetContainerListViewDelegate)_parentContainer.get()).handleLongClickOnAsset(localAdobeAsset);
  }
  
  protected boolean isAssetSelected(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
  {
    return AdobeStorageAssetSelectionState.containsAsset((AdobeAssetFile)originalAsset);
  }
  
  protected boolean loadAssetRendition(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData, AdobeAssetFileRenditionType paramAdobeAssetFileRenditionType, AdobeAssetImageDimensions paramAdobeAssetImageDimensions, final IAdobeGenericRequestCallback<byte[], AdobeCSDKException> paramIAdobeGenericRequestCallback)
  {
    AdobeAsset localAdobeAsset = (AdobeAsset)originalAsset;
    if ((localAdobeAsset instanceof AdobeAssetFile)) {
      ((AdobeAssetFile)localAdobeAsset).getRenditionWithType(paramAdobeAssetFileRenditionType, paramAdobeAssetImageDimensions, new IAdobeGenericRequestCallback()
      {
        public void onCancellation()
        {
          paramIAdobeGenericRequestCallback.onCancellation();
        }
        
        public void onCompletion(byte[] paramAnonymousArrayOfByte)
        {
          paramIAdobeGenericRequestCallback.onCompletion(paramAnonymousArrayOfByte);
        }
        
        public void onError(AdobeAssetException paramAnonymousAdobeAssetException)
        {
          paramIAdobeGenericRequestCallback.onError(paramAnonymousAdobeAssetException);
        }
        
        public void onProgress(double paramAnonymousDouble)
        {
          paramIAdobeGenericRequestCallback.onProgress(paramAnonymousDouble);
        }
      });
    }
    while ((localAdobeAsset instanceof AdobeAssetFolder)) {
      return true;
    }
    if (isAssetALocalUpload(paramAdobeAssetsViewCellAssetData))
    {
      fetchUploadAssetThumbnail(paramAdobeAssetsViewCellAssetData, paramIAdobeGenericRequestCallback);
      return true;
    }
    return false;
  }
  
  public void refreshDueToDataChange()
  {
    ArrayList localArrayList = _ccfilesDataSource.assetsToDisplay();
    _ccfilesDataSource.getAdobeStorageSortIndexCollation().createSectionDataFromMaster(localArrayList);
    super.refreshDueToDataChange();
  }
  
  public void setAssetListViewerConfiguration(AdobeAssetsViewContainerConfiguration paramAdobeAssetsViewContainerConfiguration)
  {
    _assetViewerConfiguration = paramAdobeAssetsViewContainerConfiguration;
  }
  
  public void setStorageDataSource(AdobeStorageDataSource paramAdobeStorageDataSource)
  {
    _ccfilesDataSource = paramAdobeStorageDataSource;
  }
  
  public void setUpListViewToTrackActiveUploads(AdobeCCFilesUploadSession paramAdobeCCFilesUploadSession)
  {
    _uploadTrackingnData = new UploadRelatedData();
    _uploadTrackingnData._uploadSession = paramAdobeCCFilesUploadSession;
    _uploadTrackingnData._originalAssetsAdapter = _assetsItemsAdapter;
    LocalAssetsUploadCCAssetsCombinedAdapter localLocalAssetsUploadCCAssetsCombinedAdapter = createUploadCombinedAdapter();
    localLocalAssetsUploadCCAssetsCombinedAdapter.setCCFilesAdapter((CCFilesAssetsListViewBaseAdapter)_assetsItemsAdapter);
    localLocalAssetsUploadCCAssetsCombinedAdapter.setUploadSession(paramAdobeCCFilesUploadSession);
    _uploadTrackingnData._localAssetsCCFilesCombinedAdapter = localLocalAssetsUploadCCAssetsCombinedAdapter;
    if ((_assetsItemsAdapter instanceof AdobeAssetsViewCCFilesSectionListViewController.CCFilesAssetsSectionalListItemsAdapter)) {
      ((AdobeAssetsViewCCFilesSectionListViewController.CCFilesAssetsSectionalListItemsAdapter)_assetsItemsAdapter).removeHeaders();
    }
    attachBaseAdapterToListView(localLocalAssetsUploadCCAssetsCombinedAdapter);
  }
  
  protected boolean shouldFilterOutAsset(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
  {
    return shouldFilterStorageAsset((AdobeAsset)originalAsset);
  }
  
  protected boolean shouldFilterStorageAsset(AdobeAsset paramAdobeAsset)
  {
    if ((paramAdobeAsset instanceof AdobeAssetFile)) {
      return AdobeStorageUtils.shouldFilterAssetMimeType(_assetViewerConfiguration.getMimeTypesFilter(), ((AdobeAssetFile)paramAdobeAsset).getType(), _assetViewerConfiguration.getIsMimeTypeFilterInclusive());
    }
    return false;
  }
  
  protected abstract class CCFilesAssetsListViewBaseAdapter
    extends AdobeAssetsViewBaseRecyclerViewController.AssetsListViewBaseAdapter
  {
    protected ArrayList<AdobeAssetsViewCellAssetData> _flattenedAssetsList;
    
    public CCFilesAssetsListViewBaseAdapter(Context paramContext)
    {
      super(paramContext);
    }
    
    protected abstract AdobeAssetViewListBaseCellView createAssetFileCellView(ViewGroup paramViewGroup);
    
    protected abstract AdobeAssetViewListBaseCellView createAssetFolderCellView(ViewGroup paramViewGroup);
    
    protected AdobeAssetViewListBaseCellView createNewAssetCellView(ViewGroup paramViewGroup, int paramInt)
    {
      if (paramInt == 0) {
        return createAssetFileCellView(paramViewGroup);
      }
      if (paramInt == 1) {
        return createAssetFolderCellView(paramViewGroup);
      }
      return null;
    }
    
    protected AdobeAsset getAdobeAssetAtPosition(int paramInt)
    {
      AdobeAsset localAdobeAsset = null;
      AdobeAssetsViewCellAssetData localAdobeAssetsViewCellAssetData = getItem(paramInt);
      if (localAdobeAssetsViewCellAssetData != null) {
        localAdobeAsset = (AdobeAsset)originalAsset;
      }
      return localAdobeAsset;
    }
    
    protected AdobeAssetsViewCellAssetData getAssetItemData(int paramInt)
    {
      if (getAssetsList() != null) {
        return (AdobeAssetsViewCellAssetData)getAssetsList().get(paramInt);
      }
      return null;
    }
    
    protected int getAssetsCount()
    {
      int i = 0;
      if (getAssetsList() != null) {
        i = getAssetsList().size();
      }
      return i;
    }
    
    protected ArrayList<AdobeAssetsViewCellAssetData> getAssetsList()
    {
      if (_ccfilesDataSource == null) {
        return null;
      }
      if (_flattenedAssetsList == null)
      {
        ArrayList localArrayList = _ccfilesDataSource.getAdobeStorageSortIndexCollation().getFlattenedAssetsItemsList();
        if (localArrayList != null)
        {
          _flattenedAssetsList = new ArrayList(localArrayList.size());
          int i = 0;
          while (i < localArrayList.size())
          {
            _flattenedAssetsList.add(getCellDataFromAsset((AdobeAsset)localArrayList.get(i)));
            i += 1;
          }
        }
      }
      return _flattenedAssetsList;
    }
    
    protected AdobeAssetsViewCellAssetData getCellDataFromAsset(AdobeAsset paramAdobeAsset)
    {
      Object localObject2 = null;
      AdobeAssetsViewCellAssetData localAdobeAssetsViewCellAssetData = new AdobeAssetsViewCellAssetData();
      guid = paramAdobeAsset.getGUID();
      title = paramAdobeAsset.getName();
      modificationDate = paramAdobeAsset.getModificationDate();
      creationDate = paramAdobeAsset.getCreationDate();
      boolean bool = paramAdobeAsset instanceof AdobeAssetFile;
      if (bool) {}
      for (Object localObject1 = ((AdobeAssetFile)paramAdobeAsset).getOptionalMetadata();; localObject1 = null)
      {
        optionalMetadata = ((JSONObject)localObject1);
        localObject1 = localObject2;
        if (bool) {
          localObject1 = ((AdobeAssetFile)paramAdobeAsset).getMd5Hash();
        }
        imageMD5Hash = ((String)localObject1);
        originalAsset = paramAdobeAsset;
        return localAdobeAssetsViewCellAssetData;
      }
    }
    
    public int getItemViewType(int paramInt)
    {
      if ((paramInt >= 0) && (paramInt < getItemCount())) {
        return getTypeFromAsset(getAdobeAssetAtPosition(paramInt));
      }
      return IGNORE_ITEM_VIEW_TYPE;
    }
    
    int getTypeFromAsset(AdobeAsset paramAdobeAsset)
    {
      if ((paramAdobeAsset instanceof AdobeAssetFile)) {
        return 0;
      }
      return 1;
    }
    
    public int getViewTypeCount()
    {
      return 2;
    }
    
    protected void handlePostCellViewBinding(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData, int paramInt)
    {
      super.handlePostCellViewBinding(paramAdobeAssetViewListBaseCellView, paramAdobeAssetsViewCellAssetData, paramInt);
      if ((originalAsset instanceof AdobeAssetFolder))
      {
        paramAdobeAssetsViewCellAssetData = (AdobeAssetFolder)originalAsset;
        if (paramAdobeAssetsViewCellAssetData != null) {
          setCCFolderViewAsShared(paramAdobeAssetViewListBaseCellView, paramAdobeAssetsViewCellAssetData, paramAdobeAssetsViewCellAssetData.isShared());
        }
      }
    }
    
    protected void invalidateAssetsList()
    {
      _flattenedAssetsList = null;
    }
    
    protected boolean isAssetCellViewAlreadyRepresentAsset(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
    {
      boolean bool2 = false;
      String str = paramAdobeAssetViewListBaseCellView.getGuid();
      Object localObject = guid;
      boolean bool1 = bool2;
      if (str != null)
      {
        bool1 = bool2;
        if (localObject != null)
        {
          bool1 = bool2;
          if (str.equalsIgnoreCase((String)localObject))
          {
            str = paramAdobeAssetViewListBaseCellView.getTitle();
            localObject = title;
            if ((str == null) || (localObject == null) || (!str.equalsIgnoreCase((String)localObject))) {
              break label191;
            }
          }
        }
      }
      label191:
      for (bool2 = true;; bool2 = false)
      {
        bool1 = bool2;
        if (bool2)
        {
          bool1 = bool2;
          if ((originalAsset instanceof AdobeAssetFile))
          {
            bool2 = false;
            localObject = (AdobeAssetFile)originalAsset;
            str = paramAdobeAssetViewListBaseCellView.getImageMD5();
            localObject = ((AdobeAssetFile)localObject).getMd5Hash();
            bool1 = bool2;
            if (str != null)
            {
              bool1 = bool2;
              if (localObject != null)
              {
                bool1 = bool2;
                if (str.equalsIgnoreCase((String)localObject))
                {
                  if (AdobeStorageAssetSelectionState.isMultiSelectModeActive())
                  {
                    bool1 = paramAdobeAssetViewListBaseCellView.isMarkedSelected();
                    bool2 = isAssetSelected(paramAdobeAssetsViewCellAssetData);
                    if (bool1 != bool2) {
                      paramAdobeAssetViewListBaseCellView.markSelected(bool2);
                    }
                  }
                  bool1 = true;
                }
              }
            }
          }
        }
        return bool1;
      }
    }
    
    protected boolean isAssetHasThumbnail(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
    {
      boolean bool2 = true;
      boolean bool1 = bool2;
      if (paramAdobeAssetsViewCellAssetData != null)
      {
        bool1 = bool2;
        if (originalAsset != null)
        {
          bool1 = bool2;
          if ((originalAsset instanceof AdobeAssetFolder)) {
            bool1 = false;
          }
        }
      }
      return bool1;
    }
    
    protected boolean isAssetSelectable(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
    {
      boolean bool2 = false;
      boolean bool1 = bool2;
      if (paramAdobeAssetsViewCellAssetData != null)
      {
        bool1 = bool2;
        if (originalAsset != null) {
          bool1 = originalAsset instanceof AdobeAssetFile;
        }
      }
      return bool1;
    }
    
    protected void setCCFolderViewAsShared(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetFolder paramAdobeAssetFolder, boolean paramBoolean) {}
  }
  
  public abstract class LocalAssetsUploadCCAssetsCombinedAdapter
    extends AdobeAssetsViewCCFilesBaseListViewController.CCFilesAssetsListViewBaseAdapter
  {
    private ArrayList<AdobeAssetsViewCellAssetData> _combinedSortedAssets;
    private AdobeAssetsViewCCFilesBaseListViewController.CCFilesAssetsListViewBaseAdapter _originalCcfilesAdapter;
    private LocalUploadAssetsToCellViewBinder _uploadAssetsToCellViewBinder = new LocalUploadAssetsToCellViewBinder();
    private AdobeCCFilesUploadSession _uploadSession;
    
    public LocalAssetsUploadCCAssetsCombinedAdapter(Context paramContext)
    {
      super(paramContext);
    }
    
    private boolean isLocalUploadAsset(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
    {
      return paramAdobeAssetsViewCellAssetData instanceof AdobeCCFilesUploadAssetData;
    }
    
    private boolean isUploadAssetDataCellViewEqual(AdobeCCFilesUploadAssetData paramAdobeCCFilesUploadAssetData, AdobeAssetViewListBaseUploadAssetCellView paramAdobeAssetViewListBaseUploadAssetCellView)
    {
      boolean bool = false;
      if (paramAdobeAssetViewListBaseUploadAssetCellView.getGuid() != null) {
        bool = guid.equalsIgnoreCase(paramAdobeAssetViewListBaseUploadAssetCellView.getGuid());
      }
      return bool;
    }
    
    private void registerLocalAssetUploadProgress(AdobeCCFilesUploadAssetData paramAdobeCCFilesUploadAssetData, AdobeAssetViewListBaseUploadAssetCellView paramAdobeAssetViewListBaseUploadAssetCellView)
    {
      _uploadAssetsToCellViewBinder.bindCellViewToAsset(paramAdobeCCFilesUploadAssetData, paramAdobeAssetViewListBaseUploadAssetCellView);
    }
    
    private ArrayList<AdobeAssetsViewCellAssetData> sortAssetsList(ArrayList<AdobeAssetsViewCellAssetData> paramArrayList, AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType paramAdobeUXAssetBrowserSortType)
    {
      if (paramAdobeUXAssetBrowserSortType == AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortType.SORT_TYPE_ALPHA) {}
      for (boolean bool = true;; bool = false)
      {
        Collections.sort(paramArrayList, new CustomAssetDataComparator(bool));
        return paramArrayList;
      }
    }
    
    private void unRegisterLocalAssetUploadProgress(AdobeCCFilesUploadAssetData paramAdobeCCFilesUploadAssetData, AdobeAssetViewListBaseUploadAssetCellView paramAdobeAssetViewListBaseUploadAssetCellView)
    {
      _uploadAssetsToCellViewBinder.unBindCellView(paramAdobeCCFilesUploadAssetData, paramAdobeAssetViewListBaseUploadAssetCellView);
    }
    
    protected void bindAssetCellViewToAsset(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData, int paramInt)
    {
      if ((isLocalUploadAsset(paramAdobeAssetsViewCellAssetData)) && (_guid != null)) {
        unRegisterLocalAssetUploadProgress((AdobeCCFilesUploadAssetData)paramAdobeAssetsViewCellAssetData, (AdobeAssetViewListBaseUploadAssetCellView)paramAdobeAssetViewListBaseCellView);
      }
      super.bindAssetCellViewToAsset(paramAdobeAssetViewListBaseCellView, paramAdobeAssetsViewCellAssetData, paramInt);
    }
    
    protected AdobeAssetViewListBaseCellView createAssetFileCellView(ViewGroup paramViewGroup)
    {
      return _originalCcfilesAdapter.createAssetFileCellView(paramViewGroup);
    }
    
    protected AdobeAssetViewListBaseCellView createAssetFolderCellView(ViewGroup paramViewGroup)
    {
      return _originalCcfilesAdapter.createAssetFolderCellView(paramViewGroup);
    }
    
    protected AdobeAssetViewListBaseCellView createNewAssetCellView(ViewGroup paramViewGroup, int paramInt)
    {
      if (paramInt == super.getViewTypeCount()) {
        return createUploadAssetCellView(paramViewGroup);
      }
      return super.createNewAssetCellView(paramViewGroup, paramInt);
    }
    
    protected abstract AdobeAssetViewListBaseUploadAssetCellView createUploadAssetCellView(ViewGroup paramViewGroup);
    
    protected void generateCombinedAssetsList()
    {
      if (_combinedSortedAssets != null) {
        return;
      }
      ArrayList localArrayList = new ArrayList(_uploadSession.getAssetsList());
      if (_originalCcfilesAdapter.getAssetsList() != null) {
        localArrayList.addAll(_originalCcfilesAdapter.getAssetsList());
      }
      _combinedSortedAssets = sortAssetsList(localArrayList, _ccfilesDataSource.getSortType());
    }
    
    protected AdobeAssetsViewCellAssetData getAssetItemData(int paramInt)
    {
      generateCombinedAssetsList();
      if (_combinedSortedAssets != null) {
        return (AdobeAssetsViewCellAssetData)_combinedSortedAssets.get(paramInt);
      }
      return null;
    }
    
    protected int getAssetsCount()
    {
      if (_uploadSession == null) {
        return 0;
      }
      generateCombinedAssetsList();
      return _combinedSortedAssets.size();
    }
    
    public int getItemViewType(int paramInt)
    {
      int j = IGNORE_ITEM_VIEW_TYPE;
      int i = j;
      if (paramInt >= 0)
      {
        i = j;
        if (paramInt < getItemCount())
        {
          if (!isLocalUploadAsset(getAssetItemData(paramInt))) {
            break label37;
          }
          i = 2;
        }
      }
      return i;
      label37:
      return super.getItemViewType(paramInt);
    }
    
    public int getViewTypeCount()
    {
      return 3;
    }
    
    protected void handlePostCellViewBinding(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData, int paramInt)
    {
      if (isLocalUploadAsset(paramAdobeAssetsViewCellAssetData))
      {
        AdobeAssetViewListBaseUploadAssetCellView localAdobeAssetViewListBaseUploadAssetCellView = (AdobeAssetViewListBaseUploadAssetCellView)paramAdobeAssetViewListBaseCellView;
        registerLocalAssetUploadProgress((AdobeCCFilesUploadAssetData)paramAdobeAssetsViewCellAssetData, localAdobeAssetViewListBaseUploadAssetCellView);
        super.handlePostCellViewBinding(paramAdobeAssetViewListBaseCellView, paramAdobeAssetsViewCellAssetData, paramInt);
        return;
      }
      super.handlePostCellViewBinding(paramAdobeAssetViewListBaseCellView, paramAdobeAssetsViewCellAssetData, paramInt);
    }
    
    protected void invalidateAssetsList()
    {
      _combinedSortedAssets = null;
      _originalCcfilesAdapter.invalidateAssetsList();
    }
    
    protected boolean isAssetCellViewAlreadyRepresentAsset(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
    {
      if ((paramAdobeAssetsViewCellAssetData instanceof AdobeCCFilesUploadAssetData))
      {
        String str1 = paramAdobeAssetViewListBaseCellView.getGuid();
        String str2 = guid;
        if ((str1 != null) && (str2 != null) && (str1.equalsIgnoreCase(str2)))
        {
          str1 = paramAdobeAssetViewListBaseCellView.getTitle();
          str2 = title;
          if ((str1 != null) && (str2 != null) && (str1.equalsIgnoreCase(str2))) {}
          for (boolean bool = true;; bool = false)
          {
            if (bool)
            {
              paramAdobeAssetsViewCellAssetData = (AdobeCCFilesUploadAssetData)paramAdobeAssetsViewCellAssetData;
              paramAdobeAssetViewListBaseCellView = (AdobeAssetViewListBaseUploadAssetCellView)paramAdobeAssetViewListBaseCellView;
              paramAdobeAssetViewListBaseCellView.setUploadStatus(paramAdobeAssetsViewCellAssetData.getStatus());
              paramAdobeAssetViewListBaseCellView.setUploadProgres(paramAdobeAssetsViewCellAssetData.getProgress());
            }
            return bool;
          }
        }
      }
      else
      {
        return super.isAssetCellViewAlreadyRepresentAsset(paramAdobeAssetViewListBaseCellView, paramAdobeAssetsViewCellAssetData);
      }
      return false;
    }
    
    protected boolean isAssetHasThumbnail(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
    {
      if ((paramAdobeAssetsViewCellAssetData instanceof AdobeCCFilesUploadAssetData)) {
        return true;
      }
      return super.isAssetHasThumbnail(paramAdobeAssetsViewCellAssetData);
    }
    
    protected boolean isAssetSelectable(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
    {
      if (isLocalUploadAsset(paramAdobeAssetsViewCellAssetData)) {
        return false;
      }
      return super.isAssetSelectable(paramAdobeAssetsViewCellAssetData);
    }
    
    public void resetSelf()
    {
      _uploadSession = null;
      _uploadAssetsToCellViewBinder.resetBinder();
      invalidateAssetsList();
      notifyDataSetChanged();
    }
    
    public void setCCFilesAdapter(AdobeAssetsViewCCFilesBaseListViewController.CCFilesAssetsListViewBaseAdapter paramCCFilesAssetsListViewBaseAdapter)
    {
      _originalCcfilesAdapter = paramCCFilesAssetsListViewBaseAdapter;
    }
    
    public void setUploadSession(AdobeCCFilesUploadSession paramAdobeCCFilesUploadSession)
    {
      _uploadSession = paramAdobeCCFilesUploadSession;
    }
    
    public class CustomAssetDataComparator
      implements Comparator<AdobeAssetsViewCellAssetData>
    {
      private boolean _isSortByAlpha = false;
      
      public CustomAssetDataComparator(boolean paramBoolean)
      {
        _isSortByAlpha = paramBoolean;
      }
      
      private int compareAlpha(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData1, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData2)
      {
        int i = 0;
        int j = Character.toUpperCase(title.charAt(0));
        int k = Character.toUpperCase(title.charAt(0));
        if (j > k) {
          i = 1;
        }
        while (j >= k) {
          return i;
        }
        return -1;
      }
      
      private int compareDate(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData1, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData2)
      {
        int i = 0;
        long l1 = modificationDate.getTime();
        long l2 = modificationDate.getTime();
        if (l1 > l2) {
          i = -1;
        }
        while (l1 >= l2) {
          return i;
        }
        return 1;
      }
      
      public int compare(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData1, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData2)
      {
        if (_isSortByAlpha) {
          return compareAlpha(paramAdobeAssetsViewCellAssetData1, paramAdobeAssetsViewCellAssetData2);
        }
        return compareDate(paramAdobeAssetsViewCellAssetData1, paramAdobeAssetsViewCellAssetData2);
      }
    }
    
    private class LocalUploadAssetsToCellViewBinder
    {
      HashMap<String, Observer> _assetsUploadObservers = new HashMap();
      
      public LocalUploadAssetsToCellViewBinder() {}
      
      private AdobeCCFilesUploadSession getUploadSession()
      {
        return _uploadSession;
      }
      
      public void bindCellViewToAsset(AdobeCCFilesUploadAssetData paramAdobeCCFilesUploadAssetData, final AdobeAssetViewListBaseUploadAssetCellView paramAdobeAssetViewListBaseUploadAssetCellView)
      {
        unBindCellView(paramAdobeCCFilesUploadAssetData, paramAdobeAssetViewListBaseUploadAssetCellView);
        Observer local1 = new Observer()
        {
          public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
          {
            updateUploadCellViewStatus((AdobeCCFilesUploadAssetData)paramAnonymousObject, paramAdobeAssetViewListBaseUploadAssetCellView);
          }
        };
        _assetsUploadObservers.put(guid, local1);
        getUploadSession().addObserverForAssetUpload(paramAdobeCCFilesUploadAssetData, local1);
        updateUploadCellViewStatus(paramAdobeCCFilesUploadAssetData, paramAdobeAssetViewListBaseUploadAssetCellView);
      }
      
      public void resetBinder()
      {
        _assetsUploadObservers.clear();
      }
      
      public void unBindCellView(AdobeCCFilesUploadAssetData paramAdobeCCFilesUploadAssetData, AdobeAssetViewListBaseUploadAssetCellView paramAdobeAssetViewListBaseUploadAssetCellView)
      {
        paramAdobeAssetViewListBaseUploadAssetCellView = (Observer)_assetsUploadObservers.get(guid);
        if (paramAdobeAssetViewListBaseUploadAssetCellView == null) {
          return;
        }
        _assetsUploadObservers.remove(guid);
        getUploadSession().removeObserverForAssetUpload(paramAdobeCCFilesUploadAssetData, paramAdobeAssetViewListBaseUploadAssetCellView);
      }
      
      protected void updateUploadCellViewStatus(AdobeCCFilesUploadAssetData paramAdobeCCFilesUploadAssetData, AdobeAssetViewListBaseUploadAssetCellView paramAdobeAssetViewListBaseUploadAssetCellView)
      {
        if (!AdobeAssetsViewCCFilesBaseListViewController.LocalAssetsUploadCCAssetsCombinedAdapter.this.isUploadAssetDataCellViewEqual(paramAdobeCCFilesUploadAssetData, paramAdobeAssetViewListBaseUploadAssetCellView)) {
          return;
        }
        paramAdobeAssetViewListBaseUploadAssetCellView.setUploadStatus(paramAdobeCCFilesUploadAssetData.getStatus());
        paramAdobeAssetViewListBaseUploadAssetCellView.setUploadProgres(paramAdobeCCFilesUploadAssetData.getProgress());
      }
    }
  }
  
  class UploadRelatedData
  {
    public AdobeAssetsViewCCFilesBaseListViewController.LocalAssetsUploadCCAssetsCombinedAdapter _localAssetsCCFilesCombinedAdapter;
    public AdobeAssetsViewBaseRecyclerViewController.AssetsListViewBaseAdapter _originalAssetsAdapter;
    public AdobeCCFilesUploadSession _uploadSession;
    
    UploadRelatedData() {}
  }
}
