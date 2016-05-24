package org.apache.http.impl.auth;

import java.io.IOException;
import java.io.OutputStream;
import java.security.MessageDigest;

class HttpEntityDigester
  extends OutputStream
{
  private boolean closed;
  private byte[] digest;
  private final MessageDigest digester;
  
  HttpEntityDigester(MessageDigest paramMessageDigest)
  {
    digester = paramMessageDigest;
    digester.reset();
  }
  
  public void close()
    throws IOException
  {
    if (closed) {
      return;
    }
    closed = true;
    digest = digester.digest();
    super.close();
  }
  
  public byte[] getDigest()
  {
    return digest;
  }
  
  public void write(int paramInt)
    throws IOException
  {
    if (closed) {
      throw new IOException("Stream has been already closed");
    }
    digester.update((byte)paramInt);
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (closed) {
      throw new IOException("Stream has been already closed");
    }
    digester.update(paramArrayOfByte, paramInt1, paramInt2);
  }
}
