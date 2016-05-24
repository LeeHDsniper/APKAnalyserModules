package org.apache.http.impl.io;

import java.io.IOException;
import java.io.OutputStream;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.SessionOutputBuffer;
import org.apache.http.util.Args;

@NotThreadSafe
public class IdentityOutputStream
  extends OutputStream
{
  private boolean closed = false;
  private final SessionOutputBuffer out;
  
  public IdentityOutputStream(SessionOutputBuffer paramSessionOutputBuffer)
  {
    out = ((SessionOutputBuffer)Args.notNull(paramSessionOutputBuffer, "Session output buffer"));
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
    out.write(paramInt);
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
    out.write(paramArrayOfByte, paramInt1, paramInt2);
  }
}
