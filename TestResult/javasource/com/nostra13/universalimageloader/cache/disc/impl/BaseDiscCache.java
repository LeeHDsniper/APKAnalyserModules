package com.nostra13.universalimageloader.cache.disc.impl;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import com.nostra13.universalimageloader.cache.disc.DiskCache;
import com.nostra13.universalimageloader.cache.disc.naming.FileNameGenerator;
import com.nostra13.universalimageloader.utils.IoUtils;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

public abstract class BaseDiscCache
  implements DiskCache
{
  public static final Bitmap.CompressFormat DEFAULT_COMPRESS_FORMAT = Bitmap.CompressFormat.PNG;
  protected int bufferSize = 32768;
  protected final File cacheDir;
  protected Bitmap.CompressFormat compressFormat = DEFAULT_COMPRESS_FORMAT;
  protected int compressQuality = 100;
  protected final FileNameGenerator fileNameGenerator;
  protected final File reserveCacheDir;
  
  public BaseDiscCache(File paramFile1, File paramFile2, FileNameGenerator paramFileNameGenerator)
  {
    if (paramFile1 == null) {
      throw new IllegalArgumentException("cacheDir argument must be not null");
    }
    if (paramFileNameGenerator == null) {
      throw new IllegalArgumentException("fileNameGenerator argument must be not null");
    }
    cacheDir = paramFile1;
    reserveCacheDir = paramFile2;
    fileNameGenerator = paramFileNameGenerator;
  }
  
  public File get(String paramString)
  {
    return getFile(paramString);
  }
  
  protected File getFile(String paramString)
  {
    String str = fileNameGenerator.generate(paramString);
    File localFile = cacheDir;
    paramString = localFile;
    if (!cacheDir.exists())
    {
      paramString = localFile;
      if (!cacheDir.mkdirs())
      {
        paramString = localFile;
        if (reserveCacheDir != null) {
          if (!reserveCacheDir.exists())
          {
            paramString = localFile;
            if (!reserveCacheDir.mkdirs()) {}
          }
          else
          {
            paramString = reserveCacheDir;
          }
        }
      }
    }
    return new File(paramString, str);
  }
  
  public boolean save(String paramString, Bitmap paramBitmap)
    throws IOException
  {
    paramString = getFile(paramString);
    File localFile = new File(paramString.getAbsolutePath() + ".tmp");
    BufferedOutputStream localBufferedOutputStream = new BufferedOutputStream(new FileOutputStream(localFile), bufferSize);
    try
    {
      boolean bool1 = paramBitmap.compress(compressFormat, compressQuality, localBufferedOutputStream);
      IoUtils.closeSilently(localBufferedOutputStream);
      boolean bool2 = bool1;
      if (bool1)
      {
        bool2 = bool1;
        if (!localFile.renameTo(paramString)) {
          bool2 = false;
        }
      }
      if (!bool2) {
        localFile.delete();
      }
      paramBitmap.recycle();
      return bool2;
    }
    finally
    {
      IoUtils.closeSilently(localBufferedOutputStream);
      if (((0 == 0) || (localFile.renameTo(paramString))) || (0 == 0)) {
        localFile.delete();
      }
    }
  }
  
  /* Error */
  public boolean save(String paramString, java.io.InputStream paramInputStream, com.nostra13.universalimageloader.utils.IoUtils.CopyListener paramCopyListener)
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: aload_1
    //   2: invokevirtual 58	com/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache:getFile	(Ljava/lang/String;)Ljava/io/File;
    //   5: astore_1
    //   6: new 66	java/io/File
    //   9: dup
    //   10: new 82	java/lang/StringBuilder
    //   13: dup
    //   14: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   17: aload_1
    //   18: invokevirtual 87	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   21: invokevirtual 91	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   24: ldc 93
    //   26: invokevirtual 91	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   29: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   32: invokespecial 97	java/io/File:<init>	(Ljava/lang/String;)V
    //   35: astore 6
    //   37: iconst_0
    //   38: istore 5
    //   40: iload 5
    //   42: istore 4
    //   44: new 99	java/io/BufferedOutputStream
    //   47: dup
    //   48: new 101	java/io/FileOutputStream
    //   51: dup
    //   52: aload 6
    //   54: invokespecial 104	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   57: aload_0
    //   58: getfield 34	com/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache:bufferSize	I
    //   61: invokespecial 107	java/io/BufferedOutputStream:<init>	(Ljava/io/OutputStream;I)V
    //   64: astore 7
    //   66: aload_2
    //   67: aload 7
    //   69: aload_3
    //   70: aload_0
    //   71: getfield 34	com/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache:bufferSize	I
    //   74: invokestatic 135	com/nostra13/universalimageloader/utils/IoUtils:copyStream	(Ljava/io/InputStream;Ljava/io/OutputStream;Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;I)Z
    //   77: istore 4
    //   79: iload 4
    //   81: istore 5
    //   83: iload 5
    //   85: istore 4
    //   87: aload 7
    //   89: invokestatic 119	com/nostra13/universalimageloader/utils/IoUtils:closeSilently	(Ljava/io/Closeable;)V
    //   92: aload_2
    //   93: invokestatic 119	com/nostra13/universalimageloader/utils/IoUtils:closeSilently	(Ljava/io/Closeable;)V
    //   96: iload 5
    //   98: istore 4
    //   100: iload 5
    //   102: ifeq +19 -> 121
    //   105: iload 5
    //   107: istore 4
    //   109: aload 6
    //   111: aload_1
    //   112: invokevirtual 123	java/io/File:renameTo	(Ljava/io/File;)Z
    //   115: ifne +6 -> 121
    //   118: iconst_0
    //   119: istore 4
    //   121: iload 4
    //   123: ifne +9 -> 132
    //   126: aload 6
    //   128: invokevirtual 126	java/io/File:delete	()Z
    //   131: pop
    //   132: iload 4
    //   134: ireturn
    //   135: astore_3
    //   136: iload 5
    //   138: istore 4
    //   140: aload 7
    //   142: invokestatic 119	com/nostra13/universalimageloader/utils/IoUtils:closeSilently	(Ljava/io/Closeable;)V
    //   145: iload 5
    //   147: istore 4
    //   149: aload_3
    //   150: athrow
    //   151: astore_3
    //   152: aload_2
    //   153: invokestatic 119	com/nostra13/universalimageloader/utils/IoUtils:closeSilently	(Ljava/io/Closeable;)V
    //   156: iload 4
    //   158: istore 5
    //   160: iload 4
    //   162: ifeq +19 -> 181
    //   165: iload 4
    //   167: istore 5
    //   169: aload 6
    //   171: aload_1
    //   172: invokevirtual 123	java/io/File:renameTo	(Ljava/io/File;)Z
    //   175: ifne +6 -> 181
    //   178: iconst_0
    //   179: istore 5
    //   181: iload 5
    //   183: ifne +9 -> 192
    //   186: aload 6
    //   188: invokevirtual 126	java/io/File:delete	()Z
    //   191: pop
    //   192: aload_3
    //   193: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	194	0	this	BaseDiscCache
    //   0	194	1	paramString	String
    //   0	194	2	paramInputStream	java.io.InputStream
    //   0	194	3	paramCopyListener	com.nostra13.universalimageloader.utils.IoUtils.CopyListener
    //   42	124	4	bool1	boolean
    //   38	144	5	bool2	boolean
    //   35	152	6	localFile	File
    //   64	77	7	localBufferedOutputStream	BufferedOutputStream
    // Exception table:
    //   from	to	target	type
    //   66	79	135	finally
    //   44	66	151	finally
    //   87	92	151	finally
    //   140	145	151	finally
    //   149	151	151	finally
  }
}
