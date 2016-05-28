package org.apache.http.impl.conn;

import java.io.IOException;
import java.io.InputStream;
import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
class LoggingInputStream
  extends InputStream
{
  private final InputStream in;
  private final Wire wire;
  
  public LoggingInputStream(InputStream paramInputStream, Wire paramWire)
  {
    in = paramInputStream;
    wire = paramWire;
  }
  
  public int available()
    throws IOException
  {
    return in.available();
  }
  
  public void close()
    throws IOException
  {
    in.close();
  }
  
  public void mark(int paramInt)
  {
    try
    {
      super.mark(paramInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public boolean markSupported()
  {
    return false;
  }
  
  public int read()
    throws IOException
  {
    int i = in.read();
    if (i != -1) {
      wire.input(i);
    }
    return i;
  }
  
  public int read(byte[] paramArrayOfByte)
    throws IOException
  {
    int i = in.read(paramArrayOfByte);
    if (i != -1) {
      wire.input(paramArrayOfByte, 0, i);
    }
    return i;
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    paramInt2 = in.read(paramArrayOfByte, paramInt1, paramInt2);
    if (paramInt2 != -1) {
      wire.input(paramArrayOfByte, paramInt1, paramInt2);
    }
    return paramInt2;
  }
  
  public void reset()
    throws IOException
  {
    try
    {
      super.reset();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public long skip(long paramLong)
    throws IOException
  {
    return super.skip(paramLong);
  }
}
