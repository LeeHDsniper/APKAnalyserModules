package org.apache.http.client.entity;

import java.io.IOException;
import java.io.InputStream;
import java.io.PushbackInputStream;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;
import java.util.zip.InflaterInputStream;

public class DeflateInputStream
  extends InputStream
{
  private InputStream sourceStream;
  
  public DeflateInputStream(InputStream paramInputStream)
    throws IOException
  {
    byte[] arrayOfByte1 = new byte[6];
    PushbackInputStream localPushbackInputStream = new PushbackInputStream(paramInputStream, arrayOfByte1.length);
    int i = localPushbackInputStream.read(arrayOfByte1);
    if (i == -1) {
      throw new IOException("Unable to read the response");
    }
    byte[] arrayOfByte3 = new byte[1];
    paramInputStream = new Inflater();
    for (;;)
    {
      try
      {
        j = paramInputStream.inflate(arrayOfByte3);
        if (j == 0) {
          if (paramInputStream.finished()) {
            throw new IOException("Unable to read the response");
          }
        }
      }
      catch (DataFormatException localDataFormatException)
      {
        int j;
        localPushbackInputStream.unread(arrayOfByte1, 0, i);
        sourceStream = new DeflateStream(localPushbackInputStream, new Inflater(true));
        return;
        if (paramInputStream.needsDictionary())
        {
          if (j != -1) {
            break;
          }
          throw new IOException("Unable to read the response");
        }
      }
      finally
      {
        paramInputStream.end();
      }
      if (paramInputStream.needsInput()) {
        paramInputStream.setInput(arrayOfByte2);
      }
    }
    localPushbackInputStream.unread(arrayOfByte2, 0, i);
    sourceStream = new DeflateStream(localPushbackInputStream, new Inflater());
    paramInputStream.end();
  }
  
  public int available()
    throws IOException
  {
    return sourceStream.available();
  }
  
  public void close()
    throws IOException
  {
    sourceStream.close();
  }
  
  public void mark(int paramInt)
  {
    sourceStream.mark(paramInt);
  }
  
  public boolean markSupported()
  {
    return sourceStream.markSupported();
  }
  
  public int read()
    throws IOException
  {
    return sourceStream.read();
  }
  
  public int read(byte[] paramArrayOfByte)
    throws IOException
  {
    return sourceStream.read(paramArrayOfByte);
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    return sourceStream.read(paramArrayOfByte, paramInt1, paramInt2);
  }
  
  public void reset()
    throws IOException
  {
    sourceStream.reset();
  }
  
  public long skip(long paramLong)
    throws IOException
  {
    return sourceStream.skip(paramLong);
  }
  
  static class DeflateStream
    extends InflaterInputStream
  {
    private boolean closed = false;
    
    public DeflateStream(InputStream paramInputStream, Inflater paramInflater)
    {
      super(paramInflater);
    }
    
    public void close()
      throws IOException
    {
      if (closed) {
        return;
      }
      closed = true;
      inf.end();
      super.close();
    }
  }
}
