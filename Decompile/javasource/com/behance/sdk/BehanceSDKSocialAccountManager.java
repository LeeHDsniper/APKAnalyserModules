package com.behance.sdk;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.behance.sdk.dto.BehanceSDKSocialAccountDTO;
import com.behance.sdk.enums.BehanceSDKSocialAccountType;
import com.facebook.Session;
import com.facebook.Session.Builder;

public class BehanceSDKSocialAccountManager
{
  private static BehanceSDKSocialAccountManager instance;
  private Context context;
  
  private BehanceSDKSocialAccountManager(Context paramContext)
  {
    context = paramContext;
  }
  
  private boolean areAccountsSame(BehanceSDKSocialAccountDTO paramBehanceSDKSocialAccountDTO1, BehanceSDKSocialAccountDTO paramBehanceSDKSocialAccountDTO2)
  {
    if (((paramBehanceSDKSocialAccountDTO1.getAccountClientId() != null) && (paramBehanceSDKSocialAccountDTO2.getAccountClientId() == null)) || ((paramBehanceSDKSocialAccountDTO1.getAccountClientId() == null) && (paramBehanceSDKSocialAccountDTO2.getAccountClientId() != null)) || ((paramBehanceSDKSocialAccountDTO1.getAccountClientId() != null) && (!paramBehanceSDKSocialAccountDTO1.getAccountClientId().equals(paramBehanceSDKSocialAccountDTO2.getAccountClientId())))) {}
    while (((paramBehanceSDKSocialAccountDTO1.getAccountClientSecret() != null) && (paramBehanceSDKSocialAccountDTO2.getAccountClientSecret() == null)) || ((paramBehanceSDKSocialAccountDTO1.getAccountClientSecret() == null) && (paramBehanceSDKSocialAccountDTO2.getAccountClientSecret() != null)) || ((paramBehanceSDKSocialAccountDTO1.getAccountClientSecret() != null) && (!paramBehanceSDKSocialAccountDTO1.getAccountClientSecret().equals(paramBehanceSDKSocialAccountDTO2.getAccountClientSecret()))) || (paramBehanceSDKSocialAccountDTO1.getAccountDisplayNameResourceId() != paramBehanceSDKSocialAccountDTO2.getAccountDisplayNameResourceId()) || ((paramBehanceSDKSocialAccountDTO1.getAdditionalData() != null) && (paramBehanceSDKSocialAccountDTO2.getAdditionalData() == null)) || ((paramBehanceSDKSocialAccountDTO1.getAdditionalData() == null) && (paramBehanceSDKSocialAccountDTO2.getAdditionalData() != null)) || ((paramBehanceSDKSocialAccountDTO1.getAdditionalData() != null) && (!paramBehanceSDKSocialAccountDTO1.getAdditionalData().equals(paramBehanceSDKSocialAccountDTO2.getAdditionalData()))) || ((paramBehanceSDKSocialAccountDTO1.getUserAuthToken() != null) && (paramBehanceSDKSocialAccountDTO2.getUserAuthToken() == null)) || ((paramBehanceSDKSocialAccountDTO1.getUserAuthToken() == null) && (paramBehanceSDKSocialAccountDTO2.getUserAuthToken() != null)) || ((paramBehanceSDKSocialAccountDTO1.getUserAuthToken() != null) && (!paramBehanceSDKSocialAccountDTO1.getUserAuthToken().equals(paramBehanceSDKSocialAccountDTO2.getUserAuthToken()))) || (paramBehanceSDKSocialAccountDTO1.getUserAuthTokenExpiryTime() != paramBehanceSDKSocialAccountDTO2.getUserAuthTokenExpiryTime()) || ((paramBehanceSDKSocialAccountDTO1.getUserId() != null) && (paramBehanceSDKSocialAccountDTO2.getUserId() == null)) || ((paramBehanceSDKSocialAccountDTO1.getUserId() == null) && (paramBehanceSDKSocialAccountDTO2.getUserId() != null)) || ((paramBehanceSDKSocialAccountDTO1.getUserId() != null) && (!paramBehanceSDKSocialAccountDTO1.getUserId().equals(paramBehanceSDKSocialAccountDTO2.getUserId()))) || (paramBehanceSDKSocialAccountDTO1.isSharingEnabledLastTime() != paramBehanceSDKSocialAccountDTO2.isSharingEnabledLastTime()) || (paramBehanceSDKSocialAccountDTO1.isUserAuthenticated() != paramBehanceSDKSocialAccountDTO2.isUserAuthenticated())) {
      return false;
    }
    return true;
  }
  
  private SharedPreferences getExistingAccountSharedPreference(BehanceSDKSocialAccountType paramBehanceSDKSocialAccountType)
  {
    paramBehanceSDKSocialAccountType = getSharedPreference(paramBehanceSDKSocialAccountType);
    if (paramBehanceSDKSocialAccountType.contains("SP_KEY_ACCOUNT_CLIENT_ID")) {
      return paramBehanceSDKSocialAccountType;
    }
    return null;
  }
  
  public static BehanceSDKSocialAccountManager getInstance(Context paramContext)
  {
    if (instance == null) {
      instance = new BehanceSDKSocialAccountManager(paramContext);
    }
    return instance;
  }
  
  private SharedPreferences getSharedPreference(BehanceSDKSocialAccountType paramBehanceSDKSocialAccountType)
  {
    paramBehanceSDKSocialAccountType = "BEHANCE_SDK_SOCIAL_ACCOUNTS_SHARED_PREFERENES_KEY_" + paramBehanceSDKSocialAccountType.name();
    return context.getSharedPreferences(paramBehanceSDKSocialAccountType, 0);
  }
  
  private BehanceSDKSocialAccountDTO readAccountFromStorage(BehanceSDKSocialAccountType paramBehanceSDKSocialAccountType)
  {
    SharedPreferences localSharedPreferences = getExistingAccountSharedPreference(paramBehanceSDKSocialAccountType);
    if (localSharedPreferences != null)
    {
      BehanceSDKSocialAccountDTO localBehanceSDKSocialAccountDTO = new BehanceSDKSocialAccountDTO();
      localBehanceSDKSocialAccountDTO.setAccountClientId(localSharedPreferences.getString("SP_KEY_ACCOUNT_CLIENT_ID", null));
      localBehanceSDKSocialAccountDTO.setAccountClientSecret(localSharedPreferences.getString("SP_KEY_ACCOUNT_CLIENT_SECRET", null));
      localBehanceSDKSocialAccountDTO.setAccountDisplayNameResourceId(localSharedPreferences.getInt("SP_KEY_ACCOUNT_DISPLAY_NAME_RES_ID", -1));
      localBehanceSDKSocialAccountDTO.setAccountType(paramBehanceSDKSocialAccountType);
      localBehanceSDKSocialAccountDTO.setUserAuthToken(localSharedPreferences.getString("SP_KEY_USER_AUTH_TOKEN", null));
      localBehanceSDKSocialAccountDTO.setUserAuthTokenExpiryTime(localSharedPreferences.getLong("SP_KEY_USER_AUTH_TOKEN_EXPIRY_TIME", 0L));
      localBehanceSDKSocialAccountDTO.setUserId(localSharedPreferences.getString("SP_KEY_USER_ID", null));
      localBehanceSDKSocialAccountDTO.setAdditionalData(localSharedPreferences.getString("SP_KEY_ADDITIONAL_DATA", null));
      localBehanceSDKSocialAccountDTO.setSharingEnabledLastTime(localSharedPreferences.getBoolean("SP_KEY_SHARE_ENABLED_LAST_TIME", false));
      localBehanceSDKSocialAccountDTO.setUserAuthenticated(localSharedPreferences.getBoolean("SP_KEY_USER_AUTHENTICATED", false));
      return localBehanceSDKSocialAccountDTO;
    }
    return null;
  }
  
  private boolean removeAccountFromStorage(BehanceSDKSocialAccountType paramBehanceSDKSocialAccountType)
  {
    paramBehanceSDKSocialAccountType = getSharedPreference(paramBehanceSDKSocialAccountType).edit();
    paramBehanceSDKSocialAccountType.clear();
    return paramBehanceSDKSocialAccountType.commit();
  }
  
  private boolean saveAccountToStorage(BehanceSDKSocialAccountDTO paramBehanceSDKSocialAccountDTO)
  {
    SharedPreferences.Editor localEditor = getSharedPreference(paramBehanceSDKSocialAccountDTO.getAccountType()).edit();
    localEditor.putString("SP_KEY_ACCOUNT_CLIENT_ID", paramBehanceSDKSocialAccountDTO.getAccountClientId());
    localEditor.putString("SP_KEY_ACCOUNT_CLIENT_SECRET", paramBehanceSDKSocialAccountDTO.getAccountClientSecret());
    localEditor.putInt("SP_KEY_ACCOUNT_DISPLAY_NAME_RES_ID", paramBehanceSDKSocialAccountDTO.getAccountDisplayNameResourceId());
    localEditor.putString("SP_KEY_USER_AUTH_TOKEN", paramBehanceSDKSocialAccountDTO.getUserAuthToken());
    localEditor.putLong("SP_KEY_USER_AUTH_TOKEN_EXPIRY_TIME", paramBehanceSDKSocialAccountDTO.getUserAuthTokenExpiryTime());
    localEditor.putString("SP_KEY_USER_ID", paramBehanceSDKSocialAccountDTO.getUserId());
    localEditor.putString("SP_KEY_ADDITIONAL_DATA", paramBehanceSDKSocialAccountDTO.getAdditionalData());
    localEditor.putBoolean("SP_KEY_SHARE_ENABLED_LAST_TIME", paramBehanceSDKSocialAccountDTO.isSharingEnabledLastTime());
    localEditor.putBoolean("SP_KEY_USER_AUTHENTICATED", paramBehanceSDKSocialAccountDTO.isUserAuthenticated());
    return localEditor.commit();
  }
  
  public boolean addAccount(BehanceSDKSocialAccountDTO paramBehanceSDKSocialAccountDTO)
  {
    if (paramBehanceSDKSocialAccountDTO != null)
    {
      BehanceSDKSocialAccountDTO localBehanceSDKSocialAccountDTO = getAccount(paramBehanceSDKSocialAccountDTO.getAccountType());
      if (localBehanceSDKSocialAccountDTO != null)
      {
        if (!areAccountsSame(localBehanceSDKSocialAccountDTO, paramBehanceSDKSocialAccountDTO)) {
          return saveAccountToStorage(paramBehanceSDKSocialAccountDTO);
        }
        return true;
      }
      return saveAccountToStorage(paramBehanceSDKSocialAccountDTO);
    }
    return false;
  }
  
  public BehanceSDKSocialAccountDTO getAccount(BehanceSDKSocialAccountType paramBehanceSDKSocialAccountType)
  {
    return readAccountFromStorage(paramBehanceSDKSocialAccountType);
  }
  
  public boolean removeAccount(BehanceSDKSocialAccountType paramBehanceSDKSocialAccountType)
  {
    if (paramBehanceSDKSocialAccountType == BehanceSDKSocialAccountType.FACEBOOK)
    {
      BehanceSDKSocialAccountDTO localBehanceSDKSocialAccountDTO = getAccount(BehanceSDKSocialAccountType.FACEBOOK);
      if (localBehanceSDKSocialAccountDTO != null)
      {
        new Session.Builder(context).setApplicationId(localBehanceSDKSocialAccountDTO.getAccountClientId()).build().closeAndClearTokenInformation();
        Session.setActiveSession(null);
      }
    }
    return removeAccountFromStorage(paramBehanceSDKSocialAccountType);
  }
  
  public boolean revokeAccountAccess(BehanceSDKSocialAccountType paramBehanceSDKSocialAccountType)
  {
    return removeAccount(paramBehanceSDKSocialAccountType);
  }
  
  public boolean updateAccount(BehanceSDKSocialAccountDTO paramBehanceSDKSocialAccountDTO)
  {
    return addAccount(paramBehanceSDKSocialAccountDTO);
  }
}
