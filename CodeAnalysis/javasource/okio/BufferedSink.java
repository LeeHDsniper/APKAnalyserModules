package okio;

import java.io.IOException;
import java.io.OutputStream;

public abstract interface BufferedSink
  extends Sink
{
  public abstract Buffer buffer();
  
  public abstract BufferedSink emitCompleteSegments()
    throws IOException;
  
  public abstract OutputStream outputStream();
  
  public abstract BufferedSink write(ByteString paramByteString)
    throws IOException;
  
  public abstract BufferedSink write(byte[] paramArrayOfByte)
    throws IOException;
  
  public abstract BufferedSink write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException;
  
  public abstract long writeAll(Source paramSource)
    throws IOException;
  
  public abstract BufferedSink writeByte(int paramInt)
    throws IOException;
  
  public abstract BufferedSink writeInt(int paramInt)
    throws IOException;
  
  public abstract BufferedSink writeShort(int paramInt)
    throws IOException;
  
  public abstract BufferedSink writeUtf8(String paramString)
    throws IOException;
}
