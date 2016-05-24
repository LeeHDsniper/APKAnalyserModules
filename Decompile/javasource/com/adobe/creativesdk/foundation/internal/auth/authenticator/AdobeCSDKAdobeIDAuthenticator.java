package com.adobe.creativesdk.foundation.internal.auth.authenticator;

import android.accounts.AbstractAccountAuthenticator;
import android.accounts.Account;
import android.accounts.AccountAuthenticatorResponse;
import android.accounts.AccountManager;
import android.accounts.NetworkErrorException;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.TextUtils;
import com.adobe.creativesdk.foundation.auth.R.string;
import com.adobe.creativesdk.foundation.internal.auth.AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;

public class AdobeCSDKAdobeIDAuthenticator
  extends AbstractAccountAuthenticator
{
  private boolean _shouldAllowAccountRemovalInNextCall = false;
  private final Context mContext;
  
  public AdobeCSDKAdobeIDAuthenticator(Context paramContext)
  {
    super(paramContext);
    mContext = paramContext;
  }
  
  public static void LogText(String paramString) {}
  
  private boolean checkCallerPermission(Bundle paramBundle)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramBundle != null)
    {
      int i = paramBundle.getInt("callerUid", -1);
      bool1 = bool2;
      if (i != -1) {
        bool1 = doesCallerUidSignatureMatchWithThisAuthenticator(i);
      }
    }
    return bool1;
  }
  
  private boolean doesCallerUidSignatureMatchWithThisAuthenticator(int paramInt)
  {
    boolean bool = false;
    if (mContext.getPackageManager().checkSignatures(mContext.getApplicationInfo().uid, paramInt) == 0) {
      bool = true;
    }
    return bool;
  }
  
  private String getAuthTokenFromPreference(Account paramAccount)
  {
    paramAccount = AccountManager.get(mContext).getPassword(paramAccount);
    LogText("in getAuth : going to decrypt encrypted passwd is  " + paramAccount);
    paramAccount = AdobeCSDKAuthSharedDeviceTokenAESKeyMgr.getInstance().decryptData(paramAccount);
    LogText("in addAccount : decrypted token is " + paramAccount);
    return paramAccount;
  }
  
  private void initializeDeviceTokenSharedAESKey()
  {
    AdobeCSDKAuthSharedDeviceTokenAESKeyMgr.getInstance().initializeDeviceTokenAES(mContext);
  }
  
  private void removeAdobeIDAccount(Account paramAccount)
  {
    LogText("in getAuthToken : Remove AdobeId account request - removing the account");
    _shouldAllowAccountRemovalInNextCall = true;
    try
    {
      removeAuthTokenInPreference(paramAccount);
      AccountManager.get(mContext).removeAccount(paramAccount, null, null);
      return;
    }
    catch (Exception paramAccount) {}
  }
  
  private void removeAuthTokenInPreference(Account paramAccount)
  {
    AccountManager localAccountManager = AccountManager.get(mContext);
    localAccountManager.invalidateAuthToken(type, null);
    localAccountManager.setPassword(paramAccount, null);
  }
  
  private void storeAuthTokenInPreference(Account paramAccount, String paramString)
  {
    AccountManager localAccountManager = AccountManager.get(mContext);
    LogText("in addAccount : encrypting the token  " + paramString);
    paramString = AdobeCSDKAuthSharedDeviceTokenAESKeyMgr.getInstance().encryptData(paramString);
    LogText("in addAccount : encrypted token  " + paramString);
    localAccountManager.setPassword(paramAccount, paramString);
  }
  
  public Bundle addAccount(AccountAuthenticatorResponse paramAccountAuthenticatorResponse, String paramString1, String paramString2, String[] paramArrayOfString, Bundle paramBundle)
    throws NetworkErrorException
  {
    LogText("in addAccount : Trying adding account ");
    paramArrayOfString = new Bundle();
    if ((!checkCallerPermission(paramBundle)) || (paramBundle == null) || (!paramBundle.containsKey("adbAuth_adobeId")) || (!paramBundle.containsKey("adbAuth_authtoken")))
    {
      LogText("in addAccount : Permission Denied Or Bad Request - FAIL ");
      paramArrayOfString.putInt("errorCode", 4);
      return paramArrayOfString;
    }
    LogText("in addAccount : Initializing the shared AES Key ");
    initializeDeviceTokenSharedAESKey();
    if (!AdobeCSDKAuthSharedDeviceTokenAESKeyMgr.getInstance().isInitializationSuccess())
    {
      LogText("in addAccount :  shared AES Key - Not Initialized ");
      AdobeCSDKAuthSharedDeviceTokenAESKeyMgr.getInstance().createNewAESKeyForSharedDeviceToken(mContext);
      if (!AdobeCSDKAuthSharedDeviceTokenAESKeyMgr.getInstance().isInitializationSuccess())
      {
        LogText("in addAccount :  shared AES Key Initialization FAILED - Not adding account");
        paramArrayOfString.putInt("errorCode", 4);
        return paramArrayOfString;
      }
    }
    String str = paramBundle.getString("adbAuth_adobeId");
    paramBundle = paramBundle.getString("adbAuth_authtoken");
    paramString2 = new Account(str, paramString1);
    int j = 1;
    AccountManager localAccountManager = AccountManager.get(mContext);
    Account[] arrayOfAccount = localAccountManager.getAccountsByType("com.adobe.creativesdk.foundation.auth.adobeID");
    paramAccountAuthenticatorResponse = paramString2;
    int i = j;
    if (arrayOfAccount != null)
    {
      paramAccountAuthenticatorResponse = paramString2;
      i = j;
      if (arrayOfAccount.length > 0)
      {
        LogText("in addAccount : more than one account - remove the existing one");
        if (!str.equalsIgnoreCase(0name)) {
          break label328;
        }
        LogText("in addAccount : existing one same as the new one - so just udpate");
        i = 0;
        paramAccountAuthenticatorResponse = arrayOfAccount[0];
      }
    }
    for (;;)
    {
      if (i != 0)
      {
        LogText("in addAccount : everything Ok . adding account to Account Manager " + str);
        boolean bool = localAccountManager.addAccountExplicitly(paramAccountAuthenticatorResponse, null, null);
        LogText("in addAccount : Adding Account Manager  returned " + Boolean.toString(bool));
      }
      storeAuthTokenInPreference(paramAccountAuthenticatorResponse, paramBundle);
      paramArrayOfString.putString("authAccount", str);
      paramArrayOfString.putString("accountType", paramString1);
      paramArrayOfString.putString("authtoken", paramBundle);
      return paramArrayOfString;
      label328:
      removeAdobeIDAccount(arrayOfAccount[0]);
      paramAccountAuthenticatorResponse = paramString2;
      i = j;
    }
  }
  
  public Bundle confirmCredentials(AccountAuthenticatorResponse paramAccountAuthenticatorResponse, Account paramAccount, Bundle paramBundle)
    throws NetworkErrorException
  {
    return null;
  }
  
  public Bundle editProperties(AccountAuthenticatorResponse paramAccountAuthenticatorResponse, String paramString)
  {
    return null;
  }
  
  public Bundle getAuthToken(AccountAuthenticatorResponse paramAccountAuthenticatorResponse, Account paramAccount, String paramString, Bundle paramBundle)
    throws NetworkErrorException
  {
    LogText("in getAuthToken : fetch token");
    boolean bool = checkCallerPermission(paramBundle);
    if ((!bool) || (!paramString.equals("AdobeID access")))
    {
      LogText("in getAuthToken : FAILING due to permission check");
      paramAccount = new Bundle();
      paramAccount.putInt("errorCode", 7);
      if (!bool) {}
      for (paramAccountAuthenticatorResponse = "caller UID Different";; paramAccountAuthenticatorResponse = "invalid authTokenType")
      {
        paramAccount.putString("errorMessage", paramAccountAuthenticatorResponse);
        return paramAccount;
      }
    }
    paramAccountAuthenticatorResponse = new Bundle();
    LogText("in getAuthToken : Try getting authtoken from preference");
    initializeDeviceTokenSharedAESKey();
    if (!AdobeCSDKAuthSharedDeviceTokenAESKeyMgr.getInstance().isInitializationSuccess())
    {
      LogText("in getAuthToken : AES Mgr initialization failed - Remove Account");
      removeAdobeIDAccount(paramAccount);
      paramAccountAuthenticatorResponse.putInt("errorCode", 9);
      return paramAccountAuthenticatorResponse;
    }
    paramString = getAuthTokenFromPreference(paramAccount);
    if (!TextUtils.isEmpty(paramString))
    {
      LogText("in getAuthToken : seems to have a Valid Token");
      paramAccountAuthenticatorResponse.putString("authAccount", name);
      paramAccountAuthenticatorResponse.putString("accountType", type);
      paramAccountAuthenticatorResponse.putString("authtoken", paramString);
      paramAccountAuthenticatorResponse.putString("adbAuth_device_token_aes_key", AdobeCSDKAuthSharedDeviceTokenAESKeyMgr.getInstance().getDeviceTokenSharedAESKey());
      paramAccountAuthenticatorResponse.putInt("adbAuth_authenticator_uid", mContext.getApplicationInfo().uid);
      return paramAccountAuthenticatorResponse;
    }
    LogText("in getAuthToken : auth Token not present in preference");
    paramAccountAuthenticatorResponse.putInt("errorCode", 9);
    return paramAccountAuthenticatorResponse;
  }
  
  public String getAuthTokenLabel(String paramString)
  {
    return mContext.getResources().getString(R.string.adobe_id_authenticator_accesslabel);
  }
  
  public Bundle hasFeatures(AccountAuthenticatorResponse paramAccountAuthenticatorResponse, Account paramAccount, String[] paramArrayOfString)
    throws NetworkErrorException
  {
    paramAccountAuthenticatorResponse = new Bundle();
    paramAccountAuthenticatorResponse.putBoolean("booleanResult", false);
    return paramAccountAuthenticatorResponse;
  }
  
  public Bundle updateCredentials(AccountAuthenticatorResponse paramAccountAuthenticatorResponse, Account paramAccount, String paramString, Bundle paramBundle)
    throws NetworkErrorException
  {
    return null;
  }
}
