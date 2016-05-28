package rx.internal.util.unsafe;

import java.lang.reflect.Field;
import sun.misc.Unsafe;

public final class UnsafeAccess
{
  public static final Unsafe UNSAFE;
  
  static
  {
    Object localObject1 = null;
    try
    {
      Object localObject2 = Unsafe.class.getDeclaredField("theUnsafe");
      ((Field)localObject2).setAccessible(true);
      localObject2 = (Unsafe)((Field)localObject2).get(null);
      localObject1 = localObject2;
    }
    catch (Throwable localThrowable)
    {
      for (;;) {}
    }
    UNSAFE = localObject1;
  }
  
  public static final boolean isUnsafeAvailable()
  {
    return UNSAFE != null;
  }
}
