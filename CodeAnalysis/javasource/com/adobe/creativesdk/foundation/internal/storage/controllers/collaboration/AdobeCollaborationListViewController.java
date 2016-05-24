package com.adobe.creativesdk.foundation.internal.storage.controllers.collaboration;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.adobe.creativesdk.foundation.adobeinternal.auth.AdobeUXAuthManagerRestricted;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeCollaborationInvite;
import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeCollaborator;
import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeCollaboratorInvitation;
import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeGetUserProfilePic;
import com.adobe.creativesdk.foundation.internal.collaboration.models.IAdobeProfilePicCallback;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

public class AdobeCollaborationListViewController
{
  protected RecyclerView _absListView;
  protected CollaborationListViewBaseAdapter _assetsItemsAdapter;
  private int _deleteToken = -1;
  protected View _mainRootView;
  private WeakReference<IAdobeCollaborationContainerListViewDelegate> _parentContainer;
  protected SwipeRefreshLayout _swipeRefreshLayout;
  private ArrayList<AdobeCollaboratorInvitation> collaboratorsList;
  private boolean online = true;
  protected String selfID = null;
  
  public AdobeCollaborationListViewController() {}
  
  private int getCollaboratorTypeFromPosition(int paramInt)
  {
    return getTypeFromCollaboration((AdobeCollaboratorInvitation)collaboratorsList.get(paramInt));
  }
  
  private String getSelfID()
  {
    if (selfID == null) {
      selfID = AdobeUXAuthManagerRestricted.getSharedAuthManagerRestricted().getAdobeID();
    }
    return selfID;
  }
  
  private int getTypeFromCollaboration(AdobeCollaboratorInvitation paramAdobeCollaboratorInvitation)
  {
    if (paramAdobeCollaboratorInvitation.isInvite()) {
      return 1;
    }
    return 0;
  }
  
  private void handleCollaboratorSelfDelete()
  {
    ((IAdobeCollaborationContainerListViewDelegate)_parentContainer.get()).handleSelfDelete();
  }
  
  private void hideAddCollaboratorIcon()
  {
    ((IAdobeCollaborationContainerListViewDelegate)_parentContainer.get()).hideAddCollaboratorIcon();
  }
  
  private void removeViewAndRefresh(int paramInt)
  {
    collaboratorsList.remove(paramInt);
    _deleteToken = -1;
    showAddCollaboratorIcon();
    _assetsItemsAdapter.notifyDataSetChanged();
  }
  
  private void showAddCollaboratorIcon()
  {
    ((IAdobeCollaborationContainerListViewDelegate)_parentContainer.get()).showAddCollaboratorIcon();
  }
  
  protected void addInvitation(AdobeCollaboratorInvitation paramAdobeCollaboratorInvitation)
  {
    collaboratorsList.add(paramAdobeCollaboratorInvitation);
    refreshDueToDataChange();
  }
  
  protected CollaborationListViewBaseAdapter createAssetItemsAdapter(Context paramContext)
  {
    return new CollaborationListViewBaseAdapter(paramContext);
  }
  
  public AdobeCollaboratorInvitation getCollaborationItem(int paramInt)
  {
    return (AdobeCollaboratorInvitation)collaboratorsList.get(paramInt);
  }
  
  protected ArrayList<AdobeCollaboratorInvitation> getCollaboratorsList()
  {
    return collaboratorsList;
  }
  
  protected RecyclerView getConcreteAbsListView(Context paramContext)
  {
    return _absListView;
  }
  
  protected View getMainRootView(Context paramContext)
  {
    paramContext = _mainRootView;
    _swipeRefreshLayout = ((SwipeRefreshLayout)paramContext.findViewById(R.id.swipe_collaboration_container));
    _absListView = ((RecyclerView)paramContext.findViewById(R.id.adobe_asset_browser_collaboration_list));
    return paramContext;
  }
  
  protected boolean handleBackPress()
  {
    if (_deleteToken != -1)
    {
      _deleteToken = -1;
      showAddCollaboratorIcon();
      refreshDueToDataChange();
      return true;
    }
    return false;
  }
  
  protected void handleNetworkOffline()
  {
    online = false;
    refreshDueToDataChange();
  }
  
  protected void handleNetworkOnline()
  {
    online = true;
    refreshDueToDataChange();
  }
  
  void loadAndDisplayThumbnail(final AdobeCollaborationCellView paramAdobeCollaborationCellView, AdobeCollaborator paramAdobeCollaborator, final int paramInt)
  {
    AdobeGetUserProfilePic.getAvatarFromUserID(paramAdobeCollaborator.getUserID(), new IAdobeProfilePicCallback()
    {
      public void onComplete(Bitmap paramAnonymousBitmap)
      {
        if (paramAdobeCollaborationCellView.getPosition() == paramInt) {
          paramAdobeCollaborationCellView.setProfilePicture(paramAnonymousBitmap);
        }
      }
      
      public void onError() {}
    });
  }
  
  public void performInitialization(Context paramContext)
  {
    _mainRootView = getMainRootView(paramContext);
    _absListView = getConcreteAbsListView(paramContext);
    LinearLayoutManager localLinearLayoutManager = new LinearLayoutManager(((IAdobeCollaborationContainerListViewDelegate)_parentContainer.get()).getHostActivity());
    localLinearLayoutManager.setOrientation(1);
    _absListView.setLayoutManager(localLinearLayoutManager);
    _swipeRefreshLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener()
    {
      public void onRefresh()
      {
        if (_parentContainer.get() != null)
        {
          startRefreshAnimation();
          ((IAdobeCollaborationContainerListViewDelegate)_parentContainer.get()).refreshListDueToSwipe();
          stopRefreshAnimation();
        }
      }
    });
    _assetsItemsAdapter = createAssetItemsAdapter(paramContext);
    _absListView.setAdapter(_assetsItemsAdapter.getRealAdapter());
  }
  
  public void refreshDueToDataChange()
  {
    _assetsItemsAdapter.invalidateAssetsList();
    _assetsItemsAdapter.markDataSetChanged();
  }
  
  public void setCollaboratorsList(ArrayList<AdobeCollaboratorInvitation> paramArrayList)
  {
    collaboratorsList = paramArrayList;
  }
  
  protected void setMainRootView(View paramView)
  {
    _mainRootView = paramView;
  }
  
  public void setParentContainer(IAdobeCollaborationContainerListViewDelegate paramIAdobeCollaborationContainerListViewDelegate)
  {
    _parentContainer = new WeakReference(paramIAdobeCollaborationContainerListViewDelegate);
  }
  
  public void startRefreshAnimation()
  {
    _swipeRefreshLayout.setRefreshing(true);
  }
  
  public void stopRefreshAnimation()
  {
    _swipeRefreshLayout.setRefreshing(false);
  }
  
  public class CollaborationListViewBaseAdapter
    extends RecyclerView.Adapter<RecyclerView.ViewHolder>
    implements IAdobeCollaborationCellViewDelegate
  {
    public CollaborationListViewBaseAdapter(Context paramContext) {}
    
    public void disableDataViewAndShowProgress()
    {
      ((IAdobeCollaborationContainerListViewDelegate)_parentContainer.get()).disableDataView();
    }
    
    public void enableDataView()
    {
      ((IAdobeCollaborationContainerListViewDelegate)_parentContainer.get()).enableDataView();
    }
    
    public Context getActivityContext()
    {
      return ((IAdobeCollaborationContainerListViewDelegate)_parentContainer.get()).getHostActivity();
    }
    
    public AdobeAssetFolder getCollaboratedFolder()
    {
      return ((IAdobeCollaborationContainerListViewDelegate)_parentContainer.get()).getCollaboratedFolder();
    }
    
    protected AdobeCollaboratorInvitation getCollaborationItemData(int paramInt)
    {
      return getCollaborationItem(paramInt);
    }
    
    protected int getCollaboratorsCount()
    {
      return collaboratorsList.size();
    }
    
    public int getItemCount()
    {
      return getCollaboratorsCount();
    }
    
    public int getItemViewType(int paramInt)
    {
      return AdobeCollaborationListViewController.this.getCollaboratorTypeFromPosition(paramInt);
    }
    
    public RecyclerView.Adapter getRealAdapter()
    {
      return this;
    }
    
    public int getToken()
    {
      return _deleteToken;
    }
    
    protected void handlePostCellViewBinding(AdobeCollaborationGenericCellView paramAdobeCollaborationGenericCellView, AdobeCollaboratorInvitation paramAdobeCollaboratorInvitation, int paramInt)
    {
      if (!paramAdobeCollaboratorInvitation.isInvite()) {
        loadAndDisplayThumbnail((AdobeCollaborationCellView)paramAdobeCollaborationGenericCellView, (AdobeCollaborator)paramAdobeCollaboratorInvitation, paramInt);
      }
    }
    
    public void handleSelfDelete()
    {
      AdobeCollaborationListViewController.this.handleCollaboratorSelfDelete();
    }
    
    protected void invalidateAssetsList() {}
    
    public boolean isOnline()
    {
      return online;
    }
    
    public void markDataSetChanged()
    {
      getRealAdapter().notifyDataSetChanged();
    }
    
    public void onBindViewHolder(RecyclerView.ViewHolder paramViewHolder, int paramInt)
    {
      Object localObject1 = getCollaborationItemData(paramInt);
      ((CellViewHolder)paramViewHolder).getCellView().prepareForReuse();
      ((CellViewHolder)paramViewHolder).getCellView().setPosition(paramInt);
      Object localObject2 = ((CellViewHolder)paramViewHolder).getCellView();
      if (_deleteToken == paramInt) {}
      for (boolean bool = true;; bool = false)
      {
        ((AdobeCollaborationGenericCellView)localObject2).setDeleteVisibility(bool);
        ((CellViewHolder)paramViewHolder).getCellView().setEnabled(isOnline());
        switch (viewTypeId)
        {
        default: 
          return;
        }
      }
      localObject1 = (AdobeCollaborationInvite)localObject1;
      paramViewHolder = (AdobeInvitationCellView)((CellViewHolder)paramViewHolder).getCellView();
      paramViewHolder.setInviteId(((AdobeCollaborationInvite)localObject1).getInviteID());
      paramViewHolder.setName(((AdobeCollaborationInvite)localObject1).getEmail());
      paramViewHolder.setInviteProfilePicture();
      return;
      localObject2 = (AdobeCollaborator)localObject1;
      paramViewHolder = (AdobeCollaborationCellView)((CellViewHolder)paramViewHolder).getCellView();
      String str = ((AdobeCollaborator)localObject2).getUserID();
      paramViewHolder.setID(str);
      paramViewHolder.setSelf(str.equals(AdobeCollaborationListViewController.this.getSelfID()));
      paramViewHolder.setOwner(((AdobeCollaborator)localObject2).isOwner());
      paramViewHolder.setName(((AdobeCollaborator)localObject2).getName());
      handlePostCellViewBinding(paramViewHolder, (AdobeCollaboratorInvitation)localObject1, paramInt);
    }
    
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup paramViewGroup, int paramInt)
    {
      return new CellViewHolder(LayoutInflater.from(paramViewGroup.getContext()).inflate(R.layout.adobe_collaboration_list_view, paramViewGroup, false), this, paramInt);
    }
    
    public void removeView(int paramInt)
    {
      AdobeCollaborationListViewController.this.removeViewAndRefresh(paramInt);
    }
    
    public void setToken(int paramInt)
    {
      AdobeCollaborationListViewController.access$202(AdobeCollaborationListViewController.this, paramInt);
      if (_deleteToken == -1)
      {
        AdobeCollaborationListViewController.this.showAddCollaboratorIcon();
        return;
      }
      AdobeCollaborationListViewController.this.hideAddCollaboratorIcon();
    }
    
    private class CellViewHolder
      extends RecyclerView.ViewHolder
    {
      private AdobeCollaborationGenericCellView mainBaseListCellView;
      public int viewTypeId;
      
      public CellViewHolder(View paramView, IAdobeCollaborationCellViewDelegate paramIAdobeCollaborationCellViewDelegate, int paramInt)
      {
        super();
        viewTypeId = paramInt;
        if (viewTypeId == 1) {}
        for (mainBaseListCellView = new AdobeInvitationCellView();; mainBaseListCellView = new AdobeCollaborationCellView())
        {
          mainBaseListCellView.setDelegate(paramIAdobeCollaborationCellViewDelegate);
          mainBaseListCellView.initializeFromLayout(paramView);
          return;
        }
      }
      
      public AdobeCollaborationGenericCellView getCellView()
      {
        return mainBaseListCellView;
      }
    }
  }
}
