package org.apache.http.impl.io;

import java.io.IOException;
import java.io.InputStream;
import org.apache.http.ConnectionClosedException;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.BufferInfo;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.util.Args;

@NotThreadSafe
public class ContentLengthInputStream
  extends InputStream
{
  private static final int BUFFER_SIZE = 2048;
  private boolean closed = false;
  private final long contentLength;
  private SessionInputBuffer in = null;
  private long pos = 0L;
  
  public ContentLengthInputStream(SessionInputBuffer paramSessionInputBuffer, long paramLong)
  {
    in = ((SessionInputBuffer)Args.notNull(paramSessionInputBuffer, "Session input buffer"));
    contentLength = Args.notNegative(paramLong, "Content length");
  }
  
  public int available()
    throws IOException
  {
    if ((in instanceof BufferInfo)) {
      return Math.min(((BufferInfo)in).length(), (int)(contentLength - pos));
    }
    return 0;
  }
  
  public void close()
    throws IOException
  {
    if (!closed) {}
    try
    {
      if (pos < contentLength)
      {
        byte[] arrayOfByte = new byte['ࠀ'];
        int i;
        do
        {
          i = read(arrayOfByte);
        } while (i >= 0);
      }
      return;
    }
    finally
    {
      closed = true;
    }
  }
  
  public int read()
    throws IOException
  {
    if (closed) {
      throw new IOException("Attempted read from closed stream.");
    }
    int i;
    if (pos >= contentLength) {
      i = -1;
    }
    do
    {
      return i;
      i = in.read();
      if (i != -1) {
        break;
      }
    } while (pos >= contentLength);
    throw new ConnectionClosedException("Premature end of Content-Length delimited message body (expected: " + contentLength + "; received: " + pos);
    pos += 1L;
    return i;
  }
  
  public int read(byte[] paramArrayOfByte)
    throws IOException
  {
    return read(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (closed) {
      throw new IOException("Attempted read from closed stream.");
    }
    if (pos >= contentLength) {
      paramInt1 = -1;
    }
    do
    {
      return paramInt1;
      int i = paramInt2;
      if (pos + paramInt2 > contentLength) {
        i = (int)(contentLength - pos);
      }
      paramInt2 = in.read(paramArrayOfByte, paramInt1, i);
      if ((paramInt2 == -1) && (pos < contentLength)) {
        throw new ConnectionClosedException("Premature end of Content-Length delimited message body (expected: " + contentLength + "; received: " + pos);
      }
      paramInt1 = paramInt2;
    } while (paramInt2 <= 0);
    pos += paramInt2;
    return paramInt2;
  }
  
  public long skip(long paramLong)
    throws IOException
  {
    long l2;
    if (paramLong <= 0L)
    {
      l2 = 0L;
      return l2;
    }
    byte[] arrayOfByte = new byte['ࠀ'];
    long l1 = Math.min(paramLong, contentLength - pos);
    paramLong = 0L;
    for (;;)
    {
      l2 = paramLong;
      if (l1 <= 0L) {
        break;
      }
      int i = read(arrayOfByte, 0, (int)Math.min(2048L, l1));
      l2 = paramLong;
      if (i == -1) {
        break;
      }
      paramLong += i;
      l1 -= i;
    }
  }
}
