package com.adobe.creativesdk.foundation.internal.storage.controllers.edit;

import android.app.Activity;
import android.content.Context;
import android.support.v4.widget.SwipeRefreshLayout;
import android.view.ViewGroup;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetViewListBaseCellView;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetsViewBaseRecyclerViewController.AssetsListViewBaseAdapter;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetsViewCCFilesSectionListViewController;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetsViewCCFilesSectionListViewController.CCFilesAssetsSectionalListItemsAdapter;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetsViewCellAssetData;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONObject;

public class AdobeAssetViewEditSectionalListViewController
  extends AdobeAssetsViewCCFilesSectionListViewController
{
  private HashMap<String, AdobeAssetsViewCellAssetData> _assetsList = new HashMap();
  private WeakReference<IAdobeAssetViewEditFragmentControllerCallback> controllerCallback;
  private boolean isControllerEnabled = true;
  
  public AdobeAssetViewEditSectionalListViewController(Context paramContext)
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
    return new CCFilesAssetsEditSectionalListItemsAdapater(paramContext);
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
  
  protected class CCFilesAssetsEditSectionalListItemsAdapater
    extends AdobeAssetsViewCCFilesSectionListViewController.CCFilesAssetsSectionalListItemsAdapter
    implements IAdobeCCFilesEditDelegate
  {
    public CCFilesAssetsEditSectionalListItemsAdapater(Context paramContext)
    {
      super(paramContext);
    }
    
    protected void bindAssetCellViewToAsset(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData, int paramInt)
    {
      super.bindAssetCellViewToAsset(paramAdobeAssetViewListBaseCellView, paramAdobeAssetsViewCellAssetData, paramInt);
    }
    
    protected AdobeAssetViewListBaseCellView createAssetFileCellView(ViewGroup paramViewGroup)
    {
      AdobeAssetViewEditSectionalListViewAssetCellView localAdobeAssetViewEditSectionalListViewAssetCellView = new AdobeAssetViewEditSectionalListViewAssetCellView();
      localAdobeAssetViewEditSectionalListViewAssetCellView.initializeFromLayout(getHostActivity().getLayoutInflater(), R.layout.adobe_assetview_list_assetviewcell, paramViewGroup);
      ((AdobeAssetViewEditSectionalListViewAssetCellView)localAdobeAssetViewEditSectionalListViewAssetCellView).setEditDelegate(this);
      return localAdobeAssetViewEditSectionalListViewAssetCellView;
    }
    
    protected AdobeAssetViewListBaseCellView createAssetFolderCellView(ViewGroup paramViewGroup)
    {
      AdobeAssetViewEditSectionalListFolderCellView localAdobeAssetViewEditSectionalListFolderCellView = new AdobeAssetViewEditSectionalListFolderCellView();
      localAdobeAssetViewEditSectionalListFolderCellView.initializeFromLayout(getHostActivity().getLayoutInflater(), R.layout.adobe_assetview_list_folderviewcell, paramViewGroup);
      ((AdobeAssetViewEditSectionalListFolderCellView)localAdobeAssetViewEditSectionalListFolderCellView).setEditDelegate(this);
      return localAdobeAssetViewEditSectionalListFolderCellView;
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
      return AdobeAssetViewEditSectionalListViewController.this.controllerState();
    }
    
    public void handleAssetSelectionToggle(int paramInt)
    {
      AdobeAssetViewEditCellAssetData localAdobeAssetViewEditCellAssetData = (AdobeAssetViewEditCellAssetData)getAssetItemData(paramInt);
      if (!AdobeAssetViewEditSectionalListViewController.this.isAssetSelected((AdobeAsset)originalAsset))
      {
        isSelected = true;
        AdobeAssetViewEditSectionalListViewController.this.addSelectedAsset(localAdobeAssetViewEditCellAssetData);
        return;
      }
      isSelected = false;
      AdobeAssetViewEditSectionalListViewController.this.removeSelectedAsset(guid);
    }
    
    protected void handlePostCellViewBinding(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData, int paramInt)
    {
      super.handlePostCellViewBinding(paramAdobeAssetViewListBaseCellView, paramAdobeAssetsViewCellAssetData, paramInt);
      boolean bool;
      if ((paramAdobeAssetViewListBaseCellView instanceof AdobeAssetViewEditSectionalListViewAssetCellView))
      {
        bool = AdobeAssetViewEditSectionalListViewController.this.isAssetSelected((AdobeAsset)originalAsset);
        ((AdobeAssetViewEditSectionalListViewAssetCellView)paramAdobeAssetViewListBaseCellView).handleSelection(bool);
      }
      if ((paramAdobeAssetViewListBaseCellView instanceof AdobeAssetViewEditSectionalListFolderCellView))
      {
        bool = AdobeAssetViewEditSectionalListViewController.this.isAssetSelected((AdobeAsset)originalAsset);
        ((AdobeAssetViewEditSectionalListFolderCellView)paramAdobeAssetViewListBaseCellView).handleSelection(bool);
      }
    }
    
    protected boolean isAssetCellViewAlreadyRepresentAsset(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
    {
      boolean bool = super.isAssetCellViewAlreadyRepresentAsset(paramAdobeAssetViewListBaseCellView, paramAdobeAssetsViewCellAssetData);
      if ((bool == true) && ((paramAdobeAssetsViewCellAssetData instanceof AdobeAssetViewEditCellAssetData)))
      {
        if (!(paramAdobeAssetViewListBaseCellView instanceof AdobeAssetViewEditSectionalListViewAssetCellView)) {
          break label49;
        }
        ((AdobeAssetViewEditSectionalListViewAssetCellView)paramAdobeAssetViewListBaseCellView).handleSelection(AdobeAssetViewEditSectionalListViewController.this.isAssetSelected((AdobeAsset)originalAsset));
      }
      label49:
      while (!(paramAdobeAssetViewListBaseCellView instanceof AdobeAssetViewEditSectionalListFolderCellView)) {
        return bool;
      }
      ((AdobeAssetViewEditSectionalListFolderCellView)paramAdobeAssetViewListBaseCellView).handleSelection(AdobeAssetViewEditSectionalListViewController.this.isAssetSelected((AdobeAsset)originalAsset));
      return bool;
    }
  }
}
