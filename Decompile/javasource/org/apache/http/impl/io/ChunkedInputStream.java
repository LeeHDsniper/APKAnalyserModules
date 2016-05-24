package org.apache.http.impl.io;

import java.io.IOException;
import java.io.InputStream;
import org.apache.http.Header;
import org.apache.http.HttpException;
import org.apache.http.MalformedChunkCodingException;
import org.apache.http.TruncatedChunkException;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.BufferInfo;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@NotThreadSafe
public class ChunkedInputStream
  extends InputStream
{
  private static final int BUFFER_SIZE = 2048;
  private static final int CHUNK_CRLF = 3;
  private static final int CHUNK_DATA = 2;
  private static final int CHUNK_LEN = 1;
  private final CharArrayBuffer buffer;
  private int chunkSize;
  private boolean closed = false;
  private boolean eof = false;
  private Header[] footers = new Header[0];
  private final SessionInputBuffer in;
  private int pos;
  private int state;
  
  public ChunkedInputStream(SessionInputBuffer paramSessionInputBuffer)
  {
    in = ((SessionInputBuffer)Args.notNull(paramSessionInputBuffer, "Session input buffer"));
    pos = 0;
    buffer = new CharArrayBuffer(16);
    state = 1;
  }
  
  private int getChunkSize()
    throws IOException
  {
    switch (state)
    {
    case 2: 
    default: 
      throw new IllegalStateException("Inconsistent codec state");
    case 3: 
      buffer.clear();
      if (in.readLine(buffer) != -1) {
        break;
      }
    }
    do
    {
      return 0;
      if (!buffer.isEmpty()) {
        throw new MalformedChunkCodingException("Unexpected content at the end of chunk");
      }
      state = 1;
      buffer.clear();
    } while (in.readLine(buffer) == -1);
    int j = buffer.indexOf(59);
    int i = j;
    if (j < 0) {
      i = buffer.length();
    }
    try
    {
      i = Integer.parseInt(buffer.substringTrimmed(0, i), 16);
      return i;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      throw new MalformedChunkCodingException("Bad chunk header");
    }
  }
  
  private void nextChunk()
    throws IOException
  {
    chunkSize = getChunkSize();
    if (chunkSize < 0) {
      throw new MalformedChunkCodingException("Negative chunk size");
    }
    state = 2;
    pos = 0;
    if (chunkSize == 0)
    {
      eof = true;
      parseTrailerHeaders();
    }
  }
  
  private void parseTrailerHeaders()
    throws IOException
  {
    try
    {
      footers = AbstractMessageParser.parseHeaders(in, -1, -1, null);
      return;
    }
    catch (HttpException localHttpException)
    {
      MalformedChunkCodingException localMalformedChunkCodingException = new MalformedChunkCodingException("Invalid footer: " + localHttpException.getMessage());
      localMalformedChunkCodingException.initCause(localHttpException);
      throw localMalformedChunkCodingException;
    }
  }
  
  public int available()
    throws IOException
  {
    if ((in instanceof BufferInfo)) {
      return Math.min(((BufferInfo)in).length(), chunkSize - pos);
    }
    return 0;
  }
  
  public void close()
    throws IOException
  {
    if (!closed) {}
    try
    {
      if (!eof)
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
      eof = true;
      closed = true;
    }
  }
  
  public Header[] getFooters()
  {
    return (Header[])footers.clone();
  }
  
  public int read()
    throws IOException
  {
    if (closed) {
      throw new IOException("Attempted read from closed stream.");
    }
    int i;
    if (eof) {
      i = -1;
    }
    int j;
    do
    {
      do
      {
        return i;
        if (state != 2)
        {
          nextChunk();
          if (eof) {
            return -1;
          }
        }
        j = in.read();
        i = j;
      } while (j == -1);
      pos += 1;
      i = j;
    } while (pos < chunkSize);
    state = 3;
    return j;
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
    if (eof) {
      paramInt1 = -1;
    }
    do
    {
      return paramInt1;
      if (state != 2)
      {
        nextChunk();
        if (eof) {
          return -1;
        }
      }
      paramInt2 = in.read(paramArrayOfByte, paramInt1, Math.min(paramInt2, chunkSize - pos));
      if (paramInt2 == -1) {
        break;
      }
      pos += paramInt2;
      paramInt1 = paramInt2;
    } while (pos < chunkSize);
    state = 3;
    return paramInt2;
    eof = true;
    throw new TruncatedChunkException("Truncated chunk ( expected size: " + chunkSize + "; actual size: " + pos + ")");
  }
}
