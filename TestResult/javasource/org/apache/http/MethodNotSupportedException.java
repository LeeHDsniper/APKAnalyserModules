package org.apache.http;

public class MethodNotSupportedException
  extends HttpException
{
  private static final long serialVersionUID = 3365359036840171201L;
  
  public MethodNotSupportedException(String paramString)
  {
    super(paramString);
  }
  
  public MethodNotSupportedException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }
}
