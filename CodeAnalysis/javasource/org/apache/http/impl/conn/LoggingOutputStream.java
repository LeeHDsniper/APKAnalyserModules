package org.apache.http.impl.conn;

import java.io.IOException;
import java.io.OutputStream;
import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
class LoggingOutputStream
  extends OutputStream
{
  private final OutputStream out;
  private final Wire wire;
  
  public LoggingOutputStream(OutputStream paramOutputStream, Wire paramWire)
  {
    out = paramOutputStream;
    wire = paramWire;
  }
  
  public void close()
    throws IOException
  {
    out.close();
  }
  
  public void flush()
    throws IOException
  {
    out.flush();
  }
  
  public void write(int paramInt)
    throws IOException
  {
    wire.output(paramInt);
  }
  
  public void write(byte[] paramArrayOfByte)
    throws IOException
  {
    wire.output(paramArrayOfByte);
    out.write(paramArrayOfByte);
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    wire.output(paramArrayOfByte, paramInt1, paramInt2);
    out.write(paramArrayOfByte, paramInt1, paramInt2);
  }
}
