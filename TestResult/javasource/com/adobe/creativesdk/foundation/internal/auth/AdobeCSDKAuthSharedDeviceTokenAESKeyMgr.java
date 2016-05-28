package com.adobe.creativesdk.foundation.internal.auth;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import com.adobe.creativesdk.foundation.internal.utils.Util;

public class AdobeCSDKAuthSharedDeviceTokenAESKeyMgr
{
  private static AdobeCSDKAuthSharedDeviceTokenAESKeyMgr _sInstance;
  private boolean _bInstanceInitialized = false;
  private AdobeCommonCipher _cipher;
  private String _deviceTokenAESKey;
  
  AdobeCSDKAuthSharedDeviceTokenAESKeyMgr() {}
  
  public static void LogText(String paramString) {}
  
  public static AdobeCSDKAuthSharedDeviceTokenAESKeyMgr getInstance()
  {
    if (_sInstance == null) {
      _sInstance = new AdobeCSDKAuthSharedDeviceTokenAESKeyMgr();
    }
    return _sInstance;
  }
  
  private void initializeCipher()
  {
    try
    {
      LogText("Creating the Cipher Instance of Key");
      printAESKey(_deviceTokenAESKey);
      _cipher = new AdobeCommonCipher(Util.convertStringToByteArray(_deviceTokenAESKey));
      return;
    }
    catch (Exception localException)
    {
      LogText("Cipher cretion FAILED with messages :  " + localException.getClass().getSimpleName() + "   : " + localException.getMessage());
    }
  }
  
  private void printAESKey(String paramString) {}
  
  public void createNewAESKeyForSharedDeviceToken(Context paramContext)
  {
    byte[] arrayOfByte = AdobeCSDKAuthAESKeyMgr.generateNewAESKey_Common();
    try
    {
      setSharedDeviceTokenAESKey(paramContext, Util.convertByteArrayToString(arrayOfByte));
      return;
    }
    catch (Exception paramContext)
    {
      LogText("Cipher creation FAILED with messages :  " + paramContext.getClass().getSimpleName() + "   : " + paramContext.getMessage());
    }
  }
  
  public String decryptData(String paramString)
  {
    if (_cipher == null) {
      return paramString;
    }
    return _cipher.decrypt(paramString);
  }
  
  public String encryptData(String paramString)
  {
    if (_cipher == null) {
      return paramString;
    }
    return _cipher.encrypt(paramString);
  }
  
  public String getDeviceTokenSharedAESKey()
  {
    return _deviceTokenAESKey;
  }
  
  public void initializeDeviceTokenAES(Context paramContext)
  {
    LogText("AES initializing the AES");
    String str;
    if (!_bInstanceInitialized)
    {
      _bInstanceInitialized = true;
      str = paramContext.getSharedPreferences("adb_authenticator_shared_aes_preference", 0).getString("adb_authenticator_shared_aes_devicetoken", null);
      LogText("AES from preferenc is " + str);
      if (str != null) {}
    }
    else
    {
      LogText("AESMgr is already initialized - aes key :  " + _deviceTokenAESKey);
      return;
    }
    AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().setApplicationContext(paramContext);
    _deviceTokenAESKey = AdobeAuthIdentityManagementService.getSharedInstance().getCipher().decrypt(str);
    LogText("AES after decrypting is " + _deviceTokenAESKey);
    printAESKey(_deviceTokenAESKey);
    initializeCipher();
  }
  
  public boolean isInitializationSuccess()
  {
    return _cipher != null;
  }
  
  public void setSharedDeviceTokenAESKey(Context paramContext, String paramString)
  {
    AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().setApplicationContext(paramContext);
    Object localObject = AdobeAuthIdentityManagementService.getSharedInstance();
    LogText("Setting new key " + paramString);
    localObject = ((AdobeAuthIdentityManagementService)localObject).getCipher().encrypt(paramString);
    paramContext = paramContext.getSharedPreferences("adb_authenticator_shared_aes_preference", 0).edit();
    paramContext.putString("adb_authenticator_shared_aes_devicetoken", (String)localObject);
    paramContext.commit();
    _deviceTokenAESKey = paramString;
    printAESKey(_deviceTokenAESKey);
    initializeCipher();
  }
}
