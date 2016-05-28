package com.squareup.okhttp;

import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import okio.BufferedSource;

public abstract class ResponseBody
  implements Closeable
{
  public ResponseBody() {}
  
  public final InputStream byteStream()
  {
    return source().inputStream();
  }
  
  public void close()
    throws IOException
  {
    source().close();
  }
  
  public abstract long contentLength();
  
  public abstract BufferedSource source();
}
