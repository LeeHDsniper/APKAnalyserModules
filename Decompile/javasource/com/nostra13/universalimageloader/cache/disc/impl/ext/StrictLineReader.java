package com.nostra13.universalimageloader.cache.disc.impl.ext;

import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;

class StrictLineReader
  implements Closeable
{
  private byte[] buf;
  private final Charset charset;
  private int end;
  private final InputStream in;
  private int pos;
  
  public StrictLineReader(InputStream paramInputStream, int paramInt, Charset paramCharset)
  {
    if ((paramInputStream == null) || (paramCharset == null)) {
      throw new NullPointerException();
    }
    if (paramInt < 0) {
      throw new IllegalArgumentException("capacity <= 0");
    }
    if (!paramCharset.equals(Util.US_ASCII)) {
      throw new IllegalArgumentException("Unsupported encoding");
    }
    in = paramInputStream;
    charset = paramCharset;
    buf = new byte[paramInt];
  }
  
  public StrictLineReader(InputStream paramInputStream, Charset paramCharset)
  {
    this(paramInputStream, 8192, paramCharset);
  }
  
  private void fillBuf()
    throws IOException
  {
    int i = in.read(buf, 0, buf.length);
    if (i == -1) {
      throw new EOFException();
    }
    pos = 0;
    end = i;
  }
  
  public void close()
    throws IOException
  {
    synchronized (in)
    {
      if (buf != null)
      {
        buf = null;
        in.close();
      }
      return;
    }
  }
  
  public String readLine()
    throws IOException
  {
    synchronized (in)
    {
      if (buf == null) {
        throw new IOException("LineReader is closed");
      }
    }
    if (pos >= end) {
      fillBuf();
    }
    int i = pos;
    for (;;)
    {
      if (i != end)
      {
        if (buf[i] != 10) {
          break label272;
        }
        if ((i == pos) || (buf[(i - 1)] != 13)) {
          break label267;
        }
      }
      label267:
      for (int j = i - 1;; j = i)
      {
        Object localObject2 = new String(buf, pos, j - pos, charset.name());
        pos = (i + 1);
        return localObject2;
        localObject2 = new ByteArrayOutputStream(end - pos + 80)
        {
          public String toString()
          {
            if ((count > 0) && (buf[(count - 1)] == 13)) {}
            for (int i = count - 1;; i = count) {
              try
              {
                String str = new String(buf, 0, i, charset.name());
                return str;
              }
              catch (UnsupportedEncodingException localUnsupportedEncodingException)
              {
                throw new AssertionError(localUnsupportedEncodingException);
              }
            }
          }
        };
        for (;;)
        {
          ((ByteArrayOutputStream)localObject2).write(buf, pos, end - pos);
          end = -1;
          fillBuf();
          i = pos;
          while (i != end)
          {
            if (buf[i] == 10)
            {
              if (i != pos) {
                ((ByteArrayOutputStream)localObject2).write(buf, pos, i - pos);
              }
              pos = (i + 1);
              localObject2 = ((ByteArrayOutputStream)localObject2).toString();
              return localObject2;
            }
            i += 1;
          }
        }
      }
      label272:
      i += 1;
    }
  }
}
