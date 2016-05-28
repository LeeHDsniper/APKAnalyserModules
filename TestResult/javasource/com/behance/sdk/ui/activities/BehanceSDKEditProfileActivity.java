package com.behance.sdk.ui.activities;

import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import com.behance.sdk.BehanceSDKImageSelectorOptions;
import com.behance.sdk.R.color;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.R.string;
import com.behance.sdk.asynctask.params.BehanceSDKGetUserProfileTaskParams;
import com.behance.sdk.asynctasks.result.BehanceSDKEditProfileTaskResult;
import com.behance.sdk.dto.BehanceSDKImageCropperDTO;
import com.behance.sdk.dto.location.BehanceSDKCityDTO;
import com.behance.sdk.dto.location.BehanceSDKCountryDTO;
import com.behance.sdk.dto.location.BehanceSDKStateDTO;
import com.behance.sdk.fragments.headless.BehanceSDKEditProfileHeadlessFragment;
import com.behance.sdk.fragments.headless.BehanceSDKEditProfileHeadlessFragment.Callbacks;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.managers.BehanceSDKEditProfileManager;
import com.behance.sdk.project.modules.ImageModule;
import com.behance.sdk.ui.dialogs.BehanceSDKGenericAlertDialog;
import com.behance.sdk.ui.dialogs.BehanceSDKProfileLocationSelectionDialog;
import com.behance.sdk.ui.dialogs.BehanceSDKProfileLocationSelectionDialog.Callbacks;
import com.behance.sdk.ui.fragments.BehanceSDKImageCropperDialogFragment;
import com.behance.sdk.ui.fragments.BehanceSDKImageCropperDialogFragment.Callbacks;
import com.behance.sdk.ui.fragments.BehanceSDKImageSelectorDialogFragment;
import com.behance.sdk.ui.fragments.BehanceSDKImageSelectorDialogFragment.Callbacks;
import com.behance.sdk.util.BehanceSDKUtils;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration;
import java.util.Iterator;
import java.util.List;

public class BehanceSDKEditProfileActivity
  extends FragmentActivity
  implements TextWatcher, View.OnClickListener, BehanceSDKEditProfileHeadlessFragment.Callbacks, BehanceSDKProfileLocationSelectionDialog.Callbacks, BehanceSDKImageCropperDialogFragment.Callbacks, BehanceSDKImageSelectorDialogFragment.Callbacks
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKEditProfileActivity.class);
  private ImageView avatar;
  private EditText companyET;
  private BehanceSDKEditProfileHeadlessFragment editProfileHeadlessFragment;
  private boolean enableAlternateImageSelectionSources = true;
  private EditText firstNameET;
  private EditText lastNameET;
  private TextView location;
  private ImageLoader mLoader;
  private EditText occupationET;
  private boolean profileChanged = false;
  private View progressBar;
  private TextView saveNavBtn;
  private BehanceSDKGenericAlertDialog unsavedChangesAlertDialog;
  private EditText websiteET;
  
  public BehanceSDKEditProfileActivity() {}
  
  private void closeThisActivity()
  {
    finish();
  }
  
  private void closeUnsavedChangesAlertDialog()
  {
    if (unsavedChangesAlertDialog != null) {
      unsavedChangesAlertDialog.dismiss();
    }
  }
  
  private void displayNoInternetConnectivity()
  {
    Toast.makeText(this, getString(R.string.bsdk_add_wip_view_connection_error_msg), 1).show();
    closeThisActivity();
  }
  
  private ImageLoader getImageLoaderInstance()
  {
    ImageLoader localImageLoader = ImageLoader.getInstance();
    if (!localImageLoader.isInited()) {
      localImageLoader.init(ImageLoaderConfiguration.createDefault(this));
    }
    return localImageLoader;
  }
  
  private void handleLocationClick()
  {
    FragmentManager localFragmentManager = getSupportFragmentManager();
    BehanceSDKProfileLocationSelectionDialog localBehanceSDKProfileLocationSelectionDialog = BehanceSDKProfileLocationSelectionDialog.getInstance();
    Bundle localBundle = new Bundle();
    setSelectedLocation(localBundle);
    localBehanceSDKProfileLocationSelectionDialog.setArguments(localBundle);
    localBehanceSDKProfileLocationSelectionDialog.setCallbacks(this);
    localBehanceSDKProfileLocationSelectionDialog.show(localFragmentManager, "FRAGMENT_TAG_EDIT_PROFILE_LOCATION");
  }
  
  private void hideProgressBar()
  {
    if (progressBar != null) {
      progressBar.setVisibility(8);
    }
  }
  
  private void initializeFields()
  {
    firstNameET.setText(editProfileHeadlessFragment.getFirstName());
    lastNameET.setText(editProfileHeadlessFragment.getLastName());
    occupationET.setText(editProfileHeadlessFragment.getOccupation());
    companyET.setText(editProfileHeadlessFragment.getCompany());
    websiteET.setText(editProfileHeadlessFragment.getWebsite());
    Object localObject2 = "";
    if (editProfileHeadlessFragment.getCountry() != null) {
      localObject2 = "" + editProfileHeadlessFragment.getCountry().getDisplayName();
    }
    Object localObject1 = localObject2;
    if (editProfileHeadlessFragment.getState() != null) {
      localObject1 = (String)localObject2 + "/" + editProfileHeadlessFragment.getState().getId();
    }
    localObject2 = localObject1;
    if (editProfileHeadlessFragment.getCity() != null) {
      localObject2 = (String)localObject1 + "/" + editProfileHeadlessFragment.getCity().getDisplayName();
    }
    location.setText((CharSequence)localObject2);
    if (editProfileHeadlessFragment.getImageBitmap() == null) {
      mLoader.displayImage(editProfileHeadlessFragment.getOriginalImageUrl(), avatar);
    }
    for (;;)
    {
      firstNameET.addTextChangedListener(this);
      lastNameET.addTextChangedListener(this);
      occupationET.addTextChangedListener(this);
      companyET.addTextChangedListener(this);
      websiteET.addTextChangedListener(this);
      avatar.setOnClickListener(this);
      location.setOnClickListener(this);
      return;
      avatar.setImageBitmap(editProfileHeadlessFragment.getImageBitmap());
    }
  }
  
  private boolean isStringEmpty(String paramString)
  {
    return (paramString == null) || (paramString.trim().length() <= 0);
  }
  
  private void launchAlbumsViewToPickPicture()
  {
    Object localObject1 = BehanceSDKImageSelectorOptions.getSingleImageSelectionOptions();
    if (!enableAlternateImageSelectionSources) {
      ((BehanceSDKImageSelectorOptions)localObject1).hideImageSelectionSources();
    }
    ((BehanceSDKImageSelectorOptions)localObject1).setAllowedFileExtensions(BehanceSDKUtils.getAllowedFileExtensionsForProfileImage());
    localObject1 = BehanceSDKImageSelectorDialogFragment.getInstance(this, (BehanceSDKImageSelectorOptions)localObject1);
    Object localObject2 = getSupportFragmentManager();
    FragmentTransaction localFragmentTransaction = ((FragmentManager)localObject2).beginTransaction();
    localObject2 = ((FragmentManager)localObject2).findFragmentByTag("FRAGMENT_TAG_EDIT_PROFILE_SELECT_IMAGE");
    if (localObject2 != null) {
      localFragmentTransaction.remove((Fragment)localObject2);
    }
    localFragmentTransaction.addToBackStack(null);
    ((BehanceSDKImageSelectorDialogFragment)localObject1).show(localFragmentTransaction, "FRAGMENT_TAG_EDIT_PROFILE_SELECT_IMAGE");
  }
  
  private void saveChanges()
  {
    String str1;
    String str2;
    int i;
    int j;
    if (profileChanged)
    {
      str1 = firstNameET.getText().toString();
      str2 = lastNameET.getText().toString();
      String str3 = occupationET.getText().toString();
      String str4 = companyET.getText().toString();
      String str5 = websiteET.getText().toString();
      editProfileHeadlessFragment.setFirstName(str1);
      editProfileHeadlessFragment.setLastName(str2);
      editProfileHeadlessFragment.setOccupation(str3);
      editProfileHeadlessFragment.setCompany(str4);
      editProfileHeadlessFragment.setWebsite(str5);
      i = 1;
      j = R.string.bsdk_edit_profile_avatar_required_fields_missing_msg;
      if ((!isStringEmpty(str1)) || (!isStringEmpty(str2))) {
        break label172;
      }
      i = 0;
      j = R.string.bsdk_edit_profile_avatar_required_fields_missing_msg;
    }
    while (i != 0)
    {
      showProgressBar();
      saveNavBtn.setTextColor(getResources().getColor(R.color.bsdk_adobe_blue_disabled));
      editProfileHeadlessFragment.saveUserPortfolioChanges();
      return;
      label172:
      if (isStringEmpty(str1))
      {
        i = 0;
        j = R.string.bsdk_edit_profile_avatar_first_name_field_missing_msg;
      }
      else if (isStringEmpty(str2))
      {
        i = 0;
        j = R.string.bsdk_edit_profile_avatar_last_name_field_missing_msg;
      }
      else if (!editProfileHeadlessFragment.isValidLocation())
      {
        i = 0;
        j = R.string.bsdk_location_filter_dialog_city_empty_error;
      }
    }
    Toast.makeText(this, j, 1).show();
  }
  
  private void setSelectedLocation(Bundle paramBundle)
  {
    if (editProfileHeadlessFragment.getCountry() != null)
    {
      paramBundle.putSerializable("INSTANCE_STATE_KEY_SELECTED_COUNTRY", editProfileHeadlessFragment.getCountry());
      if (editProfileHeadlessFragment.getState() != null) {
        paramBundle.putSerializable("INSTANCE_STATE_KEY_SELECTED_STATE", editProfileHeadlessFragment.getState());
      }
      if (editProfileHeadlessFragment.getCity() != null) {
        paramBundle.putSerializable("INSTANCE_STATE_KEY_SELECTED_CITY", editProfileHeadlessFragment.getCity());
      }
    }
  }
  
  private void showProgressBar()
  {
    if (progressBar != null) {
      progressBar.setVisibility(0);
    }
  }
  
  public void afterTextChanged(Editable paramEditable)
  {
    if (!profileChanged)
    {
      profileChanged = true;
      saveNavBtn.setTextColor(getResources().getColor(R.color.bsdk_adobe_blue));
    }
  }
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void onBackPressed()
  {
    if (profileChanged)
    {
      unsavedChangesAlertDialog = BehanceSDKGenericAlertDialog.getInstance(this, R.string.bsdk_edit_profile_unsaved_changes_title, R.string.bsdk_edit_profile_unsaved_changes_body, R.string.bsdk_generic_alert_dialog_ok_btn_label, R.string.bsdk_generic_alert_dialog_cancel_btn_label);
      unsavedChangesAlertDialog.setOnOKBtnClickListener(this);
      unsavedChangesAlertDialog.setOnNotOKBtnClickListener(this);
      unsavedChangesAlertDialog.show();
      return;
    }
    super.onBackPressed();
  }
  
  public void onClick(View paramView)
  {
    int i = paramView.getId();
    if (i == R.id.bsdkEditProfileActionbarBackBtnImageView) {
      onBackPressed();
    }
    do
    {
      return;
      if (i == R.id.bsdkEditProfileActionbarActionBtnTxtView)
      {
        saveChanges();
        return;
      }
      if (i == R.id.bsdkEditProfileAvatar)
      {
        launchAlbumsViewToPickPicture();
        return;
      }
      if (i == R.id.bsdkGenericAlertDialogOKBtn)
      {
        closeThisActivity();
        return;
      }
      if (i == R.id.bsdkGenericAlertDialogNotOKBtn)
      {
        closeUnsavedChangesAlertDialog();
        return;
      }
    } while (i != R.id.bsdkEditProfileLocation);
    handleLocationClick();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(R.layout.bsdk_activity_edit_profile);
    paramBundle = getIntent();
    if (paramBundle != null)
    {
      enableAlternateImageSelectionSources = paramBundle.getBooleanExtra("INTENT_EXTRA_BOOLEAN_ENABLE_ALTERNATE_IMAGE_SELECTION_SOURCES", true);
      findViewById(R.id.bsdkEditProfileActionbarBackBtnImageView).setOnClickListener(this);
      saveNavBtn = ((TextView)findViewById(R.id.bsdkEditProfileActionbarActionBtnTxtView));
      saveNavBtn.setOnClickListener(this);
      progressBar = findViewById(R.id.bsdkEditProfileLoader);
      firstNameET = ((EditText)findViewById(R.id.bsdkEditProfileFirstName));
      lastNameET = ((EditText)findViewById(R.id.bsdkEditProfileLastName));
      occupationET = ((EditText)findViewById(R.id.bsdkEditProfileOccupation));
      companyET = ((EditText)findViewById(R.id.bsdkEditProfileCompany));
      websiteET = ((EditText)findViewById(R.id.bsdkEditProfileWebsite));
      avatar = ((ImageView)findViewById(R.id.bsdkEditProfileAvatar));
      location = ((TextView)findViewById(R.id.bsdkEditProfileLocation));
      mLoader = getImageLoaderInstance();
      editProfileHeadlessFragment = ((BehanceSDKEditProfileHeadlessFragment)getSupportFragmentManager().findFragmentByTag("EDIT_PROFILE_HEADLESS_FRAGMENT_TAG"));
      if (editProfileHeadlessFragment != null) {
        break label360;
      }
      editProfileHeadlessFragment = new BehanceSDKEditProfileHeadlessFragment();
      getSupportFragmentManager().beginTransaction().add(editProfileHeadlessFragment, "EDIT_PROFILE_HEADLESS_FRAGMENT_TAG").commit();
      editProfileHeadlessFragment.loadUserDetailsFromServer();
    }
    for (;;)
    {
      editProfileHeadlessFragment.setCallbacks(this);
      paramBundle = getSupportFragmentManager();
      Fragment localFragment = paramBundle.findFragmentByTag("FRAGMENT_TAG_EDIT_PROFILE_SELECT_IMAGE");
      if ((localFragment instanceof BehanceSDKImageSelectorDialogFragment)) {
        ((BehanceSDKImageSelectorDialogFragment)localFragment).setCallbacks(this);
      }
      localFragment = paramBundle.findFragmentByTag("FRAGMENT_TAG_EDIT_PROFILE_CROP_IMAGE");
      if ((localFragment instanceof BehanceSDKImageCropperDialogFragment)) {
        ((BehanceSDKImageCropperDialogFragment)localFragment).setCallbacks(this);
      }
      paramBundle = paramBundle.findFragmentByTag("FRAGMENT_TAG_EDIT_PROFILE_LOCATION");
      if ((paramBundle instanceof BehanceSDKProfileLocationSelectionDialog)) {
        ((BehanceSDKProfileLocationSelectionDialog)paramBundle).setCallbacks(this);
      }
      if ((editProfileHeadlessFragment.isGetUserProfileTaskInProgress()) || (editProfileHeadlessFragment.isEditProfileTaskInProgress())) {
        showProgressBar();
      }
      return;
      enableAlternateImageSelectionSources = true;
      break;
      label360:
      initializeFields();
      hideProgressBar();
    }
  }
  
  public void onEditProfileFailure(BehanceSDKEditProfileTaskResult paramBehanceSDKEditProfileTaskResult)
  {
    Object localObject = paramBehanceSDKEditProfileTaskResult.getExceptions();
    if (localObject != null)
    {
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        Exception localException = (Exception)((Iterator)localObject).next();
        logger.error(localException, "Problem updating user profile", new Object[0]);
      }
    }
    if (paramBehanceSDKEditProfileTaskResult.isProfileUpdateFailed()) {
      Toast.makeText(this, getResources().getString(R.string.bsdk_edit_profile_editing_error), 1).show();
    }
    for (;;)
    {
      hideProgressBar();
      closeThisActivity();
      return;
      if (paramBehanceSDKEditProfileTaskResult.isProfileAvatarUpdateFailed())
      {
        Toast.makeText(this, getResources().getString(R.string.bsdk_edit_profile_avatar_saving_error), 1).show();
        BehanceSDKEditProfileManager.getInstance().onEditProfileSuccess();
      }
      else
      {
        Toast.makeText(this, getResources().getString(R.string.bsdk_edit_profile_editing_error), 1).show();
      }
    }
  }
  
  public void onEditProfileSuccess(BehanceSDKEditProfileTaskResult paramBehanceSDKEditProfileTaskResult)
  {
    BehanceSDKEditProfileManager.getInstance().onEditProfileSuccess();
    closeThisActivity();
  }
  
  public void onGetUserProfileFailure(Exception paramException, BehanceSDKGetUserProfileTaskParams paramBehanceSDKGetUserProfileTaskParams)
  {
    logger.error(paramException, "Problem retrieving user Profile details", new Object[0]);
    Toast.makeText(this, getResources().getString(R.string.bsdk_edit_profile_loading_error), 1).show();
    closeThisActivity();
  }
  
  public void onGetUserProfileSuccess()
  {
    initializeFields();
    hideProgressBar();
  }
  
  public void onImageCropped(Bitmap paramBitmap)
  {
    editProfileHeadlessFragment.setImageBitmap(paramBitmap);
    avatar.setImageBitmap(paramBitmap);
    if (!profileChanged)
    {
      profileChanged = true;
      saveNavBtn.setTextColor(getResources().getColor(R.color.bsdk_adobe_blue));
    }
  }
  
  public void onImageSelectorOnError(Exception paramException) {}
  
  public void onImageSelectorSelectionBackPressed() {}
  
  public void onImageSelectorSelectionCanceled() {}
  
  public void onImageSelectorSelectionFinished(List<ImageModule> paramList)
  {
    if ((paramList != null) && (!paramList.isEmpty()))
    {
      paramList = (ImageModule)paramList.get(0);
      Object localObject1 = new BehanceSDKImageCropperDTO();
      ((BehanceSDKImageCropperDTO)localObject1).setHeight(276);
      ((BehanceSDKImageCropperDTO)localObject1).setWidth(276);
      ((BehanceSDKImageCropperDTO)localObject1).setMinSize(276);
      ((BehanceSDKImageCropperDTO)localObject1).setImageModule(paramList);
      ((BehanceSDKImageCropperDTO)localObject1).setIncludeControls(true);
      localObject1 = BehanceSDKImageCropperDialogFragment.getInstance((BehanceSDKImageCropperDTO)localObject1, this);
      Object localObject2 = getSupportFragmentManager();
      FragmentTransaction localFragmentTransaction = ((FragmentManager)localObject2).beginTransaction();
      localObject2 = ((FragmentManager)localObject2).findFragmentByTag("FRAGMENT_TAG_EDIT_PROFILE_CROP_IMAGE");
      if (localObject2 != null) {
        localFragmentTransaction.remove((Fragment)localObject2);
      }
      localFragmentTransaction.addToBackStack(null);
      ((BehanceSDKImageCropperDialogFragment)localObject1).show(localFragmentTransaction, "FRAGMENT_TAG_EDIT_PROFILE_CROP_IMAGE");
      editProfileHeadlessFragment.setImage(paramList);
    }
  }
  
  public void onLocationFilterDone(BehanceSDKCountryDTO paramBehanceSDKCountryDTO, BehanceSDKStateDTO paramBehanceSDKStateDTO, BehanceSDKCityDTO paramBehanceSDKCityDTO)
  {
    Object localObject = "";
    if (paramBehanceSDKCountryDTO != null)
    {
      editProfileHeadlessFragment.setCountry(paramBehanceSDKCountryDTO);
      paramBehanceSDKCountryDTO = "" + paramBehanceSDKCountryDTO.getDisplayName();
      localObject = paramBehanceSDKCountryDTO;
      if (!profileChanged)
      {
        profileChanged = true;
        saveNavBtn.setTextColor(getResources().getColor(R.color.bsdk_adobe_blue));
        localObject = paramBehanceSDKCountryDTO;
      }
    }
    if (paramBehanceSDKStateDTO != null)
    {
      editProfileHeadlessFragment.setState(paramBehanceSDKStateDTO);
      localObject = (String)localObject + "/" + paramBehanceSDKStateDTO.getId();
    }
    for (;;)
    {
      paramBehanceSDKCountryDTO = (BehanceSDKCountryDTO)localObject;
      if (paramBehanceSDKCityDTO != null)
      {
        editProfileHeadlessFragment.setCity(paramBehanceSDKCityDTO);
        paramBehanceSDKCountryDTO = (String)localObject + "/" + paramBehanceSDKCityDTO.getDisplayName();
      }
      location.setText(paramBehanceSDKCountryDTO);
      return;
      editProfileHeadlessFragment.setState(null);
    }
  }
  
  public void onStart()
  {
    super.onStart();
    NetworkInfo localNetworkInfo = ((ConnectivityManager)getSystemService("connectivity")).getActiveNetworkInfo();
    if ((localNetworkInfo == null) || (!localNetworkInfo.isConnected())) {
      displayNoInternetConnectivity();
    }
  }
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
}
