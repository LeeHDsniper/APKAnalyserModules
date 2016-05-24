package org.apache.http.impl.execchain;

import java.io.InterruptedIOException;
import org.apache.http.annotation.Immutable;

@Immutable
public class RequestAbortedException
  extends InterruptedIOException
{
  private static final long serialVersionUID = 4973849966012490112L;
  
  public RequestAbortedException(String paramString)
  {
    super(paramString);
  }
  
  public RequestAbortedException(String paramString, Throwable paramThrowable)
  {
    super(paramString);
    if (paramThrowable != null) {
      initCause(paramThrowable);
    }
  }
}
