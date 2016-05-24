package com.squareup.okhttp;

import java.io.IOException;
import okio.BufferedSink;

public abstract class RequestBody
{
  public RequestBody() {}
  
  public static RequestBody create(MediaType paramMediaType, final byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null) {
      throw new NullPointerException("content == null");
    }
    new RequestBody()
    {
      public long contentLength()
      {
        return paramArrayOfByte.length;
      }
      
      public MediaType contentType()
      {
        return val$contentType;
      }
      
      public void writeTo(BufferedSink paramAnonymousBufferedSink)
        throws IOException
      {
        paramAnonymousBufferedSink.write(paramArrayOfByte);
      }
    };
  }
  
  public long contentLength()
  {
    return -1L;
  }
  
  public abstract MediaType contentType();
  
  public abstract void writeTo(BufferedSink paramBufferedSink)
    throws IOException;
}
