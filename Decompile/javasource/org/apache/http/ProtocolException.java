package org.apache.http;

public class ProtocolException
  extends HttpException
{
  private static final long serialVersionUID = -2143571074341228994L;
  
  public ProtocolException() {}
  
  public ProtocolException(String paramString)
  {
    super(paramString);
  }
  
  public ProtocolException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }
}
