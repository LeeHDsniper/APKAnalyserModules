package oicq.wlogin_sdk.request;

import java.net.HttpURLConnection;
import oicq.wlogin_sdk.tools.util;

public class i
  implements Runnable
{
  private HttpURLConnection a;
  private boolean b = false;
  
  public i(HttpURLConnection paramHttpURLConnection)
  {
    a = paramHttpURLConnection;
  }
  
  public static boolean a(HttpURLConnection paramHttpURLConnection, long paramLong)
  {
    try
    {
      paramHttpURLConnection = new i(paramHttpURLConnection);
      Thread localThread = new Thread(paramHttpURLConnection);
      localThread.start();
      localThread.join(paramLong);
      boolean bool = paramHttpURLConnection.a();
      return bool;
    }
    catch (Throwable paramHttpURLConnection) {}
    return false;
  }
  
  public boolean a()
  {
    return b;
  }
  
  public void run()
  {
    try
    {
      a.connect();
      b = true;
      return;
    }
    catch (Throwable localThrowable)
    {
      util.printThrowable(localThrowable, "");
    }
  }
}
