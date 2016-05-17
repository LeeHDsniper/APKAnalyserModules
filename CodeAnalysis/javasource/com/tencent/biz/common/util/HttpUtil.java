package com.tencent.biz.common.util;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.NetworkInfo.State;
import android.net.Proxy;
import android.net.Uri;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.text.TextUtils;
import com.rookery.asyncHttpClient.AsyncHttpClient.CustomSSLSocketFactory;
import com.tencent.biz.qrcode.util.QRUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.AppNetConnInfo;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.security.KeyStore;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.scheme.SocketFactory;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class HttpUtil
{
  public static final int a = 15000;
  public static final String a;
  private static boolean a = false;
  public static final int b = 30000;
  public static final String b = "GET";
  private static final int c = 17;
  public static final String c = "POST";
  public static final String d = "http://cgi.connect.qq.com/qqconnectopen/upload_share_image";
  public static final String e = "1";
  private static final String f = "http://openmobile.qq.com/api/url_change";
  private static final String g = "http://openmobile.qq.com/api/shortUrl";
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = HttpUtil.class.getSimpleName();
    jdField_a_of_type_Boolean = false;
  }
  
  public HttpUtil() {}
  
  public static int a()
  {
    if (!AppNetConnInfo.isNetSupport()) {}
    do
    {
      return 0;
      if (AppNetConnInfo.isWifiConn()) {
        return 1;
      }
    } while (!AppNetConnInfo.isMobileConn());
    switch (AppNetConnInfo.getMobileInfo())
    {
    case -1: 
    default: 
      return -1;
    case 0: 
    case 3: 
      return 2;
    case 1: 
      return 3;
    }
    return 4;
  }
  
  private static int a(Context paramContext)
  {
    int i = -1;
    if (Build.VERSION.SDK_INT < 11) {
      if (paramContext != null)
      {
        int j = Proxy.getPort(paramContext);
        i = j;
        if (j < 0) {
          i = Proxy.getDefaultPort();
        }
      }
    }
    do
    {
      return i;
      return Proxy.getDefaultPort();
      paramContext = System.getProperty("http.proxyPort");
    } while (b(paramContext));
    try
    {
      i = Integer.parseInt(paramContext);
      return i;
    }
    catch (NumberFormatException paramContext) {}
    return -1;
  }
  
  public static HttpUtil.NetworkProxy a(Context paramContext)
  {
    if (paramContext == null) {
      return null;
    }
    Object localObject = (ConnectivityManager)paramContext.getSystemService("connectivity");
    if (localObject == null) {
      return null;
    }
    localObject = ((ConnectivityManager)localObject).getActiveNetworkInfo();
    if (localObject == null) {
      return null;
    }
    if (NetworkUtil.a((NetworkInfo)localObject))
    {
      localObject = a(paramContext);
      int i = a(paramContext);
      if ((!b((String)localObject)) && (i >= 0)) {
        return new HttpUtil.NetworkProxy((String)localObject, i, null);
      }
    }
    return null;
  }
  
  /* Error */
  public static ByteArrayOutputStream a(HttpResponse paramHttpResponse)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokeinterface 141 1 0
    //   6: astore 5
    //   8: aconst_null
    //   9: astore_2
    //   10: aconst_null
    //   11: astore 4
    //   13: aconst_null
    //   14: astore_3
    //   15: aload 5
    //   17: invokeinterface 147 1 0
    //   22: astore 5
    //   24: aload 5
    //   26: astore_3
    //   27: aload 5
    //   29: astore_2
    //   30: aload 5
    //   32: astore 4
    //   34: new 149	java/io/ByteArrayOutputStream
    //   37: dup
    //   38: invokespecial 150	java/io/ByteArrayOutputStream:<init>	()V
    //   41: astore 6
    //   43: aload 5
    //   45: astore_3
    //   46: aload 5
    //   48: astore_2
    //   49: aload 5
    //   51: astore 4
    //   53: aload_0
    //   54: ldc -104
    //   56: invokeinterface 156 2 0
    //   61: astore 7
    //   63: aload 5
    //   65: astore_0
    //   66: aload 7
    //   68: ifnull +54 -> 122
    //   71: aload 5
    //   73: astore_0
    //   74: aload 5
    //   76: astore_3
    //   77: aload 5
    //   79: astore_2
    //   80: aload 5
    //   82: astore 4
    //   84: aload 7
    //   86: invokeinterface 161 1 0
    //   91: invokevirtual 166	java/lang/String:toLowerCase	()Ljava/lang/String;
    //   94: ldc -88
    //   96: invokevirtual 172	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   99: ifeq +23 -> 122
    //   102: aload 5
    //   104: astore_3
    //   105: aload 5
    //   107: astore_2
    //   108: aload 5
    //   110: astore 4
    //   112: new 174	java/util/zip/GZIPInputStream
    //   115: dup
    //   116: aload 5
    //   118: invokespecial 177	java/util/zip/GZIPInputStream:<init>	(Ljava/io/InputStream;)V
    //   121: astore_0
    //   122: aload_0
    //   123: astore_3
    //   124: aload_0
    //   125: astore_2
    //   126: aload_0
    //   127: astore 4
    //   129: sipush 512
    //   132: newarray byte
    //   134: astore 5
    //   136: aload_0
    //   137: astore_3
    //   138: aload_0
    //   139: astore_2
    //   140: aload_0
    //   141: astore 4
    //   143: aload_0
    //   144: aload 5
    //   146: invokevirtual 183	java/io/InputStream:read	([B)I
    //   149: istore_1
    //   150: iload_1
    //   151: iconst_m1
    //   152: if_icmpeq +38 -> 190
    //   155: aload_0
    //   156: astore_3
    //   157: aload_0
    //   158: astore_2
    //   159: aload_0
    //   160: astore 4
    //   162: aload 6
    //   164: aload 5
    //   166: iconst_0
    //   167: iload_1
    //   168: invokevirtual 187	java/io/ByteArrayOutputStream:write	([BII)V
    //   171: goto -35 -> 136
    //   174: astore_0
    //   175: aload_3
    //   176: astore_2
    //   177: aload_0
    //   178: athrow
    //   179: astore_0
    //   180: aload_2
    //   181: ifnull +7 -> 188
    //   184: aload_2
    //   185: invokevirtual 190	java/io/InputStream:close	()V
    //   188: aload_0
    //   189: athrow
    //   190: aload_0
    //   191: ifnull +7 -> 198
    //   194: aload_0
    //   195: invokevirtual 190	java/io/InputStream:close	()V
    //   198: aload 6
    //   200: areturn
    //   201: astore_0
    //   202: aload 4
    //   204: astore_2
    //   205: new 133	java/io/IOException
    //   208: dup
    //   209: invokespecial 191	java/io/IOException:<init>	()V
    //   212: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	213	0	paramHttpResponse	HttpResponse
    //   149	19	1	i	int
    //   9	196	2	localObject1	Object
    //   14	162	3	localObject2	Object
    //   11	192	4	localObject3	Object
    //   6	159	5	localObject4	Object
    //   41	158	6	localByteArrayOutputStream	ByteArrayOutputStream
    //   61	24	7	localHeader	org.apache.http.Header
    // Exception table:
    //   from	to	target	type
    //   15	24	174	java/io/IOException
    //   34	43	174	java/io/IOException
    //   53	63	174	java/io/IOException
    //   84	102	174	java/io/IOException
    //   112	122	174	java/io/IOException
    //   129	136	174	java/io/IOException
    //   143	150	174	java/io/IOException
    //   162	171	174	java/io/IOException
    //   15	24	179	finally
    //   34	43	179	finally
    //   53	63	179	finally
    //   84	102	179	finally
    //   112	122	179	finally
    //   129	136	179	finally
    //   143	150	179	finally
    //   162	171	179	finally
    //   177	179	179	finally
    //   205	213	179	finally
    //   15	24	201	java/lang/Exception
    //   34	43	201	java/lang/Exception
    //   53	63	201	java/lang/Exception
    //   84	102	201	java/lang/Exception
    //   112	122	201	java/lang/Exception
    //   129	136	201	java/lang/Exception
    //   143	150	201	java/lang/Exception
    //   162	171	201	java/lang/Exception
  }
  
  private static String a(Context paramContext)
  {
    if (Build.VERSION.SDK_INT < 11)
    {
      if (paramContext != null)
      {
        String str = Proxy.getHost(paramContext);
        paramContext = str;
        if (b(str)) {
          paramContext = Proxy.getDefaultHost();
        }
        return paramContext;
      }
      return Proxy.getDefaultHost();
    }
    return System.getProperty("http.proxyHost");
  }
  
  protected static final String a(Context paramContext, String paramString1, String paramString2, int paramInt, JSONArray paramJSONArray)
  {
    Bundle localBundle = new Bundle();
    localBundle.putString("cookie", "uin=" + paramString1 + ";skey=" + paramString2);
    localBundle.putString("Referer", "http://openmobile.qq.com/");
    paramString1 = new Bundle();
    paramString1.putString("type", String.valueOf(paramInt));
    paramString1.putString("value", paramJSONArray.toString());
    paramString1.putString("mType", "qb_share");
    try
    {
      paramContext = a(paramContext, "http://openmobile.qq.com/api/url_change", "POST", paramString1, localBundle);
      return paramContext;
    }
    catch (IOException paramContext)
    {
      QLog.d("zivonchen", 4, paramContext.getMessage());
    }
    return null;
  }
  
  public static String a(Context paramContext, String paramString1, String paramString2, Bundle paramBundle1, Bundle paramBundle2)
  {
    if (paramBundle1 == null) {
      paramBundle1 = new Bundle();
    }
    for (;;)
    {
      String str2 = Uri.parse(paramString1).getHost();
      try
      {
        HttpResponse localHttpResponse = a(paramContext, paramString1, str2, paramString2, paramBundle1, paramBundle2);
        paramContext = localHttpResponse;
      }
      catch (IOException localIOException)
      {
        while (str2.equals(QRUtils.v))
        {
          str1 = QRUtils.a(paramContext, str2);
          if (str1 == null) {
            break label187;
          }
          paramString1 = paramString1.replace(str2, str1);
          QLog.d("QRHttpUtil", 2, "ClientProtocolException reopen: " + paramString1);
          paramContext = a(paramContext, paramString1, str2, paramString2, paramBundle1, paramBundle2);
        }
        throw str1;
      }
      if (paramContext == null) {
        throw new IOException("Http no response.");
      }
      label187:
      for (;;)
      {
        String str1;
        int i = paramContext.getStatusLine().getStatusCode();
        if (i == 200) {
          return a(paramContext);
        }
        throw new IOException("Http statusCode:" + i);
      }
    }
  }
  
  public static String a(Bundle paramBundle)
  {
    if (paramBundle == null) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator = paramBundle.keySet().iterator();
    int i = 1;
    while (localIterator.hasNext())
    {
      Object localObject1 = (String)localIterator.next();
      Object localObject2 = paramBundle.get((String)localObject1);
      if (((localObject2 instanceof String)) || ((localObject2 instanceof String[]))) {
        if ((localObject2 instanceof String[]))
        {
          int j;
          if (i != 0)
          {
            i = 0;
            localStringBuilder.append(URLEncoder.encode((String)localObject1) + "=");
            localObject1 = (String[])paramBundle.getStringArray((String)localObject1);
            j = 0;
            label131:
            if (j >= localObject1.length) {
              break label206;
            }
            if (j != 0) {
              break label172;
            }
            localStringBuilder.append(URLEncoder.encode(localObject1[j]));
          }
          for (;;)
          {
            j += 1;
            break label131;
            localStringBuilder.append("&");
            break;
            label172:
            localStringBuilder.append(URLEncoder.encode("," + localObject1[j]));
          }
        }
        else
        {
          label206:
          if (i != 0) {
            i = 0;
          }
          for (;;)
          {
            localStringBuilder.append(URLEncoder.encode((String)localObject1) + "=" + URLEncoder.encode(paramBundle.getString((String)localObject1)));
            break;
            localStringBuilder.append("&");
          }
        }
      }
    }
    return localStringBuilder.toString();
  }
  
  public static String a(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return "";
    }
    return paramString.replace("&", "&amp;").replace("'", "&apos;").replace("\"", "&quot;").replace(" ", "&nbsp;").replace("<", "&lt;").replace(">", "&gt;");
  }
  
  /* Error */
  public static final String a(String paramString1, String paramString2, String paramString3, Map paramMap1, Map paramMap2, Map paramMap3)
  {
    // Byte code:
    //   0: aload_1
    //   1: invokestatic 358	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   4: ifne +17 -> 21
    //   7: aload_2
    //   8: invokestatic 358	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   11: ifne +10 -> 21
    //   14: aload_0
    //   15: invokestatic 358	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   18: ifeq +7 -> 25
    //   21: aconst_null
    //   22: astore_0
    //   23: aload_0
    //   24: areturn
    //   25: aconst_null
    //   26: astore 7
    //   28: new 385	java/net/URL
    //   31: dup
    //   32: aload_0
    //   33: invokespecial 386	java/net/URL:<init>	(Ljava/lang/String;)V
    //   36: invokevirtual 390	java/net/URL:openConnection	()Ljava/net/URLConnection;
    //   39: checkcast 392	java/net/HttpURLConnection
    //   42: astore 8
    //   44: aload 8
    //   46: sipush 5000
    //   49: invokevirtual 396	java/net/HttpURLConnection:setConnectTimeout	(I)V
    //   52: aload 8
    //   54: sipush 30000
    //   57: invokevirtual 399	java/net/HttpURLConnection:setReadTimeout	(I)V
    //   60: aload 8
    //   62: iconst_1
    //   63: invokevirtual 403	java/net/HttpURLConnection:setDoOutput	(Z)V
    //   66: aload 8
    //   68: iconst_1
    //   69: invokevirtual 406	java/net/HttpURLConnection:setDoInput	(Z)V
    //   72: aload 8
    //   74: iconst_0
    //   75: invokevirtual 409	java/net/HttpURLConnection:setUseCaches	(Z)V
    //   78: aload 8
    //   80: ldc 18
    //   82: invokevirtual 412	java/net/HttpURLConnection:setRequestMethod	(Ljava/lang/String;)V
    //   85: aload 8
    //   87: ldc_w 414
    //   90: ldc_w 416
    //   93: invokevirtual 419	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   96: aload 8
    //   98: ldc_w 421
    //   101: new 207	java/lang/StringBuilder
    //   104: dup
    //   105: ldc_w 423
    //   108: invokespecial 424	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   111: ldc_w 426
    //   114: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   117: getstatic 429	android/os/Build$VERSION:SDK	Ljava/lang/String;
    //   120: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   123: ldc_w 426
    //   126: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   129: getstatic 434	android/os/Build:DEVICE	Ljava/lang/String;
    //   132: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   135: ldc_w 426
    //   138: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   141: getstatic 437	android/os/Build$VERSION:RELEASE	Ljava/lang/String;
    //   144: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   147: ldc_w 426
    //   150: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   153: ldc_w 439
    //   156: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   159: invokevirtual 219	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   162: invokevirtual 419	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   165: aload 8
    //   167: ldc_w 441
    //   170: new 207	java/lang/StringBuilder
    //   173: dup
    //   174: invokespecial 208	java/lang/StringBuilder:<init>	()V
    //   177: ldc_w 443
    //   180: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   183: ldc_w 445
    //   186: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   189: invokevirtual 219	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   192: invokevirtual 419	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   195: aload 5
    //   197: astore 7
    //   199: aload 5
    //   201: ifnonnull +12 -> 213
    //   204: new 447	java/util/HashMap
    //   207: dup
    //   208: invokespecial 448	java/util/HashMap:<init>	()V
    //   211: astore 7
    //   213: aload 7
    //   215: ldc -51
    //   217: new 207	java/lang/StringBuilder
    //   220: dup
    //   221: invokespecial 208	java/lang/StringBuilder:<init>	()V
    //   224: ldc -46
    //   226: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   229: aload_1
    //   230: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   233: ldc -40
    //   235: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   238: aload_2
    //   239: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   242: invokevirtual 219	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   245: invokeinterface 454 3 0
    //   250: pop
    //   251: aload 7
    //   253: invokeinterface 457 1 0
    //   258: invokeinterface 321 1 0
    //   263: astore_1
    //   264: aload_1
    //   265: invokeinterface 326 1 0
    //   270: ifeq +87 -> 357
    //   273: aload_1
    //   274: invokeinterface 330 1 0
    //   279: checkcast 459	java/util/Map$Entry
    //   282: astore_2
    //   283: aload 8
    //   285: aload_2
    //   286: invokeinterface 462 1 0
    //   291: checkcast 163	java/lang/String
    //   294: aload_2
    //   295: invokeinterface 464 1 0
    //   300: checkcast 163	java/lang/String
    //   303: invokevirtual 419	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   306: goto -42 -> 264
    //   309: astore_1
    //   310: aload 8
    //   312: astore_2
    //   313: aconst_null
    //   314: astore_1
    //   315: aload_2
    //   316: astore 7
    //   318: ldc_w 466
    //   321: iconst_2
    //   322: new 207	java/lang/StringBuilder
    //   325: dup
    //   326: invokespecial 208	java/lang/StringBuilder:<init>	()V
    //   329: ldc_w 468
    //   332: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   335: aload_0
    //   336: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   339: invokevirtual 219	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   342: invokestatic 255	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   345: aload_1
    //   346: astore_0
    //   347: aload_2
    //   348: ifnull -325 -> 23
    //   351: aload_2
    //   352: invokevirtual 471	java/net/HttpURLConnection:disconnect	()V
    //   355: aload_1
    //   356: areturn
    //   357: new 473	java/io/DataOutputStream
    //   360: dup
    //   361: aload 8
    //   363: invokevirtual 477	java/net/HttpURLConnection:getOutputStream	()Ljava/io/OutputStream;
    //   366: invokespecial 480	java/io/DataOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   369: astore_2
    //   370: aload_3
    //   371: ifnull +169 -> 540
    //   374: new 482	java/lang/StringBuffer
    //   377: dup
    //   378: invokespecial 483	java/lang/StringBuffer:<init>	()V
    //   381: astore_1
    //   382: aload_3
    //   383: invokeinterface 457 1 0
    //   388: invokeinterface 321 1 0
    //   393: astore 5
    //   395: aload 5
    //   397: invokeinterface 326 1 0
    //   402: ifeq +127 -> 529
    //   405: aload 5
    //   407: invokeinterface 330 1 0
    //   412: checkcast 459	java/util/Map$Entry
    //   415: astore 7
    //   417: aload 7
    //   419: invokeinterface 462 1 0
    //   424: checkcast 163	java/lang/String
    //   427: astore_3
    //   428: aload 7
    //   430: invokeinterface 464 1 0
    //   435: checkcast 163	java/lang/String
    //   438: astore 7
    //   440: aload 7
    //   442: ifnull -47 -> 395
    //   445: aload_1
    //   446: ldc_w 485
    //   449: invokevirtual 488	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   452: ldc_w 490
    //   455: invokevirtual 488	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   458: ldc_w 445
    //   461: invokevirtual 488	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   464: ldc_w 485
    //   467: invokevirtual 488	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   470: pop
    //   471: aload_1
    //   472: new 207	java/lang/StringBuilder
    //   475: dup
    //   476: invokespecial 208	java/lang/StringBuilder:<init>	()V
    //   479: ldc_w 492
    //   482: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   485: aload_3
    //   486: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   489: ldc_w 494
    //   492: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   495: invokevirtual 219	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   498: invokevirtual 488	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   501: pop
    //   502: aload_1
    //   503: aload 7
    //   505: invokevirtual 488	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   508: pop
    //   509: goto -114 -> 395
    //   512: astore_0
    //   513: aload 8
    //   515: astore 7
    //   517: aload 7
    //   519: ifnull +8 -> 527
    //   522: aload 7
    //   524: invokevirtual 471	java/net/HttpURLConnection:disconnect	()V
    //   527: aload_0
    //   528: athrow
    //   529: aload_2
    //   530: aload_1
    //   531: invokevirtual 495	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   534: invokevirtual 499	java/lang/String:getBytes	()[B
    //   537: invokevirtual 504	java/io/OutputStream:write	([B)V
    //   540: aload 4
    //   542: ifnull +385 -> 927
    //   545: aload 4
    //   547: invokeinterface 457 1 0
    //   552: invokeinterface 321 1 0
    //   557: astore_3
    //   558: aload_3
    //   559: invokeinterface 326 1 0
    //   564: ifeq +363 -> 927
    //   567: aload_3
    //   568: invokeinterface 330 1 0
    //   573: checkcast 459	java/util/Map$Entry
    //   576: astore_1
    //   577: aload_1
    //   578: invokeinterface 462 1 0
    //   583: checkcast 163	java/lang/String
    //   586: astore 5
    //   588: aload_1
    //   589: invokeinterface 464 1 0
    //   594: checkcast 163	java/lang/String
    //   597: astore_1
    //   598: aload_1
    //   599: ifnull -41 -> 558
    //   602: new 506	java/io/File
    //   605: dup
    //   606: aload_1
    //   607: invokespecial 507	java/io/File:<init>	(Ljava/lang/String;)V
    //   610: astore 4
    //   612: aload 4
    //   614: invokevirtual 510	java/io/File:getName	()Ljava/lang/String;
    //   617: astore 7
    //   619: aload 7
    //   621: ldc_w 512
    //   624: invokevirtual 515	java/lang/String:endsWith	(Ljava/lang/String;)Z
    //   627: ifeq +3 -> 630
    //   630: ldc_w 517
    //   633: astore_1
    //   634: ldc_w 517
    //   637: ifnull +427 -> 1064
    //   640: ldc_w 517
    //   643: ldc_w 311
    //   646: invokevirtual 280	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   649: ifeq +6 -> 655
    //   652: goto +412 -> 1064
    //   655: new 482	java/lang/StringBuffer
    //   658: dup
    //   659: invokespecial 483	java/lang/StringBuffer:<init>	()V
    //   662: astore 9
    //   664: aload 9
    //   666: ldc_w 485
    //   669: invokevirtual 488	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   672: ldc_w 490
    //   675: invokevirtual 488	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   678: ldc_w 445
    //   681: invokevirtual 488	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   684: ldc_w 485
    //   687: invokevirtual 488	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   690: pop
    //   691: aload 9
    //   693: new 207	java/lang/StringBuilder
    //   696: dup
    //   697: invokespecial 208	java/lang/StringBuilder:<init>	()V
    //   700: ldc_w 492
    //   703: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   706: aload 5
    //   708: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   711: ldc_w 519
    //   714: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   717: aload 7
    //   719: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   722: ldc_w 521
    //   725: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   728: invokevirtual 219	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   731: invokevirtual 488	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   734: pop
    //   735: aload 9
    //   737: new 207	java/lang/StringBuilder
    //   740: dup
    //   741: invokespecial 208	java/lang/StringBuilder:<init>	()V
    //   744: ldc_w 523
    //   747: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   750: aload_1
    //   751: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   754: ldc_w 525
    //   757: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   760: invokevirtual 219	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   763: invokevirtual 488	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   766: pop
    //   767: aload_2
    //   768: aload 9
    //   770: invokevirtual 495	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   773: invokevirtual 499	java/lang/String:getBytes	()[B
    //   776: invokevirtual 504	java/io/OutputStream:write	([B)V
    //   779: new 527	java/io/DataInputStream
    //   782: dup
    //   783: new 529	java/io/FileInputStream
    //   786: dup
    //   787: aload 4
    //   789: invokespecial 532	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   792: invokespecial 533	java/io/DataInputStream:<init>	(Ljava/io/InputStream;)V
    //   795: astore 5
    //   797: sipush 1024
    //   800: newarray byte
    //   802: astore_1
    //   803: aload 5
    //   805: aload_1
    //   806: invokevirtual 534	java/io/DataInputStream:read	([B)I
    //   809: istore 6
    //   811: iload 6
    //   813: iconst_m1
    //   814: if_icmpeq +97 -> 911
    //   817: aload_2
    //   818: aload_1
    //   819: iconst_0
    //   820: iload 6
    //   822: invokevirtual 535	java/io/OutputStream:write	([BII)V
    //   825: goto -22 -> 803
    //   828: astore_1
    //   829: getstatic 45	com/tencent/biz/common/util/HttpUtil:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   832: iconst_2
    //   833: new 207	java/lang/StringBuilder
    //   836: dup
    //   837: invokespecial 208	java/lang/StringBuilder:<init>	()V
    //   840: ldc_w 537
    //   843: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   846: aload 4
    //   848: invokevirtual 541	java/io/File:length	()J
    //   851: invokevirtual 544	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   854: ldc_w 546
    //   857: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   860: aload 4
    //   862: invokevirtual 549	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   865: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   868: invokevirtual 219	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   871: invokestatic 551	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   874: aload_2
    //   875: invokevirtual 554	java/io/OutputStream:flush	()V
    //   878: aload_2
    //   879: invokevirtual 555	java/io/OutputStream:close	()V
    //   882: aload 8
    //   884: invokevirtual 471	java/net/HttpURLConnection:disconnect	()V
    //   887: aconst_null
    //   888: astore 7
    //   890: aconst_null
    //   891: astore_1
    //   892: aload 5
    //   894: invokevirtual 556	java/io/DataInputStream:close	()V
    //   897: aload_1
    //   898: astore_0
    //   899: iconst_0
    //   900: ifeq -877 -> 23
    //   903: new 558	java/lang/NullPointerException
    //   906: dup
    //   907: invokespecial 559	java/lang/NullPointerException:<init>	()V
    //   910: athrow
    //   911: aload 5
    //   913: invokevirtual 556	java/io/DataInputStream:close	()V
    //   916: goto -358 -> 558
    //   919: astore_1
    //   920: aload 5
    //   922: invokevirtual 556	java/io/DataInputStream:close	()V
    //   925: aload_1
    //   926: athrow
    //   927: aload_2
    //   928: new 207	java/lang/StringBuilder
    //   931: dup
    //   932: invokespecial 208	java/lang/StringBuilder:<init>	()V
    //   935: ldc_w 561
    //   938: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   941: ldc_w 445
    //   944: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   947: ldc_w 563
    //   950: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   953: invokevirtual 219	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   956: invokevirtual 499	java/lang/String:getBytes	()[B
    //   959: invokevirtual 504	java/io/OutputStream:write	([B)V
    //   962: aload_2
    //   963: invokevirtual 554	java/io/OutputStream:flush	()V
    //   966: aload_2
    //   967: invokevirtual 555	java/io/OutputStream:close	()V
    //   970: new 482	java/lang/StringBuffer
    //   973: dup
    //   974: invokespecial 483	java/lang/StringBuffer:<init>	()V
    //   977: astore_3
    //   978: new 565	java/io/BufferedReader
    //   981: dup
    //   982: new 567	java/io/InputStreamReader
    //   985: dup
    //   986: aload 8
    //   988: invokevirtual 570	java/net/HttpURLConnection:getInputStream	()Ljava/io/InputStream;
    //   991: invokespecial 571	java/io/InputStreamReader:<init>	(Ljava/io/InputStream;)V
    //   994: invokespecial 574	java/io/BufferedReader:<init>	(Ljava/io/Reader;)V
    //   997: astore_2
    //   998: aload_2
    //   999: invokevirtual 577	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   1002: astore_1
    //   1003: aload_1
    //   1004: ifnull +18 -> 1022
    //   1007: aload_3
    //   1008: aload_1
    //   1009: invokevirtual 488	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   1012: ldc_w 579
    //   1015: invokevirtual 488	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   1018: pop
    //   1019: goto -21 -> 998
    //   1022: aload_3
    //   1023: invokevirtual 495	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   1026: astore_1
    //   1027: aload_2
    //   1028: invokevirtual 580	java/io/BufferedReader:close	()V
    //   1031: aload 8
    //   1033: ifnull +29 -> 1062
    //   1036: aload 8
    //   1038: invokevirtual 471	java/net/HttpURLConnection:disconnect	()V
    //   1041: aload_1
    //   1042: areturn
    //   1043: astore_0
    //   1044: goto -527 -> 517
    //   1047: aconst_null
    //   1048: astore_2
    //   1049: astore_1
    //   1050: aconst_null
    //   1051: astore_1
    //   1052: goto -737 -> 315
    //   1055: astore_2
    //   1056: aload 8
    //   1058: astore_2
    //   1059: goto -744 -> 315
    //   1062: aload_1
    //   1063: areturn
    //   1064: ldc_w 582
    //   1067: astore_1
    //   1068: goto -413 -> 655
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1071	0	paramString1	String
    //   0	1071	1	paramString2	String
    //   0	1071	2	paramString3	String
    //   0	1071	3	paramMap1	Map
    //   0	1071	4	paramMap2	Map
    //   0	1071	5	paramMap3	Map
    //   809	12	6	i	int
    //   26	863	7	localObject	Object
    //   42	1015	8	localHttpURLConnection	java.net.HttpURLConnection
    //   662	107	9	localStringBuffer	StringBuffer
    // Exception table:
    //   from	to	target	type
    //   44	195	309	java/lang/Exception
    //   204	213	309	java/lang/Exception
    //   213	264	309	java/lang/Exception
    //   264	306	309	java/lang/Exception
    //   357	370	309	java/lang/Exception
    //   374	395	309	java/lang/Exception
    //   395	440	309	java/lang/Exception
    //   445	509	309	java/lang/Exception
    //   529	540	309	java/lang/Exception
    //   545	558	309	java/lang/Exception
    //   558	598	309	java/lang/Exception
    //   602	630	309	java/lang/Exception
    //   640	652	309	java/lang/Exception
    //   655	803	309	java/lang/Exception
    //   911	916	309	java/lang/Exception
    //   920	927	309	java/lang/Exception
    //   927	998	309	java/lang/Exception
    //   998	1003	309	java/lang/Exception
    //   1007	1019	309	java/lang/Exception
    //   1022	1027	309	java/lang/Exception
    //   44	195	512	finally
    //   204	213	512	finally
    //   213	264	512	finally
    //   264	306	512	finally
    //   357	370	512	finally
    //   374	395	512	finally
    //   395	440	512	finally
    //   445	509	512	finally
    //   529	540	512	finally
    //   545	558	512	finally
    //   558	598	512	finally
    //   602	630	512	finally
    //   640	652	512	finally
    //   655	803	512	finally
    //   911	916	512	finally
    //   920	927	512	finally
    //   927	998	512	finally
    //   998	1003	512	finally
    //   1007	1019	512	finally
    //   1022	1027	512	finally
    //   1027	1031	512	finally
    //   803	811	828	java/lang/OutOfMemoryError
    //   817	825	828	java/lang/OutOfMemoryError
    //   803	811	919	finally
    //   817	825	919	finally
    //   829	887	919	finally
    //   28	44	1043	finally
    //   318	345	1043	finally
    //   892	897	1043	finally
    //   28	44	1047	java/lang/Exception
    //   892	897	1047	java/lang/Exception
    //   1027	1031	1055	java/lang/Exception
  }
  
  public static String a(Map paramMap)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator = paramMap.keySet().iterator();
    int i = 1;
    if (localIterator.hasNext())
    {
      String str3 = (String)localIterator.next();
      String str2 = (String)paramMap.get(str3);
      String str1 = str2;
      if (str2 == null) {
        str1 = "";
      }
      if (i != 0)
      {
        localStringBuilder.append(str3 + "=" + URLEncoder.encode(str1, "utf-8"));
        i = 0;
      }
      for (;;)
      {
        break;
        if (str1 != null) {
          localStringBuilder.append("&" + str3 + "=" + URLEncoder.encode(str1, "utf-8"));
        } else {
          localStringBuilder.append("&" + str3 + "=");
        }
      }
    }
    return localStringBuilder.toString();
  }
  
  public static String a(HttpResponse paramHttpResponse)
  {
    return new String(a(paramHttpResponse).toByteArray());
  }
  
  public static final HashMap a(Context paramContext, String paramString1, String paramString2, int paramInt, HashMap paramHashMap)
  {
    if (paramHashMap == null) {
      paramContext = new HashMap();
    }
    for (;;)
    {
      return paramContext;
      HashMap localHashMap = new HashMap(paramHashMap);
      JSONArray localJSONArray = new JSONArray();
      ArrayList localArrayList = new ArrayList();
      Iterator localIterator = paramHashMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str1 = (String)localIterator.next();
        String str2 = (String)paramHashMap.get(str1);
        if (!TextUtils.isEmpty(str2))
        {
          localJSONArray.put(str2);
          localArrayList.add(str1);
        }
      }
      paramContext = a(paramContext, paramString1, paramString2, paramInt, localJSONArray);
      if (paramContext != null) {}
      try
      {
        paramContext = new JSONObject(paramContext);
        if (paramContext.getInt("retcode") == 0)
        {
          paramContext = paramContext.getJSONObject("result");
          if (paramContext == null) {
            return localHashMap;
          }
          paramString2 = paramContext.getJSONArray("list");
          if (paramString2 == null) {
            return localHashMap;
          }
          if (paramString2.length() == localArrayList.size())
          {
            paramString1 = new HashMap();
            paramInt = 0;
            for (;;)
            {
              paramContext = paramString1;
              if (paramInt >= paramString2.length()) {
                break;
              }
              paramString1.put(localArrayList.get(paramInt), paramString2.getString(paramInt));
              paramInt += 1;
            }
          }
          QLog.e("sdk_share", 4, "!!!!urlArray.length() != srcKeyArray.size()");
        }
      }
      catch (JSONException paramContext)
      {
        for (;;)
        {
          QLog.d("sdk_share", 4, paramContext.getMessage());
        }
      }
    }
    return localHashMap;
  }
  
  public static final HashMap a(HashMap paramHashMap)
  {
    if (paramHashMap == null) {
      return new HashMap();
    }
    HashMap localHashMap = new HashMap(paramHashMap);
    Object localObject1 = new JSONArray();
    ArrayList localArrayList = new ArrayList();
    Object localObject2 = paramHashMap.keySet().iterator();
    while (((Iterator)localObject2).hasNext())
    {
      String str1 = (String)((Iterator)localObject2).next();
      String str2 = (String)paramHashMap.get(str1);
      if (!TextUtils.isEmpty(str2))
      {
        ((JSONArray)localObject1).put(str2);
        localArrayList.add(str1);
      }
    }
    paramHashMap = new Bundle();
    paramHashMap.putString("Referer", "http://openmobile.qq.com/");
    localObject2 = new Bundle();
    ((Bundle)localObject2).putString("value", ((JSONArray)localObject1).toString());
    ((Bundle)localObject2).putString("mType", "qb_share");
    localObject1 = null;
    try
    {
      paramHashMap = a(BaseApplication.getContext(), MsfSdkUtils.insertMtype("AppDepart", "http://openmobile.qq.com/api/shortUrl"), "POST", (Bundle)localObject2, paramHashMap);
      if (TextUtils.isEmpty(paramHashMap)) {
        return localHashMap;
      }
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        paramHashMap = (HashMap)localObject1;
        if (QLog.isColorLevel())
        {
          QLog.d(jdField_a_of_type_JavaLangString, 2, localIOException.getMessage());
          paramHashMap = (HashMap)localObject1;
        }
      }
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
      for (;;)
      {
        paramHashMap = (HashMap)localObject1;
        if (QLog.isColorLevel())
        {
          QLog.d(jdField_a_of_type_JavaLangString, 2, localOutOfMemoryError.getMessage());
          paramHashMap = (HashMap)localObject1;
        }
      }
    }
    for (;;)
    {
      int i;
      try
      {
        paramHashMap = new JSONObject(paramHashMap);
        i = paramHashMap.getInt("retcode");
        if (i != 0)
        {
          if (!QLog.isColorLevel()) {
            break label445;
          }
          QLog.d(jdField_a_of_type_JavaLangString, 2, "shortenUrl error retcode:" + i);
          break label445;
        }
        paramHashMap = paramHashMap.getJSONObject("result");
        if (paramHashMap == null)
        {
          if (!QLog.isColorLevel()) {
            break label447;
          }
          QLog.d(jdField_a_of_type_JavaLangString, 2, "shortenUrl error result");
          break label447;
        }
        paramHashMap = paramHashMap.getJSONArray("list");
        if (paramHashMap == null)
        {
          if (!QLog.isColorLevel()) {
            break label449;
          }
          QLog.d(jdField_a_of_type_JavaLangString, 2, "shortenUrl error result");
          break label449;
        }
        if (paramHashMap.length() == localArrayList.size())
        {
          i = 0;
          if (i < paramHashMap.length())
          {
            localObject1 = paramHashMap.getString(i);
            if (TextUtils.isEmpty((CharSequence)localObject1)) {
              break label451;
            }
            localHashMap.put(localArrayList.get(i), localObject1);
            break label451;
          }
        }
        else if (QLog.isColorLevel())
        {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "shortenUrl error result size");
        }
      }
      catch (JSONException paramHashMap)
      {
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d(jdField_a_of_type_JavaLangString, 2, "shortenUrl parse response error");
        continue;
      }
      return localHashMap;
      label445:
      return localHashMap;
      label447:
      return localHashMap;
      label449:
      return localHashMap;
      label451:
      i += 1;
    }
  }
  
  public static HttpResponse a(Context paramContext, String paramString1, String paramString2, String paramString3, Bundle paramBundle1, Bundle paramBundle2)
  {
    return a(paramContext, paramString1, paramString2, paramString3, paramBundle1, paramBundle2, 15000, 30000);
  }
  
  public static HttpResponse a(Context paramContext, String paramString1, String paramString2, String paramString3, Bundle paramBundle1, Bundle paramBundle2, int paramInt1, int paramInt2)
  {
    if (!jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_Boolean = true;
      QRUtils.a(paramContext, QRUtils.v);
    }
    if (paramContext == null) {
      return null;
    }
    HttpClient localHttpClient = a(paramContext, paramInt1, paramInt2);
    if (localHttpClient == null) {
      return null;
    }
    QLog.d("QRHttpUtil", 2, paramString1);
    paramContext = paramString1;
    if (paramString1.contains("#")) {
      paramContext = paramString1.substring(0, paramString1.indexOf('#'));
    }
    paramString1 = paramContext.replace(" ", "");
    if ("GET".equals(paramString3))
    {
      paramString3 = a(paramBundle1);
      paramContext = paramString1;
      if (paramString3 != null)
      {
        paramContext = paramString1;
        if (paramString3.length() > 0)
        {
          paramBundle1 = new StringBuilder().append(paramString1);
          if (!paramString1.contains("?")) {
            break label240;
          }
          paramContext = "&";
        }
      }
      for (;;)
      {
        paramContext = paramContext + paramString3;
        try
        {
          paramContext = new HttpGet(paramContext);
          paramContext.addHeader("Accept-Encoding", "gzip");
          if (paramBundle2 != null)
          {
            paramString1 = paramBundle2.keySet().iterator();
            while (paramString1.hasNext())
            {
              paramString3 = (String)paramString1.next();
              paramBundle1 = paramBundle2.get(paramString3);
              if ((paramBundle1 instanceof String))
              {
                paramContext.addHeader(paramString3, (String)paramBundle1);
                continue;
                label240:
                paramContext = "?";
              }
            }
          }
        }
        catch (Exception paramContext)
        {
          return null;
        }
      }
    }
    for (;;)
    {
      if (!TextUtils.isEmpty(paramString2)) {
        paramContext.getParams().setParameter("http.virtual-host", new HttpHost(paramString2));
      }
      try
      {
        paramContext = localHttpClient.execute(paramContext);
        return paramContext;
      }
      catch (IOException paramContext)
      {
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("QRHttpUtil", 2, "openRequest fail IOException", paramContext);
        return null;
      }
      catch (OutOfMemoryError paramContext)
      {
        if (!QLog.isColorLevel()) {
          break label449;
        }
        QLog.d("QRHttpUtil", 2, "openRequest fail OutOfMemoryError");
        return null;
      }
      catch (Exception paramContext)
      {
        if (!QLog.isColorLevel()) {
          break label469;
        }
        QLog.d("QRHttpUtil", 2, "openRequest fail Exception", paramContext);
      }
      paramContext = new HttpPost(paramString1);
      paramContext.addHeader("Accept-Encoding", "gzip");
      paramString1 = a(paramBundle1);
      paramContext.setHeader("Content-Type", "application/x-www-form-urlencoded");
      paramString1 = paramString1.getBytes();
      if (paramBundle2 != null)
      {
        paramString3 = paramBundle2.keySet().iterator();
        while (paramString3.hasNext())
        {
          paramBundle1 = (String)paramString3.next();
          Object localObject = paramBundle2.get(paramBundle1);
          if ((localObject instanceof String)) {
            paramContext.addHeader(paramBundle1, (String)localObject);
          }
        }
      }
      paramContext.setEntity(new ByteArrayEntity(paramString1));
    }
    label449:
    label469:
    return null;
  }
  
  private static HttpClient a(Context paramContext, int paramInt1, int paramInt2)
  {
    Object localObject1 = null;
    if (paramContext == null)
    {
      paramContext = (Context)localObject1;
      return paramContext;
    }
    if (Build.VERSION.SDK_INT < 16) {}
    for (;;)
    {
      try
      {
        localObject1 = KeyStore.getInstance(KeyStore.getDefaultType());
        ((KeyStore)localObject1).load(null, null);
        localObject1 = new AsyncHttpClient.CustomSSLSocketFactory((KeyStore)localObject1);
        ((SSLSocketFactory)localObject1).setHostnameVerifier(SSLSocketFactory.STRICT_HOSTNAME_VERIFIER);
        Object localObject2 = new BasicHttpParams();
        HttpConnectionParams.setConnectionTimeout((HttpParams)localObject2, paramInt1);
        HttpConnectionParams.setSoTimeout((HttpParams)localObject2, paramInt2);
        HttpProtocolParams.setVersion((HttpParams)localObject2, HttpVersion.HTTP_1_1);
        HttpProtocolParams.setContentCharset((HttpParams)localObject2, "UTF-8");
        HttpProtocolParams.setUserAgent((HttpParams)localObject2, "AndroidSDK_" + Build.VERSION.SDK + "_" + Build.DEVICE + "_" + Build.VERSION.RELEASE);
        SchemeRegistry localSchemeRegistry = new SchemeRegistry();
        localSchemeRegistry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
        localSchemeRegistry.register(new Scheme("https", (SocketFactory)localObject1, 443));
        localObject1 = new DefaultHttpClient(new ThreadSafeClientConnManager((HttpParams)localObject2, localSchemeRegistry), (HttpParams)localObject2);
        localObject2 = a(paramContext);
        paramContext = (Context)localObject1;
        if (localObject2 == null) {
          break;
        }
        paramContext = new HttpHost(jdField_a_of_type_JavaLangString, jdField_a_of_type_Int);
        ((HttpClient)localObject1).getParams().setParameter("http.route.default-proxy", paramContext);
        return localObject1;
      }
      catch (Exception localException)
      {
        localSSLSocketFactory = SSLSocketFactory.getSocketFactory();
        continue;
      }
      SSLSocketFactory localSSLSocketFactory = SSLSocketFactory.getSocketFactory();
    }
  }
  
  public static boolean a(Context paramContext)
  {
    if (paramContext == null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("HttpUtil", 2, "isConnect(), context == null");
      }
      return false;
    }
    try
    {
      paramContext = (ConnectivityManager)paramContext.getSystemService("connectivity");
      if (paramContext != null)
      {
        paramContext = paramContext.getActiveNetworkInfo();
        if ((paramContext != null) && (paramContext.isConnected()))
        {
          paramContext = paramContext.getState();
          NetworkInfo.State localState = NetworkInfo.State.CONNECTED;
          if (paramContext == localState) {
            return true;
          }
        }
      }
    }
    catch (Exception paramContext)
    {
      QLog.d("HttpUtil", 2, paramContext.toString());
    }
    return false;
  }
  
  public static final boolean a(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {}
    while ((!paramString.startsWith("http://")) && (!paramString.startsWith("https://"))) {
      return false;
    }
    return true;
  }
  
  public static byte[] a(Context paramContext, String paramString1, String paramString2, Bundle paramBundle1, Bundle paramBundle2)
  {
    if (TextUtils.isEmpty(paramString1)) {
      return null;
    }
    if (paramBundle1 == null) {
      paramBundle1 = new Bundle();
    }
    for (;;)
    {
      String str2 = Uri.parse(paramString1).getHost();
      try
      {
        HttpResponse localHttpResponse = a(paramContext, paramString1, str2, paramString2, paramBundle1, paramBundle2);
        paramContext = localHttpResponse;
      }
      catch (IOException localIOException)
      {
        while (str2.equals(QRUtils.v))
        {
          str1 = QRUtils.a(paramContext, str2);
          if (str1 == null) {
            break label199;
          }
          paramString1 = paramString1.replace(str2, str1);
          QLog.d("QRHttpUtil", 2, "ClientProtocolException reopen: " + paramString1);
          paramContext = a(paramContext, paramString1, str2, paramString2, paramBundle1, paramBundle2);
        }
        throw str1;
      }
      if (paramContext == null) {
        throw new IOException("Http no response.");
      }
      label199:
      for (;;)
      {
        String str1;
        int i = paramContext.getStatusLine().getStatusCode();
        if (i == 200) {
          return a(paramContext).toByteArray();
        }
        throw new IOException("Http statusCode:" + i);
      }
    }
  }
  
  public static String b(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return "";
    }
    return paramString.replace("&apos;", "'").replace("&quot;", "\"").replace("&nbsp;", " ").replace("&lt;", "<").replace("&gt;", ">").replace("&amp;", "&");
  }
  
  private static boolean b(String paramString)
  {
    return (paramString == null) || (paramString.length() == 0);
  }
  
  public static String c(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return "";
    }
    Object localObject = new String[27];
    localObject[0] = "li";
    localObject[1] = "del";
    localObject[2] = "ins";
    localObject[3] = "fieldset";
    localObject[4] = "legend";
    localObject[5] = "tr";
    localObject[6] = "th";
    localObject[7] = "caption";
    localObject[8] = "thead";
    localObject[9] = "tbody";
    localObject[10] = "tfoot";
    localObject[11] = "p";
    localObject[12] = "h[1-6]";
    localObject[13] = "dl";
    localObject[14] = "dt";
    localObject[15] = "dd";
    localObject[16] = "ol";
    localObject[17] = "ul";
    localObject[18] = "dir";
    localObject[19] = "address";
    localObject[20] = "blockquote";
    localObject[21] = "center";
    localObject[22] = "hr";
    localObject[23] = "pre";
    localObject[24] = "form";
    localObject[25] = "textarea";
    localObject[26] = "table";
    int j = localObject.length;
    int i = 0;
    while (i < j)
    {
      Matcher localMatcher = Pattern.compile("<(\\s*" + localObject[i] + ")[^>]*>").matcher(paramString);
      if (localMatcher.find()) {
        paramString = localMatcher.replaceAll(" ");
      }
      localMatcher = Pattern.compile("</?(\\s*" + localObject[i] + ")[^>]*>").matcher(paramString);
      if (localMatcher.find()) {
        paramString = localMatcher.replaceAll("\n");
      }
      i += 1;
    }
    localObject = Pattern.compile("<br>").matcher(paramString);
    if (((Matcher)localObject).find()) {
      paramString = ((Matcher)localObject).replaceAll("\n");
    }
    return paramString.replaceAll("<[^>]*>", "").replaceAll("[(/>)<]", "");
  }
  
  public static String d(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return "";
    }
    return paramString.replace("&nbsp;", " ").replace("<br>", " ").replace("<br/>", " ").replace("<br />", " ").replace("&amp;", "&").replace("&lt;", "<").replace("&gt;", ">").replace("&quot;", "\"").replace("&#92;", "\\").replace("&#39;", "'");
  }
}
