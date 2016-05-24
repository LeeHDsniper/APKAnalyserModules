package okio;

import java.io.IOException;
import java.io.InputStream;

public abstract interface BufferedSource
  extends Source
{
  public abstract Buffer buffer();
  
  public abstract boolean exhausted()
    throws IOException;
  
  public abstract long indexOf(byte paramByte)
    throws IOException;
  
  public abstract InputStream inputStream();
  
  public abstract byte readByte()
    throws IOException;
  
  public abstract byte[] readByteArray(long paramLong)
    throws IOException;
  
  public abstract ByteString readByteString(long paramLong)
    throws IOException;
  
  public abstract int readInt()
    throws IOException;
  
  public abstract int readIntLe()
    throws IOException;
  
  public abstract short readShort()
    throws IOException;
  
  public abstract short readShortLe()
    throws IOException;
  
  public abstract String readUtf8LineStrict()
    throws IOException;
  
  public abstract void require(long paramLong)
    throws IOException;
  
  public abstract void skip(long paramLong)
    throws IOException;
}
