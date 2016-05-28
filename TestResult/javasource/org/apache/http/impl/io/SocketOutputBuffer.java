package org.apache.http.impl.io;

import java.io.IOException;
import java.net.Socket;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;

@Deprecated
@NotThreadSafe
public class SocketOutputBuffer
  extends AbstractSessionOutputBuffer
{
  public SocketOutputBuffer(Socket paramSocket, int paramInt, HttpParams paramHttpParams)
    throws IOException
  {
    Args.notNull(paramSocket, "Socket");
    int i = paramInt;
    paramInt = i;
    if (i < 0) {
      paramInt = paramSocket.getSendBufferSize();
    }
    i = paramInt;
    if (paramInt < 1024) {
      i = 1024;
    }
    init(paramSocket.getOutputStream(), i, paramHttpParams);
  }
}
