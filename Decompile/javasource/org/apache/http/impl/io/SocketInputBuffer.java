package org.apache.http.impl.io;

import java.io.IOException;
import java.net.Socket;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.EofSensor;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;

@Deprecated
@NotThreadSafe
public class SocketInputBuffer
  extends AbstractSessionInputBuffer
  implements EofSensor
{
  private boolean eof;
  private final Socket socket;
  
  public SocketInputBuffer(Socket paramSocket, int paramInt, HttpParams paramHttpParams)
    throws IOException
  {
    Args.notNull(paramSocket, "Socket");
    socket = paramSocket;
    eof = false;
    int i = paramInt;
    paramInt = i;
    if (i < 0) {
      paramInt = paramSocket.getReceiveBufferSize();
    }
    i = paramInt;
    if (paramInt < 1024) {
      i = 1024;
    }
    init(paramSocket.getInputStream(), i, paramHttpParams);
  }
  
  protected int fillBuffer()
    throws IOException
  {
    int i = super.fillBuffer();
    if (i == -1) {}
    for (boolean bool = true;; bool = false)
    {
      eof = bool;
      return i;
    }
  }
  
  public boolean isDataAvailable(int paramInt)
    throws IOException
  {
    boolean bool2 = hasBufferedData();
    boolean bool1 = bool2;
    int i;
    if (!bool2) {
      i = socket.getSoTimeout();
    }
    try
    {
      socket.setSoTimeout(paramInt);
      fillBuffer();
      bool1 = hasBufferedData();
      return bool1;
    }
    finally
    {
      socket.setSoTimeout(i);
    }
  }
  
  public boolean isEof()
  {
    return eof;
  }
}
