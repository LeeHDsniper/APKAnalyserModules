package com.tencent.qphone.base.util;

import com.tencent.mobileqq.msf.core.net.g;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.net.Socket;
import java.util.ArrayList;
import org.apache.http.impl.io.HttpTransportMetricsImpl;
import org.apache.http.util.ByteArrayBuffer;

public class MsfSocketInputBuffer
  extends AbsSessionInputBuffer
{
  private static final Class SOCKET_TIMEOUT_CLASS = ;
  private int inputBufferSize = 0;
  public InputStream instream;
  private final Socket socket;
  
  public MsfSocketInputBuffer(Socket paramSocket, int paramInt1, String paramString, int paramInt2)
    throws IOException
  {
    if (paramSocket == null) {
      throw new IllegalArgumentException("Socket may not be null");
    }
    socket = paramSocket;
    if (paramInt1 < 0) {
      paramInt1 = paramSocket.getReceiveBufferSize();
    }
    for (;;)
    {
      if (paramInt1 < 1024) {
        paramInt1 = i;
      }
      for (;;)
      {
        paramSocket = paramSocket.getInputStream();
        if (!g.n.contains(paramSocket.toString())) {
          g.n.add(paramSocket.toString());
        }
        init(paramSocket, paramInt1, paramString, paramInt2);
        return;
      }
    }
  }
  
  private static Class SocketTimeoutExceptionClass()
  {
    try
    {
      Class localClass = Class.forName("java.net.SocketTimeoutException");
      return localClass;
    }
    catch (ClassNotFoundException localClassNotFoundException) {}
    return null;
  }
  
  private static boolean isSocketTimeoutException(InterruptedIOException paramInterruptedIOException)
  {
    if (SOCKET_TIMEOUT_CLASS != null) {
      return SOCKET_TIMEOUT_CLASS.isInstance(paramInterruptedIOException);
    }
    return true;
  }
  
  protected int fillBuffer()
    throws IOException
  {
    if (bufferpos > 0)
    {
      i = bufferlen - bufferpos;
      if (i > 0) {
        System.arraycopy(buffer, bufferpos, buffer, 0, i);
      }
      bufferpos = 0;
      bufferlen = i;
    }
    int i = bufferlen;
    int j = buffer.length;
    j = instream.read(buffer, i, j - i);
    if (j == -1) {
      return -1;
    }
    bufferlen = (i + j);
    metrics.incrementBytesTransferred(j);
    return j;
  }
  
  protected void init(InputStream paramInputStream, int paramInt1, String paramString, int paramInt2)
  {
    boolean bool = false;
    if (paramInputStream == null) {
      throw new IllegalArgumentException("Input stream may not be null");
    }
    if (paramInt1 <= 0) {
      throw new IllegalArgumentException("Buffer size may not be negative or zero");
    }
    instream = paramInputStream;
    inputBufferSize = paramInt1;
    buffer = new byte[inputBufferSize];
    bufferpos = 0;
    bufferlen = 0;
    linebuffer = new ByteArrayBuffer(paramInt1);
    charset = paramString;
    if ((charset.equalsIgnoreCase("US-ASCII")) || (charset.equalsIgnoreCase("ASCII"))) {
      bool = true;
    }
    ascii = bool;
    maxLineLen = paramInt2;
    metrics = new HttpTransportMetricsImpl();
  }
  
  public boolean isDataAvailable(int paramInt)
    throws IOException
  {
    boolean bool1 = hasBufferedData();
    boolean bool2 = bool1;
    int i;
    if (!bool1)
    {
      i = socket.getSoTimeout();
      try
      {
        socket.setSoTimeout(paramInt);
        if (fillBuffer() == -1) {
          throw new IOException("readData return -1");
        }
      }
      catch (InterruptedIOException localInterruptedIOException)
      {
        if (isSocketTimeoutException(localInterruptedIOException)) {
          break label99;
        }
        throw localInterruptedIOException;
      }
      finally
      {
        socket.setSoTimeout(i);
      }
      bool2 = hasBufferedData();
      bool1 = bool2;
    }
    label99:
    for (Socket localSocket = socket;; localSocket = socket)
    {
      localSocket.setSoTimeout(i);
      bool2 = bool1;
      return bool2;
    }
  }
  
  public void reset()
  {
    if (buffer != null) {
      buffer = new byte[inputBufferSize];
    }
    bufferpos = 0;
    bufferlen = 0;
    if (linebuffer != null) {
      linebuffer.clear();
    }
  }
}
