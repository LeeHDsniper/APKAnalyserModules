package com.adobe.creativesdk.aviary.internal.cds.util;

import android.text.TextUtils;
import android.util.Log;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.Signature;
import java.security.SignatureException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;

public class Security
{
  public static PublicKey generatePublicKey(String paramString)
  {
    try
    {
      paramString = Base64.decode(paramString);
      paramString = KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(paramString));
      return paramString;
    }
    catch (NoSuchAlgorithmException paramString)
    {
      throw new RuntimeException(paramString);
    }
    catch (InvalidKeySpecException paramString)
    {
      Log.e("IABUtil/Security", "Invalid key specification.");
      throw new IllegalArgumentException(paramString);
    }
    catch (Base64DecoderException paramString)
    {
      Log.e("IABUtil/Security", "Base64 decoding failed.");
      throw new IllegalArgumentException(paramString);
    }
  }
  
  public static boolean verify(PublicKey paramPublicKey, String paramString1, String paramString2)
  {
    try
    {
      Signature localSignature = Signature.getInstance("SHA1withRSA");
      localSignature.initVerify(paramPublicKey);
      localSignature.update(paramString1.getBytes());
      if (!localSignature.verify(Base64.decode(paramString2)))
      {
        Log.e("IABUtil/Security", "Signature verification failed.");
        return false;
      }
      return true;
    }
    catch (NoSuchAlgorithmException paramPublicKey)
    {
      Log.e("IABUtil/Security", "NoSuchAlgorithmException.");
      return false;
    }
    catch (InvalidKeyException paramPublicKey)
    {
      Log.e("IABUtil/Security", "Invalid key specification.");
      return false;
    }
    catch (SignatureException paramPublicKey)
    {
      Log.e("IABUtil/Security", "Signature exception.");
      return false;
    }
    catch (Base64DecoderException paramPublicKey)
    {
      Log.e("IABUtil/Security", "Base64 decoding failed.");
    }
    return false;
  }
  
  public static boolean verifyPurchase(String paramString1, String paramString2, String paramString3)
  {
    if ((TextUtils.isEmpty(paramString2)) || (TextUtils.isEmpty(paramString1)) || (TextUtils.isEmpty(paramString3)))
    {
      Log.e("IABUtil/Security", "Purchase verification failed: missing data.");
      return false;
    }
    return verify(generatePublicKey(paramString1), paramString2, paramString3);
  }
}
