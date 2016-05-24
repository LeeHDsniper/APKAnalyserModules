package com.nostra13.universalimageloader.core.assist;

import java.io.IOException;
import java.io.InputStream;

public class ContentLengthInputStream
  extends InputStream
{
  private final int length;
  private final InputStream stream;
  
  public ContentLengthInputStream(InputStream paramInputStream, int paramInt)
  {
    stream = paramInputStream;
    length = paramInt;
  }
  
  public int available()
  {
    return length;
  }
  
  public void close()
    throws IOException
  {
    stream.close();
  }
  
  public void mark(int paramInt)
  {
    stream.mark(paramInt);
  }
  
  public boolean markSupported()
  {
    return stream.markSupported();
  }
  
  public int read()
    throws IOException
  {
    return stream.read();
  }
  
  public int read(byte[] paramArrayOfByte)
    throws IOException
  {
    return stream.read(paramArrayOfByte);
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    return stream.read(paramArrayOfByte, paramInt1, paramInt2);
  }
  
  public void reset()
    throws IOException
  {
    stream.reset();
  }
  
  public long skip(long paramLong)
    throws IOException
  {
    return stream.skip(paramLong);
  }
}
