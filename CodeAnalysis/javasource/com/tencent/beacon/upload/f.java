package com.tencent.beacon.upload;

import android.content.Context;
import android.net.Proxy;
import com.tencent.beacon.a.b.d;
import java.io.IOException;
import java.util.Date;
import java.util.Locale;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.NoHttpResponseException;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;

public abstract class f
{
  private static f a = null;
  
  public f() {}
  
  public static f a(Context paramContext)
  {
    try
    {
      if ((a == null) && (paramContext != null)) {
        a = new a(paramContext);
      }
      paramContext = a;
      return paramContext;
    }
    finally {}
  }
  
  public abstract byte[] a(String paramString, byte[] paramArrayOfByte, e paramE, a paramA)
    throws Exception;
  
  public static final class a
    extends f
  {
    private Context a;
    
    public a(Context paramContext)
    {
      a = paramContext;
    }
    
    private static b a(String paramString1, byte[] paramArrayOfByte, String paramString2, int paramInt)
      throws Exception
    {
      if (paramString1 == null)
      {
        com.tencent.beacon.d.a.d("no destUrl!", new Object[0]);
        return null;
      }
      HttpClient localHttpClient;
      if (paramArrayOfByte != null) {
        try
        {
          paramArrayOfByte = new ByteArrayEntity(paramArrayOfByte);
          localHttpClient = a(paramString2, paramInt);
          if (localHttpClient == null)
          {
            com.tencent.beacon.d.a.d("no httpClient!", new Object[0]);
            return null;
          }
        }
        catch (Throwable paramString1)
        {
          paramArrayOfByte = null;
        }
      }
      for (;;)
      {
        com.tencent.beacon.d.a.a(paramString1);
        com.tencent.beacon.d.a.d("execute error:%s", new Object[] { paramString1.toString() });
        if (paramArrayOfByte != null) {
          paramArrayOfByte.abort();
        }
        throw new Exception(paramString1.toString());
        paramArrayOfByte = new ByteArrayEntity("".getBytes());
        break;
        paramString2 = new HttpPost(paramString1);
        try
        {
          paramString2.setHeader("wup_version", "3.0");
          paramString2.setHeader("TYPE_COMPRESS", "2");
          paramString2.setHeader("encr_type", "rsapost");
          paramString1 = d.a();
          if (paramString1 != null) {
            paramString2.setHeader("bea_key", paramString1.n());
          }
          paramString2.setEntity(paramArrayOfByte);
          paramString1 = new BasicHttpContext();
          paramArrayOfByte = localHttpClient.execute(paramString2, paramString1);
          com.tencent.beacon.d.a.h("execute request:\n %s", new Object[] { ((HttpRequest)paramString1.getAttribute("http.request")).getRequestLine().toString() });
          paramString1 = new b(paramArrayOfByte, paramString2);
          return paramString1;
        }
        catch (Throwable paramString1)
        {
          paramArrayOfByte = paramString2;
        }
      }
    }
    
    private static HttpClient a(String paramString, int paramInt)
    {
      try
      {
        BasicHttpParams localBasicHttpParams = new BasicHttpParams();
        HttpConnectionParams.setConnectionTimeout(localBasicHttpParams, 30000);
        HttpConnectionParams.setSoTimeout(localBasicHttpParams, 20000);
        HttpConnectionParams.setSocketBufferSize(localBasicHttpParams, 2000);
        localBasicHttpParams.setBooleanParameter("http.protocol.handle-redirects", false);
        DefaultHttpClient localDefaultHttpClient = new DefaultHttpClient(localBasicHttpParams);
        HttpProtocolParams.setUseExpectContinue(localBasicHttpParams, false);
        localDefaultHttpClient.setHttpRequestRetryHandler(new HttpRequestRetryHandler()
        {
          public final boolean retryRequest(IOException paramAnonymousIOException, int paramAnonymousInt, HttpContext paramAnonymousHttpContext)
          {
            if (paramAnonymousInt >= 3) {}
            do
            {
              return false;
              if ((paramAnonymousIOException instanceof NoHttpResponseException)) {
                return true;
              }
            } while (!(paramAnonymousIOException instanceof ClientProtocolException));
            return true;
          }
        });
        if ((paramString != null) && (paramString.toLowerCase(Locale.US).contains("wap")) && (paramInt != 2))
        {
          com.tencent.beacon.d.a.a("use proxy: %s, try time: %s", new Object[] { paramString, Integer.valueOf(paramInt) });
          paramString = new HttpHost(Proxy.getDefaultHost(), Proxy.getDefaultPort());
          localDefaultHttpClient.getParams().setParameter("http.route.default-proxy", paramString);
          return localDefaultHttpClient;
        }
        if (paramString != null) {
          com.tencent.beacon.d.a.a("Don't use proxy: %s, try time: %s", new Object[] { paramString, Integer.valueOf(paramInt) });
        }
        localDefaultHttpClient.getParams().removeParameter("http.route.default-proxy");
        return localDefaultHttpClient;
      }
      catch (Throwable paramString)
      {
        com.tencent.beacon.d.a.a(paramString);
        com.tencent.beacon.d.a.d("httpclient error!", new Object[0]);
      }
      return null;
    }
    
    /* Error */
    private byte[] a(HttpResponse paramHttpResponse, HttpPost paramHttpPost)
    {
      // Byte code:
      //   0: aconst_null
      //   1: astore 6
      //   3: aload_1
      //   4: ifnonnull +10 -> 14
      //   7: aload 6
      //   9: astore 4
      //   11: aload 4
      //   13: areturn
      //   14: aload_1
      //   15: invokeinterface 236 1 0
      //   20: invokeinterface 241 1 0
      //   25: istore_3
      //   26: iload_3
      //   27: sipush 200
      //   30: if_icmpeq +30 -> 60
      //   33: ldc -13
      //   35: iconst_2
      //   36: anewarray 25	java/lang/Object
      //   39: dup
      //   40: iconst_0
      //   41: iload_3
      //   42: invokestatic 193	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
      //   45: aastore
      //   46: dup
      //   47: iconst_1
      //   48: aload_1
      //   49: invokeinterface 236 1 0
      //   54: aastore
      //   55: invokestatic 246	com/tencent/beacon/d/a:c	(Ljava/lang/String;[Ljava/lang/Object;)V
      //   58: aconst_null
      //   59: areturn
      //   60: aload_1
      //   61: ldc -8
      //   63: invokeinterface 251 2 0
      //   68: ifeq +58 -> 126
      //   71: aload_1
      //   72: ldc -3
      //   74: invokeinterface 251 2 0
      //   79: ifeq +47 -> 126
      //   82: aload_1
      //   83: ldc -8
      //   85: invokeinterface 257 2 0
      //   90: invokeinterface 262 1 0
      //   95: astore 4
      //   97: aload_1
      //   98: ldc -3
      //   100: invokeinterface 257 2 0
      //   105: invokeinterface 262 1 0
      //   110: astore 5
      //   112: invokestatic 88	com/tencent/beacon/a/b/d:a	()Lcom/tencent/beacon/a/b/d;
      //   115: aload_0
      //   116: getfield 15	com/tencent/beacon/upload/f$a:a	Landroid/content/Context;
      //   119: aload 4
      //   121: aload 5
      //   123: invokevirtual 265	com/tencent/beacon/a/b/d:a	(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
      //   126: aload_1
      //   127: invokeinterface 269 1 0
      //   132: astore_1
      //   133: aload_1
      //   134: ifnonnull +15 -> 149
      //   137: ldc_w 271
      //   140: iconst_0
      //   141: anewarray 25	java/lang/Object
      //   144: invokestatic 31	com/tencent/beacon/d/a:d	(Ljava/lang/String;[Ljava/lang/Object;)V
      //   147: aconst_null
      //   148: areturn
      //   149: new 273	java/io/BufferedInputStream
      //   152: dup
      //   153: new 275	java/io/DataInputStream
      //   156: dup
      //   157: aload_1
      //   158: invokeinterface 281 1 0
      //   163: invokespecial 284	java/io/DataInputStream:<init>	(Ljava/io/InputStream;)V
      //   166: invokespecial 285	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;)V
      //   169: astore 4
      //   171: aload 4
      //   173: astore_1
      //   174: new 287	java/io/ByteArrayOutputStream
      //   177: dup
      //   178: invokespecial 288	java/io/ByteArrayOutputStream:<init>	()V
      //   181: astore 5
      //   183: aload 4
      //   185: astore_1
      //   186: aload 4
      //   188: invokevirtual 291	java/io/BufferedInputStream:read	()I
      //   191: istore_3
      //   192: iload_3
      //   193: iconst_m1
      //   194: if_icmpeq +70 -> 264
      //   197: aload 4
      //   199: astore_1
      //   200: aload 5
      //   202: iload_3
      //   203: invokevirtual 295	java/io/ByteArrayOutputStream:write	(I)V
      //   206: goto -23 -> 183
      //   209: astore 5
      //   211: aload 4
      //   213: astore_1
      //   214: aload 5
      //   216: invokestatic 44	com/tencent/beacon/d/a:a	(Ljava/lang/Throwable;)V
      //   219: aload 4
      //   221: astore_1
      //   222: ldc_w 297
      //   225: iconst_1
      //   226: anewarray 25	java/lang/Object
      //   229: dup
      //   230: iconst_0
      //   231: aload 5
      //   233: invokevirtual 50	java/lang/Throwable:toString	()Ljava/lang/String;
      //   236: aastore
      //   237: invokestatic 31	com/tencent/beacon/d/a:d	(Ljava/lang/String;[Ljava/lang/Object;)V
      //   240: aload 4
      //   242: ifnull +8 -> 250
      //   245: aload 4
      //   247: invokevirtual 300	java/io/BufferedInputStream:close	()V
      //   250: aload 6
      //   252: astore 4
      //   254: aload_2
      //   255: ifnull -244 -> 11
      //   258: aload_2
      //   259: invokevirtual 55	org/apache/http/client/methods/HttpPost:abort	()V
      //   262: aconst_null
      //   263: areturn
      //   264: aload 4
      //   266: astore_1
      //   267: aload 5
      //   269: invokevirtual 303	java/io/ByteArrayOutputStream:flush	()V
      //   272: aload 4
      //   274: astore_1
      //   275: aload 5
      //   277: invokevirtual 306	java/io/ByteArrayOutputStream:toByteArray	()[B
      //   280: astore 5
      //   282: aload 5
      //   284: astore_1
      //   285: aload 4
      //   287: invokevirtual 300	java/io/BufferedInputStream:close	()V
      //   290: aload_1
      //   291: astore 4
      //   293: aload_2
      //   294: ifnull -283 -> 11
      //   297: aload_2
      //   298: invokevirtual 55	org/apache/http/client/methods/HttpPost:abort	()V
      //   301: aload_1
      //   302: areturn
      //   303: astore 4
      //   305: aload 4
      //   307: invokestatic 44	com/tencent/beacon/d/a:a	(Ljava/lang/Throwable;)V
      //   310: goto -20 -> 290
      //   313: astore_1
      //   314: aload_1
      //   315: invokestatic 44	com/tencent/beacon/d/a:a	(Ljava/lang/Throwable;)V
      //   318: goto -68 -> 250
      //   321: astore 4
      //   323: aconst_null
      //   324: astore_1
      //   325: aload_1
      //   326: ifnull +7 -> 333
      //   329: aload_1
      //   330: invokevirtual 300	java/io/BufferedInputStream:close	()V
      //   333: aload_2
      //   334: ifnull +7 -> 341
      //   337: aload_2
      //   338: invokevirtual 55	org/apache/http/client/methods/HttpPost:abort	()V
      //   341: aload 4
      //   343: athrow
      //   344: astore_1
      //   345: aload_1
      //   346: invokestatic 44	com/tencent/beacon/d/a:a	(Ljava/lang/Throwable;)V
      //   349: goto -16 -> 333
      //   352: astore 4
      //   354: goto -29 -> 325
      //   357: astore 5
      //   359: aconst_null
      //   360: astore 4
      //   362: goto -151 -> 211
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	365	0	this	a
      //   0	365	1	paramHttpResponse	HttpResponse
      //   0	365	2	paramHttpPost	HttpPost
      //   25	178	3	i	int
      //   9	283	4	localObject1	Object
      //   303	3	4	localThrowable1	Throwable
      //   321	21	4	localObject2	Object
      //   352	1	4	localObject3	Object
      //   360	1	4	localObject4	Object
      //   110	91	5	localObject5	Object
      //   209	67	5	localThrowable2	Throwable
      //   280	3	5	arrayOfByte	byte[]
      //   357	1	5	localThrowable3	Throwable
      //   1	250	6	localObject6	Object
      // Exception table:
      //   from	to	target	type
      //   174	183	209	java/lang/Throwable
      //   186	192	209	java/lang/Throwable
      //   200	206	209	java/lang/Throwable
      //   267	272	209	java/lang/Throwable
      //   275	282	209	java/lang/Throwable
      //   285	290	303	java/lang/Throwable
      //   245	250	313	java/lang/Throwable
      //   149	171	321	finally
      //   329	333	344	java/lang/Throwable
      //   174	183	352	finally
      //   186	192	352	finally
      //   200	206	352	finally
      //   214	219	352	finally
      //   222	240	352	finally
      //   267	272	352	finally
      //   275	282	352	finally
      //   149	171	357	java/lang/Throwable
    }
    
    public final byte[] a(String paramString, byte[] paramArrayOfByte, e paramE, a paramA)
      throws Exception
    {
      if (paramString == null)
      {
        com.tencent.beacon.d.a.d("no destUrl!", new Object[0]);
        return null;
      }
      Object localObject1 = null;
      if (paramArrayOfByte == null) {}
      String str1;
      int j;
      int i;
      Object localObject2;
      int k;
      int m;
      for (long l2 = 0L;; l2 = paramArrayOfByte.length)
      {
        com.tencent.beacon.d.a.h("start req: %s sz:%d", new Object[] { paramString, Long.valueOf(l2) });
        str1 = "";
        j = 0;
        i = 0;
        localObject2 = paramString;
        paramString = "";
        k = 0;
        m = k + 1;
        if ((k >= 3) || (i >= 2)) {
          break label773;
        }
        if (j == 0) {
          break;
        }
        throw new Exception("net redirect");
      }
      if (m > 1)
      {
        com.tencent.beacon.d.a.h("try time:" + m, new Object[0]);
        if ((m == 2) && (paramA.c() == 2)) {
          paramA.b(false);
        }
      }
      long l1;
      long l4;
      int i2;
      try
      {
        Thread.sleep(5000L);
        Object localObject4 = com.tencent.beacon.a.f.u(a);
        if (paramE != null) {
          paramE.a((String)localObject2, l2, (String)localObject4, m);
        }
        l1 = new Date().getTime();
        try
        {
          localObject4 = a((String)localObject2, paramArrayOfByte, (String)localObject4, m);
          localObject1 = localObject4;
        }
        catch (Exception localException2)
        {
          HttpEntity localHttpEntity;
          long l3;
          str2 = localException2.toString();
          if (!paramString.equals(str2)) {
            break label441;
          }
          for (str1 = str1 + m + ":same ";; str1 = str1 + m + ":" + str2 + " ")
          {
            paramString = str2;
            break;
          }
          paramString = a(str2, b);
          if (paramE == null) {
            break label514;
          }
          if (paramString != null) {
            break label516;
          }
          l1 = 0L;
          paramE.a(l1, l4);
          return paramString;
        }
        l4 = new Date().getTime() - l1;
        if (localObject1 == null) {
          break label755;
        }
        localObject4 = a;
        localHttpEntity = ((HttpResponse)localObject4).getEntity();
        l1 = 0L;
        if (localHttpEntity != null)
        {
          l3 = localHttpEntity.getContentLength();
          l1 = l3;
          if (l3 < 0L) {
            l1 = 0L;
          }
        }
        i2 = ((HttpResponse)localObject4).getStatusLine().getStatusCode();
        com.tencent.beacon.d.a.h("response code:%d ", new Object[] { Integer.valueOf(i2) });
        if (i2 != 200) {
          break label524;
        }
        if (((HttpResponse)localObject4).containsHeader("encrypt-status"))
        {
          com.tencent.beacon.d.a.d("svr encry failed: " + ((HttpResponse)localObject4).getFirstHeader("encrypt-status").getValue(), new Object[0]);
          return null;
        }
      }
      catch (InterruptedException localInterruptedException)
      {
        for (;;)
        {
          com.tencent.beacon.d.a.a(localInterruptedException);
        }
      }
      String str2;
      for (;;)
      {
        label441:
        label514:
        label516:
        l1 = paramString.length;
      }
      label524:
      if ((i2 == 301) || (i2 == 302) || (i2 == 303) || (i2 == 307))
      {
        k = 1;
        label559:
        if (k == 0) {
          break label808;
        }
        m = 1;
        localObject2 = str2.getFirstHeader("Location");
        if (localObject2 != null) {
          break label639;
        }
        com.tencent.beacon.d.a.d("redirect code:" + i2 + " Location is null! return", new Object[0]);
      }
      for (;;)
      {
        try
        {
          if (b != null) {
            b.abort();
          }
          return null;
          k = 0;
          break label559;
          label639:
          n = i + 1;
          i1 = 0;
          str2 = ((Header)localObject2).getValue();
          com.tencent.beacon.d.a.h("redirect code:%d , to:%s", new Object[] { Integer.valueOf(i2), str2 });
          i = m;
          j = n;
          k = i1;
          localObject2 = str2;
          try
          {
            if (b != null)
            {
              b.abort();
              localObject2 = str2;
              k = i1;
              j = n;
              i = m;
            }
          }
          catch (Exception localException1)
          {
            i = m;
            j = n;
            k = i1;
            Object localObject3 = str2;
            continue;
          }
          if (paramE != null) {
            paramE.a(l1, l4);
          }
          m = j;
          j = i;
          i = m;
          break;
          label755:
          if (paramE != null) {
            paramE.a(0L, l4);
          }
          k = m;
          break;
          label773:
          throw new Exception(str1);
        }
        catch (Exception paramString)
        {
          int n;
          int i1;
          continue;
        }
        label808:
        k = m;
        m = i;
        i = j;
        j = m;
      }
    }
  }
}
