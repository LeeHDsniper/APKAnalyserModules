package com.adobe.creativesdk.aviary.internal.utils;

import android.text.TextUtils;
import android.util.Base64;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.message.BasicNameValuePair;

public final class CryptoUtils
{
  private static final Comparator<NameValuePair> SIGNATURE_PARAMS_COMPARATOR = new Comparator()
  {
    public int compare(NameValuePair paramAnonymousNameValuePair1, NameValuePair paramAnonymousNameValuePair2)
    {
      return paramAnonymousNameValuePair1.getName().compareTo(paramAnonymousNameValuePair2.getName());
    }
  };
  
  public static void addSignature(List<NameValuePair> paramList, String paramString)
  {
    Collections.sort(paramList, SIGNATURE_PARAMS_COMPARATOR);
    Object localObject = URLEncodedUtils.format(paramList, "utf-8");
    for (;;)
    {
      try
      {
        MessageDigest localMessageDigest = MessageDigest.getInstance("SHA-256");
        localObject = new StringBuilder().append((String)localObject);
        if (!TextUtils.isEmpty(paramString))
        {
          localMessageDigest.update(paramString.getBytes());
          paramList.add(new BasicNameValuePair("signature", Base64.encodeToString(localMessageDigest.digest(), 2)));
          return;
        }
      }
      catch (NoSuchAlgorithmException paramList)
      {
        paramList.printStackTrace();
        return;
      }
      paramString = "";
    }
  }
}
