import java.util.concurrent.ThreadFactory;

public final class red
  implements ThreadFactory
{
  public red() {}
  
  public Thread newThread(Runnable paramRunnable)
  {
    return new Thread(paramRunnable, "RDM-Service");
  }
}
