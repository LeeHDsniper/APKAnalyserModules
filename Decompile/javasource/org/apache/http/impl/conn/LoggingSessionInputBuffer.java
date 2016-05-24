package org.apache.http.impl.conn;

import java.io.IOException;
import java.nio.charset.Charset;
import org.apache.http.Consts;
import org.apache.http.annotation.Immutable;
import org.apache.http.io.EofSensor;
import org.apache.http.io.HttpTransportMetrics;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.util.CharArrayBuffer;

@Deprecated
@Immutable
public class LoggingSessionInputBuffer
  implements EofSensor, SessionInputBuffer
{
  private final String charset;
  private final EofSensor eofSensor;
  private final SessionInputBuffer in;
  private final Wire wire;
  
  public LoggingSessionInputBuffer(SessionInputBuffer paramSessionInputBuffer, Wire paramWire)
  {
    this(paramSessionInputBuffer, paramWire, null);
  }
  
  public LoggingSessionInputBuffer(SessionInputBuffer paramSessionInputBuffer, Wire paramWire, String paramString)
  {
    in = paramSessionInputBuffer;
    if ((paramSessionInputBuffer instanceof EofSensor))
    {
      paramSessionInputBuffer = (EofSensor)paramSessionInputBuffer;
      eofSensor = paramSessionInputBuffer;
      wire = paramWire;
      if (paramString == null) {
        break label46;
      }
    }
    for (;;)
    {
      charset = paramString;
      return;
      paramSessionInputBuffer = null;
      break;
      label46:
      paramString = Consts.ASCII.name();
    }
  }
  
  public HttpTransportMetrics getMetrics()
  {
    return in.getMetrics();
  }
  
  public boolean isDataAvailable(int paramInt)
    throws IOException
  {
    return in.isDataAvailable(paramInt);
  }
  
  public boolean isEof()
  {
    if (eofSensor != null) {
      return eofSensor.isEof();
    }
    return false;
  }
  
  public int read()
    throws IOException
  {
    int i = in.read();
    if ((wire.enabled()) && (i != -1)) {
      wire.input(i);
    }
    return i;
  }
  
  public int read(byte[] paramArrayOfByte)
    throws IOException
  {
    int i = in.read(paramArrayOfByte);
    if ((wire.enabled()) && (i > 0)) {
      wire.input(paramArrayOfByte, 0, i);
    }
    return i;
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    paramInt2 = in.read(paramArrayOfByte, paramInt1, paramInt2);
    if ((wire.enabled()) && (paramInt2 > 0)) {
      wire.input(paramArrayOfByte, paramInt1, paramInt2);
    }
    return paramInt2;
  }
  
  public int readLine(CharArrayBuffer paramCharArrayBuffer)
    throws IOException
  {
    int i = in.readLine(paramCharArrayBuffer);
    if ((wire.enabled()) && (i >= 0))
    {
      int j = paramCharArrayBuffer.length();
      paramCharArrayBuffer = new String(paramCharArrayBuffer.buffer(), j - i, i);
      paramCharArrayBuffer = paramCharArrayBuffer + "\r\n";
      wire.input(paramCharArrayBuffer.getBytes(charset));
    }
    return i;
  }
  
  public String readLine()
    throws IOException
  {
    String str1 = in.readLine();
    if ((wire.enabled()) && (str1 != null))
    {
      String str2 = str1 + "\r\n";
      wire.input(str2.getBytes(charset));
    }
    return str1;
  }
}
