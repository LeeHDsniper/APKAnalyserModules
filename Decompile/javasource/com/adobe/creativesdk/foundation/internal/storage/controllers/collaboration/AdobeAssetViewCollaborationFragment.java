package com.adobe.creativesdk.foundation.internal.storage.controllers.collaboration;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.adobeinternal.auth.AdobeUXAuthManagerRestricted;
import com.adobe.creativesdk.foundation.adobeinternal.net.AdobeNetworkReachability;
import com.adobe.creativesdk.foundation.adobeinternal.net.AdobeNetworkReachability.AdobeNetworkStatus;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.auth.AdobeAuthUserProfile;
import com.adobe.creativesdk.foundation.internal.collaboration.AdobeAssetFolderCollaboration;
import com.adobe.creativesdk.foundation.internal.collaboration.AdobeCollaborationException;
import com.adobe.creativesdk.foundation.internal.collaboration.IAdobeCollaborationGetCollaborationCallback;
import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeCollaboration;
import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeCollaborationInvite;
import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeCollaborator;
import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeCollaboratorInvitation;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.utils.AdobeNetworkReachabilityUtil;
import com.adobe.creativesdk.foundation.internal.utils.DrawShadowRelativeLayout;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;

public class AdobeAssetViewCollaborationFragment
  extends Fragment
  implements IAdobeCollaborationContainerListViewDelegate
{
  private String ASSET_VIEW_COLLABORATION_FOLDER_HREF_KEY = "ASSET_VIEW_COLLABORATION_FOLDER_HREF";
  private View _addCollaboratorButton;
  private View _commonPopUpBannerView;
  private View _commonPopUpErrorView;
  private View _dataView;
  IAdobeCollaborationFragmentHostActivity _fragmentHostActivity;
  private Observer _network_reachability_observer;
  private ProgressBar _progressBar;
  private DrawShadowRelativeLayout _rootShadowRelativeLayout;
  private AdobeAssetFolder _targetFolder;
  private ArrayList<AdobeCollaboratorInvitation> collaboratorInvitation = new ArrayList();
  private boolean dataViewLoaded;
  private AdobeAssetFolderCollaboration folderCollaboration;
  private AdobeCollaborationListViewController listViewController = new AdobeCollaborationListViewController();
  private boolean shadowVisible = true;
  
  public AdobeAssetViewCollaborationFragment() {}
  
  private AdobeAssetFolder getFolderFromHref(String paramString)
  {
    Object localObject = hrefByRemovingPathExtension(paramString);
    paramString = null;
    try
    {
      localObject = new URI((String)localObject);
      paramString = (String)localObject;
    }
    catch (URISyntaxException localURISyntaxException)
    {
      for (;;)
      {
        localURISyntaxException.printStackTrace();
      }
    }
    return AdobeAssetFolder.getFolderFromHref(paramString);
  }
  
  private void handleAddCollaboratorClick()
  {
    FragmentTransaction localFragmentTransaction = getFragmentManager().beginTransaction();
    Observer local4 = new Observer()
    {
      public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
      {
        paramAnonymousObservable = (AdobeCollaborationInvite)((HashMap)paramAnonymousObject).get("Invite");
        if (paramAnonymousObservable != null)
        {
          addInvitationToList(paramAnonymousObservable);
          return;
        }
        refreshListDueToSwipe();
      }
    };
    AdobeAssetViewCollaborationInviteDialogFragment localAdobeAssetViewCollaborationInviteDialogFragment = new AdobeAssetViewCollaborationInviteDialogFragment();
    localAdobeAssetViewCollaborationInviteDialogFragment.setFolderAndObserver(folderCollaboration.getCollaboratedFolder(), local4);
    localAdobeAssetViewCollaborationInviteDialogFragment.setCollaboratorsList(listViewController.getCollaboratorsList());
    localAdobeAssetViewCollaborationInviteDialogFragment.show(localFragmentTransaction, "Collaborate");
  }
  
  private void hideProgress()
  {
    _dataView.setVisibility(0);
    _progressBar.setVisibility(8);
  }
  
  private String hrefByRemovingPathExtension(String paramString)
  {
    if (paramString.startsWith("/files")) {}
    return paramString.substring(6);
  }
  
  private void setupListView(View paramView)
  {
    listViewController.setMainRootView(paramView);
    listViewController.setParentContainer(this);
    listViewController.setCollaboratorsList(collaboratorInvitation);
    listViewController.performInitialization(getHostActivity());
  }
  
  private void showErrorScreen()
  {
    if (!dataViewLoaded)
    {
      _commonPopUpErrorView.setVisibility(0);
      _commonPopUpBannerView.setVisibility(8);
      TextView localTextView = (TextView)_commonPopUpErrorView.findViewById(R.id.adobe_common_view_error_message);
      if (localTextView != null) {
        localTextView.setText(R.string.collaboration_error);
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
    refreshListDueToSwipe();
    if (listViewController != null) {
      listViewController.handleNetworkOnline();
    }
  }
  
  public void addInvitationToList(AdobeCollaboratorInvitation paramAdobeCollaboratorInvitation)
  {
    listViewController.addInvitation(paramAdobeCollaboratorInvitation);
  }
  
  public void disableDataView()
  {
    if ((_dataView != null) && (_progressBar != null))
    {
      _dataView.setVisibility(8);
      _progressBar.setVisibility(0);
    }
  }
  
  public void enableDataView()
  {
    if ((_dataView != null) && (_progressBar != null))
    {
      _dataView.setVisibility(0);
      _progressBar.setVisibility(8);
    }
  }
  
  public AdobeAssetFolder getCollaboratedFolder()
  {
    if (folderCollaboration == null) {
      return null;
    }
    return folderCollaboration.getCollaboratedFolder();
  }
  
  public Activity getHostActivity()
  {
    return getActivity();
  }
  
  public boolean handleBackPress()
  {
    return (listViewController != null) && (listViewController.handleBackPress() == true);
  }
  
  public void handleSelfDelete()
  {
    if (_fragmentHostActivity != null) {
      _fragmentHostActivity.handleSelfDelete();
    }
  }
  
  public void hideAddCollaboratorIcon()
  {
    if (_addCollaboratorButton != null) {
      _addCollaboratorButton.setVisibility(4);
    }
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = paramLayoutInflater.inflate(R.layout.adobe_fragment_asset_browser_collaboration, paramViewGroup, false);
    _dataView = paramLayoutInflater.findViewById(R.id.collaboration_data_view);
    _progressBar = ((ProgressBar)paramLayoutInflater.findViewById(R.id.collaboration_waiting_progress_view));
    _commonPopUpBannerView = paramLayoutInflater.findViewById(R.id.collaboration_container_no_network_notification_bar);
    _rootShadowRelativeLayout = ((DrawShadowRelativeLayout)paramLayoutInflater.findViewById(R.id.collaboration_root_view));
    _rootShadowRelativeLayout.setShadowTopOffset(0);
    _commonPopUpErrorView = paramLayoutInflater.findViewById(R.id.collaboration_container_no_network);
    _targetFolder = getFolderFromHref(getArguments().getString(ASSET_VIEW_COLLABORATION_FOLDER_HREF_KEY));
    folderCollaboration = new AdobeAssetFolderCollaboration(_targetFolder);
    setupListView(paramLayoutInflater);
    _addCollaboratorButton = paramLayoutInflater.findViewById(R.id.collaborator_add_button);
    _addCollaboratorButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AdobeAssetViewCollaborationFragment.this.handleAddCollaboratorClick();
      }
    });
    refreshListDueToSwipe();
    return paramLayoutInflater;
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    if (paramMenuItem.getItemId() == 16908332) {
      return handleBackPress();
    }
    return false;
  }
  
  public void onStart()
  {
    super.onStart();
    registerLocalNofications();
  }
  
  public void onStop()
  {
    super.onStop();
    unRegisterLocalNotifications();
  }
  
  public void refreshListDueToSwipe()
  {
    _addCollaboratorButton.setVisibility(8);
    dataViewLoaded = false;
    if (!AdobeNetworkReachabilityUtil.getSharedInstance().isOnline())
    {
      wentOffline();
      return;
    }
    showProgress();
    folderCollaboration.getCollaboration(new IAdobeCollaborationGetCollaborationCallback()
    {
      public void onComplete(AdobeCollaboration paramAnonymousAdobeCollaboration)
      {
        AdobeAssetViewCollaborationFragment.access$302(AdobeAssetViewCollaborationFragment.this, true);
        _addCollaboratorButton.setVisibility(0);
        AdobeAssetViewCollaborationFragment.this.hideProgress();
        if ((paramAnonymousAdobeCollaboration == null) || (paramAnonymousAdobeCollaboration.getCollaboratorsAndInvites().size() == 0))
        {
          paramAnonymousAdobeCollaboration = new ArrayList();
          AdobeCollaborator localAdobeCollaborator = new AdobeCollaborator();
          AdobeAuthUserProfile localAdobeAuthUserProfile = AdobeUXAuthManagerRestricted.getSharedAuthManagerRestricted().getUserProfile();
          localAdobeCollaborator.setEmail(localAdobeAuthUserProfile.getEmail());
          localAdobeCollaborator.setName(localAdobeAuthUserProfile.getDisplayName());
          localAdobeCollaborator.setUserId(localAdobeAuthUserProfile.getAdobeID());
          localAdobeCollaborator.setOwner(true);
          paramAnonymousAdobeCollaboration.add(localAdobeCollaborator);
          listViewController.setCollaboratorsList(paramAnonymousAdobeCollaboration);
        }
        for (;;)
        {
          listViewController.refreshDueToDataChange();
          return;
          listViewController.setCollaboratorsList(paramAnonymousAdobeCollaboration.getCollaboratorsAndInvites());
        }
      }
      
      public void onError(AdobeCollaborationException paramAnonymousAdobeCollaborationException)
      {
        if (!AdobeNetworkReachabilityUtil.getSharedInstance().isOnline())
        {
          AdobeAssetViewCollaborationFragment.access$302(AdobeAssetViewCollaborationFragment.this, false);
          AdobeAssetViewCollaborationFragment.this.wentOffline();
          AdobeAssetViewCollaborationFragment.this.hideProgress();
          return;
        }
        AdobeAssetViewCollaborationFragment.access$302(AdobeAssetViewCollaborationFragment.this, false);
        AdobeAssetViewCollaborationFragment.this.hideProgress();
        AdobeAssetViewCollaborationFragment.this.showErrorScreen();
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
          switch (AdobeAssetViewCollaborationFragment.5.$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$net$AdobeNetworkReachability$AdobeNetworkStatusCode[networkStatusCode.ordinal()])
          {
          default: 
            AdobeAssetViewCollaborationFragment.this.wentOffline();
            return;
          }
          AdobeAssetViewCollaborationFragment.this.wentOnline();
        }
      };
    }
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeNetworkStatusChangeNotification, _network_reachability_observer);
  }
  
  public void setFragmentHostActivity(IAdobeCollaborationFragmentHostActivity paramIAdobeCollaborationFragmentHostActivity)
  {
    _fragmentHostActivity = paramIAdobeCollaborationFragmentHostActivity;
  }
  
  public void showAddCollaboratorIcon()
  {
    if (_addCollaboratorButton != null) {
      _addCollaboratorButton.setVisibility(0);
    }
  }
  
  protected void unRegisterLocalNotifications()
  {
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeNetworkStatusChangeNotification, _network_reachability_observer);
  }
}
