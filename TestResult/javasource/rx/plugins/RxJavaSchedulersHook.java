package rx.plugins;

import rx.Scheduler;
import rx.functions.Action0;

public class RxJavaSchedulersHook
{
  private static final RxJavaSchedulersHook DEFAULT_INSTANCE = new RxJavaSchedulersHook();
  
  protected RxJavaSchedulersHook() {}
  
  public static RxJavaSchedulersHook getDefaultInstance()
  {
    return DEFAULT_INSTANCE;
  }
  
  public Scheduler getComputationScheduler()
  {
    return null;
  }
  
  public Scheduler getIOScheduler()
  {
    return null;
  }
  
  public Scheduler getNewThreadScheduler()
  {
    return null;
  }
  
  public Action0 onSchedule(Action0 paramAction0)
  {
    return paramAction0;
  }
}
