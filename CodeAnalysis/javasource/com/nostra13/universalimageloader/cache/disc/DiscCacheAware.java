package com.nostra13.universalimageloader.cache.disc;

import android.graphics.Bitmap;
import com.nostra13.universalimageloader.utils.IoUtils.CopyListener;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

@Deprecated
public abstract interface DiscCacheAware
{
  public abstract File get(String paramString);
  
  public abstract boolean save(String paramString, Bitmap paramBitmap)
    throws IOException;
  
  public abstract boolean save(String paramString, InputStream paramInputStream, IoUtils.CopyListener paramCopyListener)
    throws IOException;
}
