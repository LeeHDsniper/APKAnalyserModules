package com.adobe.creativesdk.aviary.internal.receipt;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.HandlerThread;
import android.util.Log;
import com.adobe.creativesdk.aviary.internal.utils.ConnectionUtils;
import com.adobe.creativesdk.aviary.internal.utils.CryptoUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import it.sephiroth.android.library.ab.AB;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

final class ReceiptUtils
{
  private static Locale sLocale;
  
  static int clamp(int paramInt1, int paramInt2, int paramInt3)
  {
    return Math.min(paramInt3, Math.max(paramInt1, paramInt2));
  }
  
  static String generateSignedUrl(String paramString1, String paramString2)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(new BasicNameValuePair("apiKey", paramString1));
    localArrayList.add(new BasicNameValuePair("timestamp", String.valueOf(System.currentTimeMillis())));
    CryptoUtils.addSignature(localArrayList, paramString2);
    return URLEncodedUtils.format(localArrayList, "utf-8");
  }
  
  public static int getBinaryVersion(Context paramContext)
  {
    paramContext = PackageManagerUtils.getPackageInfo(paramContext);
    if (paramContext != null) {
      return versionCode;
    }
    return 0;
  }
  
  public static String getCountry()
  {
    return getLocale().getCountry();
  }
  
  static HandlerThread getHandlerThread(String paramString)
  {
    paramString = new HandlerThread(paramString, 19);
    paramString.start();
    return paramString;
  }
  
  public static String getLanguage()
  {
    return getLocale().getLanguage();
  }
  
  private static Locale getLocale()
  {
    if (sLocale == null) {
      sLocale = Locale.getDefault();
    }
    return sLocale;
  }
  
  public static String getUserUUID(Context paramContext)
  {
    return AB.getInstance(paramContext).getUUID();
  }
  
  static int upload(String paramString1, String paramString2)
    throws IOException
  {
    DefaultHttpClient localDefaultHttpClient = new DefaultHttpClient();
    paramString1 = new HttpPost(paramString1);
    paramString2 = new StringEntity(paramString2);
    paramString1.setHeader("Accept", "application/json");
    paramString1.setHeader("Content-Type", "application/json");
    paramString1.setEntity(paramString2);
    try
    {
      paramString2 = localDefaultHttpClient.execute(paramString1);
      int i = paramString2.getStatusLine().getStatusCode();
      paramString2.getStatusLine().getReasonPhrase();
      Log.d("ReceiptsUtils", "code: " + i);
      return i;
    }
    catch (IOException paramString2)
    {
      paramString2.printStackTrace();
      paramString1.abort();
      throw paramString2;
    }
  }
  
  static boolean upload(Context paramContext, String paramString1, String paramString2)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (ConnectionUtils.isConnectedOrConnecting(paramContext, false)) {}
    try
    {
      int i = upload(paramString1, paramString2);
      bool1 = bool2;
      if (i == 200) {
        bool1 = true;
      }
      return bool1;
    }
    catch (Exception paramContext)
    {
      Log.w("ReceiptsUtils", "failed to upload content to " + paramString1);
      Log.w("ReceiptsUtils", "error: " + paramContext);
    }
    return false;
  }
  
  static boolean upload(Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (ConnectionUtils.isConnectedOrConnecting(paramContext, false)) {}
    try
    {
      int i = upload(paramString1 + "?" + generateSignedUrl(paramString3, paramString4), paramString2);
      bool1 = bool2;
      if (i == 200) {
        bool1 = true;
      }
      return bool1;
    }
    catch (Exception paramContext)
    {
      Log.w("ReceiptsUtils", "failed to upload content to " + paramString1);
      Log.w("ReceiptsUtils", "error: " + paramContext);
    }
    return false;
  }
}
