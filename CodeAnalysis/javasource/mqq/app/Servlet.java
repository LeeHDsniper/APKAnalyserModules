package mqq.app;

import android.content.Intent;
import android.os.Bundle;
import mqq.observer.BusinessObserver;

public abstract class Servlet
{
  private ServletContainer container;
  private AppRuntime mAppRuntime;
  
  public Servlet() {}
  
  public AppRuntime getAppRuntime()
  {
    return mAppRuntime;
  }
  
  ServletContainer getServletContainer()
  {
    return container;
  }
  
  void init(AppRuntime paramAppRuntime, ServletContainer paramServletContainer)
  {
    mAppRuntime = paramAppRuntime;
    container = paramServletContainer;
  }
  
  public void notifyObserver(Intent paramIntent, int paramInt, boolean paramBoolean, Bundle paramBundle, Class<? extends BusinessObserver> paramClass)
  {
    if ((paramIntent instanceof NewIntent))
    {
      paramIntent = ((NewIntent)paramIntent).getObserver();
      if (paramIntent != null) {
        getAppRuntime().notifyObserver(paramIntent, paramInt, paramBoolean, paramBundle);
      }
    }
    getAppRuntime().notifyObservers(paramClass, paramInt, paramBoolean, paramBundle);
  }
  
  protected void onCreate() {}
  
  protected void onDestroy() {}
  
  public abstract void service(Intent paramIntent);
}
