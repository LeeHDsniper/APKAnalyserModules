package rx.android.plugins;

import java.util.concurrent.atomic.AtomicReference;

public final class RxAndroidPlugins
{
  private static final RxAndroidPlugins INSTANCE = new RxAndroidPlugins();
  private final AtomicReference<RxAndroidSchedulersHook> schedulersHook = new AtomicReference();
  
  RxAndroidPlugins() {}
  
  public static RxAndroidPlugins getInstance()
  {
    return INSTANCE;
  }
  
  private static <T> T getPluginImplementationViaProperty(Class<T> paramClass)
  {
    String str1 = paramClass.getSimpleName();
    String str2 = System.getProperty("rxandroid.plugin." + str1 + ".implementation");
    if (str2 != null) {
      try
      {
        paramClass = Class.forName(str2).asSubclass(paramClass).newInstance();
        return paramClass;
      }
      catch (ClassCastException paramClass)
      {
        throw new RuntimeException(str1 + " implementation is not an instance of " + str1 + ": " + str2);
      }
      catch (ClassNotFoundException paramClass)
      {
        throw new RuntimeException(str1 + " implementation class not found: " + str2, paramClass);
      }
      catch (InstantiationException paramClass)
      {
        throw new RuntimeException(str1 + " implementation not able to be instantiated: " + str2, paramClass);
      }
      catch (IllegalAccessException paramClass)
      {
        throw new RuntimeException(str1 + " implementation not able to be accessed: " + str2, paramClass);
      }
    }
    return null;
  }
  
  public RxAndroidSchedulersHook getSchedulersHook()
  {
    RxAndroidSchedulersHook localRxAndroidSchedulersHook;
    if (schedulersHook.get() == null)
    {
      localRxAndroidSchedulersHook = (RxAndroidSchedulersHook)getPluginImplementationViaProperty(RxAndroidSchedulersHook.class);
      if (localRxAndroidSchedulersHook != null) {
        break label46;
      }
      schedulersHook.compareAndSet(null, RxAndroidSchedulersHook.getDefaultInstance());
    }
    for (;;)
    {
      return (RxAndroidSchedulersHook)schedulersHook.get();
      label46:
      schedulersHook.compareAndSet(null, localRxAndroidSchedulersHook);
    }
  }
}
