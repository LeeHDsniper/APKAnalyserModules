package it.sephiroth.android.library.picasso;

import android.graphics.Bitmap;
import android.net.Uri;
import java.io.IOException;
import java.io.InputStream;

public abstract interface Downloader
{
  public abstract Response load(Uri paramUri, int paramInt)
    throws IOException;
  
  public static class Response
  {
    final Bitmap bitmap;
    final boolean cached;
    final long contentLength;
    final InputStream stream;
    
    public Response(InputStream paramInputStream, boolean paramBoolean, long paramLong)
    {
      if (paramInputStream == null) {
        throw new IllegalArgumentException("Stream may not be null.");
      }
      stream = paramInputStream;
      bitmap = null;
      cached = paramBoolean;
      contentLength = paramLong;
    }
    
    @Deprecated
    public Bitmap getBitmap()
    {
      return bitmap;
    }
    
    public long getContentLength()
    {
      return contentLength;
    }
    
    public InputStream getInputStream()
    {
      return stream;
    }
  }
  
  public static class ResponseException
    extends IOException
  {
    final boolean localCacheOnly;
    final int responseCode;
    
    public ResponseException(String paramString, int paramInt1, int paramInt2)
    {
      super();
      localCacheOnly = NetworkPolicy.isOfflineOnly(paramInt1);
      responseCode = paramInt2;
    }
  }
}
