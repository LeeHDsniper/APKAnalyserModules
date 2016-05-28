package com.adobe.creativesdk.foundation.internal.auth;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AccountManagerFuture;
import android.accounts.AuthenticatorDescription;
import android.accounts.AuthenticatorException;
import android.accounts.OperationCanceledException;
import android.app.Activity;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import android.os.Bundle;
import java.io.IOException;
import java.util.Date;
import java.util.Formatter;
import java.util.Locale;
import java.util.Scanner;

public class AdobeCSDKAdobeIdAuthenticatorHelper
{
  private static AdobeCSDKAdobeIdAuthenticatorHelper _sInstance;
  
  private AdobeCSDKAdobeIdAuthenticatorHelper() {}
  
  private String createCombinedData(String paramString, Date paramDate)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    new Formatter(localStringBuilder, Locale.US).format("%d %d %d %s", new Object[] { Integer.valueOf(1), Integer.valueOf(2), Long.valueOf(paramDate.getTime()), paramString });
    return localStringBuilder.toString();
  }
  
  private String decryptData(String paramString)
  {
    return paramString;
  }
  
  private String encryptData(String paramString)
  {
    return paramString;
  }
  
  public static AdobeCSDKAdobeIdAuthenticatorHelper getInstance()
  {
    if (_sInstance == null) {
      _sInstance = new AdobeCSDKAdobeIdAuthenticatorHelper();
    }
    return _sInstance;
  }
  
  private TokenDetails getTokenDetailsFromData(String paramString)
  {
    if (paramString == null) {}
    do
    {
      return null;
      paramString = new Scanner(decryptData(paramString));
    } while ((paramString.nextInt() > 1) || (paramString.nextInt() < 2));
    long l = paramString.nextLong();
    paramString = paramString.next().trim();
    TokenDetails localTokenDetails = new TokenDetails();
    deviceToken = paramString;
    deviceExpirationTime = new Date(l);
    return localTokenDetails;
  }
  
  public static boolean isAccountManagerHasSharedAdobeIdAccount(Context paramContext)
  {
    paramContext = AccountManager.get(paramContext);
    try
    {
      paramContext = paramContext.getAccountsByType("com.adobe.creativesdk.foundation.auth.adobeID");
      if (paramContext != null)
      {
        int i = paramContext.length;
        if (i > 0) {
          return true;
        }
      }
      return false;
    }
    catch (Exception paramContext) {}
    return false;
  }
  
  public static boolean isSharedDeviceTokenExpired(TokenDetails paramTokenDetails)
  {
    return (paramTokenDetails == null) || (deviceExpirationTime == null) || (deviceExpirationTime.getTime() - System.currentTimeMillis() < '✐');
  }
  
  public static void removeCurrentSharedAdobeIDFromAccountManager(Context paramContext)
  {
    try
    {
      paramContext = AccountManager.get(paramContext);
      Account[] arrayOfAccount = paramContext.getAccountsByType("com.adobe.creativesdk.foundation.auth.adobeID");
      if ((arrayOfAccount != null) && (arrayOfAccount.length > 0)) {
        paramContext.removeAccount(arrayOfAccount[0], null, null);
      }
      return;
    }
    catch (Exception paramContext)
    {
      paramContext.printStackTrace();
    }
  }
  
  public void addNewAccountDirectlyToAccountManager(Context paramContext, TokenDetails paramTokenDetails, boolean paramBoolean)
  {
    if (!checkAuthenticatorSignature(paramContext)) {
      return;
    }
    paramContext = AccountManager.get(paramContext);
    Bundle localBundle = new Bundle();
    localBundle.putString("adbAuth_adobeId", adobeId);
    localBundle.putString("adbAuth_authtoken", createCombinedEncryptedDataOfToken(deviceToken, deviceExpirationTime));
    if (paramBoolean) {
      localBundle.putBoolean("adbAuth_addaccount_signup_force", true);
    }
    try
    {
      paramContext.addAccount("com.adobe.creativesdk.foundation.auth.adobeID", "AdobeID access", null, localBundle, null, null, null);
      return;
    }
    catch (Exception paramContext)
    {
      paramContext.printStackTrace();
    }
  }
  
  public boolean checkAuthenticatorSignature(Context paramContext)
  {
    boolean bool = false;
    AuthenticatorDescription[] arrayOfAuthenticatorDescription = AccountManager.get(paramContext).getAuthenticatorTypes();
    int j = arrayOfAuthenticatorDescription.length;
    int i = 0;
    if (i < j)
    {
      Object localObject = arrayOfAuthenticatorDescription[i];
      if (type.equalsIgnoreCase("com.adobe.creativesdk.foundation.auth.adobeID"))
      {
        String str = getApplicationInfopackageName;
        localObject = packageName;
        if (paramContext.getPackageManager().checkSignatures(str, (String)localObject) != 0) {
          break label82;
        }
      }
      label82:
      for (bool = true;; bool = false)
      {
        i += 1;
        break;
      }
    }
    return bool;
  }
  
  public String createCombinedEncryptedDataOfToken(String paramString, Date paramDate)
  {
    return encryptData(createCombinedData(paramString, paramDate));
  }
  
  public void getSharedAdobeIdTokenFromAccountManager(final Activity paramActivity, final Bundle paramBundle, final ICSDKAdobeIdAuthTokenResultHandler paramICSDKAdobeIdAuthTokenResultHandler)
  {
    new AsyncTask()
    {
      private void storeDeviceTokenSharedAESKey(Context paramAnonymousContext, Bundle paramAnonymousBundle)
      {
        String str = paramAnonymousBundle.getString("adbAuth_device_token_aes_key", null);
        if (str == null) {}
        int i;
        do
        {
          return;
          i = paramAnonymousBundle.getInt("adbAuth_authenticator_uid", -1);
        } while ((i == -1) || (i == getApplicationInfouid));
        AdobeCSDKAuthSharedDeviceTokenAESKeyMgr.getInstance().setSharedDeviceTokenAESKey(paramAnonymousContext, str);
      }
      
      protected AdobeCSDKAdobeIdAuthenticatorHelper.SharedAccountRequestResultData doInBackground(Void... paramAnonymousVarArgs)
      {
        try
        {
          paramAnonymousVarArgs = getSharedAdobeIdAuthTokenFromAccountManager();
          return paramAnonymousVarArgs;
        }
        catch (Exception paramAnonymousVarArgs)
        {
          paramAnonymousVarArgs.printStackTrace();
        }
        return null;
      }
      
      AdobeCSDKAdobeIdAuthenticatorHelper.SharedAccountRequestResultData getSharedAdobeIdAuthTokenFromAccountManager()
      {
        Object localObject10 = null;
        Object localObject11 = null;
        Object localObject12 = null;
        Object localObject13 = null;
        localObject6 = null;
        localObject7 = AccountManager.get(paramActivity);
        localObject8 = ((AccountManager)localObject7).getAccountsByType("com.adobe.creativesdk.foundation.auth.adobeID");
        bool2 = false;
        bool1 = bool2;
        Object localObject1 = localObject6;
        if (localObject8 != null)
        {
          bool1 = bool2;
          localObject1 = localObject6;
          if (localObject8.length > 0)
          {
            bool1 = bool2;
            localObject1 = localObject6;
            if (this$0.checkAuthenticatorSignature(paramActivity))
            {
              localObject1 = ((AccountManager)localObject7).getAuthToken(localObject8[0], "AdobeID access", paramBundle, paramActivity, null, null);
              localObject6 = localObject10;
              localObject7 = localObject11;
              localObject8 = localObject12;
              localObject9 = localObject13;
            }
          }
        }
        try
        {
          Bundle localBundle = (Bundle)((AccountManagerFuture)localObject1).getResult();
          localObject6 = localObject10;
          localObject7 = localObject11;
          localObject8 = localObject12;
          localObject9 = localObject13;
          localObject1 = localBundle.getString("authtoken");
          localObject6 = localObject10;
          localObject7 = localObject11;
          localObject8 = localObject12;
          localObject9 = localObject13;
          localObject1 = this$0.getTokenDetailsFromData((String)localObject1);
          localObject6 = localObject1;
          localObject7 = localObject1;
          localObject8 = localObject1;
          localObject9 = localObject1;
          storeDeviceTokenSharedAESKey(paramActivity, localBundle);
          bool1 = bool2;
        }
        catch (OperationCanceledException localOperationCanceledException)
        {
          for (;;)
          {
            bool1 = true;
            Object localObject2 = localObject6;
          }
        }
        catch (Exception localException)
        {
          for (;;)
          {
            localException.printStackTrace();
            bool1 = bool2;
            Object localObject3 = localObject7;
          }
        }
        catch (AuthenticatorException localAuthenticatorException)
        {
          for (;;)
          {
            bool1 = bool2;
            Object localObject4 = localObject8;
          }
        }
        catch (IOException localIOException)
        {
          for (;;)
          {
            bool1 = bool2;
            Object localObject5 = localObject9;
          }
        }
        localObject6 = new AdobeCSDKAdobeIdAuthenticatorHelper.SharedAccountRequestResultData();
        tokenDetails = ((AdobeCSDKAdobeIdAuthenticatorHelper.TokenDetails)localObject1);
        isRequestCancelled = bool1;
        return localObject6;
      }
      
      protected void onPostExecute(AdobeCSDKAdobeIdAuthenticatorHelper.SharedAccountRequestResultData paramAnonymousSharedAccountRequestResultData)
      {
        paramICSDKAdobeIdAuthTokenResultHandler.handleAuthenticatorTokenResult(paramAnonymousSharedAccountRequestResultData);
      }
    }.execute(new Void[0]);
  }
  
  public static abstract interface ICSDKAdobeIdAuthTokenResultHandler
  {
    public abstract void handleAuthenticatorTokenResult(AdobeCSDKAdobeIdAuthenticatorHelper.SharedAccountRequestResultData paramSharedAccountRequestResultData);
  }
  
  public static class SharedAccountRequestResultData
  {
    boolean isRequestCancelled = false;
    AdobeCSDKAdobeIdAuthenticatorHelper.TokenDetails tokenDetails;
    
    SharedAccountRequestResultData() {}
  }
  
  public static class TokenDetails
  {
    public String adobeId;
    public Date deviceExpirationTime;
    public String deviceToken;
    
    public TokenDetails() {}
  }
}
