package org.apache.http.conn;

import java.io.IOException;
import java.io.InputStream;

public abstract interface EofSensorWatcher
{
  public abstract boolean eofDetected(InputStream paramInputStream)
    throws IOException;
  
  public abstract boolean streamAbort(InputStream paramInputStream)
    throws IOException;
  
  public abstract boolean streamClosed(InputStream paramInputStream)
    throws IOException;
}
