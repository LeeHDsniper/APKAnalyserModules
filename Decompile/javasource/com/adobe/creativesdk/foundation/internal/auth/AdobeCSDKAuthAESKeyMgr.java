package com.adobe.creativesdk.foundation.internal.auth;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.ApplicationInfo;
import android.os.Build.VERSION;
import android.security.KeyPairGeneratorSpec.Builder;
import android.util.Base64;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import java.io.IOException;
import java.math.BigInteger;
import java.security.KeyPairGenerator;
import java.security.KeyStore;
import java.security.KeyStore.PrivateKeyEntry;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.UnrecoverableEntryException;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.util.Calendar;
import java.util.Date;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.security.auth.x500.X500Principal;

public class AdobeCSDKAuthAESKeyMgr
{
  private static AdobeCSDKAuthAESKeyMgr _sInstance;
  private final String FOUNDATION_AUTH_AES_KEY_PREFERENCE = "adb_foundation_auth_aes_preference";
  private final String FOUNDATION_AUTH_AES_SECRET_KEY = "adb_foundation_auth_aes_secret_key";
  private final String SHARED_DEVICETOKEN_AUTH_AES_SECRET_KEY = "adb_shareddevicetoken_auth_aes_secret_key";
  private AESKeySecret_Encryptor _aeskey_Encryptor = new AESKeySecret_Encryptor();
  private byte[] _foundationAuth_AES_key;
  
  AdobeCSDKAuthAESKeyMgr() {}
  
  public static byte[] generateNewAESKey_Common()
  {
    try
    {
      Object localObject = KeyGenerator.getInstance("AES");
      ((KeyGenerator)localObject).init(128);
      localObject = ((KeyGenerator)localObject).generateKey().getEncoded();
      return localObject;
    }
    catch (Exception localException)
    {
      throw new IllegalArgumentException("Auth Foundation : Auth AESKeyMgr : Failed to generate an AES key");
    }
  }
  
  private byte[] getAESKeyFromPreference_Common(String paramString)
  {
    paramString = getStringFromAuthAESFoundationPreference(paramString);
    if (paramString == null) {
      return null;
    }
    paramString = Base64.decode(paramString, 2);
    return _aeskey_Encryptor.deCryptData(paramString);
  }
  
  private String getAuthFoundation_Encrypted_AES_Key_fromPreference()
  {
    return getStringFromAuthAESFoundationPreference("adb_foundation_auth_aes_secret_key");
  }
  
  private byte[] getFoundation_AESKey_fromPreference()
  {
    return getAESKeyFromPreference_Common("adb_foundation_auth_aes_secret_key");
  }
  
  static AdobeCSDKAuthAESKeyMgr getInstance()
  {
    if (_sInstance == null) {
      _sInstance = new AdobeCSDKAuthAESKeyMgr();
    }
    return _sInstance;
  }
  
  private String getStringFromAuthAESFoundationPreference(String paramString)
  {
    return AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext().getSharedPreferences("adb_foundation_auth_aes_preference", 0).getString(paramString, null);
  }
  
  private void storeAESKeyInPreference_Common(byte[] paramArrayOfByte, String paramString)
  {
    paramArrayOfByte = Base64.encodeToString(_aeskey_Encryptor.encyrptData(paramArrayOfByte), 2);
    SharedPreferences.Editor localEditor = AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext().getSharedPreferences("adb_foundation_auth_aes_preference", 0).edit();
    localEditor.putString(paramString, paramArrayOfByte);
    localEditor.commit();
  }
  
  private void storeFoundatationAuth_AESKey_InPreference(byte[] paramArrayOfByte)
  {
    storeAESKeyInPreference_Common(paramArrayOfByte, "adb_foundation_auth_aes_secret_key");
  }
  
  public void deleteFoundationAuthAESKey()
  {
    SharedPreferences.Editor localEditor = AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext().getSharedPreferences("adb_foundation_auth_aes_preference", 0).edit();
    localEditor.remove("adb_foundation_auth_aes_secret_key");
    localEditor.commit();
  }
  
  public byte[] getFoundationAuthAESKey()
  {
    if (_foundationAuth_AES_key != null) {
      return _foundationAuth_AES_key;
    }
    _foundationAuth_AES_key = getFoundation_AESKey_fromPreference();
    if (_foundationAuth_AES_key == null)
    {
      _foundationAuth_AES_key = generateNewAESKey_Common();
      if (_foundationAuth_AES_key != null) {
        storeFoundatationAuth_AESKey_InPreference(_foundationAuth_AES_key);
      }
    }
    else
    {
      return _foundationAuth_AES_key;
    }
    throw new IllegalArgumentException("CSDK Foundation Auth AES Key is null.");
  }
  
  private class AESKeySecret_Encryptor
  {
    private PrivateKey _app_privateRSAKey;
    private PublicKey _app_publicRSAKey;
    private boolean _isRunningAPI_18_Above = false;
    
    public AESKeySecret_Encryptor()
    {
      if (!_isRunningAPI_18_Above) {
        return;
      }
      initializeRSAKeyPairs();
    }
    
    private byte[] deCryptUsingPrivateKey(byte[] paramArrayOfByte)
    {
      Cipher localCipher = getRSACipher();
      try
      {
        localCipher.init(2, _app_privateRSAKey);
        paramArrayOfByte = localCipher.doFinal(paramArrayOfByte);
        return paramArrayOfByte;
      }
      catch (Exception paramArrayOfByte)
      {
        paramArrayOfByte.printStackTrace();
        throw new IllegalArgumentException("Auth Foundation : Auth AESKeyMgr : Failed to decyrpt using private key");
      }
    }
    
    private byte[] encryptUsingPublicKey(byte[] paramArrayOfByte)
    {
      Cipher localCipher = getRSACipher();
      try
      {
        localCipher.init(1, _app_publicRSAKey);
        paramArrayOfByte = localCipher.doFinal(paramArrayOfByte);
        return paramArrayOfByte;
      }
      catch (Exception paramArrayOfByte)
      {
        paramArrayOfByte.printStackTrace();
        throw new IllegalArgumentException("Auth Foundation : Auth AESKeyMgr : Failed to encrypt using public key");
      }
    }
    
    @TargetApi(18)
    private void generateAppRSAPublicPrivateKeys()
    {
      Object localObject2 = Calendar.getInstance();
      Object localObject1 = ((Calendar)localObject2).getTime();
      ((Calendar)localObject2).add(1, 25);
      Date localDate = ((Calendar)localObject2).getTime();
      try
      {
        localObject2 = KeyPairGenerator.getInstance("RSA", "AndroidKeyStore");
        Context localContext = AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext();
        localObject1 = new KeyPairGeneratorSpec.Builder(localContext).setAlias("adb_auth_foundation_rsa_keypair_alias").setStartDate((Date)localObject1).setEndDate(localDate).setSerialNumber(BigInteger.valueOf(1L)).setSubject(new X500Principal(String.format("CN=%s, OU=%s", new Object[] { "adb_auth_foundation_rsa_keypair_alias", getApplicationInfopackageName })));
        if (Build.VERSION.SDK_INT >= 19) {
          ((KeyPairGeneratorSpec.Builder)localObject1).setKeySize(2048);
        }
        ((KeyPairGenerator)localObject2).initialize(((KeyPairGeneratorSpec.Builder)localObject1).build());
        ((KeyPairGenerator)localObject2).generateKeyPair();
        return;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        throw new IllegalArgumentException("Failed to generate RSA Public Private Key pair");
      }
    }
    
    private Cipher getRSACipher()
    {
      try
      {
        Cipher localCipher = Cipher.getInstance("RSA/ECB/PKCS1Padding", "AndroidOpenSSL");
        return localCipher;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        throw new IllegalArgumentException("Auth Foundation : Auth AESKeyMgr : Failed to create Cipher");
      }
    }
    
    private void initializePublicPrivateKeys()
    {
      try
      {
        Object localObject = KeyStore.getInstance("AndroidKeyStore");
        ((KeyStore)localObject).load(null);
        localObject = (KeyStore.PrivateKeyEntry)((KeyStore)localObject).getEntry("adb_auth_foundation_rsa_keypair_alias", null);
        _app_privateRSAKey = ((KeyStore.PrivateKeyEntry)localObject).getPrivateKey();
        _app_publicRSAKey = ((KeyStore.PrivateKeyEntry)localObject).getCertificate().getPublicKey();
        return;
      }
      catch (KeyStoreException localKeyStoreException)
      {
        AdobeLogger.log(Level.ERROR, AdobeCSDKAuthAESKeyMgr.class.getSimpleName(), localKeyStoreException.getMessage());
        return;
      }
      catch (CertificateException localCertificateException)
      {
        AdobeLogger.log(Level.ERROR, AdobeCSDKAuthAESKeyMgr.class.getSimpleName(), localCertificateException.getMessage());
        return;
      }
      catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
      {
        AdobeLogger.log(Level.ERROR, AdobeCSDKAuthAESKeyMgr.class.getSimpleName(), localNoSuchAlgorithmException.getMessage());
        return;
      }
      catch (UnrecoverableEntryException localUnrecoverableEntryException)
      {
        AdobeLogger.log(Level.ERROR, AdobeCSDKAuthAESKeyMgr.class.getSimpleName(), localUnrecoverableEntryException.getMessage());
        return;
      }
      catch (IOException localIOException)
      {
        AdobeLogger.log(Level.ERROR, AdobeCSDKAuthAESKeyMgr.class.getSimpleName(), localIOException.getMessage());
      }
    }
    
    private void initializeRSAKeyPairs()
    {
      initializePublicPrivateKeys();
      int i;
      if ((_app_privateRSAKey == null) || (_app_publicRSAKey == null)) {
        i = 1;
      }
      while (i != 0) {
        if (AdobeCSDKAuthAESKeyMgr.this.getAuthFoundation_Encrypted_AES_Key_fromPreference() != null)
        {
          throw new IllegalArgumentException("Auth Foundation :AESKeyMgr Failed to initialize Private keys - but already have a valid aes key stored !!");
          i = 0;
        }
        else
        {
          generateAppRSAPublicPrivateKeys();
          initializePublicPrivateKeys();
        }
      }
    }
    
    public byte[] deCryptData(byte[] paramArrayOfByte)
    {
      if (!_isRunningAPI_18_Above) {
        return paramArrayOfByte;
      }
      return deCryptUsingPrivateKey(paramArrayOfByte);
    }
    
    public byte[] encyrptData(byte[] paramArrayOfByte)
    {
      if (!_isRunningAPI_18_Above) {
        return paramArrayOfByte;
      }
      return encryptUsingPublicKey(paramArrayOfByte);
    }
  }
}
