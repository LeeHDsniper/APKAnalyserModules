package com.tencent.commonsdk.soload;

import android.text.TextUtils;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.ByteOrder;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;
import java.util.zip.ZipException;

public class DexReleasor
  implements MyZipConstants
{
  private static final String DEX_NAME = "classes.dex";
  static byte[] buffer = new byte[81920];
  private static DexReleasor dexOperator;
  public static final String[] sExtraDexes = { "classes2.dex", "classes3.dex", "classes5.dex" };
  public static final String[] sExtraJarDexes = { "classes2.jar", "classes3.jar", "classes5.jar" };
  byte[] commentOfEOCD = null;
  private String mDstPath;
  private final LinkedHashMap<String, MyZipEntry> mEntries = new LinkedHashMap();
  RandomAccessFile mRaf = null;
  private String mSrcFile;
  
  static
  {
    dexOperator = null;
  }
  
  private DexReleasor(String paramString1, String paramString2)
  {
    mSrcFile = paramString1;
    mDstPath = paramString2;
    try
    {
      read();
      return;
    }
    catch (IOException paramString1)
    {
      paramString1.printStackTrace();
    }
  }
  
  public static DexReleasor getInstance(String paramString1, String paramString2)
  {
    try
    {
      if (dexOperator == null) {
        dexOperator = new DexReleasor(paramString1, paramString2);
      }
      paramString1 = dexOperator;
      return paramString1;
    }
    finally {}
  }
  
  private boolean read()
    throws IOException
  {
    boolean bool;
    long l2;
    try
    {
      File localFile = new File(mSrcFile);
      bool = localFile.exists();
      if (!bool)
      {
        bool = false;
        return bool;
      }
      mRaf = new RandomAccessFile(localFile, "r");
      l2 = mRaf.length() - 22L;
      if (l2 < 0L) {
        throw new ZipException("too short to be Zip");
      }
    }
    finally {}
    long l3 = l2 - 65536L;
    long l1 = l3;
    if (l3 < 0L) {
      l1 = 0L;
    }
    int i3;
    int m;
    label246:
    do
    {
      mRaf.seek(l2);
      if (Integer.reverseBytes(mRaf.readInt()) == 101010256)
      {
        localObject2 = new byte[18];
        mRaf.readFully((byte[])localObject2);
        localObject2 = HeapBufferIterator.iterator((byte[])localObject2, 0, localObject2.length, ByteOrder.LITTLE_ENDIAN);
        i = ((BufferIterator)localObject2).readShort();
        j = ((BufferIterator)localObject2).readShort();
        i3 = ((BufferIterator)localObject2).readShort();
        k = ((BufferIterator)localObject2).readShort();
        l1 = ((BufferIterator)localObject2).readInt();
        m = ((BufferIterator)localObject2).readInt();
        n = ((BufferIterator)localObject2).readShort();
        if (n <= 0) {
          break;
        }
        localObject2 = new byte[n];
        if (mRaf.read((byte[])localObject2, 0, localObject2.length) == -1) {
          break;
        }
        commentOfEOCD = ((byte[])localObject2);
        break;
        throw new ZipException("spanned archives not supported");
      }
      l3 = l2 - 1L;
      l2 = l3;
    } while (l3 >= l1);
    throw new ZipException("EOCD not found; not a Zip archive?");
    label284:
    Object localObject2 = new BufferedInputStream(new MyZipFile.RAFStream(mRaf, m), 4096);
    byte[] arrayOfByte = new byte[46];
    int k = 0;
    int n = 0;
    int j = 0;
    int i = 0;
    label350:
    label556:
    label571:
    for (;;)
    {
      int i1;
      int i2;
      if ((k != 0) && (n != 0))
      {
        bool = readLocalHeader(mRaf);
        break;
        MyZipEntry localMyZipEntry = new MyZipEntry(arrayOfByte, (InputStream)localObject2);
        String str = localMyZipEntry.getName();
        m = j;
        i1 = k;
        i2 = n;
        if (TextUtils.isEmpty(str)) {
          break label556;
        }
        if (str.equals(sExtraDexes[0]))
        {
          mEntries.put(str, localMyZipEntry);
          i1 = 1;
          m = j;
          i2 = n;
          break label556;
        }
        if (str.equals(sExtraDexes[1]))
        {
          mEntries.put(str, localMyZipEntry);
          i2 = 1;
          m = j;
          i1 = k;
          break label556;
        }
        m = j;
        i1 = k;
        i2 = n;
        if (!str.equals(sExtraDexes[2])) {
          break label556;
        }
        mEntries.put(str, localMyZipEntry);
        m = 1;
        i1 = k;
        i2 = n;
        break label556;
      }
      bool = false;
      break;
      if ((i3 != k) || (i != 0)) {
        break label246;
      }
      if (j == 0) {
        break label284;
      }
      break label246;
      for (;;)
      {
        if (i >= i3) {
          break label571;
        }
        if ((k == 0) || (n == 0) || (j == 0)) {
          break label350;
        }
        break;
        i += 1;
        j = m;
        k = i1;
        n = i2;
      }
    }
  }
  
  private boolean readLocalHeader(RandomAccessFile paramRandomAccessFile)
    throws IOException
  {
    for (;;)
    {
      try
      {
        byte[] arrayOfByte = new byte[30];
        Iterator localIterator = mEntries.keySet().iterator();
        if (!localIterator.hasNext()) {
          break label229;
        }
        Object localObject = (String)localIterator.next();
        localObject = (MyZipEntry)mEntries.get(localObject);
        Streams.readFully(new BufferedInputStream(new MyZipFile.RAFStream(paramRandomAccessFile, mLocalHeaderRelOffset), 4096), arrayOfByte, 0, arrayOfByte.length);
        HeapBufferIterator localHeapBufferIterator = HeapBufferIterator.iterator(arrayOfByte, 0, arrayOfByte.length, ByteOrder.LITTLE_ENDIAN);
        i = localHeapBufferIterator.readInt();
        if (i != 67324752L)
        {
          bool = false;
          return bool;
        }
        localHeapBufferIterator.skip(2);
        if ((localHeapBufferIterator.readShort() & 0x8) != 0)
        {
          bool = true;
          localHeapBufferIterator.skip(18);
          i = localHeapBufferIterator.readShort();
          int j = localHeapBufferIterator.readShort();
          hasDD = bool;
          long l1 = i + 30 + j;
          long l2 = compressedSize;
          if (!bool) {
            break label224;
          }
          i = 16;
          mLocContentSize = (l1 + l2 + i);
          continue;
        }
        bool = false;
      }
      finally {}
      continue;
      label224:
      int i = 0;
      continue;
      label229:
      boolean bool = true;
    }
  }
  
  private long writeLong(OutputStream paramOutputStream, long paramLong)
    throws IOException
  {
    paramOutputStream.write((int)(0xFF & paramLong));
    paramOutputStream.write((int)(paramLong >> 8) & 0xFF);
    paramOutputStream.write((int)(paramLong >> 16) & 0xFF);
    paramOutputStream.write((int)(paramLong >> 24) & 0xFF);
    return paramLong;
  }
  
  private int writeShort(OutputStream paramOutputStream, int paramInt)
    throws IOException
  {
    paramOutputStream.write(paramInt & 0xFF);
    paramOutputStream.write(paramInt >> 8 & 0xFF);
    return paramInt;
  }
  
  /* Error */
  private File writeToJar(String paramString1, String paramString2)
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 66	com/tencent/commonsdk/soload/DexReleasor:mEntries	Ljava/util/LinkedHashMap;
    //   6: aload_2
    //   7: invokevirtual 214	java/util/LinkedHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   10: checkcast 170	com/tencent/commonsdk/soload/MyZipEntry
    //   13: astore_2
    //   14: aload_2
    //   15: ifnonnull +9 -> 24
    //   18: aconst_null
    //   19: astore_1
    //   20: aload_0
    //   21: monitorexit
    //   22: aload_1
    //   23: areturn
    //   24: new 83	java/io/File
    //   27: dup
    //   28: new 254	java/lang/StringBuilder
    //   31: dup
    //   32: invokespecial 255	java/lang/StringBuilder:<init>	()V
    //   35: aload_0
    //   36: getfield 70	com/tencent/commonsdk/soload/DexReleasor:mDstPath	Ljava/lang/String;
    //   39: invokevirtual 259	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   42: aload_1
    //   43: invokevirtual 259	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   46: invokevirtual 262	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   49: invokespecial 86	java/io/File:<init>	(Ljava/lang/String;)V
    //   52: astore_1
    //   53: aload_1
    //   54: invokevirtual 89	java/io/File:exists	()Z
    //   57: ifne +8 -> 65
    //   60: aload_1
    //   61: invokevirtual 265	java/io/File:createNewFile	()Z
    //   64: pop
    //   65: new 267	java/io/FileOutputStream
    //   68: dup
    //   69: aload_1
    //   70: invokespecial 270	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   73: astore 10
    //   75: new 272	java/io/BufferedOutputStream
    //   78: dup
    //   79: aload 10
    //   81: invokespecial 275	java/io/BufferedOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   84: astore 11
    //   86: aload_0
    //   87: getfield 59	com/tencent/commonsdk/soload/DexReleasor:mRaf	Ljava/io/RandomAccessFile;
    //   90: aload_2
    //   91: getfield 218	com/tencent/commonsdk/soload/MyZipEntry:mLocalHeaderRelOffset	J
    //   94: invokevirtual 113	java/io/RandomAccessFile:seek	(J)V
    //   97: aload_0
    //   98: getfield 59	com/tencent/commonsdk/soload/DexReleasor:mRaf	Ljava/io/RandomAccessFile;
    //   101: getstatic 50	com/tencent/commonsdk/soload/DexReleasor:buffer	[B
    //   104: iconst_0
    //   105: bipush 26
    //   107: invokevirtual 150	java/io/RandomAccessFile:read	([BII)I
    //   110: istore_3
    //   111: iload_3
    //   112: iconst_m1
    //   113: if_icmpeq +9 -> 122
    //   116: iload_3
    //   117: bipush 26
    //   119: if_icmpeq +18 -> 137
    //   122: aload 11
    //   124: invokevirtual 278	java/io/BufferedOutputStream:close	()V
    //   127: aload 10
    //   129: invokevirtual 279	java/io/FileOutputStream:close	()V
    //   132: aconst_null
    //   133: astore_1
    //   134: goto -114 -> 20
    //   137: aload 11
    //   139: getstatic 50	com/tencent/commonsdk/soload/DexReleasor:buffer	[B
    //   142: iconst_0
    //   143: bipush 26
    //   145: invokevirtual 282	java/io/BufferedOutputStream:write	([BII)V
    //   148: ldc 10
    //   150: ldc_w 284
    //   153: invokevirtual 288	java/lang/String:getBytes	(Ljava/lang/String;)[B
    //   156: astore 12
    //   158: aload 12
    //   160: arraylength
    //   161: istore 4
    //   163: aload_0
    //   164: aload 11
    //   166: iload 4
    //   168: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   171: pop
    //   172: aload_0
    //   173: aload 11
    //   175: aload_2
    //   176: getfield 294	com/tencent/commonsdk/soload/MyZipEntry:extraLength	I
    //   179: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   182: pop
    //   183: aload 11
    //   185: aload 12
    //   187: invokevirtual 296	java/io/BufferedOutputStream:write	([B)V
    //   190: aload_0
    //   191: getfield 59	com/tencent/commonsdk/soload/DexReleasor:mRaf	Ljava/io/RandomAccessFile;
    //   194: aload_2
    //   195: getfield 218	com/tencent/commonsdk/soload/MyZipEntry:mLocalHeaderRelOffset	J
    //   198: ldc2_w 297
    //   201: ladd
    //   202: aload_2
    //   203: getfield 301	com/tencent/commonsdk/soload/MyZipEntry:nameLength	I
    //   206: i2l
    //   207: ladd
    //   208: invokevirtual 113	java/io/RandomAccessFile:seek	(J)V
    //   211: aload_2
    //   212: getfield 239	com/tencent/commonsdk/soload/MyZipEntry:mLocContentSize	J
    //   215: ldc2_w 297
    //   218: lsub
    //   219: aload_2
    //   220: getfield 301	com/tencent/commonsdk/soload/MyZipEntry:nameLength	I
    //   223: i2l
    //   224: lsub
    //   225: lstore 8
    //   227: lconst_0
    //   228: lstore 6
    //   230: ldc2_w 302
    //   233: lload 6
    //   235: ladd
    //   236: lload 8
    //   238: lcmp
    //   239: ifgt +19 -> 258
    //   242: aload_0
    //   243: getfield 59	com/tencent/commonsdk/soload/DexReleasor:mRaf	Ljava/io/RandomAccessFile;
    //   246: getstatic 50	com/tencent/commonsdk/soload/DexReleasor:buffer	[B
    //   249: invokevirtual 306	java/io/RandomAccessFile:read	([B)I
    //   252: istore_3
    //   253: iload_3
    //   254: iconst_m1
    //   255: if_icmpne +446 -> 701
    //   258: lload 8
    //   260: lload 6
    //   262: lsub
    //   263: l2i
    //   264: istore_3
    //   265: aload_0
    //   266: getfield 59	com/tencent/commonsdk/soload/DexReleasor:mRaf	Ljava/io/RandomAccessFile;
    //   269: getstatic 50	com/tencent/commonsdk/soload/DexReleasor:buffer	[B
    //   272: iconst_0
    //   273: iload_3
    //   274: invokevirtual 150	java/io/RandomAccessFile:read	([BII)I
    //   277: istore 5
    //   279: iload 5
    //   281: iconst_m1
    //   282: if_icmpeq +468 -> 750
    //   285: iload 5
    //   287: iload_3
    //   288: if_icmpne +462 -> 750
    //   291: aload 11
    //   293: getstatic 50	com/tencent/commonsdk/soload/DexReleasor:buffer	[B
    //   296: iconst_0
    //   297: iload_3
    //   298: invokevirtual 282	java/io/BufferedOutputStream:write	([BII)V
    //   301: new 308	java/io/ByteArrayOutputStream
    //   304: dup
    //   305: invokespecial 309	java/io/ByteArrayOutputStream:<init>	()V
    //   308: astore 13
    //   310: aload_0
    //   311: aload 13
    //   313: ldc2_w 310
    //   316: invokespecial 313	com/tencent/commonsdk/soload/DexReleasor:writeLong	(Ljava/io/OutputStream;J)J
    //   319: pop2
    //   320: aload_0
    //   321: aload 13
    //   323: aload_2
    //   324: getfield 316	com/tencent/commonsdk/soload/MyZipEntry:version	I
    //   327: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   330: pop
    //   331: aload_0
    //   332: aload 13
    //   334: aload_2
    //   335: getfield 319	com/tencent/commonsdk/soload/MyZipEntry:versionMinimum	I
    //   338: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   341: pop
    //   342: aload_0
    //   343: aload 13
    //   345: aload_2
    //   346: getfield 322	com/tencent/commonsdk/soload/MyZipEntry:flags	I
    //   349: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   352: pop
    //   353: aload_0
    //   354: aload 13
    //   356: aload_2
    //   357: getfield 325	com/tencent/commonsdk/soload/MyZipEntry:compressionMethod	I
    //   360: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   363: pop
    //   364: aload_0
    //   365: aload 13
    //   367: aload_2
    //   368: getfield 328	com/tencent/commonsdk/soload/MyZipEntry:time	I
    //   371: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   374: pop
    //   375: aload_0
    //   376: aload 13
    //   378: aload_2
    //   379: getfield 331	com/tencent/commonsdk/soload/MyZipEntry:modDate	I
    //   382: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   385: pop
    //   386: aload_0
    //   387: aload 13
    //   389: aload_2
    //   390: getfield 334	com/tencent/commonsdk/soload/MyZipEntry:crc	J
    //   393: invokespecial 313	com/tencent/commonsdk/soload/DexReleasor:writeLong	(Ljava/io/OutputStream;J)J
    //   396: pop2
    //   397: aload_0
    //   398: aload 13
    //   400: aload_2
    //   401: getfield 236	com/tencent/commonsdk/soload/MyZipEntry:compressedSize	J
    //   404: invokespecial 313	com/tencent/commonsdk/soload/DexReleasor:writeLong	(Ljava/io/OutputStream;J)J
    //   407: pop2
    //   408: aload_0
    //   409: aload 13
    //   411: aload_2
    //   412: getfield 337	com/tencent/commonsdk/soload/MyZipEntry:size	J
    //   415: invokespecial 313	com/tencent/commonsdk/soload/DexReleasor:writeLong	(Ljava/io/OutputStream;J)J
    //   418: pop2
    //   419: aload_0
    //   420: aload 13
    //   422: iload 4
    //   424: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   427: pop
    //   428: aload_0
    //   429: aload 13
    //   431: aload_2
    //   432: getfield 294	com/tencent/commonsdk/soload/MyZipEntry:extraLength	I
    //   435: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   438: pop
    //   439: aload_0
    //   440: aload 13
    //   442: aload_2
    //   443: getfield 340	com/tencent/commonsdk/soload/MyZipEntry:commentLength	I
    //   446: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   449: pop
    //   450: aload_0
    //   451: aload 13
    //   453: aload_2
    //   454: getfield 343	com/tencent/commonsdk/soload/MyZipEntry:diskNumbers	I
    //   457: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   460: pop
    //   461: aload_0
    //   462: aload 13
    //   464: aload_2
    //   465: getfield 346	com/tencent/commonsdk/soload/MyZipEntry:internalFileAttri	I
    //   468: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   471: pop
    //   472: aload_0
    //   473: aload 13
    //   475: aload_2
    //   476: getfield 349	com/tencent/commonsdk/soload/MyZipEntry:externalFileAttri	J
    //   479: invokespecial 313	com/tencent/commonsdk/soload/DexReleasor:writeLong	(Ljava/io/OutputStream;J)J
    //   482: pop2
    //   483: aload_0
    //   484: aload 13
    //   486: lconst_0
    //   487: invokespecial 313	com/tencent/commonsdk/soload/DexReleasor:writeLong	(Ljava/io/OutputStream;J)J
    //   490: pop2
    //   491: aload 13
    //   493: aload 12
    //   495: invokevirtual 350	java/io/ByteArrayOutputStream:write	([B)V
    //   498: aload_2
    //   499: getfield 294	com/tencent/commonsdk/soload/MyZipEntry:extraLength	I
    //   502: ifle +12 -> 514
    //   505: aload 13
    //   507: aload_2
    //   508: getfield 353	com/tencent/commonsdk/soload/MyZipEntry:extra	[B
    //   511: invokevirtual 350	java/io/ByteArrayOutputStream:write	([B)V
    //   514: aload_2
    //   515: getfield 340	com/tencent/commonsdk/soload/MyZipEntry:commentLength	I
    //   518: ifle +15 -> 533
    //   521: aload 13
    //   523: aload_2
    //   524: getfield 356	com/tencent/commonsdk/soload/MyZipEntry:comment	Ljava/lang/String;
    //   527: invokevirtual 359	java/lang/String:getBytes	()[B
    //   530: invokevirtual 350	java/io/ByteArrayOutputStream:write	([B)V
    //   533: aload_2
    //   534: getfield 233	com/tencent/commonsdk/soload/MyZipEntry:hasDD	Z
    //   537: ifeq +218 -> 755
    //   540: bipush 16
    //   542: istore_3
    //   543: iload_3
    //   544: bipush 30
    //   546: iadd
    //   547: iload 4
    //   549: iadd
    //   550: aload_2
    //   551: getfield 294	com/tencent/commonsdk/soload/MyZipEntry:extraLength	I
    //   554: iadd
    //   555: i2l
    //   556: lstore 6
    //   558: aload_2
    //   559: getfield 236	com/tencent/commonsdk/soload/MyZipEntry:compressedSize	J
    //   562: lstore 8
    //   564: aload 13
    //   566: invokevirtual 361	java/io/ByteArrayOutputStream:size	()I
    //   569: istore_3
    //   570: aload_0
    //   571: aload 13
    //   573: ldc2_w 362
    //   576: invokespecial 313	com/tencent/commonsdk/soload/DexReleasor:writeLong	(Ljava/io/OutputStream;J)J
    //   579: pop2
    //   580: aload_0
    //   581: aload 13
    //   583: iconst_0
    //   584: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   587: pop
    //   588: aload_0
    //   589: aload 13
    //   591: iconst_0
    //   592: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   595: pop
    //   596: aload_0
    //   597: aload 13
    //   599: iconst_1
    //   600: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   603: pop
    //   604: aload_0
    //   605: aload 13
    //   607: iconst_1
    //   608: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   611: pop
    //   612: aload_0
    //   613: aload 13
    //   615: iload_3
    //   616: i2l
    //   617: invokespecial 313	com/tencent/commonsdk/soload/DexReleasor:writeLong	(Ljava/io/OutputStream;J)J
    //   620: pop2
    //   621: aload_0
    //   622: aload 13
    //   624: lload 6
    //   626: lload 8
    //   628: ladd
    //   629: invokespecial 313	com/tencent/commonsdk/soload/DexReleasor:writeLong	(Ljava/io/OutputStream;J)J
    //   632: pop2
    //   633: aload_0
    //   634: getfield 61	com/tencent/commonsdk/soload/DexReleasor:commentOfEOCD	[B
    //   637: ifnull +82 -> 719
    //   640: aload_0
    //   641: aload 13
    //   643: aload_0
    //   644: getfield 61	com/tencent/commonsdk/soload/DexReleasor:commentOfEOCD	[B
    //   647: arraylength
    //   648: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   651: pop
    //   652: aload 13
    //   654: aload_0
    //   655: getfield 61	com/tencent/commonsdk/soload/DexReleasor:commentOfEOCD	[B
    //   658: invokevirtual 350	java/io/ByteArrayOutputStream:write	([B)V
    //   661: aload 13
    //   663: aload 11
    //   665: invokevirtual 366	java/io/ByteArrayOutputStream:writeTo	(Ljava/io/OutputStream;)V
    //   668: aload 11
    //   670: ifnull +13 -> 683
    //   673: aload 11
    //   675: invokevirtual 369	java/io/BufferedOutputStream:flush	()V
    //   678: aload 11
    //   680: invokevirtual 278	java/io/BufferedOutputStream:close	()V
    //   683: aload 10
    //   685: ifnull +62 -> 747
    //   688: aload 10
    //   690: invokevirtual 370	java/io/FileOutputStream:flush	()V
    //   693: aload 10
    //   695: invokevirtual 279	java/io/FileOutputStream:close	()V
    //   698: goto +49 -> 747
    //   701: aload 11
    //   703: getstatic 50	com/tencent/commonsdk/soload/DexReleasor:buffer	[B
    //   706: invokevirtual 296	java/io/BufferedOutputStream:write	([B)V
    //   709: lload 6
    //   711: iload_3
    //   712: i2l
    //   713: ladd
    //   714: lstore 6
    //   716: goto -486 -> 230
    //   719: aload_0
    //   720: aload 13
    //   722: iconst_0
    //   723: invokespecial 290	com/tencent/commonsdk/soload/DexReleasor:writeShort	(Ljava/io/OutputStream;I)I
    //   726: pop
    //   727: goto -66 -> 661
    //   730: astore_1
    //   731: aload_0
    //   732: monitorexit
    //   733: aload_1
    //   734: athrow
    //   735: astore_1
    //   736: goto -5 -> 731
    //   739: astore_1
    //   740: goto -9 -> 731
    //   743: astore_1
    //   744: goto -13 -> 731
    //   747: goto -727 -> 20
    //   750: aconst_null
    //   751: astore_1
    //   752: goto -732 -> 20
    //   755: iconst_0
    //   756: istore_3
    //   757: goto -214 -> 543
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	760	0	this	DexReleasor
    //   0	760	1	paramString1	String
    //   0	760	2	paramString2	String
    //   110	647	3	i	int
    //   161	389	4	j	int
    //   277	12	5	k	int
    //   228	487	6	l1	long
    //   225	402	8	l2	long
    //   73	621	10	localFileOutputStream	java.io.FileOutputStream
    //   84	618	11	localBufferedOutputStream	java.io.BufferedOutputStream
    //   156	338	12	arrayOfByte	byte[]
    //   308	413	13	localByteArrayOutputStream	java.io.ByteArrayOutputStream
    // Exception table:
    //   from	to	target	type
    //   86	111	730	finally
    //   122	132	730	finally
    //   137	227	730	finally
    //   242	253	730	finally
    //   265	279	730	finally
    //   291	514	730	finally
    //   514	533	730	finally
    //   533	540	730	finally
    //   543	661	730	finally
    //   661	668	730	finally
    //   673	683	730	finally
    //   688	698	730	finally
    //   701	709	730	finally
    //   719	727	730	finally
    //   2	14	735	finally
    //   24	53	735	finally
    //   53	65	739	finally
    //   65	75	739	finally
    //   75	86	743	finally
  }
  
  public void destroy()
  {
    if (mRaf != null) {}
    try
    {
      mRaf.close();
      mRaf = null;
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        localIOException = localIOException;
        mRaf = null;
      }
    }
    finally
    {
      localObject = finally;
      mRaf = null;
      throw localObject;
    }
    buffer = null;
    dexOperator = null;
  }
  
  /* Error */
  public File releaseDex(String paramString1, String paramString2)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: aload_2
    //   5: invokespecial 375	com/tencent/commonsdk/soload/DexReleasor:writeToJar	(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    //   8: astore_3
    //   9: aload_3
    //   10: astore_1
    //   11: getstatic 37	com/tencent/commonsdk/soload/DexReleasor:sExtraDexes	[Ljava/lang/String;
    //   14: iconst_2
    //   15: aaload
    //   16: aload_2
    //   17: invokevirtual 187	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   20: ifeq +9 -> 29
    //   23: aload_0
    //   24: invokevirtual 377	com/tencent/commonsdk/soload/DexReleasor:destroy	()V
    //   27: aload_3
    //   28: astore_1
    //   29: aload_0
    //   30: monitorexit
    //   31: aload_1
    //   32: areturn
    //   33: astore_1
    //   34: aload_1
    //   35: invokevirtual 77	java/io/IOException:printStackTrace	()V
    //   38: aconst_null
    //   39: astore_3
    //   40: aload_3
    //   41: astore_1
    //   42: getstatic 37	com/tencent/commonsdk/soload/DexReleasor:sExtraDexes	[Ljava/lang/String;
    //   45: iconst_2
    //   46: aaload
    //   47: aload_2
    //   48: invokevirtual 187	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   51: ifeq -22 -> 29
    //   54: aload_0
    //   55: invokevirtual 377	com/tencent/commonsdk/soload/DexReleasor:destroy	()V
    //   58: aload_3
    //   59: astore_1
    //   60: goto -31 -> 29
    //   63: astore_1
    //   64: aload_0
    //   65: monitorexit
    //   66: aload_1
    //   67: athrow
    //   68: astore_1
    //   69: getstatic 37	com/tencent/commonsdk/soload/DexReleasor:sExtraDexes	[Ljava/lang/String;
    //   72: iconst_2
    //   73: aaload
    //   74: aload_2
    //   75: invokevirtual 187	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   78: ifeq +7 -> 85
    //   81: aload_0
    //   82: invokevirtual 377	com/tencent/commonsdk/soload/DexReleasor:destroy	()V
    //   85: aload_1
    //   86: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	87	0	this	DexReleasor
    //   0	87	1	paramString1	String
    //   0	87	2	paramString2	String
    //   8	51	3	localFile	File
    // Exception table:
    //   from	to	target	type
    //   2	9	33	java/io/IOException
    //   11	27	63	finally
    //   42	58	63	finally
    //   69	85	63	finally
    //   85	87	63	finally
    //   2	9	68	finally
    //   34	38	68	finally
  }
}
