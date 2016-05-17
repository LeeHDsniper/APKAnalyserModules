package oicq.wlogin_sdk.request;

import java.net.InetSocketAddress;

public class a
  implements Runnable
{
  private String a;
  private int b;
  private InetSocketAddress c;
  
  public a(String paramString, int paramInt)
  {
    a = paramString;
    b = paramInt;
  }
  
  public static InetSocketAddress a(String paramString, int paramInt, long paramLong)
  {
    try
    {
      paramString = new a(paramString, paramInt);
      Thread localThread = new Thread(paramString);
      localThread.start();
      localThread.join(paramLong);
      paramString = paramString.a();
      return paramString;
    }
    catch (Exception paramString) {}
    return null;
  }
  
  public InetSocketAddress a()
  {
    try
    {
      InetSocketAddress localInetSocketAddress = c;
      return localInetSocketAddress;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void a(InetSocketAddress paramInetSocketAddress)
  {
    try
    {
      c = paramInetSocketAddress;
      return;
    }
    finally
    {
      paramInetSocketAddress = finally;
      throw paramInetSocketAddress;
    }
  }
  
  public void run()
  {
    try
    {
      a(new InetSocketAddress(a, b));
      return;
    }
    catch (Exception localException) {}
  }
}
