package org.apache.http.impl.io;

import java.io.IOException;
import java.io.OutputStream;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.SessionOutputBuffer;
import org.apache.http.util.Args;

@NotThreadSafe
public class ContentLengthOutputStream
  extends OutputStream
{
  private boolean closed = false;
  private final long contentLength;
  private final SessionOutputBuffer out;
  private long total = 0L;
  
  public ContentLengthOutputStream(SessionOutputBuffer paramSessionOutputBuffer, long paramLong)
  {
    out = ((SessionOutputBuffer)Args.notNull(paramSessionOutputBuffer, "Session output buffer"));
    contentLength = Args.notNegative(paramLong, "Content length");
  }
  
  public void close()
    throws IOException
  {
    if (!closed)
    {
      closed = true;
      out.flush();
    }
  }
  
  public void flush()
    throws IOException
  {
    out.flush();
  }
  
  public void write(int paramInt)
    throws IOException
  {
    if (closed) {
      throw new IOException("Attempted write to closed stream.");
    }
    if (total < contentLength)
    {
      out.write(paramInt);
      total += 1L;
    }
  }
  
  public void write(byte[] paramArrayOfByte)
    throws IOException
  {
    write(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (closed) {
      throw new IOException("Attempted write to closed stream.");
    }
    if (total < contentLength)
    {
      long l = contentLength - total;
      int i = paramInt2;
      if (paramInt2 > l) {
        i = (int)l;
      }
      out.write(paramArrayOfByte, paramInt1, i);
      total += i;
    }
  }
}
