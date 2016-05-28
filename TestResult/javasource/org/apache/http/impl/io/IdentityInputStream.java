package org.apache.http.impl.io;

import java.io.IOException;
import java.io.InputStream;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.BufferInfo;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.util.Args;

@NotThreadSafe
public class IdentityInputStream
  extends InputStream
{
  private boolean closed = false;
  private final SessionInputBuffer in;
  
  public IdentityInputStream(SessionInputBuffer paramSessionInputBuffer)
  {
    in = ((SessionInputBuffer)Args.notNull(paramSessionInputBuffer, "Session input buffer"));
  }
  
  public int available()
    throws IOException
  {
    if ((in instanceof BufferInfo)) {
      return ((BufferInfo)in).length();
    }
    return 0;
  }
  
  public void close()
    throws IOException
  {
    closed = true;
  }
  
  public int read()
    throws IOException
  {
    if (closed) {
      return -1;
    }
    return in.read();
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (closed) {
      return -1;
    }
    return in.read(paramArrayOfByte, paramInt1, paramInt2);
  }
}
