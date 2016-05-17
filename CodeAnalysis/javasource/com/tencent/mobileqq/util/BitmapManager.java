package com.tencent.mobileqq.util;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Rect;
import android.os.Build;
import android.util.Pair;
import com.tencent.image.SafeBitmapFactory;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.InputStream;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import sja;

public class BitmapManager
{
  public static final String a = "BitmapManager";
  private static ReferenceQueue jdField_a_of_type_JavaLangRefReferenceQueue = new ReferenceQueue();
  private static Map jdField_a_of_type_JavaUtilMap;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilMap = Collections.synchronizedMap(new HashMap());
  }
  
  public BitmapManager() {}
  
  public static int a(BitmapFactory.Options paramOptions, int paramInt1, int paramInt2)
  {
    int j = outHeight;
    int k = outWidth;
    int i = 1;
    if ((j > paramInt2) || (k > paramInt1))
    {
      if (k > j) {
        i = Math.round(j / paramInt2);
      }
    }
    else {
      return i;
    }
    return Math.round(k / paramInt1);
  }
  
  public static Bitmap a(Resources paramResources, int paramInt)
  {
    a();
    localBitmapDecodeResult = new BitmapManager.BitmapDecodeResult();
    for (;;)
    {
      try
      {
        localObject = new BitmapFactory.Options();
        if (((!"Xiaomi".equalsIgnoreCase(Build.MANUFACTURER)) || (!Build.MODEL.toUpperCase().startsWith("MI 2"))) && ((!"BBK".equalsIgnoreCase(Build.MANUFACTURER)) || (!Build.MODEL.toUpperCase().startsWith("VIVO")))) {
          continue;
        }
        inPreferredConfig = Bitmap.Config.ARGB_8888;
        a = BitmapFactory.decodeResource(paramResources, paramInt, (BitmapFactory.Options)localObject);
      }
      catch (OutOfMemoryError paramResources)
      {
        Object localObject;
        e = 1;
        continue;
      }
      catch (Throwable paramResources)
      {
        e = 3;
        continue;
      }
      if (a != null)
      {
        e = 0;
        paramResources = String.valueOf(a.hashCode());
        localObject = new sja(paramResources, a, jdField_a_of_type_JavaLangRefReferenceQueue);
        jdField_a_of_type_JavaUtilMap.put(paramResources, localObject);
      }
      return a;
      inPreferredConfig = Bitmap.Config.RGB_565;
    }
  }
  
  public static Bitmap a(Resources paramResources, int paramInt1, int paramInt2, int paramInt3)
  {
    a();
    Object localObject = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    BitmapFactory.decodeResource(paramResources, paramInt1, (BitmapFactory.Options)localObject);
    inSampleSize = a((BitmapFactory.Options)localObject, paramInt2, paramInt3);
    inJustDecodeBounds = false;
    paramResources = BitmapFactory.decodeResource(paramResources, paramInt1, (BitmapFactory.Options)localObject);
    if (paramResources != null)
    {
      localObject = String.valueOf(paramResources.hashCode());
      sja localSja = new sja((String)localObject, paramResources, jdField_a_of_type_JavaLangRefReferenceQueue);
      jdField_a_of_type_JavaUtilMap.put(localObject, localSja);
    }
    return paramResources;
  }
  
  public static Bitmap a(InputStream paramInputStream)
  {
    a();
    localBitmapDecodeResult = new BitmapManager.BitmapDecodeResult();
    for (;;)
    {
      try
      {
        BitmapFactory.Options localOptions = new BitmapFactory.Options();
        if ((!"Xiaomi".equalsIgnoreCase(Build.MANUFACTURER)) || (!Build.MODEL.toUpperCase().startsWith("MI 2"))) {
          continue;
        }
        localObject = Bitmap.Config.ARGB_8888;
        inPreferredConfig = ((Bitmap.Config)localObject);
        a = SafeBitmapFactory.decodeStream(paramInputStream, null, localOptions);
      }
      catch (OutOfMemoryError paramInputStream)
      {
        Object localObject;
        e = 1;
        continue;
      }
      catch (Throwable paramInputStream)
      {
        e = 3;
        continue;
      }
      if (a != null)
      {
        e = 0;
        paramInputStream = String.valueOf(a.hashCode());
        localObject = new sja(paramInputStream, a, jdField_a_of_type_JavaLangRefReferenceQueue);
        jdField_a_of_type_JavaUtilMap.put(paramInputStream, localObject);
      }
      return a;
      localObject = Bitmap.Config.RGB_565;
    }
  }
  
  public static Bitmap a(InputStream paramInputStream, Rect paramRect, int paramInt1, int paramInt2)
  {
    a();
    Object localObject = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    SafeBitmapFactory.decodeStream(paramInputStream, paramRect, (BitmapFactory.Options)localObject);
    inSampleSize = a((BitmapFactory.Options)localObject, paramInt1, paramInt2);
    inJustDecodeBounds = false;
    paramInputStream = SafeBitmapFactory.decodeStream(paramInputStream, paramRect, (BitmapFactory.Options)localObject);
    if (paramInputStream != null)
    {
      paramRect = String.valueOf(paramInputStream.hashCode());
      localObject = new sja(paramRect, paramInputStream, jdField_a_of_type_JavaLangRefReferenceQueue);
      jdField_a_of_type_JavaUtilMap.put(paramRect, localObject);
    }
    return paramInputStream;
  }
  
  public static Bitmap a(String paramString)
  {
    return a(paramString, null);
  }
  
  public static Bitmap a(String paramString, int paramInt1, int paramInt2)
  {
    a();
    Object localObject = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    SafeBitmapFactory.decodeFile(paramString, (BitmapFactory.Options)localObject);
    inSampleSize = a((BitmapFactory.Options)localObject, paramInt1, paramInt2);
    inJustDecodeBounds = false;
    paramString = SafeBitmapFactory.decodeFile(paramString, (BitmapFactory.Options)localObject);
    if (paramString != null)
    {
      localObject = String.valueOf(paramString.hashCode());
      sja localSja = new sja((String)localObject, paramString, jdField_a_of_type_JavaLangRefReferenceQueue);
      jdField_a_of_type_JavaUtilMap.put(localObject, localSja);
    }
    return paramString;
  }
  
  public static Bitmap a(String paramString, BitmapFactory.Options paramOptions)
  {
    BitmapManager.BitmapDecodeResult localBitmapDecodeResult = new BitmapManager.BitmapDecodeResult();
    a(paramString, paramOptions, localBitmapDecodeResult);
    return a;
  }
  
  public static Bitmap a(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    a();
    localBitmapDecodeResult = new BitmapManager.BitmapDecodeResult();
    for (;;)
    {
      try
      {
        BitmapFactory.Options localOptions = new BitmapFactory.Options();
        if ((!"Xiaomi".equalsIgnoreCase(Build.MANUFACTURER)) || (!Build.MODEL.toUpperCase().startsWith("MI 2"))) {
          continue;
        }
        localObject = Bitmap.Config.ARGB_8888;
        inPreferredConfig = ((Bitmap.Config)localObject);
        a = SafeBitmapFactory.decodeByteArray(paramArrayOfByte, paramInt1, paramInt2, localOptions);
      }
      catch (OutOfMemoryError paramArrayOfByte)
      {
        Object localObject;
        e = 1;
        continue;
      }
      catch (Throwable paramArrayOfByte)
      {
        e = 3;
        continue;
      }
      if (a != null)
      {
        e = 0;
        paramArrayOfByte = String.valueOf(a.hashCode());
        localObject = new sja(paramArrayOfByte, a, jdField_a_of_type_JavaLangRefReferenceQueue);
        jdField_a_of_type_JavaUtilMap.put(paramArrayOfByte, localObject);
      }
      return a;
      localObject = Bitmap.Config.RGB_565;
    }
  }
  
  public static Bitmap a(byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    a();
    Object localObject = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    SafeBitmapFactory.decodeByteArray(paramArrayOfByte, paramInt1, paramInt2, (BitmapFactory.Options)localObject);
    inSampleSize = a((BitmapFactory.Options)localObject, paramInt3, paramInt4);
    inJustDecodeBounds = false;
    paramArrayOfByte = SafeBitmapFactory.decodeByteArray(paramArrayOfByte, paramInt1, paramInt2, (BitmapFactory.Options)localObject);
    if (paramArrayOfByte != null)
    {
      localObject = String.valueOf(paramArrayOfByte.hashCode());
      sja localSja = new sja((String)localObject, paramArrayOfByte, jdField_a_of_type_JavaLangRefReferenceQueue);
      jdField_a_of_type_JavaUtilMap.put(localObject, localSja);
    }
    return paramArrayOfByte;
  }
  
  public static BitmapManager.BitmapDecodeResult a(String paramString, BitmapFactory.Options paramOptions)
  {
    BitmapManager.BitmapDecodeResult localBitmapDecodeResult = new BitmapManager.BitmapDecodeResult();
    a(paramString, paramOptions, localBitmapDecodeResult);
    return localBitmapDecodeResult;
  }
  
  public static String a()
  {
    a();
    long l = (Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory()) / 1024L;
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append(String.format("heap used=%s\n", new Object[] { Long.valueOf(l) }));
    Iterator localIterator = jdField_a_of_type_JavaUtilMap.entrySet().iterator();
    l = 0L;
    if (localIterator.hasNext())
    {
      Object localObject = (Reference)((Map.Entry)localIterator.next()).getValue();
      if (localObject == null) {
        break label203;
      }
      localObject = (Bitmap)((Reference)localObject).get();
      if (localObject == null) {
        break label203;
      }
      int i = ((Bitmap)localObject).getRowBytes();
      l += ((Bitmap)localObject).getHeight() * i;
    }
    label203:
    for (;;)
    {
      break;
      localStringBuffer.append("usedSize " + l / 1024L + "\n");
      localStringBuffer.append("images:" + jdField_a_of_type_JavaUtilMap);
      return localStringBuffer.toString();
    }
  }
  
  public static ArrayList a()
  {
    a();
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = jdField_a_of_type_JavaUtilMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      Object localObject = (Reference)localEntry.getValue();
      if (localObject != null)
      {
        localObject = (Bitmap)((Reference)localObject).get();
        if (localObject != null)
        {
          int i = ((Bitmap)localObject).getRowBytes();
          long l = ((Bitmap)localObject).getHeight() * i;
          localArrayList.add(Pair.create(localEntry.getKey(), Long.valueOf(l)));
        }
      }
    }
    return localArrayList;
  }
  
  private static void a()
  {
    for (;;)
    {
      sja localSja = (sja)jdField_a_of_type_JavaLangRefReferenceQueue.poll();
      if (localSja == null) {
        break;
      }
      jdField_a_of_type_JavaUtilMap.remove(sja.a(localSja));
    }
  }
  
  /* Error */
  public static void a(String paramString, BitmapFactory.Options paramOptions, BitmapManager.BitmapDecodeResult paramBitmapDecodeResult)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 9
    //   3: aconst_null
    //   4: astore 10
    //   6: aconst_null
    //   7: astore 6
    //   9: aconst_null
    //   10: astore 5
    //   12: aconst_null
    //   13: astore 7
    //   15: aconst_null
    //   16: astore 8
    //   18: invokestatic 61	com/tencent/mobileqq/util/BitmapManager:a	()V
    //   21: new 299	java/io/File
    //   24: dup
    //   25: aload_0
    //   26: invokespecial 302	java/io/File:<init>	(Ljava/lang/String;)V
    //   29: astore 11
    //   31: aload 11
    //   33: ifnull +11 -> 44
    //   36: aload 11
    //   38: invokevirtual 305	java/io/File:exists	()Z
    //   41: ifne +32 -> 73
    //   44: aload_2
    //   45: iconst_2
    //   46: putfield 115	com/tencent/mobileqq/util/BitmapManager$BitmapDecodeResult:e	I
    //   49: iconst_0
    //   50: ifeq +11 -> 61
    //   53: new 307	java/lang/NullPointerException
    //   56: dup
    //   57: invokespecial 308	java/lang/NullPointerException:<init>	()V
    //   60: athrow
    //   61: iconst_0
    //   62: ifeq +10 -> 72
    //   65: invokestatic 314	com/tencent/commonsdk/pool/ByteArrayPool:getGenericInstance	()Lcom/tencent/commonsdk/pool/ByteArrayPool;
    //   68: aconst_null
    //   69: invokevirtual 318	com/tencent/commonsdk/pool/ByteArrayPool:returnBuf	([B)V
    //   72: return
    //   73: new 320	java/io/FileInputStream
    //   76: dup
    //   77: aload 11
    //   79: invokespecial 323	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   82: astore 4
    //   84: aload 6
    //   86: astore 10
    //   88: aload 5
    //   90: astore 9
    //   92: aload 7
    //   94: astore 8
    //   96: aload 11
    //   98: invokevirtual 326	java/io/File:length	()J
    //   101: l2i
    //   102: istore_3
    //   103: aload 6
    //   105: astore 10
    //   107: aload 5
    //   109: astore 9
    //   111: aload 7
    //   113: astore 8
    //   115: invokestatic 314	com/tencent/commonsdk/pool/ByteArrayPool:getGenericInstance	()Lcom/tencent/commonsdk/pool/ByteArrayPool;
    //   118: iload_3
    //   119: invokevirtual 330	com/tencent/commonsdk/pool/ByteArrayPool:getBuf	(I)[B
    //   122: astore 7
    //   124: aload 7
    //   126: astore 5
    //   128: aload 4
    //   130: astore 6
    //   132: aload 7
    //   134: astore 10
    //   136: aload 7
    //   138: astore 9
    //   140: aload 7
    //   142: astore 8
    //   144: iload_3
    //   145: aload 4
    //   147: aload 7
    //   149: invokevirtual 334	java/io/FileInputStream:read	([B)I
    //   152: if_icmpeq +52 -> 204
    //   155: aload 7
    //   157: astore 5
    //   159: aload 4
    //   161: astore 6
    //   163: aload 7
    //   165: astore 10
    //   167: aload 7
    //   169: astore 9
    //   171: aload 7
    //   173: astore 8
    //   175: aload_2
    //   176: iconst_3
    //   177: putfield 115	com/tencent/mobileqq/util/BitmapManager$BitmapDecodeResult:e	I
    //   180: aload 4
    //   182: ifnull +8 -> 190
    //   185: aload 4
    //   187: invokevirtual 337	java/io/FileInputStream:close	()V
    //   190: aload 7
    //   192: ifnull -120 -> 72
    //   195: invokestatic 314	com/tencent/commonsdk/pool/ByteArrayPool:getGenericInstance	()Lcom/tencent/commonsdk/pool/ByteArrayPool;
    //   198: aload 7
    //   200: invokevirtual 318	com/tencent/commonsdk/pool/ByteArrayPool:returnBuf	([B)V
    //   203: return
    //   204: aload 7
    //   206: astore 5
    //   208: aload 4
    //   210: astore 6
    //   212: aload 7
    //   214: astore 10
    //   216: aload 7
    //   218: astore 9
    //   220: aload 7
    //   222: astore 8
    //   224: aload_2
    //   225: aload 7
    //   227: iconst_0
    //   228: aload 7
    //   230: arraylength
    //   231: aload_1
    //   232: invokestatic 170	com/tencent/image/SafeBitmapFactory:decodeByteArray	([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   235: putfield 112	com/tencent/mobileqq/util/BitmapManager$BitmapDecodeResult:a	Landroid/graphics/Bitmap;
    //   238: aload 4
    //   240: ifnull +8 -> 248
    //   243: aload 4
    //   245: invokevirtual 337	java/io/FileInputStream:close	()V
    //   248: aload 7
    //   250: ifnull +11 -> 261
    //   253: invokestatic 314	com/tencent/commonsdk/pool/ByteArrayPool:getGenericInstance	()Lcom/tencent/commonsdk/pool/ByteArrayPool;
    //   256: aload 7
    //   258: invokevirtual 318	com/tencent/commonsdk/pool/ByteArrayPool:returnBuf	([B)V
    //   261: aload_2
    //   262: getfield 112	com/tencent/mobileqq/util/BitmapManager$BitmapDecodeResult:a	Landroid/graphics/Bitmap;
    //   265: ifnull -193 -> 72
    //   268: aload_2
    //   269: iconst_0
    //   270: putfield 115	com/tencent/mobileqq/util/BitmapManager$BitmapDecodeResult:e	I
    //   273: new 125	sja
    //   276: dup
    //   277: aload_0
    //   278: aload_2
    //   279: getfield 112	com/tencent/mobileqq/util/BitmapManager$BitmapDecodeResult:a	Landroid/graphics/Bitmap;
    //   282: getstatic 36	com/tencent/mobileqq/util/BitmapManager:jdField_a_of_type_JavaLangRefReferenceQueue	Ljava/lang/ref/ReferenceQueue;
    //   285: invokespecial 128	sja:<init>	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V
    //   288: astore_1
    //   289: getstatic 31	com/tencent/mobileqq/util/BitmapManager:jdField_a_of_type_JavaUtilMap	Ljava/util/Map;
    //   292: aload_0
    //   293: aload_1
    //   294: invokeinterface 134 3 0
    //   299: pop
    //   300: return
    //   301: astore_1
    //   302: aconst_null
    //   303: astore 4
    //   305: aload 8
    //   307: astore 5
    //   309: aload 4
    //   311: astore 6
    //   313: aload_2
    //   314: iconst_2
    //   315: putfield 115	com/tencent/mobileqq/util/BitmapManager$BitmapDecodeResult:e	I
    //   318: aload 4
    //   320: ifnull +8 -> 328
    //   323: aload 4
    //   325: invokevirtual 337	java/io/FileInputStream:close	()V
    //   328: aload 8
    //   330: ifnull -69 -> 261
    //   333: invokestatic 314	com/tencent/commonsdk/pool/ByteArrayPool:getGenericInstance	()Lcom/tencent/commonsdk/pool/ByteArrayPool;
    //   336: aload 8
    //   338: invokevirtual 318	com/tencent/commonsdk/pool/ByteArrayPool:returnBuf	([B)V
    //   341: goto -80 -> 261
    //   344: astore_1
    //   345: aconst_null
    //   346: astore 4
    //   348: aload 9
    //   350: astore 5
    //   352: aload 4
    //   354: astore 6
    //   356: aload_2
    //   357: iconst_1
    //   358: putfield 115	com/tencent/mobileqq/util/BitmapManager$BitmapDecodeResult:e	I
    //   361: aload 4
    //   363: ifnull +8 -> 371
    //   366: aload 4
    //   368: invokevirtual 337	java/io/FileInputStream:close	()V
    //   371: aload 9
    //   373: ifnull -112 -> 261
    //   376: invokestatic 314	com/tencent/commonsdk/pool/ByteArrayPool:getGenericInstance	()Lcom/tencent/commonsdk/pool/ByteArrayPool;
    //   379: aload 9
    //   381: invokevirtual 318	com/tencent/commonsdk/pool/ByteArrayPool:returnBuf	([B)V
    //   384: goto -123 -> 261
    //   387: astore_1
    //   388: aconst_null
    //   389: astore 4
    //   391: aload 10
    //   393: astore 5
    //   395: aload 4
    //   397: astore 6
    //   399: aload_2
    //   400: iconst_3
    //   401: putfield 115	com/tencent/mobileqq/util/BitmapManager$BitmapDecodeResult:e	I
    //   404: aload 4
    //   406: ifnull +8 -> 414
    //   409: aload 4
    //   411: invokevirtual 337	java/io/FileInputStream:close	()V
    //   414: aload 10
    //   416: ifnull -155 -> 261
    //   419: invokestatic 314	com/tencent/commonsdk/pool/ByteArrayPool:getGenericInstance	()Lcom/tencent/commonsdk/pool/ByteArrayPool;
    //   422: aload 10
    //   424: invokevirtual 318	com/tencent/commonsdk/pool/ByteArrayPool:returnBuf	([B)V
    //   427: goto -166 -> 261
    //   430: astore_0
    //   431: aconst_null
    //   432: astore_2
    //   433: aconst_null
    //   434: astore_1
    //   435: aload_2
    //   436: ifnull +7 -> 443
    //   439: aload_2
    //   440: invokevirtual 337	java/io/FileInputStream:close	()V
    //   443: aload_1
    //   444: ifnull +10 -> 454
    //   447: invokestatic 314	com/tencent/commonsdk/pool/ByteArrayPool:getGenericInstance	()Lcom/tencent/commonsdk/pool/ByteArrayPool;
    //   450: aload_1
    //   451: invokevirtual 318	com/tencent/commonsdk/pool/ByteArrayPool:returnBuf	([B)V
    //   454: aload_0
    //   455: athrow
    //   456: astore_0
    //   457: goto -396 -> 61
    //   460: astore_0
    //   461: goto -271 -> 190
    //   464: astore_1
    //   465: goto -217 -> 248
    //   468: astore_1
    //   469: goto -141 -> 328
    //   472: astore_1
    //   473: goto -102 -> 371
    //   476: astore_1
    //   477: goto -63 -> 414
    //   480: astore_2
    //   481: goto -38 -> 443
    //   484: astore_0
    //   485: aload 4
    //   487: astore_2
    //   488: aconst_null
    //   489: astore_1
    //   490: goto -55 -> 435
    //   493: astore_0
    //   494: aload 6
    //   496: astore_2
    //   497: aload 5
    //   499: astore_1
    //   500: goto -65 -> 435
    //   503: astore_1
    //   504: goto -113 -> 391
    //   507: astore_1
    //   508: goto -160 -> 348
    //   511: astore_1
    //   512: goto -207 -> 305
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	515	0	paramString	String
    //   0	515	1	paramOptions	BitmapFactory.Options
    //   0	515	2	paramBitmapDecodeResult	BitmapManager.BitmapDecodeResult
    //   102	51	3	i	int
    //   82	404	4	localFileInputStream	java.io.FileInputStream
    //   10	488	5	localObject1	Object
    //   7	488	6	localObject2	Object
    //   13	244	7	arrayOfByte1	byte[]
    //   16	321	8	arrayOfByte2	byte[]
    //   1	379	9	localObject3	Object
    //   4	419	10	localObject4	Object
    //   29	68	11	localFile	java.io.File
    // Exception table:
    //   from	to	target	type
    //   21	31	301	java/io/FileNotFoundException
    //   36	44	301	java/io/FileNotFoundException
    //   44	49	301	java/io/FileNotFoundException
    //   73	84	301	java/io/FileNotFoundException
    //   21	31	344	java/lang/OutOfMemoryError
    //   36	44	344	java/lang/OutOfMemoryError
    //   44	49	344	java/lang/OutOfMemoryError
    //   73	84	344	java/lang/OutOfMemoryError
    //   21	31	387	java/lang/Throwable
    //   36	44	387	java/lang/Throwable
    //   44	49	387	java/lang/Throwable
    //   73	84	387	java/lang/Throwable
    //   21	31	430	finally
    //   36	44	430	finally
    //   44	49	430	finally
    //   73	84	430	finally
    //   53	61	456	java/io/IOException
    //   185	190	460	java/io/IOException
    //   243	248	464	java/io/IOException
    //   323	328	468	java/io/IOException
    //   366	371	472	java/io/IOException
    //   409	414	476	java/io/IOException
    //   439	443	480	java/io/IOException
    //   96	103	484	finally
    //   115	124	484	finally
    //   144	155	493	finally
    //   175	180	493	finally
    //   224	238	493	finally
    //   313	318	493	finally
    //   356	361	493	finally
    //   399	404	493	finally
    //   96	103	503	java/lang/Throwable
    //   115	124	503	java/lang/Throwable
    //   144	155	503	java/lang/Throwable
    //   175	180	503	java/lang/Throwable
    //   224	238	503	java/lang/Throwable
    //   96	103	507	java/lang/OutOfMemoryError
    //   115	124	507	java/lang/OutOfMemoryError
    //   144	155	507	java/lang/OutOfMemoryError
    //   175	180	507	java/lang/OutOfMemoryError
    //   224	238	507	java/lang/OutOfMemoryError
    //   96	103	511	java/io/FileNotFoundException
    //   115	124	511	java/io/FileNotFoundException
    //   144	155	511	java/io/FileNotFoundException
    //   175	180	511	java/io/FileNotFoundException
    //   224	238	511	java/io/FileNotFoundException
  }
  
  public static Bitmap b(Resources paramResources, int paramInt)
  {
    a();
    BitmapManager.BitmapDecodeResult localBitmapDecodeResult = new BitmapManager.BitmapDecodeResult();
    try
    {
      a = BitmapFactory.decodeResource(paramResources, paramInt, new BitmapFactory.Options());
      if (a != null)
      {
        e = 0;
        paramResources = String.valueOf(a.hashCode());
        sja localSja = new sja(paramResources, a, jdField_a_of_type_JavaLangRefReferenceQueue);
        jdField_a_of_type_JavaUtilMap.put(paramResources, localSja);
      }
      return a;
    }
    catch (OutOfMemoryError paramResources)
    {
      for (;;)
      {
        e = 1;
      }
    }
    catch (Throwable paramResources)
    {
      for (;;)
      {
        e = 3;
      }
    }
  }
}
