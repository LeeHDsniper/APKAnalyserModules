package com.adobe.creativesdk.foundation.internal.storage.controllers.edit;

import android.app.Activity;
import android.content.Context;
import android.support.v4.widget.SwipeRefreshLayout;
import android.view.ViewGroup;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetViewListBaseCellView;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetsViewBaseRecyclerViewController.AssetsListViewBaseAdapter;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetsViewCCFilesGridViewController;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetsViewCCFilesGridViewController.CCFilesAssetsStaggeredGridAdapter;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetsViewCellAssetData;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONObject;

public class AdobeAssetViewEditGridViewController
  extends AdobeAssetsViewCCFilesGridViewController
{
  private HashMap<String, AdobeAssetsViewCellAssetData> _assetsList = new HashMap();
  private WeakReference<IAdobeAssetViewEditFragmentControllerCallback> controllerCallback;
  private boolean isControllerEnabled = true;
  
  public AdobeAssetViewEditGridViewController(Context paramContext)
  {
    super(paramContext);
  }
  
  private void addSelectedAsset(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
  {
    _assetsList.put(guid, paramAdobeAssetsViewCellAssetData);
    handleAssetCountEvent();
  }
  
  private boolean controllerState()
  {
    return isControllerEnabled;
  }
  
  private void handleAssetCountEvent()
  {
    if (_assetsList.size() == 0)
    {
      ((IAdobeAssetViewEditFragmentControllerCallback)controllerCallback.get()).handleNoAssetSelection();
      return;
    }
    if (_assetsList.size() == 1)
    {
      ((IAdobeAssetViewEditFragmentControllerCallback)controllerCallback.get()).handleSingleAssetSelection();
      return;
    }
    ((IAdobeAssetViewEditFragmentControllerCallback)controllerCallback.get()).handleMultipleAssetSelection(_assetsList.size());
  }
  
  private boolean isAssetSelected(AdobeAsset paramAdobeAsset)
  {
    if (_assetsList != null) {
      return _assetsList.containsKey(paramAdobeAsset.getGUID());
    }
    return false;
  }
  
  private void removeSelectedAsset(String paramString)
  {
    if (_assetsList.containsKey(paramString))
    {
      _assetsList.remove(paramString);
      handleAssetCountEvent();
    }
  }
  
  public void clearSelection()
  {
    Iterator localIterator = _assetsList.values().iterator();
    while (localIterator.hasNext()) {
      nextisSelected = false;
    }
    _assetsList.clear();
    refreshDueToDataChange();
  }
  
  protected AdobeAssetsViewBaseRecyclerViewController.AssetsListViewBaseAdapter createAssetItemsAdapter(Context paramContext)
  {
    return new CCFilesAssetsEditStaggeredGridAdapater(paramContext);
  }
  
  protected void disableController()
  {
    isControllerEnabled = false;
  }
  
  protected void enableController()
  {
    isControllerEnabled = true;
  }
  
  protected ArrayList<AdobeAsset> getSelectedAssets()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = _assetsList.values().iterator();
    while (localIterator.hasNext()) {
      localArrayList.add((AdobeAsset)nextoriginalAsset);
    }
    return localArrayList;
  }
  
  protected void handleListItemClick(int paramInt) {}
  
  protected void handleListItemLongClick(int paramInt) {}
  
  public void performInitialization(Context paramContext)
  {
    super.performInitialization(paramContext);
    _swipeRefreshLayout.setEnabled(false);
  }
  
  public void setControllerCallback(IAdobeAssetViewEditFragmentControllerCallback paramIAdobeAssetViewEditFragmentControllerCallback)
  {
    controllerCallback = new WeakReference(paramIAdobeAssetViewEditFragmentControllerCallback);
  }
  
  protected class CCFilesAssetsEditStaggeredGridAdapater
    extends AdobeAssetsViewCCFilesGridViewController.CCFilesAssetsStaggeredGridAdapter
    implements IAdobeCCFilesEditDelegate
  {
    public CCFilesAssetsEditStaggeredGridAdapater(Context paramContext)
    {
      super(paramContext);
    }
    
    protected void bindAssetCellViewToAsset(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData, int paramInt)
    {
      super.bindAssetCellViewToAsset(paramAdobeAssetViewListBaseCellView, paramAdobeAssetsViewCellAssetData, paramInt);
      if ((paramAdobeAssetViewListBaseCellView instanceof AdobeAssetViewEditStaggeredGridAssetCellView)) {
        ((AdobeAssetViewEditStaggeredGridAssetCellView)paramAdobeAssetViewListBaseCellView).adjustSelectionFrame();
      }
    }
    
    protected AdobeAssetViewListBaseCellView createAssetFileCellView(ViewGroup paramViewGroup)
    {
      AdobeAssetViewEditStaggeredGridAssetCellView localAdobeAssetViewEditStaggeredGridAssetCellView = new AdobeAssetViewEditStaggeredGridAssetCellView();
      localAdobeAssetViewEditStaggeredGridAssetCellView.initializeFromLayout(getHostActivity().getLayoutInflater(), R.layout.adobe_generic_staggered_assetviewcell, paramViewGroup);
      localAdobeAssetViewEditStaggeredGridAssetCellView.setEditDelegate(this);
      return localAdobeAssetViewEditStaggeredGridAssetCellView;
    }
    
    protected AdobeAssetViewListBaseCellView createAssetFolderCellView(ViewGroup paramViewGroup)
    {
      AdobeAssetViewEditStaggeredGridFolderCellView localAdobeAssetViewEditStaggeredGridFolderCellView = new AdobeAssetViewEditStaggeredGridFolderCellView();
      localAdobeAssetViewEditStaggeredGridFolderCellView.initializeFromLayout(getHostActivity().getLayoutInflater(), R.layout.adobe_assetview_assetsgrid_folderviewcell, paramViewGroup);
      localAdobeAssetViewEditStaggeredGridFolderCellView.setEditDelegate(this);
      return localAdobeAssetViewEditStaggeredGridFolderCellView;
    }
    
    protected AdobeAssetsViewCellAssetData getCellDataFromAsset(AdobeAsset paramAdobeAsset)
    {
      Object localObject2 = null;
      AdobeAssetViewEditCellAssetData localAdobeAssetViewEditCellAssetData = new AdobeAssetViewEditCellAssetData();
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
        isSelected = false;
        return localAdobeAssetViewEditCellAssetData;
      }
    }
    
    public boolean getControllerState()
    {
      return AdobeAssetViewEditGridViewController.this.controllerState();
    }
    
    public void handleAssetSelectionToggle(int paramInt)
    {
      AdobeAssetViewEditCellAssetData localAdobeAssetViewEditCellAssetData = (AdobeAssetViewEditCellAssetData)getAssetItemData(paramInt);
      if (!AdobeAssetViewEditGridViewController.this.isAssetSelected((AdobeAsset)originalAsset))
      {
        isSelected = true;
        AdobeAssetViewEditGridViewController.this.addSelectedAsset(localAdobeAssetViewEditCellAssetData);
        return;
      }
      isSelected = false;
      AdobeAssetViewEditGridViewController.this.removeSelectedAsset(guid);
    }
    
    protected void handlePostCellViewBinding(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData, int paramInt)
    {
      super.handlePostCellViewBinding(paramAdobeAssetViewListBaseCellView, paramAdobeAssetsViewCellAssetData, paramInt);
      boolean bool;
      if ((paramAdobeAssetViewListBaseCellView instanceof AdobeAssetViewEditStaggeredGridAssetCellView))
      {
        bool = AdobeAssetViewEditGridViewController.this.isAssetSelected((AdobeAsset)originalAsset);
        ((AdobeAssetViewEditStaggeredGridAssetCellView)paramAdobeAssetViewListBaseCellView).handleSelection(bool);
        ((AdobeAssetViewEditStaggeredGridAssetCellView)paramAdobeAssetViewListBaseCellView).adjustSelectionFrame();
      }
      if ((paramAdobeAssetViewListBaseCellView instanceof AdobeAssetViewEditStaggeredGridFolderCellView))
      {
        bool = AdobeAssetViewEditGridViewController.this.isAssetSelected((AdobeAsset)originalAsset);
        ((AdobeAssetViewEditStaggeredGridFolderCellView)paramAdobeAssetViewListBaseCellView).handleSelection(bool);
      }
    }
    
    protected boolean isAssetCellViewAlreadyRepresentAsset(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
    {
      boolean bool = super.isAssetCellViewAlreadyRepresentAsset(paramAdobeAssetViewListBaseCellView, paramAdobeAssetsViewCellAssetData);
      if ((bool == true) && ((paramAdobeAssetsViewCellAssetData instanceof AdobeAssetViewEditCellAssetData)))
      {
        if (!(paramAdobeAssetViewListBaseCellView instanceof AdobeAssetViewEditStaggeredGridAssetCellView)) {
          break label56;
        }
        ((AdobeAssetViewEditStaggeredGridAssetCellView)paramAdobeAssetViewListBaseCellView).handleSelection(AdobeAssetViewEditGridViewController.this.isAssetSelected((AdobeAsset)originalAsset));
        ((AdobeAssetViewEditStaggeredGridAssetCellView)paramAdobeAssetViewListBaseCellView).adjustSelectionFrame();
      }
      label56:
      while (!(paramAdobeAssetViewListBaseCellView instanceof AdobeAssetViewEditStaggeredGridFolderCellView)) {
        return bool;
      }
      ((AdobeAssetViewEditStaggeredGridFolderCellView)paramAdobeAssetViewListBaseCellView).handleSelection(AdobeAssetViewEditGridViewController.this.isAssetSelected((AdobeAsset)originalAsset));
      return bool;
    }
  }
}
