package com.tencent.mobileqq.app.utils;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import nmp;

public class QQPimUtil
{
  public static final int a = 0;
  public static final int b = 1;
  public static final int c = 2;
  public static final int d = 3;
  
  public QQPimUtil()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static int a(Context paramContext, String paramString)
  {
    Object localObject1;
    try
    {
      localObject1 = a(paramContext, paramString);
      if (localObject1 == null)
      {
        localObject1 = new QQPimUtil();
        localObject1.getClass();
        if (a(paramContext, paramString, new nmp((QQPimUtil)localObject1, paramContext).a())) {
          return 2;
        }
        return 3;
      }
    }
    finally {}
    Object localObject2 = new QQPimUtil();
    localObject2.getClass();
    localObject2 = new nmp((QQPimUtil)localObject2, paramContext).a();
    if (localObject2 == null) {
      return 3;
    }
    if (((List)localObject2).size() != ((Map)localObject1).size())
    {
      a(paramContext, paramString, (List)localObject2);
      return 1;
    }
    Iterator localIterator = ((List)localObject2).iterator();
    while (localIterator.hasNext()) {
      if (((Map)localObject1).get((String)localIterator.next()) == null)
      {
        a(paramContext, paramString, (List)localObject2);
        return 1;
      }
    }
    return 0;
  }
  
  public static Intent a(Context paramContext)
  {
    paramContext = paramContext.getPackageManager();
    try
    {
      if (getPackageInfo"com.tencent.qqpim"1versionCode < 1171) {
        return paramContext.getLaunchIntentForPackage("com.tencent.qqpim");
      }
      paramContext = new Intent();
      paramContext.setPackage("com.tencent.qqpim");
      paramContext.setAction("com.tencent.qqpim.action_open_qqpim");
      paramContext.putExtra("product_package", "com.tencent.mobileqq");
      paramContext.setFlags(67108864);
      paramContext.setFlags(268435456);
      return paramContext;
    }
    catch (Throwable paramContext)
    {
      paramContext.printStackTrace();
    }
    return null;
  }
  
  private static String a(Context paramContext, String paramString)
  {
    return paramContext.getFilesDir().getAbsolutePath() + "/qqpim/map_contact_id_" + paramString;
  }
  
  /* Error */
  private static Map a(Context paramContext, String paramString)
  {
    // Byte code:
    //   0: new 137	java/io/File
    //   3: dup
    //   4: aload_0
    //   5: aload_1
    //   6: invokestatic 154	com/tencent/mobileqq/app/utils/QQPimUtil:a	(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    //   9: invokespecial 157	java/io/File:<init>	(Ljava/lang/String;)V
    //   12: astore_0
    //   13: aload_0
    //   14: invokevirtual 160	java/io/File:exists	()Z
    //   17: ifne +5 -> 22
    //   20: aconst_null
    //   21: areturn
    //   22: new 162	java/util/HashMap
    //   25: dup
    //   26: invokespecial 163	java/util/HashMap:<init>	()V
    //   29: astore 7
    //   31: sipush 1024
    //   34: newarray byte
    //   36: astore 6
    //   38: new 165	org/apache/http/util/ByteArrayBuffer
    //   41: dup
    //   42: sipush 1024
    //   45: invokespecial 168	org/apache/http/util/ByteArrayBuffer:<init>	(I)V
    //   48: astore 8
    //   50: new 170	java/io/FileInputStream
    //   53: dup
    //   54: aload_0
    //   55: invokespecial 173	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   58: astore_1
    //   59: new 175	java/io/BufferedInputStream
    //   62: dup
    //   63: aload_1
    //   64: invokespecial 178	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;)V
    //   67: astore_0
    //   68: aload_0
    //   69: astore 5
    //   71: aload_1
    //   72: astore 4
    //   74: aload_0
    //   75: aload 6
    //   77: invokevirtual 182	java/io/BufferedInputStream:read	([B)I
    //   80: istore_2
    //   81: iconst_m1
    //   82: iload_2
    //   83: if_icmpeq +53 -> 136
    //   86: aload_0
    //   87: astore 5
    //   89: aload_1
    //   90: astore 4
    //   92: aload 8
    //   94: aload 6
    //   96: iconst_0
    //   97: iload_2
    //   98: invokevirtual 185	org/apache/http/util/ByteArrayBuffer:append	([BII)V
    //   101: goto -33 -> 68
    //   104: astore 6
    //   106: aload_0
    //   107: astore 5
    //   109: aload_1
    //   110: astore 4
    //   112: aload 6
    //   114: invokevirtual 186	java/io/IOException:printStackTrace	()V
    //   117: aload_0
    //   118: ifnull +7 -> 125
    //   121: aload_0
    //   122: invokevirtual 189	java/io/BufferedInputStream:close	()V
    //   125: aload_1
    //   126: ifnull +7 -> 133
    //   129: aload_1
    //   130: invokevirtual 190	java/io/FileInputStream:close	()V
    //   133: aload 7
    //   135: areturn
    //   136: aload_0
    //   137: astore 5
    //   139: aload_1
    //   140: astore 4
    //   142: new 69	java/lang/String
    //   145: dup
    //   146: aload 8
    //   148: invokevirtual 194	org/apache/http/util/ByteArrayBuffer:toByteArray	()[B
    //   151: invokespecial 197	java/lang/String:<init>	([B)V
    //   154: ldc -57
    //   156: invokevirtual 203	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   159: astore 6
    //   161: aload_0
    //   162: astore 5
    //   164: aload_1
    //   165: astore 4
    //   167: aload 6
    //   169: arraylength
    //   170: istore_3
    //   171: iconst_0
    //   172: istore_2
    //   173: iload_2
    //   174: iload_3
    //   175: if_icmpge +32 -> 207
    //   178: aload_0
    //   179: astore 5
    //   181: aload_1
    //   182: astore 4
    //   184: aload 7
    //   186: aload 6
    //   188: iload_2
    //   189: aaload
    //   190: iconst_1
    //   191: invokestatic 209	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   194: invokeinterface 213 3 0
    //   199: pop
    //   200: iload_2
    //   201: iconst_1
    //   202: iadd
    //   203: istore_2
    //   204: goto -31 -> 173
    //   207: aload_0
    //   208: ifnull +7 -> 215
    //   211: aload_0
    //   212: invokevirtual 189	java/io/BufferedInputStream:close	()V
    //   215: aload_1
    //   216: ifnull -83 -> 133
    //   219: aload_1
    //   220: invokevirtual 190	java/io/FileInputStream:close	()V
    //   223: goto -90 -> 133
    //   226: astore_0
    //   227: aload_0
    //   228: invokevirtual 186	java/io/IOException:printStackTrace	()V
    //   231: goto -98 -> 133
    //   234: astore_0
    //   235: aload_0
    //   236: invokevirtual 186	java/io/IOException:printStackTrace	()V
    //   239: goto -24 -> 215
    //   242: astore_0
    //   243: aload_0
    //   244: invokevirtual 186	java/io/IOException:printStackTrace	()V
    //   247: goto -122 -> 125
    //   250: astore_0
    //   251: aload_0
    //   252: invokevirtual 186	java/io/IOException:printStackTrace	()V
    //   255: goto -122 -> 133
    //   258: astore_0
    //   259: aconst_null
    //   260: astore 5
    //   262: aconst_null
    //   263: astore_1
    //   264: aload 5
    //   266: ifnull +8 -> 274
    //   269: aload 5
    //   271: invokevirtual 189	java/io/BufferedInputStream:close	()V
    //   274: aload_1
    //   275: ifnull +7 -> 282
    //   278: aload_1
    //   279: invokevirtual 190	java/io/FileInputStream:close	()V
    //   282: aload_0
    //   283: athrow
    //   284: astore 4
    //   286: aload 4
    //   288: invokevirtual 186	java/io/IOException:printStackTrace	()V
    //   291: goto -17 -> 274
    //   294: astore_1
    //   295: aload_1
    //   296: invokevirtual 186	java/io/IOException:printStackTrace	()V
    //   299: goto -17 -> 282
    //   302: astore_0
    //   303: aconst_null
    //   304: astore 5
    //   306: goto -42 -> 264
    //   309: astore_0
    //   310: aload 4
    //   312: astore_1
    //   313: goto -49 -> 264
    //   316: astore 6
    //   318: aconst_null
    //   319: astore_1
    //   320: aconst_null
    //   321: astore_0
    //   322: goto -216 -> 106
    //   325: astore 6
    //   327: aconst_null
    //   328: astore_0
    //   329: goto -223 -> 106
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	332	0	paramContext	Context
    //   0	332	1	paramString	String
    //   80	124	2	i	int
    //   170	6	3	j	int
    //   72	111	4	str	String
    //   284	27	4	localIOException1	java.io.IOException
    //   69	236	5	localContext	Context
    //   36	59	6	arrayOfByte	byte[]
    //   104	9	6	localIOException2	java.io.IOException
    //   159	28	6	arrayOfString	String[]
    //   316	1	6	localIOException3	java.io.IOException
    //   325	1	6	localIOException4	java.io.IOException
    //   29	156	7	localHashMap	java.util.HashMap
    //   48	99	8	localByteArrayBuffer	org.apache.http.util.ByteArrayBuffer
    // Exception table:
    //   from	to	target	type
    //   74	81	104	java/io/IOException
    //   92	101	104	java/io/IOException
    //   142	161	104	java/io/IOException
    //   167	171	104	java/io/IOException
    //   184	200	104	java/io/IOException
    //   219	223	226	java/io/IOException
    //   211	215	234	java/io/IOException
    //   121	125	242	java/io/IOException
    //   129	133	250	java/io/IOException
    //   31	59	258	finally
    //   269	274	284	java/io/IOException
    //   278	282	294	java/io/IOException
    //   59	68	302	finally
    //   74	81	309	finally
    //   92	101	309	finally
    //   112	117	309	finally
    //   142	161	309	finally
    //   167	171	309	finally
    //   184	200	309	finally
    //   31	59	316	java/io/IOException
    //   59	68	325	java/io/IOException
  }
  
  public static boolean a(Context paramContext)
  {
    boolean bool = true;
    paramContext = paramContext.getPackageManager();
    try
    {
      paramContext = paramContext.getPackageInfo("com.tencent.qqpim", 1);
      if (paramContext == null) {
        bool = false;
      }
      return bool;
    }
    catch (Throwable paramContext)
    {
      for (;;)
      {
        paramContext.printStackTrace();
        paramContext = null;
      }
    }
  }
  
  /* Error */
  private static boolean a(Context paramContext, String paramString, List paramList)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_3
    //   2: aload_2
    //   3: ifnonnull +5 -> 8
    //   6: iconst_0
    //   7: ireturn
    //   8: new 137	java/io/File
    //   11: dup
    //   12: aload_0
    //   13: aload_1
    //   14: invokestatic 154	com/tencent/mobileqq/app/utils/QQPimUtil:a	(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    //   17: invokespecial 157	java/io/File:<init>	(Ljava/lang/String;)V
    //   20: astore_1
    //   21: aload_1
    //   22: invokevirtual 160	java/io/File:exists	()Z
    //   25: ifne +11 -> 36
    //   28: aload_1
    //   29: invokevirtual 217	java/io/File:getParentFile	()Ljava/io/File;
    //   32: invokevirtual 220	java/io/File:mkdirs	()Z
    //   35: pop
    //   36: new 130	java/lang/StringBuilder
    //   39: dup
    //   40: invokespecial 131	java/lang/StringBuilder:<init>	()V
    //   43: astore_0
    //   44: aload_2
    //   45: invokeinterface 57 1 0
    //   50: astore_2
    //   51: aload_2
    //   52: invokeinterface 63 1 0
    //   57: ifeq +42 -> 99
    //   60: aload_2
    //   61: invokeinterface 67 1 0
    //   66: checkcast 69	java/lang/String
    //   69: astore 4
    //   71: aload_0
    //   72: new 130	java/lang/StringBuilder
    //   75: dup
    //   76: invokespecial 131	java/lang/StringBuilder:<init>	()V
    //   79: aload 4
    //   81: invokevirtual 145	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   84: ldc -57
    //   86: invokevirtual 145	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   89: invokevirtual 150	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   92: invokevirtual 145	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   95: pop
    //   96: goto -45 -> 51
    //   99: new 222	java/io/FileOutputStream
    //   102: dup
    //   103: aload_1
    //   104: invokespecial 223	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   107: astore_2
    //   108: new 225	java/io/BufferedOutputStream
    //   111: dup
    //   112: aload_2
    //   113: invokespecial 228	java/io/BufferedOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   116: astore_1
    //   117: aload_1
    //   118: aload_0
    //   119: invokevirtual 150	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   122: invokevirtual 231	java/lang/String:getBytes	()[B
    //   125: invokevirtual 234	java/io/BufferedOutputStream:write	([B)V
    //   128: aload_1
    //   129: invokevirtual 237	java/io/BufferedOutputStream:flush	()V
    //   132: aload_1
    //   133: ifnull +7 -> 140
    //   136: aload_1
    //   137: invokevirtual 238	java/io/BufferedOutputStream:close	()V
    //   140: aload_2
    //   141: ifnull +7 -> 148
    //   144: aload_2
    //   145: invokevirtual 239	java/io/FileOutputStream:close	()V
    //   148: iconst_1
    //   149: ireturn
    //   150: astore_0
    //   151: aload_0
    //   152: invokevirtual 186	java/io/IOException:printStackTrace	()V
    //   155: goto -15 -> 140
    //   158: astore_0
    //   159: aload_0
    //   160: invokevirtual 186	java/io/IOException:printStackTrace	()V
    //   163: goto -15 -> 148
    //   166: astore_2
    //   167: aconst_null
    //   168: astore_1
    //   169: aload_3
    //   170: astore_0
    //   171: aload_2
    //   172: invokevirtual 186	java/io/IOException:printStackTrace	()V
    //   175: aload_1
    //   176: ifnull +7 -> 183
    //   179: aload_1
    //   180: invokevirtual 238	java/io/BufferedOutputStream:close	()V
    //   183: aload_0
    //   184: ifnull +7 -> 191
    //   187: aload_0
    //   188: invokevirtual 239	java/io/FileOutputStream:close	()V
    //   191: iconst_0
    //   192: ireturn
    //   193: astore_1
    //   194: aload_1
    //   195: invokevirtual 186	java/io/IOException:printStackTrace	()V
    //   198: goto -15 -> 183
    //   201: astore_0
    //   202: aload_0
    //   203: invokevirtual 186	java/io/IOException:printStackTrace	()V
    //   206: goto -15 -> 191
    //   209: astore_0
    //   210: aconst_null
    //   211: astore_1
    //   212: aconst_null
    //   213: astore_2
    //   214: aload_1
    //   215: ifnull +7 -> 222
    //   218: aload_1
    //   219: invokevirtual 238	java/io/BufferedOutputStream:close	()V
    //   222: aload_2
    //   223: ifnull +7 -> 230
    //   226: aload_2
    //   227: invokevirtual 239	java/io/FileOutputStream:close	()V
    //   230: aload_0
    //   231: athrow
    //   232: astore_1
    //   233: aload_1
    //   234: invokevirtual 186	java/io/IOException:printStackTrace	()V
    //   237: goto -15 -> 222
    //   240: astore_1
    //   241: aload_1
    //   242: invokevirtual 186	java/io/IOException:printStackTrace	()V
    //   245: goto -15 -> 230
    //   248: astore_0
    //   249: aconst_null
    //   250: astore_1
    //   251: goto -37 -> 214
    //   254: astore_0
    //   255: goto -41 -> 214
    //   258: astore_3
    //   259: aload_0
    //   260: astore_2
    //   261: aload_3
    //   262: astore_0
    //   263: goto -49 -> 214
    //   266: astore_3
    //   267: aconst_null
    //   268: astore_1
    //   269: aload_2
    //   270: astore_0
    //   271: aload_3
    //   272: astore_2
    //   273: goto -102 -> 171
    //   276: astore_3
    //   277: aload_2
    //   278: astore_0
    //   279: aload_3
    //   280: astore_2
    //   281: goto -110 -> 171
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	284	0	paramContext	Context
    //   0	284	1	paramString	String
    //   0	284	2	paramList	List
    //   1	169	3	localObject1	Object
    //   258	4	3	localObject2	Object
    //   266	6	3	localIOException1	java.io.IOException
    //   276	4	3	localIOException2	java.io.IOException
    //   69	11	4	str	String
    // Exception table:
    //   from	to	target	type
    //   136	140	150	java/io/IOException
    //   144	148	158	java/io/IOException
    //   99	108	166	java/io/IOException
    //   179	183	193	java/io/IOException
    //   187	191	201	java/io/IOException
    //   99	108	209	finally
    //   218	222	232	java/io/IOException
    //   226	230	240	java/io/IOException
    //   108	117	248	finally
    //   117	132	254	finally
    //   171	175	258	finally
    //   108	117	266	java/io/IOException
    //   117	132	276	java/io/IOException
  }
}
