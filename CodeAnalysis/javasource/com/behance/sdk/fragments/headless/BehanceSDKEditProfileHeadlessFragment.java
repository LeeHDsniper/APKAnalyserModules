package com.behance.sdk.fragments.headless;

import android.graphics.Bitmap;
import android.support.v4.app.Fragment;
import com.behance.sdk.BehanceSDKUserProfile;
import com.behance.sdk.IBehanceSDKUserCredentials;
import com.behance.sdk.asynctask.listeners.IBehanceSDKEditProfileAsyncTaskListener;
import com.behance.sdk.asynctask.listeners.IBehanceSDKGetUserProfileAsyncTaskListener;
import com.behance.sdk.asynctask.params.BehanceSDKEditProfileAsyncTaskParams;
import com.behance.sdk.asynctask.params.BehanceSDKGetUserProfileTaskParams;
import com.behance.sdk.asynctasks.BehanceSDKEditProfileAsyncTask;
import com.behance.sdk.asynctasks.BehanceSDKGetUserProfileAsyncTask;
import com.behance.sdk.asynctasks.result.BehanceSDKEditProfileTaskResult;
import com.behance.sdk.asynctasks.result.BehanceSDKGetUserProfileTaskResult;
import com.behance.sdk.dto.location.BehanceSDKCityDTO;
import com.behance.sdk.dto.location.BehanceSDKCountryDTO;
import com.behance.sdk.dto.location.BehanceSDKStateDTO;
import com.behance.sdk.managers.BehanceSDKEditProfileManager;
import com.behance.sdk.project.modules.ImageModule;
import java.util.List;

public class BehanceSDKEditProfileHeadlessFragment
  extends Fragment
  implements IBehanceSDKEditProfileAsyncTaskListener, IBehanceSDKGetUserProfileAsyncTaskListener
{
  private Callbacks callbacks;
  private BehanceSDKCityDTO city;
  private String company;
  private BehanceSDKCountryDTO country;
  private BehanceSDKEditProfileAsyncTask editProfileAsyncTask;
  private boolean editProfileTaskInProgress = false;
  private String firstName;
  private BehanceSDKGetUserProfileAsyncTask getUserProfileAsyncTask;
  private boolean getUserProfileTaskInProgress = false;
  private Bitmap imageBitmap;
  private ImageModule imageModule;
  private String lastName;
  private String occupation;
  private String originalImageUrl;
  private BehanceSDKStateDTO state;
  private String website;
  
  public BehanceSDKEditProfileHeadlessFragment()
  {
    setRetainInstance(true);
  }
  
  private BehanceSDKEditProfileAsyncTaskParams applyParamChanges()
  {
    BehanceSDKEditProfileAsyncTaskParams localBehanceSDKEditProfileAsyncTaskParams = new BehanceSDKEditProfileAsyncTaskParams();
    if (firstName != null) {
      localBehanceSDKEditProfileAsyncTaskParams.setFirstName(firstName);
    }
    if (lastName != null) {
      localBehanceSDKEditProfileAsyncTaskParams.setLastName(lastName);
    }
    if (occupation != null) {
      localBehanceSDKEditProfileAsyncTaskParams.setOccupation(occupation);
    }
    if (company != null) {
      localBehanceSDKEditProfileAsyncTaskParams.setCompany(company);
    }
    if (website != null) {
      localBehanceSDKEditProfileAsyncTaskParams.setWebsite(website);
    }
    if (country != null) {
      localBehanceSDKEditProfileAsyncTaskParams.setCountry(country.getDisplayName());
    }
    if (state != null) {
      localBehanceSDKEditProfileAsyncTaskParams.setState(state.getDisplayName());
    }
    if (city != null) {
      localBehanceSDKEditProfileAsyncTaskParams.setCity(city.getDisplayName());
    }
    if (imageModule != null) {
      localBehanceSDKEditProfileAsyncTaskParams.setImage(imageModule);
    }
    if (imageBitmap != null) {
      localBehanceSDKEditProfileAsyncTaskParams.setProfileImageBitmap(imageBitmap);
    }
    return localBehanceSDKEditProfileAsyncTaskParams;
  }
  
  public BehanceSDKCityDTO getCity()
  {
    return city;
  }
  
  public String getCompany()
  {
    return company;
  }
  
  public BehanceSDKCountryDTO getCountry()
  {
    return country;
  }
  
  public String getFirstName()
  {
    return firstName;
  }
  
  public Bitmap getImageBitmap()
  {
    return imageBitmap;
  }
  
  public String getLastName()
  {
    return lastName;
  }
  
  public String getOccupation()
  {
    return occupation;
  }
  
  public String getOriginalImageUrl()
  {
    return originalImageUrl;
  }
  
  public BehanceSDKStateDTO getState()
  {
    return state;
  }
  
  public String getWebsite()
  {
    return website;
  }
  
  public boolean isEditProfileTaskInProgress()
  {
    return editProfileTaskInProgress;
  }
  
  public boolean isGetUserProfileTaskInProgress()
  {
    return getUserProfileTaskInProgress;
  }
  
  public boolean isValidLocation()
  {
    if ((country == null) || ("WORLD_WIDE_COUNTRY_ID".equals(country.getId()))) {}
    while (((BehanceSDKCountryDTO.COUNTRY_CODES_FOR_LOAD_STATES.contains(country.getId())) && (state == null)) || ((state != null) && ("ALL_STATES_ID".equals(state.getId()))) || (city == null) || ("ALL_CITIES_ID".equals(city.getId()))) {
      return false;
    }
    return true;
  }
  
  public void loadUserDetailsFromServer()
  {
    if ((!isGetUserProfileTaskInProgress()) && (getUserProfileAsyncTask == null))
    {
      setGetUserProfileTaskInProgress(true);
      BehanceSDKGetUserProfileTaskParams localBehanceSDKGetUserProfileTaskParams = new BehanceSDKGetUserProfileTaskParams();
      IBehanceSDKUserCredentials localIBehanceSDKUserCredentials = BehanceSDKEditProfileManager.getInstance().getUserCredentials();
      localBehanceSDKGetUserProfileTaskParams.setUserId(localIBehanceSDKUserCredentials.getUserBehanceAccountId());
      localBehanceSDKGetUserProfileTaskParams.setClientId(localIBehanceSDKUserCredentials.getClientId());
      getUserProfileAsyncTask = new BehanceSDKGetUserProfileAsyncTask(this);
      getUserProfileAsyncTask.execute(new BehanceSDKGetUserProfileTaskParams[] { localBehanceSDKGetUserProfileTaskParams });
    }
  }
  
  public void onEditProfileTaskFailure(BehanceSDKEditProfileTaskResult paramBehanceSDKEditProfileTaskResult)
  {
    setEditProfileTaskInProgress(false);
    callbacks.onEditProfileFailure(paramBehanceSDKEditProfileTaskResult);
  }
  
  public void onEditProfileTaskSuccess(BehanceSDKEditProfileTaskResult paramBehanceSDKEditProfileTaskResult)
  {
    setEditProfileTaskInProgress(false);
    callbacks.onEditProfileSuccess(paramBehanceSDKEditProfileTaskResult);
  }
  
  public void onGetUserProfileFailure(Exception paramException, BehanceSDKGetUserProfileTaskParams paramBehanceSDKGetUserProfileTaskParams)
  {
    setGetUserProfileTaskInProgress(false);
    callbacks.onGetUserProfileFailure(paramException, paramBehanceSDKGetUserProfileTaskParams);
  }
  
  public void onGetUserProfileSuccess(BehanceSDKGetUserProfileTaskResult paramBehanceSDKGetUserProfileTaskResult, BehanceSDKGetUserProfileTaskParams paramBehanceSDKGetUserProfileTaskParams)
  {
    paramBehanceSDKGetUserProfileTaskResult = paramBehanceSDKGetUserProfileTaskResult.getBehanceUserProfile();
    setFirstName(paramBehanceSDKGetUserProfileTaskResult.getFirstName());
    setLastName(paramBehanceSDKGetUserProfileTaskResult.getLastName());
    setOccupation(paramBehanceSDKGetUserProfileTaskResult.getOccupation());
    setCompany(paramBehanceSDKGetUserProfileTaskResult.getCompany());
    setWebsite(paramBehanceSDKGetUserProfileTaskResult.getWebsite());
    setCountry(paramBehanceSDKGetUserProfileTaskResult.getCountry());
    setState(paramBehanceSDKGetUserProfileTaskResult.getState());
    setCity(paramBehanceSDKGetUserProfileTaskResult.getCity());
    setGetUserProfileTaskInProgress(false);
    setOriginalImageUrl(paramBehanceSDKGetUserProfileTaskResult.getProfileImageUrl());
    callbacks.onGetUserProfileSuccess();
  }
  
  public void saveUserPortfolioChanges()
  {
    if ((!editProfileTaskInProgress) && (editProfileAsyncTask == null))
    {
      setEditProfileTaskInProgress(true);
      editProfileAsyncTask = new BehanceSDKEditProfileAsyncTask(this);
      BehanceSDKEditProfileAsyncTaskParams localBehanceSDKEditProfileAsyncTaskParams = applyParamChanges();
      localBehanceSDKEditProfileAsyncTaskParams.setClientId(BehanceSDKEditProfileManager.getInstance().getUserCredentials().getClientId());
      editProfileAsyncTask.execute(new BehanceSDKEditProfileAsyncTaskParams[] { localBehanceSDKEditProfileAsyncTaskParams });
    }
  }
  
  public void setCallbacks(Callbacks paramCallbacks)
  {
    callbacks = paramCallbacks;
  }
  
  public void setCity(BehanceSDKCityDTO paramBehanceSDKCityDTO)
  {
    city = paramBehanceSDKCityDTO;
  }
  
  public void setCompany(String paramString)
  {
    company = paramString;
  }
  
  public void setCountry(BehanceSDKCountryDTO paramBehanceSDKCountryDTO)
  {
    country = paramBehanceSDKCountryDTO;
  }
  
  public void setEditProfileTaskInProgress(boolean paramBoolean)
  {
    editProfileTaskInProgress = paramBoolean;
  }
  
  public void setFirstName(String paramString)
  {
    firstName = paramString;
  }
  
  public void setGetUserProfileTaskInProgress(boolean paramBoolean)
  {
    getUserProfileTaskInProgress = paramBoolean;
  }
  
  public void setImage(ImageModule paramImageModule)
  {
    imageModule = paramImageModule;
  }
  
  public void setImageBitmap(Bitmap paramBitmap)
  {
    imageBitmap = paramBitmap;
  }
  
  public void setLastName(String paramString)
  {
    lastName = paramString;
  }
  
  public void setOccupation(String paramString)
  {
    occupation = paramString;
  }
  
  public void setOriginalImageUrl(String paramString)
  {
    originalImageUrl = paramString;
  }
  
  public void setState(BehanceSDKStateDTO paramBehanceSDKStateDTO)
  {
    state = paramBehanceSDKStateDTO;
  }
  
  public void setWebsite(String paramString)
  {
    website = paramString;
  }
  
  public static abstract interface Callbacks
  {
    public abstract void onEditProfileFailure(BehanceSDKEditProfileTaskResult paramBehanceSDKEditProfileTaskResult);
    
    public abstract void onEditProfileSuccess(BehanceSDKEditProfileTaskResult paramBehanceSDKEditProfileTaskResult);
    
    public abstract void onGetUserProfileFailure(Exception paramException, BehanceSDKGetUserProfileTaskParams paramBehanceSDKGetUserProfileTaskParams);
    
    public abstract void onGetUserProfileSuccess();
  }
}
