package com.adobe.creativesdk.foundation.internal.auth;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import java.util.Calendar;
import java.util.Date;

public class AdobeAuthKeychain
{
  private static AdobeAuthKeychain sharedKeychain;
  protected Context context;
  private String groupID;
  private AdobeAuthIdentityManagementService ims;
  protected SharedPreferences sharedPreferences;
  
  static
  {
    if (!AdobeAuthKeychain.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  public AdobeAuthKeychain(AdobeAuthIdentityManagementService paramAdobeAuthIdentityManagementService)
  {
    setGroupID("");
    context = AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext();
    ims = paramAdobeAuthIdentityManagementService;
    assert (context != null);
    sharedPreferences = context.getSharedPreferences("Foundation", 0);
    assert (sharedPreferences != null);
    if (Integer.valueOf(sharedPreferences.getInt("KeychainVersion", 0)).intValue() < 10)
    {
      paramAdobeAuthIdentityManagementService = sharedPreferences.edit();
      paramAdobeAuthIdentityManagementService.remove("EnvironmentIndicator");
      resetTokens();
      paramAdobeAuthIdentityManagementService.putInt("KeychainVersion", 10);
      paramAdobeAuthIdentityManagementService.commit();
      AdobeCSDKAuthAESKeyMgr.getInstance().deleteFoundationAuthAESKey();
    }
  }
  
  private Date convertStringtoDate(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    try
    {
      paramString = Long.valueOf(paramString.trim());
      Calendar localCalendar = Calendar.getInstance();
      localCalendar.setTimeInMillis(paramString.longValue());
      paramString = localCalendar.getTime();
      return paramString;
    }
    catch (Exception paramString) {}
    return null;
  }
  
  public static AdobeAuthKeychain getSharedKeychain()
  {
    return sharedKeychain;
  }
  
  private boolean hasEnvironmentChanged()
  {
    int i = sharedPreferences.getInt("EnvironmentIndicator", -1);
    if (i != -1)
    {
      if ((i != ims.getEnvironment().ordinal()) && (AdobeAuthIMSEnvironment.AdobeAuthIdentityManagementServiceUndefined != ims.getEnvironment()))
      {
        internalUpdateOrAdd("EnvironmentIndicator", ims.getEnvironment());
        return true;
      }
      return false;
    }
    internalUpdateOrAdd("EnvironmentIndicator", ims.getEnvironment());
    return true;
  }
  
  private String internalFindKey(String paramString)
  {
    paramString = sharedPreferences.getString(paramString, null);
    return ims.getCipher().decrypt(paramString);
  }
  
  private void internalUpdateOrAdd(String paramString, AdobeAuthIMSEnvironment paramAdobeAuthIMSEnvironment)
  {
    SharedPreferences.Editor localEditor = sharedPreferences.edit();
    localEditor.putInt(paramString, paramAdobeAuthIMSEnvironment.ordinal());
    localEditor.commit();
  }
  
  private void internalUpdateOrAdd(String paramString, Object paramObject)
  {
    if ((paramObject instanceof Date)) {}
    for (paramObject = Long.toString(((Date)paramObject).getTime());; paramObject = paramObject.toString())
    {
      paramObject = ims.getCipher().encrypt(paramObject);
      SharedPreferences.Editor localEditor = sharedPreferences.edit();
      localEditor.putString(paramString, paramObject);
      localEditor.commit();
      return;
    }
  }
  
  public static void setSharedKeychain(AdobeAuthKeychain paramAdobeAuthKeychain)
  {
    sharedKeychain = paramAdobeAuthKeychain;
  }
  
  public void deleteKey(String paramString)
  {
    SharedPreferences.Editor localEditor = sharedPreferences.edit();
    localEditor.remove(paramString);
    localEditor.commit();
  }
  
  public String findKey(String paramString)
  {
    if (hasEnvironmentChanged())
    {
      resetTokens();
      return null;
    }
    return internalFindKey(paramString);
  }
  
  public String getAccessToken()
  {
    return findKey("AccessToken");
  }
  
  public Date getAccessTokenExpiration()
  {
    return convertStringtoDate(findKey("AccessTokenExpiration"));
  }
  
  public String getAdobeID()
  {
    return findKey("AdobeID");
  }
  
  public String getDeviceToken()
  {
    return findKey("DeviceToken");
  }
  
  public Date getDeviceTokenExpiration()
  {
    return convertStringtoDate(findKey("DeviceTokenExpiration"));
  }
  
  public String getDisplayName()
  {
    return findKey("DisplayName");
  }
  
  public String getEmailAddress()
  {
    return findKey("Email");
  }
  
  public String getEnterpriseInfo()
  {
    return findKey("EnterpriseInfo");
  }
  
  public String getFirstName()
  {
    return findKey("FirstName");
  }
  
  public String getLastName()
  {
    return findKey("LastName");
  }
  
  public String getRefreshToken()
  {
    return findKey("RefreshToken");
  }
  
  public Date getRefreshTokenExpiration()
  {
    return convertStringtoDate(findKey("RefreshTokenExpiration"));
  }
  
  public void resetTokens()
  {
    deleteKey("AdobeID");
    deleteKey("AccessToken");
    deleteKey("AccessTokenExpiration");
    deleteKey("ContinuationToken");
    deleteKey("DeviceToken");
    deleteKey("DeviceTokenExpiration");
    deleteKey("DisplayName");
    deleteKey("Email");
    deleteKey("EmailVerified");
    deleteKey("Entitlements");
    deleteKey("FirstName");
    deleteKey("LastName");
    deleteKey("RefreshToken");
    deleteKey("RefreshTokenExpiration");
    deleteKey("EnterpriseInfo");
  }
  
  public void setGroupID(String paramString)
  {
    groupID = paramString;
  }
  
  public void updateOrAddKey(String paramString, Object paramObject)
  {
    hasEnvironmentChanged();
    internalUpdateOrAdd(paramString, paramObject);
  }
}
