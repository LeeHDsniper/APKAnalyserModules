package mqq.app;

public class AccountNotMatchException
  extends Exception
{
  public AccountNotMatchException(String paramString1, String paramString2)
  {
    super("The current account is " + paramString1 + " instead of " + paramString2);
  }
}
