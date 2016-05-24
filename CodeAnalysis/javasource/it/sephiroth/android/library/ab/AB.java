package it.sephiroth.android.library.ab;

import android.content.Context;

public class AB
{
  private static AB instance;
  private Group group;
  private final int hashCode = manager.getUUID().hashCode();
  private final ABSettingsFactory.ABSettingsManager manager = setup(paramContext);
  
  AB(Context paramContext) {}
  
  private Group generateGroup()
  {
    if (hashCode % 2 == 0) {
      return Group.GroupA;
    }
    return Group.GroupB;
  }
  
  /* Error */
  public static AB getInstance(Context paramContext)
  {
    // Byte code:
    //   0: getstatic 52	it/sephiroth/android/library/ab/AB:instance	Lit/sephiroth/android/library/ab/AB;
    //   3: ifnonnull +32 -> 35
    //   6: ldc 2
    //   8: monitorenter
    //   9: getstatic 52	it/sephiroth/android/library/ab/AB:instance	Lit/sephiroth/android/library/ab/AB;
    //   12: ifnonnull +20 -> 32
    //   15: ldc 2
    //   17: monitorenter
    //   18: new 2	it/sephiroth/android/library/ab/AB
    //   21: dup
    //   22: aload_0
    //   23: invokespecial 54	it/sephiroth/android/library/ab/AB:<init>	(Landroid/content/Context;)V
    //   26: putstatic 52	it/sephiroth/android/library/ab/AB:instance	Lit/sephiroth/android/library/ab/AB;
    //   29: ldc 2
    //   31: monitorexit
    //   32: ldc 2
    //   34: monitorexit
    //   35: getstatic 52	it/sephiroth/android/library/ab/AB:instance	Lit/sephiroth/android/library/ab/AB;
    //   38: areturn
    //   39: astore_0
    //   40: ldc 2
    //   42: monitorexit
    //   43: aload_0
    //   44: athrow
    //   45: astore_0
    //   46: ldc 2
    //   48: monitorexit
    //   49: aload_0
    //   50: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	51	0	paramContext	Context
    // Exception table:
    //   from	to	target	type
    //   18	32	39	finally
    //   40	43	39	finally
    //   9	18	45	finally
    //   32	35	45	finally
    //   43	45	45	finally
    //   46	49	45	finally
  }
  
  private ABSettingsFactory.ABSettingsManager setup(Context paramContext)
  {
    return ABSettingsFactory.create(paramContext);
  }
  
  public Group getGroup()
  {
    if (group == null) {
      group = generateGroup();
    }
    return group;
  }
  
  public String getUUID()
  {
    return manager.getUUID();
  }
  
  public static enum Group
  {
    GroupA,  GroupB;
    
    private Group() {}
  }
}
