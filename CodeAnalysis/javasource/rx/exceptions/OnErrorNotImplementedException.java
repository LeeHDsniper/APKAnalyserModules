package rx.exceptions;

public class OnErrorNotImplementedException
  extends RuntimeException
{
  private static final long serialVersionUID = -6298857009889503852L;
  
  public OnErrorNotImplementedException(Throwable paramThrowable)
  {
    super(paramThrowable.getMessage(), paramThrowable);
  }
}
