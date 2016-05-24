package com.google.android.gms.internal;

import android.os.SystemClock;
import java.io.EOFException;
import java.io.File;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class zzv
  implements zzb
{
  private final int zzaA;
  private final Map<String, zza> zzax = new LinkedHashMap(16, 0.75F, true);
  private long zzay = 0L;
  private final File zzaz;
  
  public zzv(File paramFile)
  {
    this(paramFile, 5242880);
  }
  
  public zzv(File paramFile, int paramInt)
  {
    zzaz = paramFile;
    zzaA = paramInt;
  }
  
  private void removeEntry(String paramString)
  {
    zza localZza = (zza)zzax.get(paramString);
    if (localZza != null)
    {
      zzay -= zzaB;
      zzax.remove(paramString);
    }
  }
  
  private static int zza(InputStream paramInputStream)
    throws IOException
  {
    int i = paramInputStream.read();
    if (i == -1) {
      throw new EOFException();
    }
    return i;
  }
  
  static void zza(OutputStream paramOutputStream, int paramInt)
    throws IOException
  {
    paramOutputStream.write(paramInt >> 0 & 0xFF);
    paramOutputStream.write(paramInt >> 8 & 0xFF);
    paramOutputStream.write(paramInt >> 16 & 0xFF);
    paramOutputStream.write(paramInt >> 24 & 0xFF);
  }
  
  static void zza(OutputStream paramOutputStream, long paramLong)
    throws IOException
  {
    paramOutputStream.write((byte)(int)(paramLong >>> 0));
    paramOutputStream.write((byte)(int)(paramLong >>> 8));
    paramOutputStream.write((byte)(int)(paramLong >>> 16));
    paramOutputStream.write((byte)(int)(paramLong >>> 24));
    paramOutputStream.write((byte)(int)(paramLong >>> 32));
    paramOutputStream.write((byte)(int)(paramLong >>> 40));
    paramOutputStream.write((byte)(int)(paramLong >>> 48));
    paramOutputStream.write((byte)(int)(paramLong >>> 56));
  }
  
  static void zza(OutputStream paramOutputStream, String paramString)
    throws IOException
  {
    paramString = paramString.getBytes("UTF-8");
    zza(paramOutputStream, paramString.length);
    paramOutputStream.write(paramString, 0, paramString.length);
  }
  
  private void zza(String paramString, zza paramZza)
  {
    if (!zzax.containsKey(paramString)) {}
    zza localZza;
    long l;
    for (zzay += zzaB;; zzay = (zzaB - zzaB + l))
    {
      zzax.put(paramString, paramZza);
      return;
      localZza = (zza)zzax.get(paramString);
      l = zzay;
    }
  }
  
  static void zza(Map<String, String> paramMap, OutputStream paramOutputStream)
    throws IOException
  {
    if (paramMap != null)
    {
      zza(paramOutputStream, paramMap.size());
      paramMap = paramMap.entrySet().iterator();
      while (paramMap.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)paramMap.next();
        zza(paramOutputStream, (String)localEntry.getKey());
        zza(paramOutputStream, (String)localEntry.getValue());
      }
    }
    zza(paramOutputStream, 0);
  }
  
  private static byte[] zza(InputStream paramInputStream, int paramInt)
    throws IOException
  {
    byte[] arrayOfByte = new byte[paramInt];
    int i = 0;
    while (i < paramInt)
    {
      int j = paramInputStream.read(arrayOfByte, i, paramInt - i);
      if (j == -1) {
        break;
      }
      i += j;
    }
    if (i != paramInt) {
      throw new IOException("Expected " + paramInt + " bytes, read " + i + " bytes");
    }
    return arrayOfByte;
  }
  
  static int zzb(InputStream paramInputStream)
    throws IOException
  {
    return 0x0 | zza(paramInputStream) << 0 | zza(paramInputStream) << 8 | zza(paramInputStream) << 16 | zza(paramInputStream) << 24;
  }
  
  static long zzc(InputStream paramInputStream)
    throws IOException
  {
    return 0L | (zza(paramInputStream) & 0xFF) << 0 | (zza(paramInputStream) & 0xFF) << 8 | (zza(paramInputStream) & 0xFF) << 16 | (zza(paramInputStream) & 0xFF) << 24 | (zza(paramInputStream) & 0xFF) << 32 | (zza(paramInputStream) & 0xFF) << 40 | (zza(paramInputStream) & 0xFF) << 48 | (zza(paramInputStream) & 0xFF) << 56;
  }
  
  private void zzc(int paramInt)
  {
    if (zzay + paramInt < zzaA) {}
    label119:
    label229:
    label233:
    for (;;)
    {
      return;
      if (zzs.DEBUG) {
        zzs.zza("Pruning old cache entries.", new Object[0]);
      }
      long l1 = zzay;
      long l2 = SystemClock.elapsedRealtime();
      Iterator localIterator = zzax.entrySet().iterator();
      int i = 0;
      zza localZza;
      if (localIterator.hasNext())
      {
        localZza = (zza)((Map.Entry)localIterator.next()).getValue();
        if (zzf(key).delete())
        {
          zzay -= zzaB;
          localIterator.remove();
          i += 1;
          if ((float)(zzay + paramInt) >= zzaA * 0.9F) {
            break label229;
          }
        }
      }
      for (;;)
      {
        if (!zzs.DEBUG) {
          break label233;
        }
        zzs.zza("pruned %d files, %d bytes, %d ms", new Object[] { Integer.valueOf(i), Long.valueOf(zzay - l1), Long.valueOf(SystemClock.elapsedRealtime() - l2) });
        return;
        zzs.zzb("Could not delete cache entry for key=%s, filename=%s", new Object[] { key, zze(key) });
        break label119;
        break;
      }
    }
  }
  
  static String zzd(InputStream paramInputStream)
    throws IOException
  {
    return new String(zza(paramInputStream, (int)zzc(paramInputStream)), "UTF-8");
  }
  
  private String zze(String paramString)
  {
    int i = paramString.length() / 2;
    int j = paramString.substring(0, i).hashCode();
    return String.valueOf(j) + String.valueOf(paramString.substring(i).hashCode());
  }
  
  static Map<String, String> zze(InputStream paramInputStream)
    throws IOException
  {
    int j = zzb(paramInputStream);
    if (j == 0) {}
    for (Object localObject = Collections.emptyMap();; localObject = new HashMap(j))
    {
      int i = 0;
      while (i < j)
      {
        ((Map)localObject).put(zzd(paramInputStream).intern(), zzd(paramInputStream).intern());
        i += 1;
      }
    }
    return localObject;
  }
  
  public void remove(String paramString)
  {
    try
    {
      boolean bool = zzf(paramString).delete();
      removeEntry(paramString);
      if (!bool) {
        zzs.zzb("Could not delete cache entry for key=%s, filename=%s", new Object[] { paramString, zze(paramString) });
      }
      return;
    }
    finally {}
  }
  
  /* Error */
  public zzb.zza zza(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 41	com/google/android/gms/internal/zzv:zzax	Ljava/util/Map;
    //   6: aload_1
    //   7: invokeinterface 55 2 0
    //   12: checkcast 10	com/google/android/gms/internal/zzv$zza
    //   15: astore 4
    //   17: aload 4
    //   19: ifnonnull +9 -> 28
    //   22: aconst_null
    //   23: astore_1
    //   24: aload_0
    //   25: monitorexit
    //   26: aload_1
    //   27: areturn
    //   28: aload_0
    //   29: aload_1
    //   30: invokevirtual 200	com/google/android/gms/internal/zzv:zzf	(Ljava/lang/String;)Ljava/io/File;
    //   33: astore 5
    //   35: new 13	com/google/android/gms/internal/zzv$zzb
    //   38: dup
    //   39: new 277	java/io/FileInputStream
    //   42: dup
    //   43: aload 5
    //   45: invokespecial 279	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   48: aconst_null
    //   49: invokespecial 282	com/google/android/gms/internal/zzv$zzb:<init>	(Ljava/io/InputStream;Lcom/google/android/gms/internal/zzv$1;)V
    //   52: astore_3
    //   53: aload_3
    //   54: astore_2
    //   55: aload_3
    //   56: invokestatic 285	com/google/android/gms/internal/zzv$zza:zzf	(Ljava/io/InputStream;)Lcom/google/android/gms/internal/zzv$zza;
    //   59: pop
    //   60: aload_3
    //   61: astore_2
    //   62: aload 4
    //   64: aload_3
    //   65: aload 5
    //   67: invokevirtual 287	java/io/File:length	()J
    //   70: aload_3
    //   71: invokestatic 290	com/google/android/gms/internal/zzv$zzb:zza	(Lcom/google/android/gms/internal/zzv$zzb;)I
    //   74: i2l
    //   75: lsub
    //   76: l2i
    //   77: invokestatic 235	com/google/android/gms/internal/zzv:zza	(Ljava/io/InputStream;I)[B
    //   80: invokevirtual 293	com/google/android/gms/internal/zzv$zza:zzb	([B)Lcom/google/android/gms/internal/zzb$zza;
    //   83: astore 4
    //   85: aload 4
    //   87: astore_2
    //   88: aload_2
    //   89: astore_1
    //   90: aload_3
    //   91: ifnull -67 -> 24
    //   94: aload_3
    //   95: invokevirtual 296	com/google/android/gms/internal/zzv$zzb:close	()V
    //   98: aload_2
    //   99: astore_1
    //   100: goto -76 -> 24
    //   103: astore_1
    //   104: aconst_null
    //   105: astore_1
    //   106: goto -82 -> 24
    //   109: astore 4
    //   111: aconst_null
    //   112: astore_3
    //   113: aload_3
    //   114: astore_2
    //   115: ldc_w 298
    //   118: iconst_2
    //   119: anewarray 4	java/lang/Object
    //   122: dup
    //   123: iconst_0
    //   124: aload 5
    //   126: invokevirtual 301	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   129: aastore
    //   130: dup
    //   131: iconst_1
    //   132: aload 4
    //   134: invokevirtual 302	java/io/IOException:toString	()Ljava/lang/String;
    //   137: aastore
    //   138: invokestatic 229	com/google/android/gms/internal/zzs:zzb	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   141: aload_3
    //   142: astore_2
    //   143: aload_0
    //   144: aload_1
    //   145: invokevirtual 304	com/google/android/gms/internal/zzv:remove	(Ljava/lang/String;)V
    //   148: aload_3
    //   149: ifnull +7 -> 156
    //   152: aload_3
    //   153: invokevirtual 296	com/google/android/gms/internal/zzv$zzb:close	()V
    //   156: aconst_null
    //   157: astore_1
    //   158: goto -134 -> 24
    //   161: astore_1
    //   162: aconst_null
    //   163: astore_1
    //   164: goto -140 -> 24
    //   167: astore_1
    //   168: aconst_null
    //   169: astore_2
    //   170: aload_2
    //   171: ifnull +7 -> 178
    //   174: aload_2
    //   175: invokevirtual 296	com/google/android/gms/internal/zzv$zzb:close	()V
    //   178: aload_1
    //   179: athrow
    //   180: astore_1
    //   181: aload_0
    //   182: monitorexit
    //   183: aload_1
    //   184: athrow
    //   185: astore_1
    //   186: aconst_null
    //   187: astore_1
    //   188: goto -164 -> 24
    //   191: astore_1
    //   192: goto -22 -> 170
    //   195: astore 4
    //   197: goto -84 -> 113
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	200	0	this	zzv
    //   0	200	1	paramString	String
    //   54	121	2	localObject1	Object
    //   52	101	3	localZzb	zzb
    //   15	71	4	localObject2	Object
    //   109	24	4	localIOException1	IOException
    //   195	1	4	localIOException2	IOException
    //   33	92	5	localFile	File
    // Exception table:
    //   from	to	target	type
    //   94	98	103	java/io/IOException
    //   35	53	109	java/io/IOException
    //   152	156	161	java/io/IOException
    //   35	53	167	finally
    //   2	17	180	finally
    //   28	35	180	finally
    //   94	98	180	finally
    //   152	156	180	finally
    //   174	178	180	finally
    //   178	180	180	finally
    //   174	178	185	java/io/IOException
    //   55	60	191	finally
    //   62	85	191	finally
    //   115	141	191	finally
    //   143	148	191	finally
    //   55	60	195	java/io/IOException
    //   62	85	195	java/io/IOException
  }
  
  /* Error */
  public void zza()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 45	com/google/android/gms/internal/zzv:zzaz	Ljava/io/File;
    //   6: invokevirtual 307	java/io/File:exists	()Z
    //   9: ifne +36 -> 45
    //   12: aload_0
    //   13: getfield 45	com/google/android/gms/internal/zzv:zzaz	Ljava/io/File;
    //   16: invokevirtual 310	java/io/File:mkdirs	()Z
    //   19: ifne +23 -> 42
    //   22: ldc_w 312
    //   25: iconst_1
    //   26: anewarray 4	java/lang/Object
    //   29: dup
    //   30: iconst_0
    //   31: aload_0
    //   32: getfield 45	com/google/android/gms/internal/zzv:zzaz	Ljava/io/File;
    //   35: invokevirtual 301	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   38: aastore
    //   39: invokestatic 314	com/google/android/gms/internal/zzs:zzc	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   42: aload_0
    //   43: monitorexit
    //   44: return
    //   45: aload_0
    //   46: getfield 45	com/google/android/gms/internal/zzv:zzaz	Ljava/io/File;
    //   49: invokevirtual 318	java/io/File:listFiles	()[Ljava/io/File;
    //   52: astore 5
    //   54: aload 5
    //   56: ifnull -14 -> 42
    //   59: aload 5
    //   61: arraylength
    //   62: istore_2
    //   63: iconst_0
    //   64: istore_1
    //   65: iload_1
    //   66: iload_2
    //   67: if_icmpge -25 -> 42
    //   70: aload 5
    //   72: iload_1
    //   73: aaload
    //   74: astore 6
    //   76: aconst_null
    //   77: astore_3
    //   78: new 320	java/io/BufferedInputStream
    //   81: dup
    //   82: new 277	java/io/FileInputStream
    //   85: dup
    //   86: aload 6
    //   88: invokespecial 279	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   91: invokespecial 323	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;)V
    //   94: astore 4
    //   96: aload 4
    //   98: astore_3
    //   99: aload 4
    //   101: invokestatic 285	com/google/android/gms/internal/zzv$zza:zzf	(Ljava/io/InputStream;)Lcom/google/android/gms/internal/zzv$zza;
    //   104: astore 7
    //   106: aload 4
    //   108: astore_3
    //   109: aload 7
    //   111: aload 6
    //   113: invokevirtual 287	java/io/File:length	()J
    //   116: putfield 58	com/google/android/gms/internal/zzv$zza:zzaB	J
    //   119: aload 4
    //   121: astore_3
    //   122: aload_0
    //   123: aload 7
    //   125: getfield 196	com/google/android/gms/internal/zzv$zza:key	Ljava/lang/String;
    //   128: aload 7
    //   130: invokespecial 325	com/google/android/gms/internal/zzv:zza	(Ljava/lang/String;Lcom/google/android/gms/internal/zzv$zza;)V
    //   133: aload 4
    //   135: ifnull +8 -> 143
    //   138: aload 4
    //   140: invokevirtual 326	java/io/BufferedInputStream:close	()V
    //   143: iload_1
    //   144: iconst_1
    //   145: iadd
    //   146: istore_1
    //   147: goto -82 -> 65
    //   150: astore_3
    //   151: aconst_null
    //   152: astore 4
    //   154: aload 6
    //   156: ifnull +12 -> 168
    //   159: aload 4
    //   161: astore_3
    //   162: aload 6
    //   164: invokevirtual 205	java/io/File:delete	()Z
    //   167: pop
    //   168: aload 4
    //   170: ifnull -27 -> 143
    //   173: aload 4
    //   175: invokevirtual 326	java/io/BufferedInputStream:close	()V
    //   178: goto -35 -> 143
    //   181: astore_3
    //   182: goto -39 -> 143
    //   185: astore 5
    //   187: aload_3
    //   188: astore 4
    //   190: aload 5
    //   192: astore_3
    //   193: aload 4
    //   195: ifnull +8 -> 203
    //   198: aload 4
    //   200: invokevirtual 326	java/io/BufferedInputStream:close	()V
    //   203: aload_3
    //   204: athrow
    //   205: astore_3
    //   206: aload_0
    //   207: monitorexit
    //   208: aload_3
    //   209: athrow
    //   210: astore_3
    //   211: goto -68 -> 143
    //   214: astore 4
    //   216: goto -13 -> 203
    //   219: astore 5
    //   221: aload_3
    //   222: astore 4
    //   224: aload 5
    //   226: astore_3
    //   227: goto -34 -> 193
    //   230: astore_3
    //   231: goto -77 -> 154
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	234	0	this	zzv
    //   64	83	1	i	int
    //   62	6	2	j	int
    //   77	45	3	localObject1	Object
    //   150	1	3	localIOException1	IOException
    //   161	1	3	localObject2	Object
    //   181	7	3	localIOException2	IOException
    //   192	12	3	localObject3	Object
    //   205	4	3	localObject4	Object
    //   210	12	3	localIOException3	IOException
    //   226	1	3	localObject5	Object
    //   230	1	3	localIOException4	IOException
    //   94	105	4	localObject6	Object
    //   214	1	4	localIOException5	IOException
    //   222	1	4	localIOException6	IOException
    //   52	19	5	arrayOfFile	File[]
    //   185	6	5	localObject7	Object
    //   219	6	5	localObject8	Object
    //   74	89	6	localFile	File
    //   104	25	7	localZza	zza
    // Exception table:
    //   from	to	target	type
    //   78	96	150	java/io/IOException
    //   173	178	181	java/io/IOException
    //   78	96	185	finally
    //   2	42	205	finally
    //   45	54	205	finally
    //   59	63	205	finally
    //   138	143	205	finally
    //   173	178	205	finally
    //   198	203	205	finally
    //   203	205	205	finally
    //   138	143	210	java/io/IOException
    //   198	203	214	java/io/IOException
    //   99	106	219	finally
    //   109	119	219	finally
    //   122	133	219	finally
    //   162	168	219	finally
    //   99	106	230	java/io/IOException
    //   109	119	230	java/io/IOException
    //   122	133	230	java/io/IOException
  }
  
  /* Error */
  public void zza(String paramString, zzb.zza paramZza)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_2
    //   4: getfield 333	com/google/android/gms/internal/zzb$zza:data	[B
    //   7: arraylength
    //   8: invokespecial 335	com/google/android/gms/internal/zzv:zzc	(I)V
    //   11: aload_0
    //   12: aload_1
    //   13: invokevirtual 200	com/google/android/gms/internal/zzv:zzf	(Ljava/lang/String;)Ljava/io/File;
    //   16: astore_3
    //   17: new 337	java/io/FileOutputStream
    //   20: dup
    //   21: aload_3
    //   22: invokespecial 338	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   25: astore 4
    //   27: new 10	com/google/android/gms/internal/zzv$zza
    //   30: dup
    //   31: aload_1
    //   32: aload_2
    //   33: invokespecial 340	com/google/android/gms/internal/zzv$zza:<init>	(Ljava/lang/String;Lcom/google/android/gms/internal/zzb$zza;)V
    //   36: astore 5
    //   38: aload 5
    //   40: aload 4
    //   42: invokevirtual 343	com/google/android/gms/internal/zzv$zza:zza	(Ljava/io/OutputStream;)Z
    //   45: ifne +61 -> 106
    //   48: aload 4
    //   50: invokevirtual 344	java/io/FileOutputStream:close	()V
    //   53: ldc_w 346
    //   56: iconst_1
    //   57: anewarray 4	java/lang/Object
    //   60: dup
    //   61: iconst_0
    //   62: aload_3
    //   63: invokevirtual 301	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   66: aastore
    //   67: invokestatic 229	com/google/android/gms/internal/zzs:zzb	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   70: new 64	java/io/IOException
    //   73: dup
    //   74: invokespecial 347	java/io/IOException:<init>	()V
    //   77: athrow
    //   78: astore_1
    //   79: aload_3
    //   80: invokevirtual 205	java/io/File:delete	()Z
    //   83: ifne +20 -> 103
    //   86: ldc_w 349
    //   89: iconst_1
    //   90: anewarray 4	java/lang/Object
    //   93: dup
    //   94: iconst_0
    //   95: aload_3
    //   96: invokevirtual 301	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   99: aastore
    //   100: invokestatic 229	com/google/android/gms/internal/zzs:zzb	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   103: aload_0
    //   104: monitorexit
    //   105: return
    //   106: aload 4
    //   108: aload_2
    //   109: getfield 333	com/google/android/gms/internal/zzb$zza:data	[B
    //   112: invokevirtual 352	java/io/FileOutputStream:write	([B)V
    //   115: aload 4
    //   117: invokevirtual 344	java/io/FileOutputStream:close	()V
    //   120: aload_0
    //   121: aload_1
    //   122: aload 5
    //   124: invokespecial 325	com/google/android/gms/internal/zzv:zza	(Ljava/lang/String;Lcom/google/android/gms/internal/zzv$zza;)V
    //   127: goto -24 -> 103
    //   130: astore_1
    //   131: aload_0
    //   132: monitorexit
    //   133: aload_1
    //   134: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	135	0	this	zzv
    //   0	135	1	paramString	String
    //   0	135	2	paramZza	zzb.zza
    //   16	80	3	localFile	File
    //   25	91	4	localFileOutputStream	java.io.FileOutputStream
    //   36	87	5	localZza	zza
    // Exception table:
    //   from	to	target	type
    //   17	78	78	java/io/IOException
    //   106	127	78	java/io/IOException
    //   2	17	130	finally
    //   17	78	130	finally
    //   79	103	130	finally
    //   106	127	130	finally
  }
  
  public File zzf(String paramString)
  {
    return new File(zzaz, zze(paramString));
  }
  
  static class zza
  {
    public String key;
    public long zzaB;
    public String zzb;
    public long zzc;
    public long zzd;
    public long zze;
    public long zzf;
    public Map<String, String> zzg;
    
    private zza() {}
    
    public zza(String paramString, zzb.zza paramZza)
    {
      key = paramString;
      zzaB = data.length;
      zzb = zzb;
      zzc = zzc;
      zzd = zzd;
      zze = zze;
      zzf = zzf;
      zzg = zzg;
    }
    
    public static zza zzf(InputStream paramInputStream)
      throws IOException
    {
      zza localZza = new zza();
      if (zzv.zzb(paramInputStream) != 538247942) {
        throw new IOException();
      }
      key = zzv.zzd(paramInputStream);
      zzb = zzv.zzd(paramInputStream);
      if (zzb.equals("")) {
        zzb = null;
      }
      zzc = zzv.zzc(paramInputStream);
      zzd = zzv.zzc(paramInputStream);
      zze = zzv.zzc(paramInputStream);
      zzf = zzv.zzc(paramInputStream);
      zzg = zzv.zze(paramInputStream);
      return localZza;
    }
    
    public boolean zza(OutputStream paramOutputStream)
    {
      try
      {
        zzv.zza(paramOutputStream, 538247942);
        zzv.zza(paramOutputStream, key);
        if (zzb == null) {}
        for (String str = "";; str = zzb)
        {
          zzv.zza(paramOutputStream, str);
          zzv.zza(paramOutputStream, zzc);
          zzv.zza(paramOutputStream, zzd);
          zzv.zza(paramOutputStream, zze);
          zzv.zza(paramOutputStream, zzf);
          zzv.zza(zzg, paramOutputStream);
          paramOutputStream.flush();
          return true;
        }
        return false;
      }
      catch (IOException paramOutputStream)
      {
        zzs.zzb("%s", new Object[] { paramOutputStream.toString() });
      }
    }
    
    public zzb.zza zzb(byte[] paramArrayOfByte)
    {
      zzb.zza localZza = new zzb.zza();
      data = paramArrayOfByte;
      zzb = zzb;
      zzc = zzc;
      zzd = zzd;
      zze = zze;
      zzf = zzf;
      zzg = zzg;
      return localZza;
    }
  }
  
  private static class zzb
    extends FilterInputStream
  {
    private int zzaC = 0;
    
    private zzb(InputStream paramInputStream)
    {
      super();
    }
    
    public int read()
      throws IOException
    {
      int i = super.read();
      if (i != -1) {
        zzaC += 1;
      }
      return i;
    }
    
    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      paramInt1 = super.read(paramArrayOfByte, paramInt1, paramInt2);
      if (paramInt1 != -1) {
        zzaC += paramInt1;
      }
      return paramInt1;
    }
  }
}
