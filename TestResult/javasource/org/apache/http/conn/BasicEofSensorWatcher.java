package org.apache.http.conn;

import java.io.IOException;
import java.io.InputStream;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;

@Deprecated
@NotThreadSafe
public class BasicEofSensorWatcher
  implements EofSensorWatcher
{
  protected final boolean attemptReuse;
  protected final ManagedClientConnection managedConn;
  
  public BasicEofSensorWatcher(ManagedClientConnection paramManagedClientConnection, boolean paramBoolean)
  {
    Args.notNull(paramManagedClientConnection, "Connection");
    managedConn = paramManagedClientConnection;
    attemptReuse = paramBoolean;
  }
  
  public boolean eofDetected(InputStream paramInputStream)
    throws IOException
  {
    try
    {
      if (attemptReuse)
      {
        paramInputStream.close();
        managedConn.markReusable();
      }
      return false;
    }
    finally
    {
      managedConn.releaseConnection();
    }
  }
  
  public boolean streamAbort(InputStream paramInputStream)
    throws IOException
  {
    managedConn.abortConnection();
    return false;
  }
  
  public boolean streamClosed(InputStream paramInputStream)
    throws IOException
  {
    try
    {
      if (attemptReuse)
      {
        paramInputStream.close();
        managedConn.markReusable();
      }
      return false;
    }
    finally
    {
      managedConn.releaseConnection();
    }
  }
}
