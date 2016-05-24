package com.google.android.gms.analytics.internal;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.os.Build.VERSION;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzlm;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.zip.GZIPOutputStream;

class zzah
  extends zzd
{
  private static final byte[] zzOs = "\n".getBytes();
  private final String zzHj = zza("GoogleAnalytics", zze.VERSION, Build.VERSION.RELEASE, zzam.zza(Locale.getDefault()), Build.MODEL, Build.ID);
  private final zzaj zzOr;
  
  zzah(zzf paramZzf)
  {
    super(paramZzf);
    zzOr = new zzaj(paramZzf.zzid());
  }
  
  /* Error */
  private int zza(URL paramURL, byte[] paramArrayOfByte)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 6
    //   3: aconst_null
    //   4: astore 8
    //   6: aconst_null
    //   7: astore 9
    //   9: aconst_null
    //   10: astore 7
    //   12: aload_1
    //   13: invokestatic 88	com/google/android/gms/common/internal/zzx:zzv	(Ljava/lang/Object;)Ljava/lang/Object;
    //   16: pop
    //   17: aload_2
    //   18: invokestatic 88	com/google/android/gms/common/internal/zzx:zzv	(Ljava/lang/Object;)Ljava/lang/Object;
    //   21: pop
    //   22: aload_0
    //   23: ldc 90
    //   25: aload_2
    //   26: arraylength
    //   27: invokestatic 96	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   30: aload_1
    //   31: invokevirtual 100	com/google/android/gms/analytics/internal/zzah:zzb	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    //   34: aload_0
    //   35: invokevirtual 104	com/google/android/gms/analytics/internal/zzah:zzin	()Z
    //   38: ifeq +17 -> 55
    //   41: aload_0
    //   42: ldc 106
    //   44: new 19	java/lang/String
    //   47: dup
    //   48: aload_2
    //   49: invokespecial 109	java/lang/String:<init>	([B)V
    //   52: invokevirtual 112	com/google/android/gms/analytics/internal/zzah:zza	(Ljava/lang/String;Ljava/lang/Object;)V
    //   55: aload_0
    //   56: aload_1
    //   57: invokevirtual 116	com/google/android/gms/analytics/internal/zzah:zzc	(Ljava/net/URL;)Ljava/net/HttpURLConnection;
    //   60: astore_1
    //   61: aload_1
    //   62: astore 6
    //   64: aload 8
    //   66: astore_1
    //   67: aload 6
    //   69: astore 5
    //   71: aload 9
    //   73: astore 7
    //   75: aload 6
    //   77: iconst_1
    //   78: invokevirtual 122	java/net/HttpURLConnection:setDoOutput	(Z)V
    //   81: aload 8
    //   83: astore_1
    //   84: aload 6
    //   86: astore 5
    //   88: aload 9
    //   90: astore 7
    //   92: aload 6
    //   94: aload_2
    //   95: arraylength
    //   96: invokevirtual 126	java/net/HttpURLConnection:setFixedLengthStreamingMode	(I)V
    //   99: aload 8
    //   101: astore_1
    //   102: aload 6
    //   104: astore 5
    //   106: aload 9
    //   108: astore 7
    //   110: aload 6
    //   112: invokevirtual 129	java/net/HttpURLConnection:connect	()V
    //   115: aload 8
    //   117: astore_1
    //   118: aload 6
    //   120: astore 5
    //   122: aload 9
    //   124: astore 7
    //   126: aload 6
    //   128: invokevirtual 133	java/net/HttpURLConnection:getOutputStream	()Ljava/io/OutputStream;
    //   131: astore 8
    //   133: aload 8
    //   135: astore_1
    //   136: aload 6
    //   138: astore 5
    //   140: aload 8
    //   142: astore 7
    //   144: aload 8
    //   146: aload_2
    //   147: invokevirtual 138	java/io/OutputStream:write	([B)V
    //   150: aload 8
    //   152: astore_1
    //   153: aload 6
    //   155: astore 5
    //   157: aload 8
    //   159: astore 7
    //   161: aload_0
    //   162: aload 6
    //   164: invokespecial 141	com/google/android/gms/analytics/internal/zzah:zzb	(Ljava/net/HttpURLConnection;)V
    //   167: aload 8
    //   169: astore_1
    //   170: aload 6
    //   172: astore 5
    //   174: aload 8
    //   176: astore 7
    //   178: aload 6
    //   180: invokevirtual 145	java/net/HttpURLConnection:getResponseCode	()I
    //   183: istore 4
    //   185: iload 4
    //   187: sipush 200
    //   190: if_icmpne +21 -> 211
    //   193: aload 8
    //   195: astore_1
    //   196: aload 6
    //   198: astore 5
    //   200: aload 8
    //   202: astore 7
    //   204: aload_0
    //   205: invokevirtual 149	com/google/android/gms/analytics/internal/zzah:zzhz	()Lcom/google/android/gms/analytics/internal/zzb;
    //   208: invokevirtual 154	com/google/android/gms/analytics/internal/zzb:zzhZ	()V
    //   211: aload 8
    //   213: astore_1
    //   214: aload 6
    //   216: astore 5
    //   218: aload 8
    //   220: astore 7
    //   222: aload_0
    //   223: ldc -100
    //   225: iload 4
    //   227: invokestatic 96	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   230: invokevirtual 158	com/google/android/gms/analytics/internal/zzah:zzb	(Ljava/lang/String;Ljava/lang/Object;)V
    //   233: aload 8
    //   235: ifnull +8 -> 243
    //   238: aload 8
    //   240: invokevirtual 161	java/io/OutputStream:close	()V
    //   243: iload 4
    //   245: istore_3
    //   246: aload 6
    //   248: ifnull +11 -> 259
    //   251: aload 6
    //   253: invokevirtual 164	java/net/HttpURLConnection:disconnect	()V
    //   256: iload 4
    //   258: istore_3
    //   259: iload_3
    //   260: ireturn
    //   261: astore_1
    //   262: aload_0
    //   263: ldc -90
    //   265: aload_1
    //   266: invokevirtual 169	com/google/android/gms/analytics/internal/zzah:zze	(Ljava/lang/String;Ljava/lang/Object;)V
    //   269: goto -26 -> 243
    //   272: astore_2
    //   273: aconst_null
    //   274: astore 6
    //   276: aload 7
    //   278: astore_1
    //   279: aload 6
    //   281: astore 5
    //   283: aload_0
    //   284: ldc -85
    //   286: aload_2
    //   287: invokevirtual 174	com/google/android/gms/analytics/internal/zzah:zzd	(Ljava/lang/String;Ljava/lang/Object;)V
    //   290: iconst_0
    //   291: istore_3
    //   292: aload 7
    //   294: ifnull +8 -> 302
    //   297: aload 7
    //   299: invokevirtual 161	java/io/OutputStream:close	()V
    //   302: aload 6
    //   304: ifnull -45 -> 259
    //   307: aload 6
    //   309: invokevirtual 164	java/net/HttpURLConnection:disconnect	()V
    //   312: iconst_0
    //   313: ireturn
    //   314: astore_1
    //   315: aload_0
    //   316: ldc -90
    //   318: aload_1
    //   319: invokevirtual 169	com/google/android/gms/analytics/internal/zzah:zze	(Ljava/lang/String;Ljava/lang/Object;)V
    //   322: goto -20 -> 302
    //   325: astore_2
    //   326: aconst_null
    //   327: astore 5
    //   329: aload 6
    //   331: astore_1
    //   332: aload_1
    //   333: ifnull +7 -> 340
    //   336: aload_1
    //   337: invokevirtual 161	java/io/OutputStream:close	()V
    //   340: aload 5
    //   342: ifnull +8 -> 350
    //   345: aload 5
    //   347: invokevirtual 164	java/net/HttpURLConnection:disconnect	()V
    //   350: aload_2
    //   351: athrow
    //   352: astore_1
    //   353: aload_0
    //   354: ldc -90
    //   356: aload_1
    //   357: invokevirtual 169	com/google/android/gms/analytics/internal/zzah:zze	(Ljava/lang/String;Ljava/lang/Object;)V
    //   360: goto -20 -> 340
    //   363: astore_2
    //   364: goto -32 -> 332
    //   367: astore_2
    //   368: goto -92 -> 276
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	371	0	this	zzah
    //   0	371	1	paramURL	URL
    //   0	371	2	paramArrayOfByte	byte[]
    //   245	47	3	i	int
    //   183	74	4	j	int
    //   69	277	5	localURL1	URL
    //   1	329	6	localURL2	URL
    //   10	288	7	localObject1	Object
    //   4	235	8	localOutputStream	java.io.OutputStream
    //   7	116	9	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   238	243	261	java/io/IOException
    //   55	61	272	java/io/IOException
    //   297	302	314	java/io/IOException
    //   55	61	325	finally
    //   336	340	352	java/io/IOException
    //   75	81	363	finally
    //   92	99	363	finally
    //   110	115	363	finally
    //   126	133	363	finally
    //   144	150	363	finally
    //   161	167	363	finally
    //   178	185	363	finally
    //   204	211	363	finally
    //   222	233	363	finally
    //   283	290	363	finally
    //   75	81	367	java/io/IOException
    //   92	99	367	java/io/IOException
    //   110	115	367	java/io/IOException
    //   126	133	367	java/io/IOException
    //   144	150	367	java/io/IOException
    //   161	167	367	java/io/IOException
    //   178	185	367	java/io/IOException
    //   204	211	367	java/io/IOException
    //   222	233	367	java/io/IOException
  }
  
  private static String zza(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6)
  {
    return String.format("%s/%s (Linux; U; Android %s; %s; %s Build/%s)", new Object[] { paramString1, paramString2, paramString3, paramString4, paramString5, paramString6 });
  }
  
  private void zza(StringBuilder paramStringBuilder, String paramString1, String paramString2)
    throws UnsupportedEncodingException
  {
    if (paramStringBuilder.length() != 0) {
      paramStringBuilder.append('&');
    }
    paramStringBuilder.append(URLEncoder.encode(paramString1, "UTF-8"));
    paramStringBuilder.append('=');
    paramStringBuilder.append(URLEncoder.encode(paramString2, "UTF-8"));
  }
  
  private int zzb(URL paramURL)
  {
    zzx.zzv(paramURL);
    zzb("GET request", paramURL);
    localObject = null;
    localURL = null;
    try
    {
      paramURL = zzc(paramURL);
      localURL = paramURL;
      localObject = paramURL;
      paramURL.connect();
      localURL = paramURL;
      localObject = paramURL;
      zzb(paramURL);
      localURL = paramURL;
      localObject = paramURL;
      int j = paramURL.getResponseCode();
      if (j == 200)
      {
        localURL = paramURL;
        localObject = paramURL;
        zzhz().zzhZ();
      }
      localURL = paramURL;
      localObject = paramURL;
      zzb("GET status", Integer.valueOf(j));
      i = j;
      if (paramURL != null)
      {
        paramURL.disconnect();
        i = j;
      }
    }
    catch (IOException paramURL)
    {
      do
      {
        localObject = localURL;
        zzd("Network GET connection error", paramURL);
        int i = 0;
      } while (localURL == null);
      localURL.disconnect();
      return 0;
    }
    finally
    {
      if (localObject == null) {
        break label143;
      }
      ((HttpURLConnection)localObject).disconnect();
    }
    return i;
  }
  
  /* Error */
  private int zzb(URL paramURL, byte[] paramArrayOfByte)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 6
    //   3: aconst_null
    //   4: astore 5
    //   6: aload_1
    //   7: invokestatic 88	com/google/android/gms/common/internal/zzx:zzv	(Ljava/lang/Object;)Ljava/lang/Object;
    //   10: pop
    //   11: aload_2
    //   12: invokestatic 88	com/google/android/gms/common/internal/zzx:zzv	(Ljava/lang/Object;)Ljava/lang/Object;
    //   15: pop
    //   16: aload_2
    //   17: invokestatic 217	com/google/android/gms/analytics/internal/zzah:zzg	([B)[B
    //   20: astore 7
    //   22: aload_0
    //   23: ldc -37
    //   25: aload 7
    //   27: arraylength
    //   28: invokestatic 96	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   31: ldc2_w 220
    //   34: aload 7
    //   36: arraylength
    //   37: i2l
    //   38: lmul
    //   39: aload_2
    //   40: arraylength
    //   41: i2l
    //   42: ldiv
    //   43: invokestatic 226	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   46: aload_1
    //   47: invokevirtual 229	com/google/android/gms/analytics/internal/zzah:zza	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    //   50: aload 7
    //   52: arraylength
    //   53: aload_2
    //   54: arraylength
    //   55: if_icmple +20 -> 75
    //   58: aload_0
    //   59: ldc -25
    //   61: aload 7
    //   63: arraylength
    //   64: invokestatic 96	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   67: aload_2
    //   68: arraylength
    //   69: invokestatic 96	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   72: invokevirtual 233	com/google/android/gms/analytics/internal/zzah:zzc	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    //   75: aload_0
    //   76: invokevirtual 104	com/google/android/gms/analytics/internal/zzah:zzin	()Z
    //   79: ifeq +35 -> 114
    //   82: aload_0
    //   83: ldc -21
    //   85: new 187	java/lang/StringBuilder
    //   88: dup
    //   89: invokespecial 237	java/lang/StringBuilder:<init>	()V
    //   92: ldc 17
    //   94: invokevirtual 205	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   97: new 19	java/lang/String
    //   100: dup
    //   101: aload_2
    //   102: invokespecial 109	java/lang/String:<init>	([B)V
    //   105: invokevirtual 205	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   108: invokevirtual 241	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   111: invokevirtual 112	com/google/android/gms/analytics/internal/zzah:zza	(Ljava/lang/String;Ljava/lang/Object;)V
    //   114: aload_0
    //   115: aload_1
    //   116: invokevirtual 116	com/google/android/gms/analytics/internal/zzah:zzc	(Ljava/net/URL;)Ljava/net/HttpURLConnection;
    //   119: astore_1
    //   120: aload_1
    //   121: iconst_1
    //   122: invokevirtual 122	java/net/HttpURLConnection:setDoOutput	(Z)V
    //   125: aload_1
    //   126: ldc -13
    //   128: ldc -11
    //   130: invokevirtual 249	java/net/HttpURLConnection:addRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   133: aload_1
    //   134: aload 7
    //   136: arraylength
    //   137: invokevirtual 126	java/net/HttpURLConnection:setFixedLengthStreamingMode	(I)V
    //   140: aload_1
    //   141: invokevirtual 129	java/net/HttpURLConnection:connect	()V
    //   144: aload_1
    //   145: invokevirtual 133	java/net/HttpURLConnection:getOutputStream	()Ljava/io/OutputStream;
    //   148: astore_2
    //   149: aload_2
    //   150: aload 7
    //   152: invokevirtual 138	java/io/OutputStream:write	([B)V
    //   155: aload_2
    //   156: invokevirtual 161	java/io/OutputStream:close	()V
    //   159: aload_0
    //   160: aload_1
    //   161: invokespecial 141	com/google/android/gms/analytics/internal/zzah:zzb	(Ljava/net/HttpURLConnection;)V
    //   164: aload_1
    //   165: invokevirtual 145	java/net/HttpURLConnection:getResponseCode	()I
    //   168: istore 4
    //   170: iload 4
    //   172: sipush 200
    //   175: if_icmpne +10 -> 185
    //   178: aload_0
    //   179: invokevirtual 149	com/google/android/gms/analytics/internal/zzah:zzhz	()Lcom/google/android/gms/analytics/internal/zzb;
    //   182: invokevirtual 154	com/google/android/gms/analytics/internal/zzb:zzhZ	()V
    //   185: aload_0
    //   186: ldc -100
    //   188: iload 4
    //   190: invokestatic 96	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   193: invokevirtual 158	com/google/android/gms/analytics/internal/zzah:zzb	(Ljava/lang/String;Ljava/lang/Object;)V
    //   196: iconst_0
    //   197: ifeq +11 -> 208
    //   200: new 251	java/lang/NullPointerException
    //   203: dup
    //   204: invokespecial 252	java/lang/NullPointerException:<init>	()V
    //   207: athrow
    //   208: iload 4
    //   210: istore_3
    //   211: aload_1
    //   212: ifnull +10 -> 222
    //   215: aload_1
    //   216: invokevirtual 164	java/net/HttpURLConnection:disconnect	()V
    //   219: iload 4
    //   221: istore_3
    //   222: iload_3
    //   223: ireturn
    //   224: astore_2
    //   225: aload_0
    //   226: ldc -2
    //   228: aload_2
    //   229: invokevirtual 169	com/google/android/gms/analytics/internal/zzah:zze	(Ljava/lang/String;Ljava/lang/Object;)V
    //   232: goto -24 -> 208
    //   235: astore_2
    //   236: aconst_null
    //   237: astore_1
    //   238: aload_0
    //   239: ldc_w 256
    //   242: aload_2
    //   243: invokevirtual 174	com/google/android/gms/analytics/internal/zzah:zzd	(Ljava/lang/String;Ljava/lang/Object;)V
    //   246: iconst_0
    //   247: istore_3
    //   248: aload 5
    //   250: ifnull +8 -> 258
    //   253: aload 5
    //   255: invokevirtual 161	java/io/OutputStream:close	()V
    //   258: aload_1
    //   259: ifnull -37 -> 222
    //   262: aload_1
    //   263: invokevirtual 164	java/net/HttpURLConnection:disconnect	()V
    //   266: iconst_0
    //   267: ireturn
    //   268: astore_2
    //   269: aload_0
    //   270: ldc -2
    //   272: aload_2
    //   273: invokevirtual 169	com/google/android/gms/analytics/internal/zzah:zze	(Ljava/lang/String;Ljava/lang/Object;)V
    //   276: goto -18 -> 258
    //   279: astore_2
    //   280: aconst_null
    //   281: astore_1
    //   282: aload 6
    //   284: astore 5
    //   286: aload 5
    //   288: ifnull +8 -> 296
    //   291: aload 5
    //   293: invokevirtual 161	java/io/OutputStream:close	()V
    //   296: aload_1
    //   297: ifnull +7 -> 304
    //   300: aload_1
    //   301: invokevirtual 164	java/net/HttpURLConnection:disconnect	()V
    //   304: aload_2
    //   305: athrow
    //   306: astore 5
    //   308: aload_0
    //   309: ldc -2
    //   311: aload 5
    //   313: invokevirtual 169	com/google/android/gms/analytics/internal/zzah:zze	(Ljava/lang/String;Ljava/lang/Object;)V
    //   316: goto -20 -> 296
    //   319: astore_2
    //   320: aload 6
    //   322: astore 5
    //   324: goto -38 -> 286
    //   327: astore 6
    //   329: aload_2
    //   330: astore 5
    //   332: aload 6
    //   334: astore_2
    //   335: goto -49 -> 286
    //   338: astore_2
    //   339: goto -53 -> 286
    //   342: astore_2
    //   343: goto -105 -> 238
    //   346: astore 6
    //   348: aload_2
    //   349: astore 5
    //   351: aload 6
    //   353: astore_2
    //   354: goto -116 -> 238
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	357	0	this	zzah
    //   0	357	1	paramURL	URL
    //   0	357	2	paramArrayOfByte	byte[]
    //   210	38	3	i	int
    //   168	52	4	j	int
    //   4	288	5	localObject1	Object
    //   306	6	5	localIOException1	IOException
    //   322	28	5	localObject2	Object
    //   1	320	6	localObject3	Object
    //   327	6	6	localObject4	Object
    //   346	6	6	localIOException2	IOException
    //   20	131	7	arrayOfByte	byte[]
    // Exception table:
    //   from	to	target	type
    //   200	208	224	java/io/IOException
    //   16	75	235	java/io/IOException
    //   75	114	235	java/io/IOException
    //   114	120	235	java/io/IOException
    //   253	258	268	java/io/IOException
    //   16	75	279	finally
    //   75	114	279	finally
    //   114	120	279	finally
    //   291	296	306	java/io/IOException
    //   120	149	319	finally
    //   159	170	319	finally
    //   178	185	319	finally
    //   185	196	319	finally
    //   149	159	327	finally
    //   238	246	338	finally
    //   120	149	342	java/io/IOException
    //   159	170	342	java/io/IOException
    //   178	185	342	java/io/IOException
    //   185	196	342	java/io/IOException
    //   149	159	346	java/io/IOException
  }
  
  private URL zzb(zzab paramZzab, String paramString)
  {
    if (paramZzab.zzkm()) {}
    for (paramZzab = zzif().zzjy() + zzif().zzjA() + "?" + paramString;; paramZzab = zzif().zzjz() + zzif().zzjA() + "?" + paramString) {
      try
      {
        paramZzab = new URL(paramZzab);
        return paramZzab;
      }
      catch (MalformedURLException paramZzab)
      {
        zze("Error trying to parse the hardcoded host url", paramZzab);
      }
    }
    return null;
  }
  
  private void zzb(HttpURLConnection paramHttpURLConnection)
    throws IOException
  {
    localHttpURLConnection = null;
    try
    {
      paramHttpURLConnection = paramHttpURLConnection.getInputStream();
      localHttpURLConnection = paramHttpURLConnection;
      byte[] arrayOfByte = new byte['Ѐ'];
      int i;
      do
      {
        localHttpURLConnection = paramHttpURLConnection;
        i = paramHttpURLConnection.read(arrayOfByte);
      } while (i > 0);
      if (paramHttpURLConnection != null) {}
      try
      {
        paramHttpURLConnection.close();
        return;
      }
      catch (IOException paramHttpURLConnection)
      {
        zze("Error closing http connection input stream", paramHttpURLConnection);
        return;
      }
      try
      {
        localHttpURLConnection.close();
        throw paramHttpURLConnection;
      }
      catch (IOException localIOException)
      {
        for (;;)
        {
          zze("Error closing http connection input stream", localIOException);
        }
      }
    }
    finally
    {
      if (localHttpURLConnection == null) {}
    }
  }
  
  private boolean zzg(zzab paramZzab)
  {
    zzx.zzv(paramZzab);
    boolean bool;
    Object localObject;
    if (!paramZzab.zzkm())
    {
      bool = true;
      localObject = zza(paramZzab, bool);
      if (localObject != null) {
        break label43;
      }
      zzie().zza(paramZzab, "Error formatting hit for upload");
    }
    label43:
    label90:
    do
    {
      do
      {
        return true;
        bool = false;
        break;
        if (((String)localObject).length() > zzif().zzjn()) {
          break label90;
        }
        paramZzab = zzb(paramZzab, (String)localObject);
        if (paramZzab == null)
        {
          zzbc("Failed to build collect GET endpoint url");
          return false;
        }
      } while (zzb(paramZzab) == 200);
      return false;
      localObject = zza(paramZzab, false);
      if (localObject == null)
      {
        zzie().zza(paramZzab, "Error formatting hit for POST upload");
        return true;
      }
      localObject = ((String)localObject).getBytes();
      if (localObject.length > zzif().zzjp())
      {
        zzie().zza(paramZzab, "Hit payload exceeds size limit");
        return true;
      }
      paramZzab = zzh(paramZzab);
      if (paramZzab == null)
      {
        zzbc("Failed to build collect POST endpoint url");
        return false;
      }
    } while (zza(paramZzab, (byte[])localObject) == 200);
    return false;
  }
  
  private static byte[] zzg(byte[] paramArrayOfByte)
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    GZIPOutputStream localGZIPOutputStream = new GZIPOutputStream(localByteArrayOutputStream);
    localGZIPOutputStream.write(paramArrayOfByte);
    localGZIPOutputStream.close();
    localByteArrayOutputStream.close();
    return localByteArrayOutputStream.toByteArray();
  }
  
  private URL zzh(zzab paramZzab)
  {
    if (paramZzab.zzkm()) {}
    for (paramZzab = zzif().zzjy() + zzif().zzjA();; paramZzab = zzif().zzjz() + zzif().zzjA()) {
      try
      {
        paramZzab = new URL(paramZzab);
        return paramZzab;
      }
      catch (MalformedURLException paramZzab)
      {
        zze("Error trying to parse the hardcoded host url", paramZzab);
      }
    }
    return null;
  }
  
  private String zzi(zzab paramZzab)
  {
    return String.valueOf(paramZzab.zzkj());
  }
  
  private URL zzkv()
  {
    Object localObject = zzif().zzjy() + zzif().zzjB();
    try
    {
      localObject = new URL((String)localObject);
      return localObject;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      zze("Error trying to parse the hardcoded host url", localMalformedURLException);
    }
    return null;
  }
  
  String zza(zzab paramZzab, boolean paramBoolean)
  {
    zzx.zzv(paramZzab);
    StringBuilder localStringBuilder = new StringBuilder();
    try
    {
      Iterator localIterator = paramZzab.zzn().entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        String str = (String)localEntry.getKey();
        if ((!"ht".equals(str)) && (!"qt".equals(str)) && (!"AppUID".equals(str)) && (!"z".equals(str)) && (!"_gmsv".equals(str))) {
          zza(localStringBuilder, str, (String)localEntry.getValue());
        }
      }
      zza(localStringBuilder, "ht", String.valueOf(paramZzab.zzkk()));
    }
    catch (UnsupportedEncodingException paramZzab)
    {
      zze("Failed to encode name or value", paramZzab);
      return null;
    }
    zza(localStringBuilder, "qt", String.valueOf(zzid().currentTimeMillis() - paramZzab.zzkk()));
    if (zzif().zzjk()) {
      zza(localStringBuilder, "_gmsv", zze.VERSION);
    }
    long l;
    if (paramBoolean)
    {
      l = paramZzab.zzkn();
      if (l == 0L) {
        break label251;
      }
    }
    label251:
    for (paramZzab = String.valueOf(l);; paramZzab = zzi(paramZzab))
    {
      zza(localStringBuilder, "z", paramZzab);
      return localStringBuilder.toString();
    }
  }
  
  List<Long> zza(List<zzab> paramList, boolean paramBoolean)
  {
    boolean bool;
    zza localZza;
    ArrayList localArrayList;
    if (!paramList.isEmpty())
    {
      bool = true;
      zzx.zzZ(bool);
      zza("Uploading batched hits. compression, count", Boolean.valueOf(paramBoolean), Integer.valueOf(paramList.size()));
      localZza = new zza();
      localArrayList = new ArrayList();
      paramList = paramList.iterator();
    }
    for (;;)
    {
      zzab localZzab;
      if (paramList.hasNext())
      {
        localZzab = (zzab)paramList.next();
        if (localZza.zzj(localZzab)) {}
      }
      else
      {
        if (localZza.zzkx() != 0) {
          break label129;
        }
        return localArrayList;
        bool = false;
        break;
      }
      localArrayList.add(Long.valueOf(localZzab.zzkj()));
    }
    label129:
    paramList = zzkv();
    if (paramList == null)
    {
      zzbc("Failed to build batching endpoint url");
      return Collections.emptyList();
    }
    if (paramBoolean) {}
    for (int i = zzb(paramList, localZza.getPayload()); 200 == i; i = zza(paramList, localZza.getPayload()))
    {
      zza("Batched upload completed. Hits batched", Integer.valueOf(localZza.zzkx()));
      return localArrayList;
    }
    zza("Network error uploading hits. status code", Integer.valueOf(i));
    if (zzif().zzjE().contains(Integer.valueOf(i)))
    {
      zzbb("Server instructed the client to stop batching");
      zzOr.start();
    }
    return Collections.emptyList();
  }
  
  HttpURLConnection zzc(URL paramURL)
    throws IOException
  {
    paramURL = paramURL.openConnection();
    if (!(paramURL instanceof HttpURLConnection)) {
      throw new IOException("Failed to obtain http connection");
    }
    paramURL = (HttpURLConnection)paramURL;
    paramURL.setDefaultUseCaches(false);
    paramURL.setConnectTimeout(zzif().zzjN());
    paramURL.setReadTimeout(zzif().zzjO());
    paramURL.setInstanceFollowRedirects(false);
    paramURL.setRequestProperty("User-Agent", zzHj);
    paramURL.setDoInput(true);
    return paramURL;
  }
  
  public List<Long> zzf(List<zzab> paramList)
  {
    boolean bool = true;
    zzic();
    zzio();
    zzx.zzv(paramList);
    int j;
    if ((zzif().zzjE().isEmpty()) || (!zzOr.zzv(zzif().zzjx() * 1000L)))
    {
      bool = false;
      j = 0;
      if (j != 0) {
        return zza(paramList, bool);
      }
    }
    else
    {
      if (zzif().zzjC() != zzm.zzMz) {}
      for (int i = 1;; i = 0)
      {
        j = i;
        if (zzif().zzjD() == zzo.zzMK) {
          break;
        }
        bool = false;
        j = i;
        break;
      }
    }
    return zzg(paramList);
  }
  
  List<Long> zzg(List<zzab> paramList)
  {
    ArrayList localArrayList = new ArrayList(paramList.size());
    paramList = paramList.iterator();
    do
    {
      zzab localZzab;
      if (paramList.hasNext())
      {
        localZzab = (zzab)paramList.next();
        if (zzg(localZzab)) {}
      }
      else
      {
        return localArrayList;
      }
      localArrayList.add(Long.valueOf(localZzab.zzkj()));
    } while (localArrayList.size() < zzif().zzjv());
    return localArrayList;
  }
  
  protected void zzhB()
  {
    zza("Network initialized. User agent", zzHj);
  }
  
  public boolean zzku()
  {
    zzic();
    zzio();
    Object localObject1 = (ConnectivityManager)getContext().getSystemService("connectivity");
    try
    {
      localObject1 = ((ConnectivityManager)localObject1).getActiveNetworkInfo();
      if ((localObject1 == null) || (!((NetworkInfo)localObject1).isConnected()))
      {
        zzaY("No network connectivity");
        return false;
      }
    }
    catch (SecurityException localSecurityException)
    {
      for (;;)
      {
        Object localObject2 = null;
      }
    }
    return true;
  }
  
  private class zza
  {
    private int zzOt;
    private ByteArrayOutputStream zzOu = new ByteArrayOutputStream();
    
    public zza() {}
    
    public byte[] getPayload()
    {
      return zzOu.toByteArray();
    }
    
    public boolean zzj(zzab paramZzab)
    {
      zzx.zzv(paramZzab);
      if (zzOt + 1 > zzif().zzjw()) {
        return false;
      }
      Object localObject = zza(paramZzab, false);
      if (localObject == null)
      {
        zzie().zza(paramZzab, "Error formatting hit");
        return true;
      }
      localObject = ((String)localObject).getBytes();
      int j = localObject.length;
      if (j > zzif().zzjo())
      {
        zzie().zza(paramZzab, "Hit size exceeds the maximum size limit");
        return true;
      }
      int i = j;
      if (zzOu.size() > 0) {
        i = j + 1;
      }
      if (i + zzOu.size() > zzif().zzjq()) {
        return false;
      }
      try
      {
        if (zzOu.size() > 0) {
          zzOu.write(zzah.zzkw());
        }
        zzOu.write((byte[])localObject);
        zzOt += 1;
        return true;
      }
      catch (IOException paramZzab)
      {
        zze("Failed to write payload when batching hits", paramZzab);
      }
      return true;
    }
    
    public int zzkx()
    {
      return zzOt;
    }
  }
}
