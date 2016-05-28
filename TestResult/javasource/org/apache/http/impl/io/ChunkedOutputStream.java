package org.apache.http.impl.io;

import java.io.IOException;
import java.io.OutputStream;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.SessionOutputBuffer;

@NotThreadSafe
public class ChunkedOutputStream
  extends OutputStream
{
  private final byte[] cache;
  private int cachePosition = 0;
  private boolean closed = false;
  private final SessionOutputBuffer out;
  private boolean wroteLastChunk = false;
  
  public ChunkedOutputStream(int paramInt, SessionOutputBuffer paramSessionOutputBuffer)
  {
    cache = new byte[paramInt];
    out = paramSessionOutputBuffer;
  }
  
  @Deprecated
  public ChunkedOutputStream(SessionOutputBuffer paramSessionOutputBuffer)
    throws IOException
  {
    this(2048, paramSessionOutputBuffer);
  }
  
  @Deprecated
  public ChunkedOutputStream(SessionOutputBuffer paramSessionOutputBuffer, int paramInt)
    throws IOException
  {
    this(paramInt, paramSessionOutputBuffer);
  }
  
  public void close()
    throws IOException
  {
    if (!closed)
    {
      closed = true;
      finish();
      out.flush();
    }
  }
  
  public void finish()
    throws IOException
  {
    if (!wroteLastChunk)
    {
      flushCache();
      writeClosingChunk();
      wroteLastChunk = true;
    }
  }
  
  public void flush()
    throws IOException
  {
    flushCache();
    out.flush();
  }
  
  protected void flushCache()
    throws IOException
  {
    if (cachePosition > 0)
    {
      out.writeLine(Integer.toHexString(cachePosition));
      out.write(cache, 0, cachePosition);
      out.writeLine("");
      cachePosition = 0;
    }
  }
  
  protected void flushCacheWithAppend(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    out.writeLine(Integer.toHexString(cachePosition + paramInt2));
    out.write(cache, 0, cachePosition);
    out.write(paramArrayOfByte, paramInt1, paramInt2);
    out.writeLine("");
    cachePosition = 0;
  }
  
  public void write(int paramInt)
    throws IOException
  {
    if (closed) {
      throw new IOException("Attempted write to closed stream.");
    }
    cache[cachePosition] = ((byte)paramInt);
    cachePosition += 1;
    if (cachePosition == cache.length) {
      flushCache();
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
    if (paramInt2 >= cache.length - cachePosition)
    {
      flushCacheWithAppend(paramArrayOfByte, paramInt1, paramInt2);
      return;
    }
    System.arraycopy(paramArrayOfByte, paramInt1, cache, cachePosition, paramInt2);
    cachePosition += paramInt2;
  }
  
  protected void writeClosingChunk()
    throws IOException
  {
    out.writeLine("0");
    out.writeLine("");
  }
}
