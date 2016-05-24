package com.adobe.creativesdk.foundation.internal.storage.controllers.comments;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.text.format.DateUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.auth.AdobeAuthUserProfile;
import com.adobe.creativesdk.foundation.auth.AdobeUXAuthManager;
import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeGetUserProfilePic;
import com.adobe.creativesdk.foundation.internal.collaboration.models.IAdobeProfilePicCallback;
import com.adobe.creativesdk.foundation.internal.comments.AdobeAssetCommentsManager;
import com.adobe.creativesdk.foundation.internal.comments.IAdobeDeleteCommentCallback;
import com.adobe.creativesdk.foundation.internal.comments.models.AdobeAssetCommentData;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;

public class AdobeAssetViewCommentsListViewController
{
  protected RecyclerView _absListView;
  protected CommentsListViewBaseAdapter _assetsItemsAdapter;
  private int _deleteToken = -1;
  protected View _mainRootView;
  private WeakReference<IAdobeCommentsContainerListViewDelegate> _parentContainer;
  protected SwipeRefreshLayout _swipeRefreshLayout;
  public long cellSwiping = -1L;
  private ArrayList<AdobeAssetViewCommentsCellViewData> commentsData;
  private String commentsURLjustPosted = null;
  AdobeAssetViewCommentsDeleteManager deleteManager;
  private IAdobeCommentsViewDeleteVisibiltyDelegate deleteVisibiltyDelegate;
  private boolean isRegenerationInProgress;
  private boolean online = true;
  
  public AdobeAssetViewCommentsListViewController() {}
  
  private void controlDeleteVisibility(IAdobeCommentsViewDeleteVisibiltyDelegate paramIAdobeCommentsViewDeleteVisibiltyDelegate)
  {
    if ((deleteVisibiltyDelegate != null) && (!deleteVisibiltyDelegate.equals(paramIAdobeCommentsViewDeleteVisibiltyDelegate))) {
      deleteVisibiltyDelegate.hideDeleteButton();
    }
  }
  
  private void handleDeleteComment(String paramString)
  {
    if (deleteManager == null) {
      deleteManager = new AdobeAssetViewCommentsDeleteManager();
    }
    deleteManager.insertCommentForDeletion(paramString);
  }
  
  private long isAnyCellSwiping()
  {
    return cellSwiping;
  }
  
  private void regenerateList()
  {
    int j;
    int i;
    if (!isRegenerationInProgress)
    {
      isRegenerationInProgress = true;
      ((IAdobeCommentsContainerListViewDelegate)_parentContainer.get()).hideDataViewAndShowProgress();
      j = 0;
      i = 0;
      ArrayList localArrayList = new ArrayList();
      int k = 0;
      if (k < commentsData.size())
      {
        String str = commentsData.get(k)).originalCommentData.getCommentURL();
        if (deleteManager.queue.containsKey(str)) {
          if ((AdobeAssetViewCommentDeletionStatus)deleteManager.queue.get(str) == AdobeAssetViewCommentDeletionStatus.ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_COMPLETED)
          {
            i += 1;
            label112:
            deleteManager.queue.remove(str);
          }
        }
        for (;;)
        {
          k += 1;
          break;
          AdobeAssetViewCommentsCellViewData localAdobeAssetViewCommentsCellViewData = (AdobeAssetViewCommentsCellViewData)commentsData.get(k);
          isEnabled = true;
          localArrayList.add(localAdobeAssetViewCommentsCellViewData);
          j += 1;
          break label112;
          localArrayList.add(commentsData.get(k));
        }
      }
      commentsData = localArrayList;
      ((IAdobeCommentsContainerListViewDelegate)_parentContainer.get()).hideProgressAndShowDataView();
      if (commentsData.size() != 0) {
        break label252;
      }
      ((IAdobeCommentsContainerListViewDelegate)_parentContainer.get()).handleEmptyComments();
    }
    for (;;)
    {
      ((IAdobeCommentsContainerListViewDelegate)_parentContainer.get()).showCommentDeletionBanner(i, j);
      isRegenerationInProgress = false;
      return;
      label252:
      refreshDueToDataChange();
    }
  }
  
  private void setAnyCellSwiping(long paramLong)
  {
    cellSwiping = paramLong;
  }
  
  private void showAddCommentsIcon()
  {
    ((IAdobeCommentsContainerListViewDelegate)_parentContainer.get()).showAddCommentsIcon();
  }
  
  protected CommentsListViewBaseAdapter createAssetItemsAdapter(Context paramContext)
  {
    return new CommentsListViewBaseAdapter(paramContext);
  }
  
  public AdobeAssetViewCommentsCellViewData getCommentsData(int paramInt)
  {
    return (AdobeAssetViewCommentsCellViewData)commentsData.get(paramInt);
  }
  
  protected RecyclerView getConcreteAbsListView(Context paramContext)
  {
    return _absListView;
  }
  
  protected View getMainRootView(Context paramContext)
  {
    paramContext = _mainRootView;
    _swipeRefreshLayout = ((SwipeRefreshLayout)paramContext.findViewById(R.id.swipe_comments_container));
    _absListView = ((RecyclerView)paramContext.findViewById(R.id.adobe_asset_browser_comments_list));
    return paramContext;
  }
  
  protected boolean handleBackPress()
  {
    if (_deleteToken != -1)
    {
      _deleteToken = -1;
      showAddCommentsIcon();
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
  
  void loadAndDisplayThumbnail(final AdobeAssetViewCommentsCellView paramAdobeAssetViewCommentsCellView, AdobeAssetViewCommentsCellViewData paramAdobeAssetViewCommentsCellViewData, final int paramInt)
  {
    if (!originalCommentData.getCommentURL().equals(commentsURLjustPosted))
    {
      if ((originalCommentData.getAvatarURL() == null) || (originalCommentData.getAvatarURL().length() == 0))
      {
        paramAdobeAssetViewCommentsCellView.setNoImage(paramInt);
        return;
      }
      AdobeGetUserProfilePic.getAvatarFromURL(originalCommentData.getAvatarURL(), new IAdobeProfilePicCallback()
      {
        public void onComplete(Bitmap paramAnonymousBitmap)
        {
          paramAdobeAssetViewCommentsCellView.setProfilePicture(paramAnonymousBitmap, paramInt);
        }
        
        public void onError()
        {
          paramAdobeAssetViewCommentsCellView.setNoImage(paramInt);
        }
      });
      return;
    }
    AdobeGetUserProfilePic.getAvatarFromUserID(AdobeUXAuthManager.getSharedAuthManager().getUserProfile().getAdobeID(), new IAdobeProfilePicCallback()
    {
      public void onComplete(Bitmap paramAnonymousBitmap)
      {
        paramAdobeAssetViewCommentsCellView.setProfilePicture(paramAnonymousBitmap, paramInt);
      }
      
      public void onError()
      {
        paramAdobeAssetViewCommentsCellView.setNoImage(paramInt);
      }
    });
  }
  
  public void performInitialization(Context paramContext)
  {
    _mainRootView = getMainRootView(paramContext);
    _absListView = getConcreteAbsListView(paramContext);
    LinearLayoutManager localLinearLayoutManager = new LinearLayoutManager(paramContext);
    localLinearLayoutManager.setOrientation(1);
    _absListView.setLayoutManager(localLinearLayoutManager);
    _swipeRefreshLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener()
    {
      public void onRefresh()
      {
        if (_parentContainer.get() != null)
        {
          startRefreshAnimation();
          ((IAdobeCommentsContainerListViewDelegate)_parentContainer.get()).refreshListDueToSwipe();
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
  
  public void setCommentsData(ArrayList<AdobeAssetViewCommentsCellViewData> paramArrayList)
  {
    commentsData = paramArrayList;
  }
  
  public void setCommentsURLjustPosted(String paramString)
  {
    commentsURLjustPosted = paramString;
  }
  
  public void setDeleteVisibiltyDelegate(IAdobeCommentsViewDeleteVisibiltyDelegate paramIAdobeCommentsViewDeleteVisibiltyDelegate)
  {
    deleteVisibiltyDelegate = paramIAdobeCommentsViewDeleteVisibiltyDelegate;
  }
  
  protected void setMainRootView(View paramView)
  {
    _mainRootView = paramView;
  }
  
  public void setParentContainer(IAdobeCommentsContainerListViewDelegate paramIAdobeCommentsContainerListViewDelegate)
  {
    _parentContainer = new WeakReference(paramIAdobeCommentsContainerListViewDelegate);
  }
  
  public void startRefreshAnimation()
  {
    _swipeRefreshLayout.setRefreshing(true);
  }
  
  public void stopRefreshAnimation()
  {
    _swipeRefreshLayout.setRefreshing(false);
  }
  
  class AdobeAssetViewCommentsDeleteManager
  {
    private int in_progress_count;
    private HashMap<String, AdobeAssetViewCommentDeletionStatus> queue = new HashMap();
    
    AdobeAssetViewCommentsDeleteManager() {}
    
    private void handleCommentOperationCompletion(String paramString, boolean paramBoolean)
    {
      if (paramBoolean) {
        queue.put(paramString, AdobeAssetViewCommentDeletionStatus.ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_COMPLETED);
      }
      for (;;)
      {
        in_progress_count -= 1;
        if (in_progress_count == 0) {
          AdobeAssetViewCommentsListViewController.this.regenerateList();
        }
        return;
        queue.put(paramString, AdobeAssetViewCommentDeletionStatus.ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_ERROR);
      }
    }
    
    public void insertCommentForDeletion(final String paramString)
    {
      in_progress_count += 1;
      queue.put(paramString, AdobeAssetViewCommentDeletionStatus.ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_IN_PROGRESS);
      ((IAdobeCommentsContainerListViewDelegate)_parentContainer.get()).getCommentsManager().deleteComment(paramString, new IAdobeDeleteCommentCallback()
      {
        public void onError()
        {
          AdobeAssetViewCommentsListViewController.AdobeAssetViewCommentsDeleteManager.this.handleCommentOperationCompletion(paramString, false);
        }
        
        public void onSuccess()
        {
          AdobeAssetViewCommentsListViewController.AdobeAssetViewCommentsDeleteManager.this.handleCommentOperationCompletion(paramString, true);
        }
      });
    }
  }
  
  public class CommentsListViewBaseAdapter
    extends RecyclerView.Adapter<RecyclerView.ViewHolder>
    implements IAdobeCommentsCellViewDelegate
  {
    public CommentsListViewBaseAdapter(Context paramContext) {}
    
    public void deleteComment(String paramString, int paramInt)
    {
      commentsData.get(paramInt)).isEnabled = false;
      AdobeAssetViewCommentsListViewController.this.handleDeleteComment(paramString);
    }
    
    public Context getActivityContext()
    {
      return ((IAdobeCommentsContainerListViewDelegate)_parentContainer.get()).getHostActivity();
    }
    
    protected int getCommentsCount()
    {
      if (commentsData != null) {
        return commentsData.size();
      }
      return 0;
    }
    
    protected AdobeAssetViewCommentsCellViewData getCommmentsItemData(int paramInt)
    {
      return getCommentsData(paramInt);
    }
    
    public int getItemCount()
    {
      return getCommentsCount();
    }
    
    public RecyclerView.Adapter getRealAdapter()
    {
      return this;
    }
    
    public int getToken()
    {
      return _deleteToken;
    }
    
    public void handleDeleteVisibility(IAdobeCommentsViewDeleteVisibiltyDelegate paramIAdobeCommentsViewDeleteVisibiltyDelegate)
    {
      AdobeAssetViewCommentsListViewController.this.controlDeleteVisibility(paramIAdobeCommentsViewDeleteVisibiltyDelegate);
    }
    
    protected void handlePostCellViewBinding(AdobeAssetViewCommentsCellView paramAdobeAssetViewCommentsCellView, AdobeAssetViewCommentsCellViewData paramAdobeAssetViewCommentsCellViewData, int paramInt)
    {
      loadAndDisplayThumbnail(paramAdobeAssetViewCommentsCellView, paramAdobeAssetViewCommentsCellViewData, paramInt);
    }
    
    protected void invalidateAssetsList() {}
    
    public long isCellSwiping()
    {
      return AdobeAssetViewCommentsListViewController.this.isAnyCellSwiping();
    }
    
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
      AdobeAssetViewCommentsCellViewData localAdobeAssetViewCommentsCellViewData = getCommmentsItemData(paramInt);
      paramViewHolder = (CellViewHolder)paramViewHolder;
      paramViewHolder.getCellView().prepareForReuse();
      AdobeAssetViewCommentsCellView localAdobeAssetViewCommentsCellView;
      if (paramInt == _deleteToken)
      {
        setDeleteVisibiltyDelegate(paramViewHolder.getCellView());
        paramViewHolder.getCellView().setDeleteVisible();
        localAdobeAssetViewCommentsCellView = paramViewHolder.getCellView();
        if ((!isEnabled) || (!isOnline())) {
          break label176;
        }
      }
      label176:
      for (boolean bool = true;; bool = false)
      {
        localAdobeAssetViewCommentsCellView.setIsEnabled(bool);
        paramViewHolder.getCellView().setCommentURL(originalCommentData.getCommentURL());
        paramViewHolder.getCellView().setPosition(paramInt);
        paramViewHolder.getCellView().setCommenterName(originalCommentData.getUserName());
        paramViewHolder.getCellView().setCommentDate(DateUtils.formatDateTime(getActivityContext(), originalCommentData.getTimeStamp(), 131093));
        paramViewHolder.getCellView().setCommentContent(originalCommentData.getComment());
        handlePostCellViewBinding(paramViewHolder.getCellView(), localAdobeAssetViewCommentsCellViewData, paramInt);
        return;
        paramViewHolder.getCellView().setDeleteInvisible();
        break;
      }
    }
    
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup paramViewGroup, int paramInt)
    {
      paramViewGroup = new CellViewHolder(LayoutInflater.from(paramViewGroup.getContext()).inflate(R.layout.adobe_comments_list_view, paramViewGroup, false), this, paramInt);
      paramViewGroup.getCellView().createSwipeListener();
      return paramViewGroup;
    }
    
    public void setCellSwiping(long paramLong)
    {
      AdobeAssetViewCommentsListViewController.this.setAnyCellSwiping(paramLong);
    }
    
    public void setDeleteVisibilityDelegate(IAdobeCommentsViewDeleteVisibiltyDelegate paramIAdobeCommentsViewDeleteVisibiltyDelegate)
    {
      setDeleteVisibiltyDelegate(paramIAdobeCommentsViewDeleteVisibiltyDelegate);
    }
    
    public void setToken(int paramInt)
    {
      AdobeAssetViewCommentsListViewController.access$702(AdobeAssetViewCommentsListViewController.this, paramInt);
    }
    
    private class CellViewHolder
      extends RecyclerView.ViewHolder
    {
      private AdobeAssetViewCommentsCellView mainBaseListCellView = new AdobeAssetViewCommentsCellView();
      
      public CellViewHolder(View paramView, IAdobeCommentsCellViewDelegate paramIAdobeCommentsCellViewDelegate, int paramInt)
      {
        super();
        mainBaseListCellView.setDelegate(paramIAdobeCommentsCellViewDelegate);
        mainBaseListCellView.initializeFromLayout(paramView);
      }
      
      public AdobeAssetViewCommentsCellView getCellView()
      {
        return mainBaseListCellView;
      }
    }
  }
}
