package rx.schedulers;

import java.util.concurrent.Executor;
import rx.Scheduler;
import rx.internal.schedulers.EventLoopsScheduler;
import rx.plugins.RxJavaPlugins;
import rx.plugins.RxJavaSchedulersHook;

public final class Schedulers
{
  private static final Schedulers INSTANCE = new Schedulers();
  private final Scheduler computationScheduler;
  private final Scheduler ioScheduler;
  private final Scheduler newThreadScheduler;
  
  private Schedulers()
  {
    Scheduler localScheduler = RxJavaPlugins.getInstance().getSchedulersHook().getComputationScheduler();
    if (localScheduler != null)
    {
      computationScheduler = localScheduler;
      localScheduler = RxJavaPlugins.getInstance().getSchedulersHook().getIOScheduler();
      if (localScheduler == null) {
        break label76;
      }
    }
    label76:
    for (ioScheduler = localScheduler;; ioScheduler = new CachedThreadScheduler())
    {
      localScheduler = RxJavaPlugins.getInstance().getSchedulersHook().getNewThreadScheduler();
      if (localScheduler == null) {
        break label90;
      }
      newThreadScheduler = localScheduler;
      return;
      computationScheduler = new EventLoopsScheduler();
      break;
    }
    label90:
    newThreadScheduler = NewThreadScheduler.instance();
  }
  
  public static Scheduler computation()
  {
    return INSTANCEcomputationScheduler;
  }
  
  public static Scheduler from(Executor paramExecutor)
  {
    return new ExecutorScheduler(paramExecutor);
  }
  
  public static Scheduler newThread()
  {
    return INSTANCEnewThreadScheduler;
  }
  
  public static Scheduler trampoline()
  {
    return TrampolineScheduler.instance();
  }
}
