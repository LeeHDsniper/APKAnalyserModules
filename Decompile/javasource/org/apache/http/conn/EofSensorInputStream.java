package org.apache.http.conn;

import java.io.IOException;
import java.io.InputStream;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;

@NotThreadSafe
public class EofSensorInputStream
  extends InputStream
  implements ConnectionReleaseTrigger
{
  private final EofSensorWatcher eofWatcher;
  private boolean selfClosed;
  protected InputStream wrappedStream;
  
  public EofSensorInputStream(InputStream paramInputStream, EofSensorWatcher paramEofSensorWatcher)
  {
    Args.notNull(paramInputStream, "Wrapped stream");
    wrappedStream = paramInputStream;
    selfClosed = false;
    eofWatcher = paramEofSensorWatcher;
  }
  
  public void abortConnection()
    throws IOException
  {
    selfClosed = true;
    checkAbort();
  }
  
  public int available()
    throws IOException
  {
    int i = 0;
    if (isReadAllowed()) {}
    try
    {
      i = wrappedStream.available();
      return i;
    }
    catch (IOException localIOException)
    {
      checkAbort();
      throw localIOException;
    }
  }
  
  protected void checkAbort()
    throws IOException
  {
    boolean bool;
    if (wrappedStream != null) {
      bool = true;
    }
    try
    {
      if (eofWatcher != null) {
        bool = eofWatcher.streamAbort(wrappedStream);
      }
      if (bool) {
        wrappedStream.close();
      }
      return;
    }
    finally
    {
      wrappedStream = null;
    }
  }
  
  protected void checkClose()
    throws IOException
  {
    boolean bool;
    if (wrappedStream != null) {
      bool = true;
    }
    try
    {
      if (eofWatcher != null) {
        bool = eofWatcher.streamClosed(wrappedStream);
      }
      if (bool) {
        wrappedStream.close();
      }
      return;
    }
    finally
    {
      wrappedStream = null;
    }
  }
  
  protected void checkEOF(int paramInt)
    throws IOException
  {
    boolean bool;
    if ((wrappedStream != null) && (paramInt < 0)) {
      bool = true;
    }
    try
    {
      if (eofWatcher != null) {
        bool = eofWatcher.eofDetected(wrappedStream);
      }
      if (bool) {
        wrappedStream.close();
      }
      return;
    }
    finally
    {
      wrappedStream = null;
    }
  }
  
  public void close()
    throws IOException
  {
    selfClosed = true;
    checkClose();
  }
  
  InputStream getWrappedStream()
  {
    return wrappedStream;
  }
  
  protected boolean isReadAllowed()
    throws IOException
  {
    if (selfClosed) {
      throw new IOException("Attempted read on closed stream.");
    }
    return wrappedStream != null;
  }
  
  boolean isSelfClosed()
  {
    return selfClosed;
  }
  
  public int read()
    throws IOException
  {
    int i = -1;
    if (isReadAllowed()) {}
    try
    {
      i = wrappedStream.read();
      checkEOF(i);
      return i;
    }
    catch (IOException localIOException)
    {
      checkAbort();
      throw localIOException;
    }
  }
  
  public int read(byte[] paramArrayOfByte)
    throws IOException
  {
    return read(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    int i = -1;
    if (isReadAllowed()) {}
    try
    {
      i = wrappedStream.read(paramArrayOfByte, paramInt1, paramInt2);
      checkEOF(i);
      return i;
    }
    catch (IOException paramArrayOfByte)
    {
      checkAbort();
      throw paramArrayOfByte;
    }
  }
  
  public void releaseConnection()
    throws IOException
  {
    close();
  }
}
