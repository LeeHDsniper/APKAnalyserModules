package com.behance.sdk.ui.fragments;

import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnFocusChangeListener;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import com.behance.sdk.BehanceSDKSocialAccountManager;
import com.behance.sdk.IBehanceSDKUserCredentials;
import com.behance.sdk.R.drawable;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.R.string;
import com.behance.sdk.dto.BehanceSDKCreativeFieldDTO;
import com.behance.sdk.dto.BehanceSDKPublishProjectServiceParamsDTO;
import com.behance.sdk.dto.BehanceSDKSocialAccountDTO;
import com.behance.sdk.enums.BehanceSDKCopyrightOption;
import com.behance.sdk.enums.BehanceSDKSocialAccountType;
import com.behance.sdk.fragments.headless.BehanceSDKPublishProjectHeadlessFragment;
import com.behance.sdk.fragments.headless.BehanceSDKPublishProjectHeadlessFragment.Callbacks;
import com.behance.sdk.managers.BehanceSDKProjectPublishWFManager;
import com.behance.sdk.managers.BehanceSDKProjectPublishWFManager.CoverImageChangeListener;
import com.behance.sdk.project.modules.CoverImage;
import com.behance.sdk.services.BehanceSDKPublishProjectService;
import com.behance.sdk.ui.activities.BehanceSDKLoginToTwitterActivity;
import com.behance.sdk.ui.activities.BehanceSDKPublishProjectActivity;
import com.behance.sdk.ui.dialogs.BehanceSDKGenericAlertDialog;
import com.behance.sdk.util.BehanceSDKUtils;
import com.facebook.Session;
import com.facebook.Session.Builder;
import com.facebook.Session.OpenRequest;
import com.facebook.SessionDefaultAudience;
import com.facebook.SessionLoginBehavior;
import com.facebook.SessionState;
import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

public class BehanceSDKPublishProjectDetailsFragment
  extends BehanceSDKPublishProjectBaseFragment
  implements TextWatcher, BehanceSDKPublishProjectHeadlessFragment.Callbacks, BehanceSDKProjectPublishWFManager.CoverImageChangeListener
{
  private CheckBox adultContentCheckBox;
  private ImageView coverImageView;
  private BehanceSDKSocialAccountDTO facebookAccount;
  private View.OnClickListener facebookLoginConfirmDialogClickListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      if (paramAnonymousView.getId() == R.id.bsdkGenericAlertDialogOKBtn)
      {
        BehanceSDKPublishProjectDetailsFragment.this.closeLoginToFacebookConfirmationDialog();
        BehanceSDKPublishProjectDetailsFragment.this.LoginToFacebook();
      }
      while (paramAnonymousView.getId() != R.id.bsdkGenericAlertDialogNotOKBtn) {
        return;
      }
      BehanceSDKPublishProjectDetailsFragment.this.closeLoginToFacebookConfirmationDialog();
    }
  };
  private BehanceSDKPublishProjectHeadlessFragment headlessFragment;
  private BehanceSDKGenericAlertDialog loginToFacebookConfirmationDialog;
  private BehanceSDKGenericAlertDialog loginToTwitterConfirmationDialog;
  private TextView projectCopyrightsButton;
  private EditText projectDescEditTxt;
  private TextView projectFilterFieldsButton;
  private TextView projectNameTxtView;
  private EditText projectTagsEditTxt;
  private View publishProjectProgressbar;
  private BehanceSDKCopyrightOption selectedCopyRight;
  private List<BehanceSDKCreativeFieldDTO> selectedField;
  private boolean shareOnFacebook = false;
  private ImageView shareOnFacebookBtnImageView;
  private boolean shareOnTwitter = false;
  private ImageView shareOnTwitterBtnImageView;
  private BehanceSDKSocialAccountManager socialAccountManager;
  private BehanceSDKSocialAccountDTO twitterAccount;
  private View.OnClickListener twitterLoginConfirmDialogClickListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      if (paramAnonymousView.getId() == R.id.bsdkGenericAlertDialogOKBtn)
      {
        BehanceSDKPublishProjectDetailsFragment.this.closeLoginToTwitterConfirmationDialog();
        BehanceSDKPublishProjectDetailsFragment.this.launchTwitterLoginActivity();
      }
      while (paramAnonymousView.getId() != R.id.bsdkGenericAlertDialogNotOKBtn) {
        return;
      }
      BehanceSDKPublishProjectDetailsFragment.this.closeLoginToTwitterConfirmationDialog();
    }
  };
  private BehanceSDKProjectPublishWFManager workflowManager = BehanceSDKProjectPublishWFManager.getInstance();
  
  public BehanceSDKPublishProjectDetailsFragment() {}
  
  private void LoginToFacebook()
  {
    hideSoftKeyBoardIfActive(rootView);
    Session localSession = new Session.Builder(getActivity()).setApplicationId(facebookAccount.getAccountClientId()).build();
    Session.setActiveSession(localSession);
    localSession.openForPublish(createFacebookSessionRequest());
  }
  
  private void checkFacebookAuthAndEnableSharing()
  {
    if (isFacebookAccountAuthenticatedToPublish())
    {
      shareOnFacebook = true;
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
    shareOnTwitter = true;
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
  
  private void displayTwitterLoginConfirmationDialog()
  {
    loginToTwitterConfirmationDialog = BehanceSDKGenericAlertDialog.getInstance(getActivity(), R.string.bsdk_social_account_twitter_login_confirmation_title, R.string.bsdk_social_account_twitter_login_confirmation_body, R.string.bsdk_social_account_twitter_login_confirmation_ok_btn_label, R.string.bsdk_social_account_twitter_login_confirmation_cancel_btn_label);
    loginToTwitterConfirmationDialog.setOnNotOKBtnClickListener(twitterLoginConfirmDialogClickListener);
    loginToTwitterConfirmationDialog.setOnOKBtnClickListener(twitterLoginConfirmDialogClickListener);
    loginToTwitterConfirmationDialog.show();
  }
  
  private void enableOrDisablePublishButton()
  {
    String str1 = getProjectTitle();
    String str2 = getProjectDesc();
    List localList = getProjectFields();
    String str3 = getProjectTagString();
    if ((TextUtils.isEmpty(str1)) || (TextUtils.isEmpty(str2)) || (localList == null) || (localList.isEmpty()) || (TextUtils.isEmpty(str3)))
    {
      disableActionBarRightNav();
      return;
    }
    enableActionBarRightNav();
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
  
  private String getProjectDesc()
  {
    return projectDescEditTxt.getText().toString();
  }
  
  private List<BehanceSDKCreativeFieldDTO> getProjectFields()
  {
    return selectedField;
  }
  
  private String getProjectTagString()
  {
    return projectTagsEditTxt.getText().toString();
  }
  
  private String getProjectTitle()
  {
    return projectNameTxtView.getText().toString();
  }
  
  private void handleEnableShareOnFacebookBtnClick()
  {
    if (facebookAccount != null)
    {
      if (shareOnFacebook)
      {
        shareOnFacebook = false;
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
      if (!shareOnTwitter) {
        break label24;
      }
      shareOnTwitter = false;
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
        break label75;
      }
      if (localSession.isPermissionGranted("publish_actions"))
      {
        showProgressBar();
        headlessFragment.loadFacebookUserId(localSession);
      }
    }
    else
    {
      return;
    }
    Toast.makeText(getActivity(), R.string.bsdk_social_account_fb_auth_permissions_failure, 1).show();
    shareOnFacebook = false;
    updateShareOnFacebookBtnImage();
    updateFacebookAccountAuthStatus();
    return;
    label75:
    if ((localSession != null) && (localSession.getState() == SessionState.CLOSED_LOGIN_FAILED))
    {
      Toast.makeText(getActivity(), R.string.bsdk_social_account_fb_auth_failure, 1).show();
      updateFacebookAccountAuthStatus();
    }
    shareOnFacebook = false;
    updateShareOnFacebookBtnImage();
  }
  
  private void hideProgressBar()
  {
    if (publishProjectProgressbar != null) {
      publishProjectProgressbar.setVisibility(8);
    }
  }
  
  private void invokePublishProjectService()
  {
    populateProjectDetails();
    int k = 1;
    Object localObject2 = BehanceSDKUtils.cleanUpTagsString(getProjectTagString()).split(",");
    Object localObject1 = new StringBuilder();
    int m = localObject2.length;
    int i = 0;
    Object localObject3;
    for (;;)
    {
      j = k;
      if (i >= m) {
        break label96;
      }
      localObject3 = localObject2[i].trim();
      if (!BehanceSDKUtils.isTagValidForProjectAndWIP((String)localObject3)) {
        break;
      }
      if (((StringBuilder)localObject1).length() > 0) {
        ((StringBuilder)localObject1).append("|");
      }
      ((StringBuilder)localObject1).append((String)localObject3);
      i += 1;
    }
    int j = 0;
    label96:
    if (j != 0)
    {
      hideSoftKeyBoardIfActive(rootView);
      showProgressBar();
      setEnabledInfoScreen(false);
      localObject2 = new BehanceSDKPublishProjectServiceParamsDTO();
      ((BehanceSDKPublishProjectServiceParamsDTO)localObject2).setAppClientId(workflowManager.getUserCredentials().getClientId());
      ((BehanceSDKPublishProjectServiceParamsDTO)localObject2).setNotificationHandlerActivity(workflowManager.getNotificationHandlerActivityClass());
      ((BehanceSDKPublishProjectServiceParamsDTO)localObject2).setProjectContainsAdultContent(workflowManager.isProjectContainsAdultContent());
      ((BehanceSDKPublishProjectServiceParamsDTO)localObject2).setProjectCopyright(workflowManager.getCopyrightOption().getValue());
      localObject3 = workflowManager.getSelectedCoverImage();
      ((BehanceSDKPublishProjectServiceParamsDTO)localObject2).setProjectCoverImageByteArray(((CoverImage)localObject3).getByteArray());
      ((BehanceSDKPublishProjectServiceParamsDTO)localObject2).setProjectCoverImageFileName(((CoverImage)localObject3).getName());
      ((BehanceSDKPublishProjectServiceParamsDTO)localObject2).setProjectCreativeFields(BehanceSDKUtils.getCreativeFieldsString(workflowManager.getProjectFields(), "|"));
      ((BehanceSDKPublishProjectServiceParamsDTO)localObject2).setProjectDescription(workflowManager.getProjectDescription());
      ((BehanceSDKPublishProjectServiceParamsDTO)localObject2).setProjectModules(workflowManager.getProjectModules());
      ((BehanceSDKPublishProjectServiceParamsDTO)localObject2).setProjectTags(((StringBuilder)localObject1).toString());
      ((BehanceSDKPublishProjectServiceParamsDTO)localObject2).setProjectTitle(workflowManager.getProjectTitle());
      j = 0;
      if ((shareOnFacebook) && (!isFacebookAccountAuthenticatedToPublish())) {
        shareOnFacebook = false;
      }
      boolean bool;
      if (shareOnFacebook)
      {
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
            break label634;
          }
          twitterAccount.setUserAuthenticated(true);
          i = 1;
        }
        label383:
        if ((!bool) && (shareOnTwitter)) {
          shareOnTwitter = false;
        }
        if (!shareOnTwitter) {
          break label666;
        }
        j = i;
        if (!twitterAccount.isSharingEnabledLastTime())
        {
          twitterAccount.setSharingEnabledLastTime(true);
          j = 1;
        }
        label429:
        if (j != 0) {
          socialAccountManager.updateAccount(twitterAccount);
        }
        ((BehanceSDKPublishProjectServiceParamsDTO)localObject2).setShareOnFacebook(shareOnFacebook);
        ((BehanceSDKPublishProjectServiceParamsDTO)localObject2).setShareOnTwitter(shareOnTwitter);
        if (shareOnTwitter)
        {
          ((BehanceSDKPublishProjectServiceParamsDTO)localObject2).setTwitterUserAccessToken(twitterAccount.getUserAuthToken());
          ((BehanceSDKPublishProjectServiceParamsDTO)localObject2).setTwitterUserAccessTokenSecret(twitterAccount.getAdditionalData());
          ((BehanceSDKPublishProjectServiceParamsDTO)localObject2).setTwitterConsumerKey(twitterAccount.getAccountClientId());
          ((BehanceSDKPublishProjectServiceParamsDTO)localObject2).setTwitterConsumerSecret(twitterAccount.getAccountClientSecret());
        }
        localObject1 = new Intent(getActivity(), BehanceSDKPublishProjectService.class);
        ((Intent)localObject1).putExtra("INTENT_EXTRA_PARAMS", (Serializable)localObject2);
        localObject1 = getActivity().startService((Intent)localObject1);
        i = R.string.bsdk_add_content_project_publish_service_initialize_error_msg;
        if (localObject1 == null) {
          break label700;
        }
      }
      label634:
      label666:
      label700:
      for (i = R.string.bsdk_add_content_project_publish_initiated_msg;; i = R.string.bsdk_add_content_project_publish_service_initialize_error_msg)
      {
        Toast.makeText(getActivity(), i, 1).show();
        workflowManager.finishWorkflow();
        ((BehanceSDKPublishProjectActivity)getActivity()).closeThisActivity(true);
        return;
        i = j;
        if (facebookAccount == null) {
          break;
        }
        i = j;
        if (!facebookAccount.isSharingEnabledLastTime()) {
          break;
        }
        facebookAccount.setSharingEnabledLastTime(false);
        i = 1;
        break;
        i = j;
        if (bool) {
          break label383;
        }
        i = j;
        if (!twitterAccount.isUserAuthenticated()) {
          break label383;
        }
        twitterAccount.setUserAuthenticated(false);
        i = 1;
        break label383;
        j = i;
        if (twitterAccount == null) {
          break label429;
        }
        j = i;
        if (!twitterAccount.isSharingEnabledLastTime()) {
          break label429;
        }
        twitterAccount.setSharingEnabledLastTime(false);
        j = 1;
        break label429;
      }
    }
    localObject1 = Toast.makeText(getActivity(), R.string.bsdk_add_content_project_publish_invalid_tag_msg, 1);
    ((Toast)localObject1).setGravity(17, 0, 0);
    ((Toast)localObject1).show();
    projectTagsEditTxt.requestFocus();
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
    startActivityForResult(new Intent(getActivity(), BehanceSDKLoginToTwitterActivity.class), 56790);
    closeLoginToTwitterConfirmationDialog();
  }
  
  private void loadCoverImage(CoverImage paramCoverImage)
  {
    if (paramCoverImage != null) {
      coverImageView.setImageBitmap(paramCoverImage.getBitMap());
    }
  }
  
  private void populateProjectDetails()
  {
    workflowManager.setProjectTitle(getProjectTitle());
    workflowManager.setProjectTags(getProjectTagString());
    workflowManager.setProjectFields(getProjectFields());
    workflowManager.setProjectDescription(getProjectDesc());
    workflowManager.setCopyrightOption(selectedCopyRight);
    workflowManager.setShareOnFaceBook(shareOnFacebook);
    workflowManager.setShareOnTwitter(shareOnTwitter);
    workflowManager.setContainsAdultContent(adultContentCheckBox.isChecked());
  }
  
  private void setEnabledInfoScreen(boolean paramBoolean)
  {
    projectNameTxtView.setEnabled(paramBoolean);
    projectDescEditTxt.setEnabled(paramBoolean);
    projectFilterFieldsButton.setEnabled(paramBoolean);
    projectTagsEditTxt.setEnabled(paramBoolean);
    projectCopyrightsButton.setEnabled(paramBoolean);
    adultContentCheckBox.setEnabled(paramBoolean);
    shareOnFacebookBtnImageView.setEnabled(paramBoolean);
    shareOnTwitterBtnImageView.setEnabled(paramBoolean);
    if (paramBoolean)
    {
      enableActionBarRightNav();
      return;
    }
    disableActionBarRightNav();
  }
  
  private void setSelectedCreativeFieldsText()
  {
    String str = BehanceSDKUtils.getCreativeFieldsString(selectedField, ",");
    if (!TextUtils.isEmpty(str)) {
      projectFilterFieldsButton.setText(str);
    }
  }
  
  private void showProgressBar()
  {
    if (publishProjectProgressbar != null) {
      publishProjectProgressbar.setVisibility(0);
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
  
  private void updateProjectDetailsInUI()
  {
    String str = workflowManager.getProjectTitle();
    if (!TextUtils.isEmpty(str)) {
      projectNameTxtView.setText(str);
    }
    str = workflowManager.getProjectDescription();
    if (!TextUtils.isEmpty(str)) {
      projectDescEditTxt.setText(str);
    }
    selectedField = workflowManager.getProjectFields();
    if ((selectedField != null) && (!selectedField.isEmpty())) {
      setSelectedCreativeFieldsText();
    }
    str = workflowManager.getProjectTags();
    if (!TextUtils.isEmpty(str)) {
      projectTagsEditTxt.setText(str);
    }
    selectedCopyRight = workflowManager.getCopyrightOption();
    projectCopyrightsButton.setText(selectedCopyRight.getDescription(getActivity()));
    adultContentCheckBox.setChecked(workflowManager.isProjectContainsAdultContent());
    updateShareOnFacebookBtnImage();
    updateShareOnTwitterBtnImage();
  }
  
  private void updateShareOnFacebookBtnImage()
  {
    if (shareOnFacebook)
    {
      shareOnFacebookBtnImageView.setImageResource(R.drawable.bsdk_icon_addcontent_publish_shareon_facebook_on);
      return;
    }
    shareOnFacebookBtnImageView.setImageResource(R.drawable.bsdk_icon_addcontent_publish_shareon_facebook_off);
  }
  
  private void updateShareOnTwitterBtnImage()
  {
    if (shareOnTwitter)
    {
      shareOnTwitterBtnImageView.setImageResource(R.drawable.bsdk_icon_addcontent_publish_shareon_twitter_on);
      return;
    }
    shareOnTwitterBtnImageView.setImageResource(R.drawable.bsdk_icon_addcontent_publish_shareon_twitter_off);
  }
  
  public void afterTextChanged(Editable paramEditable)
  {
    enableOrDisablePublishButton();
  }
  
  protected void backButtonPressed()
  {
    populateProjectDetails();
    hideSoftKeyBoardIfActive(rootView);
    super.backButtonPressed();
  }
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void coverImageChanges(CoverImage paramCoverImage)
  {
    loadCoverImage(paramCoverImage);
  }
  
  protected int getBackButtonID()
  {
    return R.id.bsdkPublishProjectPublishFragmentTitlebarBackBtnLayout;
  }
  
  protected int getForwardButtonID()
  {
    return R.id.bsdkPublishProjectPublishFragmentTitlebarActionBtnTxtView;
  }
  
  protected int getForwardButtonText()
  {
    return R.string.bsdk_add_content_project_publish_right_navigation;
  }
  
  protected int getLayout()
  {
    return R.layout.bsdk_dialog_fragment_publish_project_details;
  }
  
  protected int getTitle()
  {
    return R.string.bsdk_add_content_project_publish_title;
  }
  
  protected int getTitleViewID()
  {
    return R.id.bsdkPublishProjectPublishFragmentTitlebarTitleTxtView;
  }
  
  public void handleTwitterAuthenticationFailure()
  {
    if (getActivity() != null)
    {
      shareOnTwitter = false;
      updateShareOnTwitterBtnImage();
      Toast.makeText(getActivity(), R.string.bsdk_social_account_twitter_login_authentication_failure, 0).show();
    }
  }
  
  public void handleTwitterAuthenticationSuccess()
  {
    if (getActivity() != null)
    {
      shareOnTwitter = true;
      updateShareOnTwitterBtnImage();
      twitterAccount = socialAccountManager.getAccount(BehanceSDKSocialAccountType.TWITTER);
      twitterAccount.setUserAuthenticated(true);
      socialAccountManager.updateAccount(twitterAccount);
    }
  }
  
  protected void nextButtonPressed()
  {
    Object localObject = ((ConnectivityManager)getActivity().getSystemService("connectivity")).getActiveNetworkInfo();
    if ((localObject != null) && (((NetworkInfo)localObject).isConnected()))
    {
      invokePublishProjectService();
      return;
    }
    localObject = Toast.makeText(getActivity(), getString(R.string.bsdk_connection_error_msg), 1);
    ((Toast)localObject).setGravity(17, 0, 0);
    ((Toast)localObject).show();
  }
  
  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    if (paramInt1 == 56790)
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
  
  public void onCopyrightSettingSelected(BehanceSDKCopyrightOption paramBehanceSDKCopyrightOption)
  {
    if (paramBehanceSDKCopyrightOption != null) {
      selectedCopyRight = paramBehanceSDKCopyrightOption;
    }
    projectCopyrightsButton.setText(selectedCopyRight.getDescription(getActivity()));
    enableOrDisablePublishButton();
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    super.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
    disableActionBarRightNav();
    socialAccountManager = BehanceSDKSocialAccountManager.getInstance(getActivity());
    twitterAccount = socialAccountManager.getAccount(BehanceSDKSocialAccountType.TWITTER);
    facebookAccount = socialAccountManager.getAccount(BehanceSDKSocialAccountType.FACEBOOK);
    paramLayoutInflater = getActivity().getSupportFragmentManager();
    headlessFragment = ((BehanceSDKPublishProjectHeadlessFragment)paramLayoutInflater.findFragmentByTag("HEADLESS_FRAGMENT_TAG_PUBLISH_PROJECT"));
    if (headlessFragment == null)
    {
      headlessFragment = new BehanceSDKPublishProjectHeadlessFragment();
      getActivity().getSupportFragmentManager().beginTransaction().add(headlessFragment, "HEADLESS_FRAGMENT_TAG_PUBLISH_PROJECT").commit();
    }
    headlessFragment.setCallbacks(this);
    paramViewGroup = paramLayoutInflater.findFragmentByTag("FRAGMENT_TAG_CREATIVE_FIELDS_FILTER_DIALOG");
    if ((paramViewGroup instanceof BehanceSDKCreativeFieldsFilterDialog)) {
      ((BehanceSDKCreativeFieldsFilterDialog)paramViewGroup).setCallbacks(headlessFragment);
    }
    paramLayoutInflater = paramLayoutInflater.findFragmentByTag("FRAGMENT_TAG_COPYRIGHT_SETTINGS_DIALOG");
    if ((paramLayoutInflater instanceof BehanceSDKCopyrightSettingsDialog)) {
      ((BehanceSDKCopyrightSettingsDialog)paramLayoutInflater).setCallbacks(headlessFragment);
    }
    coverImageView = ((ImageView)rootView.findViewById(R.id.bsdkPublishProjectPublishFragmentCoverImage));
    loadCoverImage(workflowManager.getSelectedCoverImage());
    paramLayoutInflater = rootView.findViewById(R.id.bsdkPublishProjectPublishFragmentProjectNameLayout);
    projectNameTxtView = ((TextView)rootView.findViewById(R.id.bsdkPublishProjectPublishFragmentProjectName));
    projectNameTxtView.addTextChangedListener(this);
    projectNameTxtView.setOnFocusChangeListener(getFocusChangeListerForLayout(paramLayoutInflater));
    projectDescEditTxt = ((EditText)rootView.findViewById(R.id.bsdkPublishProjectPublishFragmentProjectDescription));
    projectDescEditTxt.addTextChangedListener(this);
    projectFilterFieldsButton = ((TextView)rootView.findViewById(R.id.bsdkPublishProjectPublishFragmentCreativeFields));
    projectFilterFieldsButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        paramAnonymousView = getActivity();
        if ((paramAnonymousView instanceof FragmentActivity))
        {
          paramAnonymousView = ((FragmentActivity)paramAnonymousView).getSupportFragmentManager();
          BehanceSDKCreativeFieldsFilterDialog localBehanceSDKCreativeFieldsFilterDialog = new BehanceSDKCreativeFieldsFilterDialog();
          localBehanceSDKCreativeFieldsFilterDialog.setSelectableFieldCount(3);
          localBehanceSDKCreativeFieldsFilterDialog.setSelectedCreativeField(selectedField);
          localBehanceSDKCreativeFieldsFilterDialog.setCallbacks(headlessFragment);
          localBehanceSDKCreativeFieldsFilterDialog.show(paramAnonymousView, "FRAGMENT_TAG_CREATIVE_FIELDS_FILTER_DIALOG");
        }
      }
    });
    projectTagsEditTxt = ((EditText)rootView.findViewById(R.id.bsdkPublishProjectPublishFragmentTags));
    projectTagsEditTxt.addTextChangedListener(this);
    projectCopyrightsButton = ((TextView)rootView.findViewById(R.id.bsdkPublishProjectPublishFragmentCopyrightSettings));
    projectCopyrightsButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        paramAnonymousView = getActivity();
        if ((paramAnonymousView instanceof FragmentActivity))
        {
          paramAnonymousView = ((FragmentActivity)paramAnonymousView).getSupportFragmentManager();
          BehanceSDKCopyrightSettingsDialog localBehanceSDKCopyrightSettingsDialog = new BehanceSDKCopyrightSettingsDialog();
          localBehanceSDKCopyrightSettingsDialog.setSelectedCopyright(selectedCopyRight);
          localBehanceSDKCopyrightSettingsDialog.setCallbacks(headlessFragment);
          localBehanceSDKCopyrightSettingsDialog.show(paramAnonymousView, "FRAGMENT_TAG_COPYRIGHT_SETTINGS_DIALOG");
        }
      }
    });
    adultContentCheckBox = ((CheckBox)rootView.findViewById(R.id.bsdkPublishProjectPublishFragmentAdultContentCheckbox));
    publishProjectProgressbar = rootView.findViewById(R.id.projectPublishProgressBar);
    shareOnTwitterBtnImageView = ((ImageView)rootView.findViewById(R.id.bsdkPublishProjectPublishFragmentTwitterIcon));
    if (workflowManager.isHideTwitterSharing()) {
      shareOnTwitterBtnImageView.setVisibility(8);
    }
    shareOnTwitterBtnImageView.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        BehanceSDKPublishProjectDetailsFragment.this.handleEnableShareOnTwitterBtnClick();
      }
    });
    shareOnFacebookBtnImageView = ((ImageView)rootView.findViewById(R.id.bsdkPublishProjectPublishFragmentFacebookIcon));
    if (workflowManager.isHideFacebookSharing()) {
      shareOnFacebookBtnImageView.setVisibility(8);
    }
    shareOnFacebookBtnImageView.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        BehanceSDKPublishProjectDetailsFragment.this.handleEnableShareOnFacebookBtnClick();
      }
    });
    if ((workflowManager.isHideFacebookSharing()) && (workflowManager.isHideTwitterSharing())) {
      rootView.findViewById(R.id.bsdkPublishProjectPublishFragmentShareOnLayout).setVisibility(8);
    }
    if (paramBundle == null) {
      if (facebookAccount != null)
      {
        shareOnFacebook = facebookAccount.isSharingEnabledLastTime();
        if (twitterAccount == null) {
          break label645;
        }
        shareOnTwitter = twitterAccount.isSharingEnabledLastTime();
      }
    }
    for (;;)
    {
      if ((shareOnFacebook) && (!isFacebookAccountAuthenticatedToPublish())) {
        shareOnFacebook = false;
      }
      if ((shareOnTwitter) && (!isTwitterAccountAuthenticated())) {
        shareOnTwitter = false;
      }
      updateProjectDetailsInUI();
      BehanceSDKUtils.setContentViewDimensions(getActivity(), rootView.findViewById(R.id.bsdkPublishProjectPublishFragmentLayout));
      return rootView;
      shareOnFacebook = false;
      break;
      label645:
      shareOnTwitter = false;
      continue;
      shareOnFacebook = workflowManager.getShareOnFaceBook();
      shareOnTwitter = workflowManager.getShareOnTwitter();
    }
  }
  
  public void onCreativeFieldsSelected(List<BehanceSDKCreativeFieldDTO> paramList)
  {
    selectedField = paramList;
    setSelectedCreativeFieldsText();
    enableOrDisablePublishButton();
  }
  
  public void onDetach()
  {
    super.onDetach();
    if (headlessFragment != null) {
      headlessFragment.setCallbacks(null);
    }
    closeLoginToTwitterConfirmationDialog();
    closeLoginToFacebookConfirmationDialog();
  }
  
  public void onGetFacebookUserIdComplete(String paramString)
  {
    if (getActivity() != null)
    {
      shareOnFacebook = true;
      updateShareOnFacebookBtnImage();
      if (facebookAccount != null)
      {
        facebookAccount.setUserId(paramString);
        updateFacebookAccountAuthStatus();
      }
      hideProgressBar();
    }
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    populateProjectDetails();
  }
  
  public void onStart()
  {
    super.onStart();
    workflowManager.addCoverImageChangeListener(this);
  }
  
  public void onStop()
  {
    super.onStop();
    workflowManager.removeCoverImageChangeListener(this);
  }
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
}
