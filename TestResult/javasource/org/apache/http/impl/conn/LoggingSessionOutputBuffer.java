package org.apache.http.impl.conn;

import java.io.IOException;
import java.nio.charset.Charset;
import org.apache.http.Consts;
import org.apache.http.annotation.Immutable;
import org.apache.http.io.HttpTransportMetrics;
import org.apache.http.io.SessionOutputBuffer;
import org.apache.http.util.CharArrayBuffer;

@Deprecated
@Immutable
public class LoggingSessionOutputBuffer
  implements SessionOutputBuffer
{
  private final String charset;
  private final SessionOutputBuffer out;
  private final Wire wire;
  
  public LoggingSessionOutputBuffer(SessionOutputBuffer paramSessionOutputBuffer, Wire paramWire)
  {
    this(paramSessionOutputBuffer, paramWire, null);
  }
  
  public LoggingSessionOutputBuffer(SessionOutputBuffer paramSessionOutputBuffer, Wire paramWire, String paramString)
  {
    out = paramSessionOutputBuffer;
    wire = paramWire;
    if (paramString != null) {}
    for (;;)
    {
      charset = paramString;
      return;
      paramString = Consts.ASCII.name();
    }
  }
  
  public void flush()
    throws IOException
  {
    out.flush();
  }
  
  public HttpTransportMetrics getMetrics()
  {
    return out.getMetrics();
  }
  
  public void write(int paramInt)
    throws IOException
  {
    out.write(paramInt);
    if (wire.enabled()) {
      wire.output(paramInt);
    }
  }
  
  public void write(byte[] paramArrayOfByte)
    throws IOException
  {
    out.write(paramArrayOfByte);
    if (wire.enabled()) {
      wire.output(paramArrayOfByte);
    }
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    out.write(paramArrayOfByte, paramInt1, paramInt2);
    if (wire.enabled()) {
      wire.output(paramArrayOfByte, paramInt1, paramInt2);
    }
  }
  
  public void writeLine(String paramString)
    throws IOException
  {
    out.writeLine(paramString);
    if (wire.enabled())
    {
      paramString = paramString + "\r\n";
      wire.output(paramString.getBytes(charset));
    }
  }
  
  public void writeLine(CharArrayBuffer paramCharArrayBuffer)
    throws IOException
  {
    out.writeLine(paramCharArrayBuffer);
    if (wire.enabled())
    {
      paramCharArrayBuffer = new String(paramCharArrayBuffer.buffer(), 0, paramCharArrayBuffer.length());
      paramCharArrayBuffer = paramCharArrayBuffer + "\r\n";
      wire.output(paramCharArrayBuffer.getBytes(charset));
    }
  }
}
