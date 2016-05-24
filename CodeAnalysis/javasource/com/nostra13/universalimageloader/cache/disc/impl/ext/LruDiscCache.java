package com.nostra13.universalimageloader.cache.disc.impl.ext;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import com.nostra13.universalimageloader.cache.disc.DiskCache;
import com.nostra13.universalimageloader.cache.disc.naming.FileNameGenerator;
import com.nostra13.universalimageloader.utils.IoUtils;
import com.nostra13.universalimageloader.utils.IoUtils.CopyListener;
import com.nostra13.universalimageloader.utils.L;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

public class LruDiscCache
  implements DiskCache
{
  public static final Bitmap.CompressFormat DEFAULT_COMPRESS_FORMAT = Bitmap.CompressFormat.PNG;
  protected int bufferSize = 32768;
  protected DiskLruCache cache;
  protected Bitmap.CompressFormat compressFormat = DEFAULT_COMPRESS_FORMAT;
  protected int compressQuality = 100;
  protected final FileNameGenerator fileNameGenerator;
  private File reserveCacheDir;
  
  public LruDiscCache(File paramFile, FileNameGenerator paramFileNameGenerator, long paramLong, int paramInt)
  {
    if (paramFile == null) {
      throw new IllegalArgumentException("cacheDir argument must be not null");
    }
    if (paramLong < 0L) {
      throw new IllegalArgumentException("cacheMaxSize argument must be positive number");
    }
    if (paramInt < 0) {
      throw new IllegalArgumentException("cacheMaxFileCount argument must be positive number");
    }
    if (paramFileNameGenerator == null) {
      throw new IllegalArgumentException("fileNameGenerator argument must be not null");
    }
    long l = paramLong;
    if (paramLong == 0L) {
      l = Long.MAX_VALUE;
    }
    int i = paramInt;
    if (paramInt == 0) {
      i = Integer.MAX_VALUE;
    }
    fileNameGenerator = paramFileNameGenerator;
    initCache(paramFile, reserveCacheDir, l, i);
  }
  
  private String getKey(String paramString)
  {
    return fileNameGenerator.generate(paramString);
  }
  
  private void initCache(File paramFile1, File paramFile2, long paramLong, int paramInt)
  {
    try
    {
      cache = DiskLruCache.open(paramFile1, 1, 1, paramLong, paramInt);
      return;
    }
    catch (IOException paramFile1)
    {
      do
      {
        L.e(paramFile1);
      } while (paramFile2 == null);
      initCache(paramFile2, null, paramLong, paramInt);
    }
  }
  
  public File get(String paramString)
  {
    localObject3 = null;
    File localFile = null;
    localObject2 = null;
    for (localObject1 = null;; localObject1 = localFile)
    {
      try
      {
        paramString = cache.get(getKey(paramString));
        if (paramString != null) {
          break label44;
        }
        localObject1 = localFile;
        localObject2 = localObject1;
        if (paramString != null)
        {
          paramString.close();
          localObject2 = localObject1;
        }
      }
      catch (IOException paramString)
      {
        label44:
        localObject2 = localObject1;
        L.e(paramString);
        localObject2 = localObject3;
        return null;
      }
      finally
      {
        if (localObject2 == null) {
          break;
        }
        ((DiskLruCache.Snapshot)localObject2).close();
      }
      return localObject2;
      localObject1 = paramString;
      localObject2 = paramString;
      localFile = paramString.getFile(0);
    }
  }
  
  public boolean save(String paramString, Bitmap paramBitmap)
    throws IOException
  {
    DiskLruCache.Editor localEditor = cache.edit(getKey(paramString));
    if (localEditor == null) {
      return false;
    }
    paramString = new BufferedOutputStream(localEditor.newOutputStream(0), bufferSize);
    boolean bool;
    try
    {
      bool = paramBitmap.compress(compressFormat, compressQuality, paramString);
      IoUtils.closeSilently(paramString);
      if (bool)
      {
        localEditor.commit();
        return bool;
      }
    }
    finally
    {
      IoUtils.closeSilently(paramString);
    }
    localEditor.abort();
    return bool;
  }
  
  public boolean save(String paramString, InputStream paramInputStream, IoUtils.CopyListener paramCopyListener)
    throws IOException
  {
    paramString = cache.edit(getKey(paramString));
    if (paramString == null) {
      return false;
    }
    BufferedOutputStream localBufferedOutputStream = new BufferedOutputStream(paramString.newOutputStream(0), bufferSize);
    try
    {
      boolean bool = IoUtils.copyStream(paramInputStream, localBufferedOutputStream, paramCopyListener, bufferSize);
      IoUtils.closeSilently(localBufferedOutputStream);
      if (bool)
      {
        paramString.commit();
        return bool;
      }
      paramString.abort();
      return bool;
    }
    finally
    {
      IoUtils.closeSilently(localBufferedOutputStream);
      if (0 == 0) {
        break label90;
      }
    }
    paramString.commit();
    for (;;)
    {
      throw paramInputStream;
      label90:
      paramString.abort();
    }
  }
  
  public void setReserveCacheDir(File paramFile)
  {
    reserveCacheDir = paramFile;
  }
}
