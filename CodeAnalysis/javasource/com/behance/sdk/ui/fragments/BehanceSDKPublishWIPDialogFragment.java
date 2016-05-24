package com.behance.sdk.ui.fragments;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.content.Intent;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.DisplayMetrics;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnFocusChangeListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ViewFlipper;
import com.adobe.creativesdk.foundation.internal.analytics.AdobeAnalyticsSDKReporter;
import com.behance.sdk.BehanceSDKPublishWIPOptions;
import com.behance.sdk.BehanceSDKSocialAccountManager;
import com.behance.sdk.IBehanceSDKUserCredentials;
import com.behance.sdk.R.anim;
import com.behance.sdk.R.bool;
import com.behance.sdk.R.drawable;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.R.string;
import com.behance.sdk.R.style;
import com.behance.sdk.dto.BehanceSDKPublishWIPServiceParamsDTO;
import com.behance.sdk.dto.BehanceSDKSocialAccountDTO;
import com.behance.sdk.dto.BehanceSDKWIPDTO;
import com.behance.sdk.enums.BehanceSDKSocialAccountType;
import com.behance.sdk.fragments.headless.BehanceSDKPublishWIPHeadlessFragment;
import com.behance.sdk.fragments.headless.BehanceSDKPublishWIPHeadlessFragment.Callbacks;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.managers.AddWIPManager;
import com.behance.sdk.project.modules.ImageModule;
import com.behance.sdk.project.modules.ProjectModuleTypes;
import com.behance.sdk.services.BehanceSDKPublishWIPService;
import com.behance.sdk.ui.activities.BehanceSDKLoginToTwitterActivity;
import com.behance.sdk.ui.adapters.BehanceSDKWIPListAdapter;
import com.behance.sdk.ui.dialogs.BehanceSDKGenericAlertDialog;
import com.behance.sdk.ui.dialogs.BehanceSDKNewWIPTitleDialog;
import com.behance.sdk.ui.dialogs.BehanceSDKNewWIPTitleDialog.Callbacks;
import com.behance.sdk.util.BehanceSDKUtils;
import com.facebook.Session;
import com.facebook.Session.Builder;
import com.facebook.Session.OpenRequest;
import com.facebook.SessionDefaultAudience;
import com.facebook.SessionLoginBehavior;
import com.facebook.SessionState;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class BehanceSDKPublishWIPDialogFragment
  extends DialogFragment
  implements DialogInterface.OnKeyListener, View.OnClickListener, BehanceSDKPublishWIPHeadlessFragment.Callbacks, BehanceSDKNewWIPTitleDialog.Callbacks
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKPublishWIPDialogFragment.class);
  CheckBox adultContentCheckBox;
  private TextWatcher allTextFieldsTextWatcher = new TextWatcher()
  {
    public void afterTextChanged(Editable paramAnonymousEditable)
    {
      BehanceSDKPublishWIPDialogFragment.this.updatePublishBtnState();
    }
    
    public void beforeTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3) {}
    
    public void onTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3) {}
  };
  private Callbacks callbacks;
  private boolean closeThisViewOnResume = false;
  private BehanceSDKSocialAccountDTO facebookAccount;
  private View.OnClickListener facebookLoginConfirmDialogClickListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      if (paramAnonymousView.getId() == R.id.bsdkGenericAlertDialogOKBtn)
      {
        BehanceSDKPublishWIPDialogFragment.this.closeLoginToFacebookConfirmationDialog();
        BehanceSDKPublishWIPDialogFragment.this.LoginToFacebook();
      }
      while (paramAnonymousView.getId() != R.id.bsdkGenericAlertDialogNotOKBtn) {
        return;
      }
      BehanceSDKPublishWIPDialogFragment.this.closeLoginToFacebookConfirmationDialog();
    }
  };
  private BehanceSDKPublishWIPHeadlessFragment headlessFragment;
  private BehanceSDKGenericAlertDialog loginToFacebookConfirmationDialog;
  private BehanceSDKGenericAlertDialog loginToTwitterConfirmationDialog;
  private BehanceSDKNewWIPTitleDialog newWIPTitleDialog;
  private View pickWIPRootContainer;
  private TextView publishWIPBtnTxtView;
  private View publishWIPInfoRootContainer;
  private View publishWipProgressbar;
  private View rootView;
  private int selectedWIPId;
  private ImageModule selectedWIPImageModule;
  private String selectedWIPTitle;
  private TextView selectedWIPTitleTxtView;
  private ImageView shareOnFacebookBtnImageView;
  private ImageView shareOnTwitterBtnImageView;
  private View shareOptionsView;
  private boolean shareWIPOnFacebook;
  private boolean shareWIPOnTwitter;
  private TextView showNewWIPDialogBtnTxtView;
  private View showPickWIPsViewBtn;
  private BehanceSDKSocialAccountManager socialAccountManager;
  private TextView titleBarTitleTextView;
  private BehanceSDKSocialAccountDTO twitterAccount;
  private View.OnClickListener twitterLoginConfirmDialogClickListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      if (paramAnonymousView.getId() == R.id.bsdkGenericAlertDialogOKBtn)
      {
        BehanceSDKPublishWIPDialogFragment.this.closeLoginToTwitterConfirmationDialog();
        BehanceSDKPublishWIPDialogFragment.this.launchTwitterLoginActivity();
      }
      while (paramAnonymousView.getId() != R.id.bsdkGenericAlertDialogNotOKBtn) {
        return;
      }
      BehanceSDKPublishWIPDialogFragment.this.closeLoginToTwitterConfirmationDialog();
    }
  };
  private boolean userEnteredNewWIPTitle;
  private ListView userWIPsListView;
  private ViewFlipper viewFlipper;
  private boolean viewPaused = false;
  private EditText wipDescEditTxt;
  private AddWIPManager wipManager;
  private EditText wipTagsEditTxt;
  private ImageView wipThumbnailImageView;
  private EditText wipTitleEditTxt;
  
  public BehanceSDKPublishWIPDialogFragment() {}
  
  private void LoginToFacebook()
  {
    hideKeyboard();
    Session localSession = new Session.Builder(getActivity()).setApplicationId(facebookAccount.getAccountClientId()).build();
    Session.setActiveSession(localSession);
    localSession.openForPublish(createFacebookSessionRequest());
  }
  
  private boolean allRequiredValuesForPublishAvaiable(String paramString1, String paramString2, String paramString3)
  {
    return (selectedWIPImageModule != null) && ((selectedWIPId > 0) || (!isStringEmpty(paramString2))) && (!isStringEmpty(paramString3));
  }
  
  private void checkFacebookAuthAndEnableSharing()
  {
    if (isFacebookAccountAuthenticatedToPublish())
    {
      shareWIPOnFacebook = true;
      updateShareOnFacebookBtnImage();
      updateFacebookAccountAuthStatus();
      return;
    }
    displayFacebookLoginConfirmationDialog();
  }
  
  private void checkIfUserHasLoggedIntoTwitter()
  {
    String str1 = twitterAccount.getUserAuthToken();
    String str2 = twitterAccount.getAdditionalData();
    if ((str1 == null) || (str1.isEmpty()) || (str2 == null) || (str2.isEmpty()))
    {
      displayTwitterLoginConfirmationDialog();
      return;
    }
    shareWIPOnTwitter = true;
    updateShareOnTwitterBtnImage();
  }
  
  private void closeLoginToFacebookConfirmationDialog()
  {
    if (loginToFacebookConfirmationDialog != null) {
      loginToFacebookConfirmationDialog.dismiss();
    }
  }
  
  private void closeLoginToTwitterConfirmationDialog()
  {
    if (loginToTwitterConfirmationDialog != null) {
      loginToTwitterConfirmationDialog.dismiss();
    }
  }
  
  private void closeThisView()
  {
    closeThisView(true);
  }
  
  private void closeThisView(boolean paramBoolean)
  {
    if (viewPaused)
    {
      closeThisViewOnResume = true;
      return;
    }
    if ((paramBoolean) && (callbacks != null)) {
      rootView.post(new Runnable()
      {
        public void run()
        {
          callbacks.onPublishWIPViewClose();
        }
      });
    }
    dismissAllowingStateLoss();
  }
  
  private Session.OpenRequest createFacebookSessionRequest()
  {
    Session.OpenRequest localOpenRequest = new Session.OpenRequest(this);
    localOpenRequest.setDefaultAudience(SessionDefaultAudience.EVERYONE);
    localOpenRequest.setPermissions(Arrays.asList(new String[] { "publish_actions" }));
    localOpenRequest.setLoginBehavior(SessionLoginBehavior.SSO_WITH_FALLBACK);
    return localOpenRequest;
  }
  
  private void displayFacebookLoginConfirmationDialog()
  {
    loginToFacebookConfirmationDialog = BehanceSDKGenericAlertDialog.getInstance(getActivity(), R.string.bsdk_social_account_facebook_login_confirmation_title, R.string.bsdk_social_account_facebook_login_confirmation_body, R.string.bsdk_social_account_facebook_login_confirmation_ok_btn_label, R.string.bsdk_social_account_facebook_login_confirmation_cancel_btn_label);
    loginToFacebookConfirmationDialog.setOnNotOKBtnClickListener(facebookLoginConfirmDialogClickListener);
    loginToFacebookConfirmationDialog.setOnOKBtnClickListener(facebookLoginConfirmDialogClickListener);
    loginToFacebookConfirmationDialog.show();
  }
  
  private void displayNewWIPTitleDialog()
  {
    newWIPTitleDialog = BehanceSDKNewWIPTitleDialog.getInstance(getActivity(), this);
    newWIPTitleDialog.show();
  }
  
  private void displayPickWIPView(boolean paramBoolean)
  {
    hideKeyboard();
    if (paramBoolean)
    {
      viewFlipper.setInAnimation(getActivity(), R.anim.bsdk_dialog_enter);
      viewFlipper.setOutAnimation(getActivity(), R.anim.bsdk_dialog_exit);
    }
    for (;;)
    {
      publishWIPBtnTxtView.setVisibility(8);
      showNewWIPDialogBtnTxtView.setVisibility(0);
      titleBarTitleTextView.setText(R.string.bsdk_add_wip_pick_wip_view_titlebar_title_select_wip_label);
      viewFlipper.setDisplayedChild(1);
      setUserWIPsListAdapter();
      return;
      viewFlipper.setInAnimation(null);
      viewFlipper.setOutAnimation(null);
    }
  }
  
  private void displayPublishView(boolean paramBoolean)
  {
    if ((selectedWIPImageModule != null) && (wipThumbnailImageView != null))
    {
      if (!paramBoolean) {
        break label140;
      }
      viewFlipper.setInAnimation(getActivity(), R.anim.bsdk_dialog_enter);
      viewFlipper.setOutAnimation(getActivity(), R.anim.bsdk_dialog_exit);
      wipThumbnailImageView.setImageBitmap(selectedWIPImageModule.getThumbNail(getActivity()));
      publishWIPBtnTxtView.setVisibility(0);
      showNewWIPDialogBtnTxtView.setVisibility(8);
      updatePublishBtnState();
      titleBarTitleTextView.setText(R.string.bsdk_wip_publish_view_titlebar_title_publish_label);
      if (!headlessFragment.isGetUserWIPsTaskInProgress()) {
        break label159;
      }
      showPickWIPsViewBtn.setVisibility(0);
      selectedWIPTitleTxtView.setText(R.string.bsdk_wip_publish_view_wips_loading_label);
      wipTitleEditTxt.setVisibility(4);
    }
    for (;;)
    {
      viewFlipper.setDisplayedChild(0);
      return;
      label140:
      viewFlipper.setInAnimation(null);
      viewFlipper.setOutAnimation(null);
      break;
      label159:
      populateSelectedWIPInPublishView();
    }
  }
  
  private void displayTwitterLoginConfirmationDialog()
  {
    loginToTwitterConfirmationDialog = BehanceSDKGenericAlertDialog.getInstance(getActivity(), R.string.bsdk_social_account_twitter_login_confirmation_title, R.string.bsdk_social_account_twitter_login_confirmation_body, R.string.bsdk_social_account_twitter_login_confirmation_ok_btn_label, R.string.bsdk_social_account_twitter_login_confirmation_cancel_btn_label);
    loginToTwitterConfirmationDialog.setOnNotOKBtnClickListener(twitterLoginConfirmDialogClickListener);
    loginToTwitterConfirmationDialog.setOnOKBtnClickListener(twitterLoginConfirmDialogClickListener);
    loginToTwitterConfirmationDialog.show();
  }
  
  private View.OnFocusChangeListener getFocusChangeListerForLayout(final View paramView)
  {
    new View.OnFocusChangeListener()
    {
      public void onFocusChange(View paramAnonymousView, boolean paramAnonymousBoolean)
      {
        if (paramAnonymousBoolean)
        {
          paramView.setActivated(true);
          return;
        }
        paramView.setActivated(false);
      }
    };
  }
  
  public static BehanceSDKPublishWIPDialogFragment getInstance(Callbacks paramCallbacks, BehanceSDKPublishWIPOptions paramBehanceSDKPublishWIPOptions)
  {
    BehanceSDKPublishWIPDialogFragment localBehanceSDKPublishWIPDialogFragment = new BehanceSDKPublishWIPDialogFragment();
    Bundle localBundle = new Bundle();
    localBundle.putSerializable("ARGS_KEY_WIP_IMAGE_MODULE", paramBehanceSDKPublishWIPOptions.getWipRevisionImageModule());
    localBundle.putInt("ARGS_KEY_WIP_ID", paramBehanceSDKPublishWIPOptions.getExistingWIPId());
    localBundle.putString("ARGS_KEY_WIP_DESCRIPTION", paramBehanceSDKPublishWIPOptions.getWipDescription());
    localBundle.putString("ARGS_KEY_WIP_TAGS", paramBehanceSDKPublishWIPOptions.getWipTags());
    localBundle.putString("ARGS_KEY_WIP_TITLE", paramBehanceSDKPublishWIPOptions.getWipTitle());
    localBehanceSDKPublishWIPDialogFragment.setArguments(localBundle);
    localBehanceSDKPublishWIPDialogFragment.setCallbacks(paramCallbacks);
    return localBehanceSDKPublishWIPDialogFragment;
  }
  
  private void handleBackBtnClick()
  {
    hideKeyboard();
    if (viewFlipper.getDisplayedChild() == 1)
    {
      displayPublishView(true);
      return;
    }
    AdobeAnalyticsSDKReporter.trackSharingAction(AdobeAnalyticsSDKReporter.AdobeAnalyticsShareTypePublishUXCancel, AdobeAnalyticsSDKReporter.AdobeAnalyticsShareTargetBehanceWIP);
    if ((selectedWIPImageModule != null) && (selectedWIPImageModule.getType() == ProjectModuleTypes.CREATIVECLOUD_ASSET)) {
      selectedWIPImageModule.deleteFromFileSystem();
    }
    closeThisView();
  }
  
  private void handleEnableShareOnFacebookBtnClick()
  {
    if (facebookAccount != null)
    {
      if (shareWIPOnFacebook)
      {
        shareWIPOnFacebook = false;
        updateShareOnFacebookBtnImage();
      }
    }
    else {
      return;
    }
    checkFacebookAuthAndEnableSharing();
  }
  
  private void handleEnableShareOnTwitterBtnClick()
  {
    if (twitterAccount != null)
    {
      if (!shareWIPOnTwitter) {
        break label24;
      }
      shareWIPOnTwitter = false;
    }
    for (;;)
    {
      updateShareOnTwitterBtnImage();
      return;
      label24:
      checkIfUserHasLoggedIntoTwitter();
    }
  }
  
  private void handleFacebookAuthActivityResult()
  {
    Session localSession;
    if (getActivity() != null)
    {
      localSession = Session.getActiveSession();
      if ((localSession == null) || (!localSession.getState().isOpened())) {
        break label76;
      }
      if (localSession.isPermissionGranted("publish_actions"))
      {
        showMainProgressSpinner();
        headlessFragment.loadFacebookUserId(localSession);
      }
    }
    else
    {
      return;
    }
    Toast.makeText(getActivity(), R.string.bsdk_social_account_fb_auth_permissions_failure, 1).show();
    shareWIPOnFacebook = false;
    updateShareOnFacebookBtnImage();
    updateFacebookAccountAuthStatus();
    return;
    label76:
    if ((localSession != null) && (localSession.getState() == SessionState.CLOSED_LOGIN_FAILED))
    {
      Toast.makeText(getActivity(), R.string.bsdk_social_account_fb_auth_failure, 1).show();
      updateFacebookAccountAuthStatus();
    }
    shareWIPOnFacebook = false;
    updateShareOnFacebookBtnImage();
  }
  
  private void handleShowPickWIPsViewClick()
  {
    if (!headlessFragment.isGetUserWIPsTaskInProgress())
    {
      List localList = headlessFragment.getUserWIPsList();
      if ((localList != null) && (!localList.isEmpty())) {
        displayPickWIPView(true);
      }
    }
    else
    {
      return;
    }
    showPickWIPsViewBtn.setVisibility(8);
    wipTitleEditTxt.setVisibility(0);
  }
  
  private void hideKeyboard()
  {
    if (rootView != null) {
      ((InputMethodManager)getActivity().getSystemService("input_method")).hideSoftInputFromWindow(rootView.getWindowToken(), 0);
    }
  }
  
  private void hideMainProgressSpinner()
  {
    if (publishWipProgressbar != null) {
      publishWipProgressbar.setVisibility(8);
    }
  }
  
  private void invokePublishWIPService()
  {
    Object localObject1 = wipDescEditTxt.getText().toString();
    String str1 = wipTitleEditTxt.getText().toString();
    Object localObject2 = wipTagsEditTxt.getText().toString();
    if (allRequiredValuesForPublishAvaiable((String)localObject1, str1, (String)localObject2))
    {
      int k = 1;
      Object localObject3 = BehanceSDKUtils.cleanUpTagsString((String)localObject2).split(",");
      localObject2 = new StringBuilder();
      int m = localObject3.length;
      int i = 0;
      for (;;)
      {
        j = k;
        if (i >= m) {
          break label139;
        }
        String str2 = localObject3[i].trim();
        if (!BehanceSDKUtils.isTagValidForProjectAndWIP(str2)) {
          break;
        }
        if (((StringBuilder)localObject2).length() > 0) {
          ((StringBuilder)localObject2).append("|");
        }
        ((StringBuilder)localObject2).append(str2);
        i += 1;
      }
      int j = 0;
      label139:
      if (j != 0)
      {
        hideKeyboard();
        showMainProgressSpinner();
        localObject3 = new BehanceSDKPublishWIPServiceParamsDTO();
        ((BehanceSDKPublishWIPServiceParamsDTO)localObject3).setAppClientId(wipManager.getUserCredentials().getClientId());
        ((BehanceSDKPublishWIPServiceParamsDTO)localObject3).setWipDescription((String)localObject1);
        label302:
        boolean bool;
        if (selectedWIPId > 0)
        {
          ((BehanceSDKPublishWIPServiceParamsDTO)localObject3).setWipId(selectedWIPId);
          ((BehanceSDKPublishWIPServiceParamsDTO)localObject3).setWipTitle(selectedWIPTitle);
          ((BehanceSDKPublishWIPServiceParamsDTO)localObject3).setWipTags(((StringBuilder)localObject2).toString());
          ((BehanceSDKPublishWIPServiceParamsDTO)localObject3).setContainsAdultContent(adultContentCheckBox.isChecked());
          ((BehanceSDKPublishWIPServiceParamsDTO)localObject3).setWipImageFile(selectedWIPImageModule);
          ((BehanceSDKPublishWIPServiceParamsDTO)localObject3).setNotificationHandlerActivity(wipManager.getNotificationHandlerActivityClass());
          j = 0;
          if ((shareWIPOnFacebook) && (!isFacebookAccountAuthenticatedToPublish())) {
            shareWIPOnFacebook = false;
          }
          if (!shareWIPOnFacebook) {
            break label588;
          }
          i = j;
          if (!facebookAccount.isSharingEnabledLastTime())
          {
            facebookAccount.setSharingEnabledLastTime(true);
            i = 1;
          }
          if (i != 0) {
            socialAccountManager.updateAccount(facebookAccount);
          }
          j = 0;
          bool = isTwitterAccountAuthenticated();
          i = j;
          if (twitterAccount != null)
          {
            if ((!bool) || (twitterAccount.isUserAuthenticated())) {
              break label622;
            }
            twitterAccount.setUserAuthenticated(true);
            i = 1;
          }
          label360:
          if ((!bool) && (shareWIPOnTwitter)) {
            shareWIPOnTwitter = false;
          }
          if (!shareWIPOnTwitter) {
            break label654;
          }
          j = i;
          if (twitterAccount != null)
          {
            j = i;
            if (!twitterAccount.isSharingEnabledLastTime())
            {
              twitterAccount.setSharingEnabledLastTime(true);
              j = 1;
            }
          }
          label415:
          if (j != 0) {
            socialAccountManager.updateAccount(twitterAccount);
          }
          ((BehanceSDKPublishWIPServiceParamsDTO)localObject3).setShareOnFacebook(shareWIPOnFacebook);
          ((BehanceSDKPublishWIPServiceParamsDTO)localObject3).setShareOnTwitter(shareWIPOnTwitter);
          if (shareWIPOnTwitter)
          {
            ((BehanceSDKPublishWIPServiceParamsDTO)localObject3).setTwitterUserAccessToken(twitterAccount.getUserAuthToken());
            ((BehanceSDKPublishWIPServiceParamsDTO)localObject3).setTwitterUserAccessTokenSecret(twitterAccount.getAdditionalData());
            ((BehanceSDKPublishWIPServiceParamsDTO)localObject3).setTwitterConsumerKey(twitterAccount.getAccountClientId());
            ((BehanceSDKPublishWIPServiceParamsDTO)localObject3).setTwitterConsumerSecret(twitterAccount.getAccountClientSecret());
          }
          localObject1 = new Intent(getActivity(), BehanceSDKPublishWIPService.class);
          ((Intent)localObject1).putExtra("INTENT_EXTRA_PARAMS", (Serializable)localObject3);
          localObject1 = getActivity().startService((Intent)localObject1);
          i = R.string.bsdk_wip_publish_view_publish_service_initialize_error_msg;
          if (localObject1 == null) {
            break label688;
          }
        }
        label588:
        label622:
        label654:
        label688:
        for (i = R.string.bsdk_wip_publish_view_publish_initiated_msg;; i = R.string.bsdk_wip_publish_view_publish_service_initialize_error_msg)
        {
          Toast.makeText(getActivity(), i, 1).show();
          closeThisView();
          return;
          ((BehanceSDKPublishWIPServiceParamsDTO)localObject3).setWipTitle(str1);
          ((BehanceSDKPublishWIPServiceParamsDTO)localObject3).setWipId(0);
          break;
          i = j;
          if (facebookAccount == null) {
            break label302;
          }
          i = j;
          if (!facebookAccount.isSharingEnabledLastTime()) {
            break label302;
          }
          facebookAccount.setSharingEnabledLastTime(false);
          i = 1;
          break label302;
          i = j;
          if (bool) {
            break label360;
          }
          i = j;
          if (!twitterAccount.isUserAuthenticated()) {
            break label360;
          }
          twitterAccount.setUserAuthenticated(false);
          i = 1;
          break label360;
          j = i;
          if (twitterAccount == null) {
            break label415;
          }
          j = i;
          if (!twitterAccount.isSharingEnabledLastTime()) {
            break label415;
          }
          twitterAccount.setSharingEnabledLastTime(false);
          j = 1;
          break label415;
        }
      }
      localObject1 = Toast.makeText(getActivity(), R.string.bsdk_wip_publish_view_publish_invalid_tag_msg, 1);
      ((Toast)localObject1).setGravity(17, 0, 0);
      ((Toast)localObject1).show();
      wipTagsEditTxt.requestFocus();
      return;
    }
    Toast.makeText(getActivity(), R.string.bsdk_wip_publish_view_publish_required_fields_missing_msg, 1).show();
  }
  
  private boolean isFacebookAccountAuthenticatedToPublish()
  {
    Session localSession = Session.getActiveSession();
    if ((localSession != null) && (localSession.isOpened()))
    {
      if (!localSession.isPermissionGranted("publish_actions")) {}
    }
    else {
      do
      {
        return true;
        localSession = new Session.Builder(getActivity()).setApplicationId(facebookAccount.getAccountClientId()).build();
        Session.setActiveSession(localSession);
        if (!localSession.isOpened()) {
          break;
        }
      } while (localSession.isPermissionGranted("publish_actions"));
    }
    do
    {
      do
      {
        return false;
      } while (localSession.getState() != SessionState.CREATED_TOKEN_LOADED);
      localSession.openForPublish(createFacebookSessionRequest());
    } while (!localSession.isPermissionGranted("publish_actions"));
    return true;
  }
  
  private boolean isStringEmpty(String paramString)
  {
    return (paramString == null) || (paramString.trim().length() <= 0);
  }
  
  private boolean isTwitterAccountAuthenticated()
  {
    String str1;
    String str2;
    if (twitterAccount != null)
    {
      str1 = twitterAccount.getUserAuthToken();
      str2 = twitterAccount.getAdditionalData();
    }
    return (str1 != null) && (!str1.isEmpty()) && (str2 != null) && (!str2.isEmpty());
  }
  
  private void launchTwitterLoginActivity()
  {
    startActivityForResult(new Intent(getActivity(), BehanceSDKLoginToTwitterActivity.class), 56789);
    closeLoginToTwitterConfirmationDialog();
  }
  
  private void loadUserWIPs()
  {
    if ((!headlessFragment.isGetUserWIPsTaskInProgress()) && (headlessFragment.getUserWIPsList() == null)) {
      headlessFragment.loadUserWIPsFromServer();
    }
  }
  
  private void onUserWIPsItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    paramAdapterView = paramAdapterView.getItemAtPosition(paramInt);
    if ((paramAdapterView instanceof BehanceSDKWIPDTO))
    {
      paramAdapterView = (BehanceSDKWIPDTO)paramAdapterView;
      selectedWIPId = paramAdapterView.getId();
      selectedWIPTitle = paramAdapterView.getTitle();
      userEnteredNewWIPTitle = false;
      displayPublishView(true);
    }
  }
  
  private void populateSelectedWIPInPublishView()
  {
    if (!userEnteredNewWIPTitle)
    {
      List localList = headlessFragment.getUserWIPsList();
      if ((localList == null) || (localList.isEmpty()))
      {
        showPickWIPsViewBtn.setVisibility(8);
        wipTitleEditTxt.setVisibility(0);
        selectedWIPId = 0;
        return;
      }
      Object localObject2 = null;
      Object localObject1 = localObject2;
      if (selectedWIPId > 0)
      {
        Iterator localIterator = localList.iterator();
        do
        {
          localObject1 = localObject2;
          if (!localIterator.hasNext()) {
            break;
          }
          localObject1 = (BehanceSDKWIPDTO)localIterator.next();
        } while (selectedWIPId != ((BehanceSDKWIPDTO)localObject1).getId());
      }
      localObject2 = localObject1;
      if (localObject1 == null) {
        localObject2 = (BehanceSDKWIPDTO)localList.get(0);
      }
      selectedWIPTitleTxtView.setText(((BehanceSDKWIPDTO)localObject2).getTitle());
      selectedWIPId = ((BehanceSDKWIPDTO)localObject2).getId();
      selectedWIPTitle = ((BehanceSDKWIPDTO)localObject2).getTitle();
      showPickWIPsViewBtn.setVisibility(0);
      wipTitleEditTxt.setVisibility(4);
      return;
    }
    showPickWIPsViewBtn.setVisibility(8);
    wipTitleEditTxt.setVisibility(0);
    selectedWIPId = 0;
  }
  
  private void setContentViewDimensions(View paramView)
  {
    if (!getResources().getBoolean(R.bool.bsdk_show_view_full_screen))
    {
      Object localObject = getResources().getDisplayMetrics();
      int i = widthPixels;
      int j = heightPixels;
      if ((i > 0) && (j > 0))
      {
        i = (int)(i * 0.8F);
        localObject = paramView.getLayoutParams();
        if (localObject != null)
        {
          width = i;
          height = -2;
          paramView.setLayoutParams((ViewGroup.LayoutParams)localObject);
        }
      }
    }
  }
  
  private void setUserWIPsListAdapter()
  {
    BehanceSDKWIPListAdapter localBehanceSDKWIPListAdapter;
    if ((getActivity() != null) && (viewFlipper.getDisplayedChild() == 1))
    {
      Object localObject = headlessFragment.getUserWIPsList();
      if (localObject != null)
      {
        localBehanceSDKWIPListAdapter = (BehanceSDKWIPListAdapter)userWIPsListView.getAdapter();
        if (localBehanceSDKWIPListAdapter != null) {
          break label71;
        }
        localObject = new BehanceSDKWIPListAdapter(getActivity(), (List)localObject, selectedWIPId);
        userWIPsListView.setAdapter((ListAdapter)localObject);
      }
    }
    return;
    label71:
    localBehanceSDKWIPListAdapter.setSelectedWIPId(selectedWIPId);
    localBehanceSDKWIPListAdapter.notifyDataSetChanged();
  }
  
  private void showMainProgressSpinner()
  {
    if (publishWipProgressbar != null) {
      publishWipProgressbar.setVisibility(0);
    }
  }
  
  private void updateFacebookAccountAuthStatus()
  {
    int j = 0;
    boolean bool = isFacebookAccountAuthenticatedToPublish();
    int i;
    if ((bool) && (!facebookAccount.isUserAuthenticated()))
    {
      facebookAccount.setUserAuthenticated(true);
      i = 1;
    }
    for (;;)
    {
      if (i != 0) {
        socialAccountManager.updateAccount(facebookAccount);
      }
      return;
      i = j;
      if (!bool)
      {
        i = j;
        if (facebookAccount.isUserAuthenticated())
        {
          facebookAccount.setUserAuthenticated(false);
          i = 1;
        }
      }
    }
  }
  
  private void updatePublishBtnState()
  {
    if (allRequiredValuesForPublishAvaiable(wipDescEditTxt.getText().toString(), wipTitleEditTxt.getText().toString(), wipTagsEditTxt.getText().toString()))
    {
      publishWIPBtnTxtView.setEnabled(true);
      return;
    }
    publishWIPBtnTxtView.setEnabled(false);
  }
  
  private void updateShareOnFacebookBtnImage()
  {
    if (shareWIPOnFacebook)
    {
      shareOnFacebookBtnImageView.setImageResource(R.drawable.bsdk_icon_addcontent_publish_shareon_facebook_on);
      return;
    }
    shareOnFacebookBtnImageView.setImageResource(R.drawable.bsdk_icon_addcontent_publish_shareon_facebook_off);
  }
  
  private void updateShareOnTwitterBtnImage()
  {
    if (shareWIPOnTwitter)
    {
      shareOnTwitterBtnImageView.setImageResource(R.drawable.bsdk_icon_addcontent_publish_shareon_twitter_on);
      return;
    }
    shareOnTwitterBtnImageView.setImageResource(R.drawable.bsdk_icon_addcontent_publish_shareon_twitter_off);
  }
  
  public void handleTwitterAuthenticationFailure()
  {
    if (getActivity() != null)
    {
      shareWIPOnTwitter = false;
      updateShareOnTwitterBtnImage();
      Toast.makeText(getActivity(), R.string.bsdk_social_account_twitter_login_authentication_failure, 0).show();
    }
  }
  
  public void handleTwitterAuthenticationSuccess()
  {
    if (getActivity() != null)
    {
      shareWIPOnTwitter = true;
      updateShareOnTwitterBtnImage();
      twitterAccount = socialAccountManager.getAccount(BehanceSDKSocialAccountType.TWITTER);
      twitterAccount.setUserAuthenticated(true);
      socialAccountManager.updateAccount(twitterAccount);
    }
  }
  
  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    if (paramInt1 == 56789)
    {
      switch (paramInt2)
      {
      default: 
        return;
      case 0: 
      case 2: 
        handleTwitterAuthenticationFailure();
        return;
      }
      handleTwitterAuthenticationSuccess();
      return;
    }
    Session localSession = Session.getActiveSession();
    if (localSession != null) {
      localSession.onActivityResult(getActivity(), paramInt1, paramInt2, paramIntent);
    }
    handleFacebookAuthActivityResult();
  }
  
  public void onClick(View paramView)
  {
    if (paramView.getId() == R.id.bsdkPublishWipTitlebarBackBtnImageView) {
      handleBackBtnClick();
    }
    do
    {
      return;
      if (paramView.getId() == R.id.bsdkPublishWipTitlebarPublishBtnTxtView)
      {
        paramView = ((ConnectivityManager)getActivity().getSystemService("connectivity")).getActiveNetworkInfo();
        if ((paramView != null) && (paramView.isConnected()))
        {
          invokePublishWIPService();
          return;
        }
        paramView = Toast.makeText(getActivity(), getString(R.string.bsdk_add_wip_view_connection_error_msg), 1);
        paramView.setGravity(17, 0, 0);
        paramView.show();
        return;
      }
      if (paramView.getId() == R.id.bsdkPublishWipTitlebarNewWIPBtnTxtView)
      {
        displayNewWIPTitleDialog();
        return;
      }
      if (paramView.getId() == R.id.bsdkPublishWipPublishViewShowPickWIPsViewBtn)
      {
        handleShowPickWIPsViewClick();
        return;
      }
      if (paramView.getId() == R.id.bsdkPublishWipPublishViewTwitterShareImageView)
      {
        handleEnableShareOnTwitterBtnClick();
        return;
      }
    } while (paramView.getId() != R.id.bsdkPublishWipPublishViewFacebookShareImageView);
    handleEnableShareOnFacebookBtnClick();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setStyle(2, R.style.BsdkPublishWIPToBehanceViewTheme);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    rootView = paramLayoutInflater.inflate(R.layout.bsdk_dialog_fragment_publish_wip_to_behance, paramViewGroup, false);
    paramLayoutInflater = getArguments();
    if (paramLayoutInflater != null) {
      selectedWIPImageModule = ((ImageModule)paramLayoutInflater.getSerializable("ARGS_KEY_WIP_IMAGE_MODULE"));
    }
    socialAccountManager = BehanceSDKSocialAccountManager.getInstance(getActivity());
    twitterAccount = socialAccountManager.getAccount(BehanceSDKSocialAccountType.TWITTER);
    facebookAccount = socialAccountManager.getAccount(BehanceSDKSocialAccountType.FACEBOOK);
    int i = 0;
    userEnteredNewWIPTitle = false;
    shareWIPOnFacebook = false;
    shareWIPOnTwitter = false;
    if (paramBundle != null)
    {
      i = paramBundle.getInt("BUNDLE_KEY_LAST_DISPLAYED_CHILD_INDEX", 0);
      selectedWIPId = paramBundle.getInt("BUNDLE_KEY_SELECTED_WIP_ID", 0);
      selectedWIPTitle = paramBundle.getString("BUNDLE_KEY_SELECTED_WIP_TITLE", null);
      userEnteredNewWIPTitle = paramBundle.getBoolean("BUNDLE_KEY_NEW_WIP_TITLE_ENTERED_BY_USER", false);
      shareWIPOnTwitter = paramBundle.getBoolean("BUNDLE_KEY_SHARE_ON_TWITTER_SELECTED", false);
      shareWIPOnFacebook = paramBundle.getBoolean("BUNDLE_KEY_SHARE_ON_FACEBOOK_SELECTED", false);
      if ((shareWIPOnFacebook) && (!isFacebookAccountAuthenticatedToPublish())) {
        shareWIPOnFacebook = false;
      }
      if ((shareWIPOnTwitter) && (!isTwitterAccountAuthenticated())) {
        shareWIPOnTwitter = false;
      }
      headlessFragment = ((BehanceSDKPublishWIPHeadlessFragment)getActivity().getSupportFragmentManager().findFragmentByTag("PUBLISH_WIP_TO_BEHANCE_FRAGMENT_HEADLESS_FRAGMENT_TAG_ADD_WIP"));
      if (headlessFragment == null)
      {
        headlessFragment = new BehanceSDKPublishWIPHeadlessFragment();
        getActivity().getSupportFragmentManager().beginTransaction().add(headlessFragment, "PUBLISH_WIP_TO_BEHANCE_FRAGMENT_HEADLESS_FRAGMENT_TAG_ADD_WIP").commit();
      }
      headlessFragment.setCallbacks(this);
      loadUserWIPs();
      rootView.findViewById(R.id.bsdkPublishWipTitlebarBackBtnImageView).setOnClickListener(this);
      titleBarTitleTextView = ((TextView)rootView.findViewById(R.id.bsdkPublishWipTitlebarTitleTxtView));
      publishWIPBtnTxtView = ((TextView)rootView.findViewById(R.id.bsdkPublishWipTitlebarPublishBtnTxtView));
      publishWIPBtnTxtView.setOnClickListener(this);
      showNewWIPDialogBtnTxtView = ((TextView)rootView.findViewById(R.id.bsdkPublishWipTitlebarNewWIPBtnTxtView));
      showNewWIPDialogBtnTxtView.setOnClickListener(this);
      viewFlipper = ((ViewFlipper)rootView.findViewById(R.id.bsdkPublishWipViewFlipper));
      publishWIPInfoRootContainer = rootView.findViewById(R.id.bsdkPublishWipPublishViewRootContainer);
      pickWIPRootContainer = rootView.findViewById(R.id.bsdkPublishWipPickWIPRootContainer);
      wipThumbnailImageView = ((ImageView)rootView.findViewById(R.id.bsdkPublishWipPublishViewWIPThumbnailImageView));
      publishWipProgressbar = rootView.findViewById(R.id.bsdkPublishWipPublishViewProgressBar);
      wipTitleEditTxt = ((EditText)rootView.findViewById(R.id.bsdkPublishWipPublishViewWIPNameEditTxt));
      wipTitleEditTxt.addTextChangedListener(allTextFieldsTextWatcher);
      wipDescEditTxt = ((EditText)rootView.findViewById(R.id.bsdkPublishWipPublishViewWIPDescriptionEditTxt));
      wipDescEditTxt.addTextChangedListener(allTextFieldsTextWatcher);
      wipTagsEditTxt = ((EditText)rootView.findViewById(R.id.bsdkPublishWipPublishViewWIPTagsEditTxt));
      wipTagsEditTxt.addTextChangedListener(allTextFieldsTextWatcher);
      selectedWIPTitleTxtView = ((TextView)rootView.findViewById(R.id.bsdkPublishWipPublishViewSelectedWIPNameTxtView));
      showPickWIPsViewBtn = rootView.findViewById(R.id.bsdkPublishWipPublishViewShowPickWIPsViewBtn);
      showPickWIPsViewBtn.setOnClickListener(this);
      adultContentCheckBox = ((CheckBox)rootView.findViewById(R.id.bsdkPublishWIPPublishViewAdultContentCheckbox));
      paramViewGroup = rootView.findViewById(R.id.bsdkPublishWipPublishViewWIPNameContainer);
      wipTitleEditTxt.setOnFocusChangeListener(getFocusChangeListerForLayout(paramViewGroup));
      userWIPsListView = ((ListView)rootView.findViewById(R.id.bsdkPublishWipPickWIPListView));
      userWIPsListView.setOnItemClickListener(new AdapterView.OnItemClickListener()
      {
        public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
        {
          BehanceSDKPublishWIPDialogFragment.this.onUserWIPsItemClick(paramAnonymousAdapterView, paramAnonymousView, paramAnonymousInt, paramAnonymousLong);
        }
      });
      shareOnTwitterBtnImageView = ((ImageView)rootView.findViewById(R.id.bsdkPublishWipPublishViewTwitterShareImageView));
      shareOnTwitterBtnImageView.setOnClickListener(this);
      shareOnFacebookBtnImageView = ((ImageView)rootView.findViewById(R.id.bsdkPublishWipPublishViewFacebookShareImageView));
      shareOnFacebookBtnImageView.setOnClickListener(this);
      wipManager = AddWIPManager.getInstance();
      shareOptionsView = rootView.findViewById(R.id.bsdkPublishWipPublishViewShareOptionsContainer);
      if ((paramLayoutInflater != null) && (paramBundle == null))
      {
        selectedWIPId = paramLayoutInflater.getInt("ARGS_KEY_WIP_ID", 0);
        if (selectedWIPId > 0) {
          break label973;
        }
        paramViewGroup = paramLayoutInflater.getString("ARGS_KEY_WIP_TITLE", null);
        if (!isStringEmpty(paramViewGroup))
        {
          userEnteredNewWIPTitle = true;
          wipTitleEditTxt.setText(paramViewGroup);
        }
        label764:
        wipDescEditTxt.setText(paramLayoutInflater.getString("ARGS_KEY_WIP_DESCRIPTION", ""));
        wipTagsEditTxt.setText(paramLayoutInflater.getString("ARGS_KEY_WIP_TAGS", ""));
      }
      if (wipManager.isHideTwitterSharing()) {
        shareOnTwitterBtnImageView.setVisibility(8);
      }
      if (wipManager.isHideFacebookSharing()) {
        shareOnFacebookBtnImageView.setVisibility(8);
      }
      if ((wipManager.isHideTwitterSharing()) && (wipManager.isHideFacebookSharing())) {
        shareOptionsView.setVisibility(4);
      }
      if (i != 0) {
        break label981;
      }
      if (selectedWIPImageModule != null) {
        displayPublishView(false);
      }
    }
    for (;;)
    {
      setContentViewDimensions(publishWIPInfoRootContainer);
      setContentViewDimensions(pickWIPRootContainer);
      updateShareOnFacebookBtnImage();
      updateShareOnTwitterBtnImage();
      getDialog().setOnKeyListener(this);
      return rootView;
      if (facebookAccount != null) {}
      for (shareWIPOnFacebook = facebookAccount.isSharingEnabledLastTime();; shareWIPOnFacebook = false)
      {
        if (twitterAccount == null) {
          break label965;
        }
        shareWIPOnTwitter = twitterAccount.isSharingEnabledLastTime();
        break;
      }
      label965:
      shareWIPOnTwitter = false;
      break;
      label973:
      userEnteredNewWIPTitle = false;
      break label764;
      label981:
      if (i == 1) {
        displayPickWIPView(false);
      }
    }
  }
  
  public void onDetach()
  {
    super.onDetach();
    if (headlessFragment != null) {
      headlessFragment.setCallbacks(null);
    }
    closeLoginToFacebookConfirmationDialog();
    closeLoginToTwitterConfirmationDialog();
  }
  
  public void onGetFacebookUserIdComplete(String paramString)
  {
    if (getActivity() != null)
    {
      shareWIPOnFacebook = true;
      updateShareOnFacebookBtnImage();
      if (facebookAccount != null)
      {
        facebookAccount.setUserId(paramString);
        updateFacebookAccountAuthStatus();
      }
      hideMainProgressSpinner();
    }
  }
  
  public void onGetUserWIPsFailure(Exception paramException)
  {
    logger.error(paramException, "Problem getting user WIPs", new Object[0]);
    if (getActivity() != null)
    {
      showPickWIPsViewBtn.setVisibility(8);
      wipTitleEditTxt.setVisibility(0);
    }
  }
  
  public void onGetUserWIPsSuccess()
  {
    logger.debug("Retrieved WIPs from server", new Object[0]);
    if (getActivity() != null)
    {
      if (viewFlipper.getDisplayedChild() == 0) {
        populateSelectedWIPInPublishView();
      }
    }
    else {
      return;
    }
    setUserWIPsListAdapter();
  }
  
  public boolean onKey(DialogInterface paramDialogInterface, int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 4) && (paramKeyEvent.getAction() != 0))
    {
      handleBackBtnClick();
      return true;
    }
    return false;
  }
  
  public void onNewWIPTitleDialogOKBtnClicked(String paramString)
  {
    userEnteredNewWIPTitle = true;
    selectedWIPId = 0;
    selectedWIPTitle = null;
    displayPublishView(true);
    showPickWIPsViewBtn.setVisibility(8);
    wipTitleEditTxt.setText(paramString);
    wipTitleEditTxt.setVisibility(0);
  }
  
  public void onPause()
  {
    super.onPause();
    viewPaused = true;
  }
  
  public void onResume()
  {
    super.onResume();
    viewPaused = false;
    if (closeThisViewOnResume)
    {
      closeThisViewOnResume = false;
      closeThisView();
    }
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putInt("BUNDLE_KEY_LAST_DISPLAYED_CHILD_INDEX", viewFlipper.getDisplayedChild());
    paramBundle.putInt("BUNDLE_KEY_SELECTED_WIP_ID", selectedWIPId);
    paramBundle.putString("BUNDLE_KEY_SELECTED_WIP_TITLE", selectedWIPTitle);
    paramBundle.putBoolean("BUNDLE_KEY_NEW_WIP_TITLE_ENTERED_BY_USER", userEnteredNewWIPTitle);
    paramBundle.putBoolean("BUNDLE_KEY_SHARE_ON_TWITTER_SELECTED", shareWIPOnTwitter);
    paramBundle.putBoolean("BUNDLE_KEY_SHARE_ON_FACEBOOK_SELECTED", shareWIPOnFacebook);
  }
  
  public void setCallbacks(Callbacks paramCallbacks)
  {
    callbacks = paramCallbacks;
  }
  
  public static abstract interface Callbacks
  {
    public abstract void onPublishWIPViewClose();
  }
}
