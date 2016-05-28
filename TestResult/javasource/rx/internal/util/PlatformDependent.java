package rx.internal.util;

import java.security.AccessController;
import java.security.PrivilegedAction;

public final class PlatformDependent
{
  private static final boolean IS_ANDROID = ;
  
  static ClassLoader getSystemClassLoader()
  {
    if (System.getSecurityManager() == null) {
      return ClassLoader.getSystemClassLoader();
    }
    (ClassLoader)AccessController.doPrivileged(new PrivilegedAction()
    {
      public ClassLoader run()
      {
        return ClassLoader.getSystemClassLoader();
      }
    });
  }
  
  public static boolean isAndroid()
  {
    return IS_ANDROID;
  }
  
  private static boolean isAndroid0()
  {
    try
    {
      Class.forName("android.app.Application", false, getSystemClassLoader());
      return true;
    }
    catch (Exception localException) {}
    return false;
  }
}
