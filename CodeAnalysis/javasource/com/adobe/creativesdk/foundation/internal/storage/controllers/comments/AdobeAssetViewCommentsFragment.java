package com.adobe.creativesdk.foundation.internal.storage.controllers.comments;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudManager;
import com.adobe.creativesdk.foundation.adobeinternal.net.AdobeNetworkReachability;
import com.adobe.creativesdk.foundation.adobeinternal.net.AdobeNetworkReachability.AdobeNetworkStatus;
import com.adobe.creativesdk.foundation.assets.R.color;
import com.adobe.creativesdk.foundation.assets.R.dimen;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.PushNotification.controller.AdobeNotificationManager;
import com.adobe.creativesdk.foundation.internal.comments.AdobeAssetCommentsManager;
import com.adobe.creativesdk.foundation.internal.comments.IAdobeGetCommentsCallback;
import com.adobe.creativesdk.foundation.internal.comments.models.AdobeAssetCommentData;
import com.adobe.creativesdk.foundation.internal.comments.models.AdobeAssetCommentsDataSource;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetMainBrowserConfiguration;
import com.adobe.creativesdk.foundation.internal.utils.AdobeNetworkReachabilityUtil;
import com.adobe.creativesdk.foundation.internal.utils.AdobeUxUtilMainUIThreadHandler;
import com.adobe.creativesdk.foundation.internal.utils.CreativeSDKTextView;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;

public class AdobeAssetViewCommentsFragment
  extends Fragment
  implements IAdobeCommentsContainerListViewDelegate
{
  private View _addCommentsButton;
  private View _commentScreen;
  private CommentSummaryBanner _commentSummaryBanner;
  private CommentUpdateBanner _commentUpdateBanner;
  AdobeAssetCommentsManager _commentsManager;
  private View _commonPopUpBannerView;
  private View _commonPopUpErrorView;
  private View _dataView;
  private Observer _network_reachability_observer;
  private Observer _newCommentInsertedObserver;
  private View _noCommentsScreen;
  private SwipeRefreshLayout _noCommentsSwipeRefresh;
  private ProgressBar _progressBar;
  private AdobeAsset _targetAsset;
  private boolean dataViewLoaded;
  private AdobeAssetViewCommentsListViewController listViewController = new AdobeAssetViewCommentsListViewController();
  private boolean openWithReply = false;
  
  public AdobeAssetViewCommentsFragment() {}
  
  private void createCommentUpdateBar()
  {
    if (_commentUpdateBanner != null) {}
    while (getHostActivity() == null) {
      return;
    }
    RelativeLayout localRelativeLayout = new RelativeLayout(getHostActivity());
    localRelativeLayout.setLayoutParams(new RelativeLayout.LayoutParams(-1, getResources().getDimensionPixelSize(R.dimen.adobe_csdk_theme_actionbar_size)));
    localRelativeLayout.setGravity(17);
    CreativeSDKTextView localCreativeSDKTextView = new CreativeSDKTextView(getHostActivity());
    Object localObject = localCreativeSDKTextView.getLayoutParams();
    if (localObject == null) {
      localObject = new RelativeLayout.LayoutParams(-2, -2);
    }
    for (;;)
    {
      localCreativeSDKTextView.setLayoutParams((ViewGroup.LayoutParams)localObject);
      localCreativeSDKTextView.setTextColor(-1);
      localCreativeSDKTextView.setTextSize(0, getResources().getDimension(R.dimen.assetbrowser_grid_text_size));
      localRelativeLayout.addView(localCreativeSDKTextView);
      _commentUpdateBanner = new CommentUpdateBanner();
      _commentUpdateBanner.bannerTitle = localCreativeSDKTextView;
      _commentUpdateBanner.bannerView = localRelativeLayout;
      _commentUpdateBanner.bannerView.setVisibility(8);
      getMainRootView().addView(_commentUpdateBanner.bannerView);
      return;
      height = -2;
      width = -2;
    }
  }
  
  private void createCommentsOperationSummary()
  {
    if (_commentSummaryBanner != null) {}
    do
    {
      return;
      localObject = getHostActivity();
    } while (localObject == null);
    RelativeLayout localRelativeLayout = new RelativeLayout((Context)localObject);
    localRelativeLayout.setLayoutParams(new RelativeLayout.LayoutParams(-1, getResources().getDimensionPixelSize(R.dimen.adobe_csdk_theme_actionbar_size)));
    localRelativeLayout.setGravity(17);
    CreativeSDKTextView localCreativeSDKTextView = new CreativeSDKTextView(getHostActivity());
    Object localObject = localCreativeSDKTextView.getLayoutParams();
    if (localObject == null) {
      localObject = new RelativeLayout.LayoutParams(-2, -2);
    }
    for (;;)
    {
      localCreativeSDKTextView.setLayoutParams((ViewGroup.LayoutParams)localObject);
      localCreativeSDKTextView.setTextColor(-1);
      localCreativeSDKTextView.setTextSize(0, getResources().getDimension(R.dimen.assetbrowser_grid_text_size));
      localRelativeLayout.addView(localCreativeSDKTextView);
      _commentSummaryBanner = new CommentSummaryBanner();
      _commentSummaryBanner.bannerTitle = localCreativeSDKTextView;
      _commentSummaryBanner.bannerView = localRelativeLayout;
      _commentSummaryBanner.bannerView.setVisibility(8);
      getMainRootView().addView(_commentSummaryBanner.bannerView);
      return;
      height = -2;
      width = -2;
    }
  }
  
  private ViewGroup getMainRootView()
  {
    return (ViewGroup)_dataView;
  }
  
  private void handleAddCommentsClick()
  {
    FragmentTransaction localFragmentTransaction = getFragmentManager().beginTransaction();
    Observer local8 = new Observer()
    {
      public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
      {
        paramAnonymousObject = (HashMap)paramAnonymousObject;
        paramAnonymousObservable = (AdobeAssetViewAddCommentOperationStatus)paramAnonymousObject.get(AdobeAssetViewCommentsKeys.ADOBE_ASSET_VIEW_ADD_COMMENTS_STATUS_KEY);
        paramAnonymousObject = (String)paramAnonymousObject.get(AdobeAssetViewCommentsKeys.ADOBE_ASSET_VIEW_ADD_COMMENTS_URL_KEY);
        if (paramAnonymousObservable == AdobeAssetViewAddCommentOperationStatus.ADOBE_CC_FILES_ADD_COMMENT_OPERATION_STATUS_COMPLETED)
        {
          AdobeAssetViewCommentsFragment.this.refreshListDueToAddComments(paramAnonymousObject);
          return;
        }
        AdobeAssetViewCommentsFragment.this.showCommentInsertionError();
      }
    };
    AdobeAssetViewAddCommentsDialogFragment localAdobeAssetViewAddCommentsDialogFragment = new AdobeAssetViewAddCommentsDialogFragment();
    AdobeCloud localAdobeCloud2 = (AdobeCloud)getArguments().getSerializable(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY);
    AdobeCloud localAdobeCloud1 = localAdobeCloud2;
    if (localAdobeCloud2 != null) {
      localAdobeCloud1 = AdobeCloudManager.getSharedCloudManager().getMatchingCloud(localAdobeCloud2);
    }
    localAdobeAssetViewAddCommentsDialogFragment.setParameters(_targetAsset, localAdobeCloud1, local8);
    localAdobeAssetViewAddCommentsDialogFragment.show(localFragmentTransaction, "Add Comment");
  }
  
  private void hideProgress()
  {
    _dataView.setVisibility(0);
    _progressBar.setVisibility(8);
  }
  
  private void refreshListDueToAddComments(String paramString)
  {
    if (listViewController != null)
    {
      listViewController.setCommentsURLjustPosted(paramString);
      refreshListDueToSwipe();
    }
  }
  
  private void setupListView(View paramView)
  {
    listViewController.setMainRootView(paramView);
    listViewController.setParentContainer(this);
    listViewController.performInitialization(getHostActivity());
  }
  
  private void showCommentDeletionSummarySummaryBar(int paramInt1, int paramInt2)
  {
    createCommentsOperationSummary();
    int i;
    if (_commentSummaryBanner != null)
    {
      if (paramInt1 <= 0) {
        break label111;
      }
      i = 1;
      if (i == 0) {
        break label131;
      }
      _commentSummaryBanner.bannerView.setBackgroundResource(R.color.assetview_common_error_banner_background);
      if (paramInt1 != 1) {
        break label116;
      }
    }
    label111:
    label116:
    for (String str = getResources().getString(R.string.IDS_COMMENT_SINGLE_ERROR_MSG);; str = getResources().getString(R.string.IDS_COMMENT_ERROR_MSG))
    {
      str = String.format(str, new Object[] { Integer.toString(paramInt1) });
      _commentSummaryBanner.bannerTitle.setText(str);
      _commentSummaryBanner.bannerView.setVisibility(0);
      AdobeUxUtilMainUIThreadHandler.getHandler().postDelayed(new Runnable()
      {
        public void run()
        {
          if ((_commentSummaryBanner != null) && (_commentSummaryBanner != null)) {
            _commentSummaryBanner.bannerView.setVisibility(8);
          }
        }
      }, 5000L);
      return;
      i = 0;
      break;
    }
    label131:
    _commentSummaryBanner.bannerView.setBackgroundResource(R.color.assetview_common_success_banner_background);
    if (paramInt2 == 1) {}
    for (str = getResources().getString(R.string.IDS_COMMENT_SINGLE_SUCCESS_MSG);; str = getResources().getString(R.string.IDS_COMMENT_SUCCESS_MSG))
    {
      str = String.format(str, new Object[] { Integer.toString(paramInt2) });
      break;
    }
  }
  
  private void showCommentInsertionError()
  {
    createCommentsOperationSummary();
    if (_commentSummaryBanner != null)
    {
      _commentSummaryBanner.bannerView.setBackgroundResource(R.color.assetview_common_error_banner_background);
      String str = getResources().getString(R.string.IDS_COMMENT_INSERTION_ERROR_MSG);
      _commentSummaryBanner.bannerTitle.setText(str);
      _commentSummaryBanner.bannerView.setVisibility(0);
      AdobeUxUtilMainUIThreadHandler.getHandler().postDelayed(new Runnable()
      {
        public void run()
        {
          if ((_commentSummaryBanner != null) && (_commentSummaryBanner != null)) {
            _commentSummaryBanner.bannerView.setVisibility(8);
          }
        }
      }, 5000L);
    }
  }
  
  private void showCommentsUpdateBar()
  {
    int i;
    if (_targetAsset != null)
    {
      i = AdobeNotificationManager.getAssetCommentCount(_targetAsset.getGUID());
      if (i > 0)
      {
        createCommentUpdateBar();
        if (_commentUpdateBanner != null)
        {
          _commentUpdateBanner.bannerView.setBackgroundResource(R.color.assetview_common_success_banner_background);
          if (i != 1) {
            break label115;
          }
          _commentUpdateBanner.bannerTitle.setText(String.format(getResources().getString(R.string.IDS_COMMENT_UPDATE_MSG_SINGLE), new Object[] { Integer.valueOf(i) }));
        }
      }
    }
    for (;;)
    {
      _commentUpdateBanner.bannerView.setVisibility(0);
      AdobeUxUtilMainUIThreadHandler.getHandler().postDelayed(new Runnable()
      {
        public void run()
        {
          if ((_commentUpdateBanner != null) && (_commentUpdateBanner != null)) {
            _commentUpdateBanner.bannerView.setVisibility(8);
          }
        }
      }, 5000L);
      return;
      label115:
      _commentUpdateBanner.bannerTitle.setText(String.format(getResources().getString(R.string.IDS_COMMENT_UPDATE_MSG), new Object[] { Integer.valueOf(i) }));
    }
  }
  
  private void showErrorScreen()
  {
    if (!dataViewLoaded)
    {
      _commonPopUpErrorView.setVisibility(0);
      _commonPopUpBannerView.setVisibility(8);
      TextView localTextView = (TextView)_commonPopUpErrorView.findViewById(R.id.adobe_common_view_error_message);
      if (localTextView != null) {
        localTextView.setText(R.string.comments_error);
      }
    }
    do
    {
      return;
      _commonPopUpErrorView.setVisibility(8);
      _commonPopUpBannerView.setVisibility(0);
    } while (listViewController == null);
    listViewController.handleNetworkOffline();
  }
  
  private void showProgress()
  {
    _dataView.setVisibility(8);
    _progressBar.setVisibility(0);
  }
  
  private void wentOffline()
  {
    if (!dataViewLoaded)
    {
      _commonPopUpErrorView.setVisibility(0);
      _commonPopUpBannerView.setVisibility(8);
    }
    for (;;)
    {
      _addCommentsButton.setVisibility(8);
      if (listViewController != null) {
        listViewController.handleNetworkOffline();
      }
      return;
      _commonPopUpErrorView.setVisibility(8);
      _commonPopUpBannerView.setVisibility(0);
    }
  }
  
  private void wentOnline()
  {
    _commonPopUpErrorView.setVisibility(8);
    _commonPopUpBannerView.setVisibility(8);
    _addCommentsButton.setVisibility(0);
    refreshListDueToSwipe();
    if (listViewController != null) {
      listViewController.handleNetworkOnline();
    }
  }
  
  public AdobeAssetCommentsManager getCommentsManager()
  {
    if (_commentsManager == null) {
      _commentsManager = new AdobeAssetCommentsManager(_targetAsset);
    }
    return _commentsManager;
  }
  
  public Activity getHostActivity()
  {
    return getActivity();
  }
  
  public boolean handleBackPress()
  {
    return (listViewController != null) && (listViewController.handleBackPress() == true);
  }
  
  public void handleEmptyComments()
  {
    if ((_noCommentsScreen != null) && (_commentScreen != null))
    {
      _noCommentsScreen.setVisibility(0);
      _commentScreen.setVisibility(8);
      _addCommentsButton.setVisibility(0);
    }
  }
  
  public void hideDataViewAndShowProgress()
  {
    _dataView.setVisibility(4);
    _progressBar.setVisibility(0);
  }
  
  public void hideProgressAndShowDataView()
  {
    _dataView.setVisibility(0);
    _progressBar.setVisibility(8);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = paramLayoutInflater.inflate(R.layout.adobe_fragment_asset_browser_comments, paramViewGroup, false);
    _dataView = paramLayoutInflater.findViewById(R.id.comments_data_view);
    _progressBar = ((ProgressBar)paramLayoutInflater.findViewById(R.id.comments_waiting_progress_view));
    _commonPopUpBannerView = paramLayoutInflater.findViewById(R.id.comments_container_no_network_notification_bar);
    _commonPopUpErrorView = paramLayoutInflater.findViewById(R.id.comments_container_no_network);
    _targetAsset = AdobeAssetViewCommentsTargetAssetController.getTargetAsset();
    _commentsManager = new AdobeAssetCommentsManager(_targetAsset);
    _noCommentsScreen = paramLayoutInflater.findViewById(R.id.adobe_no_comments_view);
    _commentScreen = paramLayoutInflater.findViewById(R.id.adobe_asset_comments_container);
    setupListView(paramLayoutInflater);
    _addCommentsButton = paramLayoutInflater.findViewById(R.id.comments_add_button);
    _noCommentsSwipeRefresh = ((SwipeRefreshLayout)paramLayoutInflater.findViewById(R.id.swipe_no_comments_container));
    _noCommentsSwipeRefresh.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener()
    {
      public void onRefresh()
      {
        startRefreshAnimation();
        refreshListDueToSwipe();
        stopRefreshAnimation();
      }
    });
    _addCommentsButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AdobeAssetViewCommentsFragment.this.handleAddCommentsClick();
      }
    });
    refreshListDueToSwipe();
    return paramLayoutInflater;
  }
  
  public void onStart()
  {
    super.onStart();
    registerLocalNofications();
    if (openWithReply)
    {
      openWithReply = false;
      handleAddCommentsClick();
    }
  }
  
  public void onStop()
  {
    super.onStop();
    unRegisterLocalNotifications();
  }
  
  public void refreshListDueToSwipe()
  {
    if ((_commentUpdateBanner != null) && (_commentUpdateBanner.bannerView != null)) {
      _commentUpdateBanner.bannerView.setVisibility(8);
    }
    _addCommentsButton.setVisibility(8);
    dataViewLoaded = false;
    if (!AdobeNetworkReachabilityUtil.getSharedInstance().isOnline())
    {
      wentOffline();
      return;
    }
    showProgress();
    _commentsManager.getComments(new IAdobeGetCommentsCallback()
    {
      public void onError()
      {
        if (!AdobeNetworkReachabilityUtil.getSharedInstance().isOnline())
        {
          AdobeAssetViewCommentsFragment.access$802(AdobeAssetViewCommentsFragment.this, false);
          AdobeAssetViewCommentsFragment.this.wentOffline();
          AdobeAssetViewCommentsFragment.this.hideProgress();
          return;
        }
        AdobeAssetViewCommentsFragment.access$802(AdobeAssetViewCommentsFragment.this, false);
        AdobeAssetViewCommentsFragment.this.hideProgress();
        AdobeAssetViewCommentsFragment.this.showErrorScreen();
      }
      
      public void onSuccess(AdobeAssetCommentsDataSource paramAnonymousAdobeAssetCommentsDataSource)
      {
        _addCommentsButton.setVisibility(0);
        AdobeAssetViewCommentsFragment.access$802(AdobeAssetViewCommentsFragment.this, true);
        AdobeAssetViewCommentsFragment.this.hideProgress();
        ArrayList localArrayList = new ArrayList();
        paramAnonymousAdobeAssetCommentsDataSource = paramAnonymousAdobeAssetCommentsDataSource.getComments();
        if ((paramAnonymousAdobeAssetCommentsDataSource != null) && (paramAnonymousAdobeAssetCommentsDataSource.size() > 0))
        {
          _noCommentsScreen.setVisibility(8);
          _commentScreen.setVisibility(0);
          int i = 0;
          while (i < paramAnonymousAdobeAssetCommentsDataSource.size())
          {
            AdobeAssetViewCommentsCellViewData localAdobeAssetViewCommentsCellViewData = new AdobeAssetViewCommentsCellViewData();
            originalCommentData = ((AdobeAssetCommentData)paramAnonymousAdobeAssetCommentsDataSource.get(i));
            isEnabled = true;
            localArrayList.add(localAdobeAssetViewCommentsCellViewData);
            i += 1;
          }
          listViewController.setCommentsData(localArrayList);
          listViewController.refreshDueToDataChange();
          if (_targetAsset != null) {
            AdobeNotificationManager.getNotificationManager().markNotificationsForAssetsAsRead(_targetAsset.getGUID(), true);
          }
          return;
        }
        handleEmptyComments();
      }
    });
  }
  
  protected void registerLocalNofications()
  {
    if (_network_reachability_observer == null) {
      _network_reachability_observer = new Observer()
      {
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          paramAnonymousObservable = (AdobeNetworkReachability.AdobeNetworkStatus)((AdobeNotification)paramAnonymousObject).getInfo().get("AdobeNetworkReachabilityStatusKey");
          switch (AdobeAssetViewCommentsFragment.10.$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$net$AdobeNetworkReachability$AdobeNetworkStatusCode[networkStatusCode.ordinal()])
          {
          default: 
            AdobeAssetViewCommentsFragment.this.wentOffline();
            return;
          }
          AdobeAssetViewCommentsFragment.this.wentOnline();
        }
      };
    }
    if (_newCommentInsertedObserver == null) {
      _newCommentInsertedObserver = new Observer()
      {
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          paramAnonymousObservable = (String)((AdobeNotification)paramAnonymousObject).getInfo().get("assetURL");
          if ((_targetAsset != null) && (paramAnonymousObservable.equalsIgnoreCase(_targetAsset.getGUID()))) {
            AdobeAssetViewCommentsFragment.this.showCommentsUpdateBar();
          }
        }
      };
    }
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeNetworkStatusChangeNotification, _network_reachability_observer);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeCCFilesNotificationRefreshComment, _newCommentInsertedObserver);
  }
  
  public void setOpenWithReply(boolean paramBoolean)
  {
    openWithReply = paramBoolean;
  }
  
  public void showAddCommentsIcon()
  {
    if (_addCommentsButton != null) {
      _addCommentsButton.setVisibility(0);
    }
  }
  
  public void showCommentDeletionBanner(int paramInt1, int paramInt2)
  {
    showCommentDeletionSummarySummaryBar(paramInt2, paramInt1);
  }
  
  public void startRefreshAnimation()
  {
    _noCommentsSwipeRefresh.setRefreshing(true);
  }
  
  public void stopRefreshAnimation()
  {
    _noCommentsSwipeRefresh.setRefreshing(false);
  }
  
  protected void unRegisterLocalNotifications()
  {
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeNetworkStatusChangeNotification, _network_reachability_observer);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeCCFilesNotificationRefreshComment, _newCommentInsertedObserver);
  }
  
  class CommentSummaryBanner
  {
    public TextView bannerTitle;
    public View bannerView;
    
    CommentSummaryBanner() {}
  }
  
  class CommentUpdateBanner
  {
    public TextView bannerTitle;
    public View bannerView;
    
    CommentUpdateBanner() {}
  }
}
