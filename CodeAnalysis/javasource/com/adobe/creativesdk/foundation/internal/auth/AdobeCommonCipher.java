package com.adobe.creativesdk.foundation.internal.auth;

import android.util.Base64;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;

final class AdobeCommonCipher
{
  private static AdobeCommonCipher instance = null;
  private Cipher decryptionCipher;
  private Cipher encryptionCipher;
  
  public AdobeCommonCipher(byte[] paramArrayOfByte)
    throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException
  {
    paramArrayOfByte = new SecretKeySpec(paramArrayOfByte, "AES");
    encryptionCipher = Cipher.getInstance("AES");
    encryptionCipher.init(1, paramArrayOfByte);
    decryptionCipher = Cipher.getInstance("AES");
    decryptionCipher.init(2, paramArrayOfByte);
  }
  
  static AdobeCommonCipher createInstance(byte[] paramArrayOfByte)
    throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException
  {
    if (instance == null) {
      instance = new AdobeCommonCipher(paramArrayOfByte);
    }
    return instance;
  }
  
  String decrypt(String paramString)
  {
    String str = null;
    if (paramString != null) {}
    try
    {
      str = new String(decryptionCipher.doFinal(Base64.decode(paramString.getBytes("UTF-8"), 2)), "UTF-8");
      return str;
    }
    catch (Exception paramString)
    {
      AdobeLogger.log(Level.ERROR, paramString.getClass().getSimpleName(), "Decryption error");
    }
    return null;
  }
  
  String encrypt(String paramString)
  {
    String str = null;
    if (paramString != null) {}
    try
    {
      str = new String(Base64.encode(encryptionCipher.doFinal(paramString.getBytes("UTF-8")), 2), "UTF-8");
      return str;
    }
    catch (Exception paramString)
    {
      AdobeLogger.log(Level.ERROR, paramString.getClass().getSimpleName(), "Encryption error");
    }
    return null;
  }
}
