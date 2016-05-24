package com.adobe.creativesdk.foundation.internal.storage.controllers.utils;

public class AdobeCSDKInternalClientsPreferences
{
  private static boolean _sShouldEnableMyAccountsOption = false;
  
  public static boolean hasClientPreferenceToEnableMyAccountOption()
  {
    return _sShouldEnableMyAccountsOption;
  }
  
  public static void setClientPreferenceEnableMyAccount(boolean paramBoolean)
  {
    _sShouldEnableMyAccountsOption = paramBoolean;
  }
}
