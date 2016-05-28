package org.apache.http.impl.execchain;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.HttpEntity;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.conn.EofSensorInputStream;
import org.apache.http.conn.EofSensorWatcher;
import org.apache.http.entity.HttpEntityWrapper;

@NotThreadSafe
class ResponseEntityWrapper
  extends HttpEntityWrapper
  implements EofSensorWatcher
{
  private final ConnectionHolder connReleaseTrigger;
  
  public ResponseEntityWrapper(HttpEntity paramHttpEntity, ConnectionHolder paramConnectionHolder)
  {
    super(paramHttpEntity);
    connReleaseTrigger = paramConnectionHolder;
  }
  
  private void cleanup()
  {
    if (connReleaseTrigger != null) {
      connReleaseTrigger.abortConnection();
    }
  }
  
  @Deprecated
  public void consumeContent()
    throws IOException
  {
    releaseConnection();
  }
  
  public boolean eofDetected(InputStream paramInputStream)
    throws IOException
  {
    try
    {
      paramInputStream.close();
      releaseConnection();
      return false;
    }
    finally
    {
      cleanup();
    }
  }
  
  public InputStream getContent()
    throws IOException
  {
    return new EofSensorInputStream(wrappedEntity.getContent(), this);
  }
  
  public boolean isRepeatable()
  {
    return false;
  }
  
  public void releaseConnection()
    throws IOException
  {
    if (connReleaseTrigger != null) {}
    try
    {
      if (connReleaseTrigger.isReusable()) {
        connReleaseTrigger.releaseConnection();
      }
      return;
    }
    finally
    {
      cleanup();
    }
  }
  
  public boolean streamAbort(InputStream paramInputStream)
    throws IOException
  {
    cleanup();
    return false;
  }
  
  /* Error */
  public boolean streamClosed(InputStream paramInputStream)
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 16	org/apache/http/impl/execchain/ResponseEntityWrapper:connReleaseTrigger	Lorg/apache/http/impl/execchain/ConnectionHolder;
    //   4: ifnull +31 -> 35
    //   7: aload_0
    //   8: getfield 16	org/apache/http/impl/execchain/ResponseEntityWrapper:connReleaseTrigger	Lorg/apache/http/impl/execchain/ConnectionHolder;
    //   11: invokevirtual 70	org/apache/http/impl/execchain/ConnectionHolder:isReleased	()Z
    //   14: istore_3
    //   15: iload_3
    //   16: ifne +19 -> 35
    //   19: iconst_1
    //   20: istore_2
    //   21: aload_1
    //   22: invokevirtual 40	java/io/InputStream:close	()V
    //   25: aload_0
    //   26: invokevirtual 31	org/apache/http/impl/execchain/ResponseEntityWrapper:releaseConnection	()V
    //   29: aload_0
    //   30: invokespecial 42	org/apache/http/impl/execchain/ResponseEntityWrapper:cleanup	()V
    //   33: iconst_0
    //   34: ireturn
    //   35: iconst_0
    //   36: istore_2
    //   37: goto -16 -> 21
    //   40: astore_1
    //   41: iload_2
    //   42: ifeq -13 -> 29
    //   45: aload_1
    //   46: athrow
    //   47: astore_1
    //   48: aload_0
    //   49: invokespecial 42	org/apache/http/impl/execchain/ResponseEntityWrapper:cleanup	()V
    //   52: aload_1
    //   53: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	54	0	this	ResponseEntityWrapper
    //   0	54	1	paramInputStream	InputStream
    //   20	22	2	i	int
    //   14	2	3	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   21	29	40	java/net/SocketException
    //   0	15	47	finally
    //   21	29	47	finally
    //   45	47	47	finally
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    try
    {
      wrappedEntity.writeTo(paramOutputStream);
      releaseConnection();
      return;
    }
    finally
    {
      cleanup();
    }
  }
}
