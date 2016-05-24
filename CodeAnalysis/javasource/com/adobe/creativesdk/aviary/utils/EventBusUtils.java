package com.adobe.creativesdk.aviary.utils;

import android.util.Log;
import de.greenrobot.event.EventBus;

public final class EventBusUtils
{
  static final EventBus S_INSTANCE = ;
  static int count = 0;
  
  public static EventBus getInstance()
  {
    try
    {
      EventBus localEventBus = S_INSTANCE;
      return localEventBus;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public static void register(Object paramObject)
  {
    for (;;)
    {
      try
      {
        boolean bool = S_INSTANCE.isRegistered(paramObject);
        if (!bool) {
          try
          {
            S_INSTANCE.register(paramObject);
            count += 1;
            Log.v("EventBusUtils", "registered(" + paramObject + "). totals: " + count);
            return;
          }
          catch (Exception localException)
          {
            localException.printStackTrace();
            continue;
          }
        }
        Log.w("EventBusUtils", "cannot register (already registered)");
      }
      finally {}
    }
  }
  
  /* Error */
  public static void unregister(Object paramObject)
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: getstatic 18	com/adobe/creativesdk/aviary/utils/EventBusUtils:S_INSTANCE	Lde/greenrobot/event/EventBus;
    //   6: aload_0
    //   7: invokevirtual 30	de/greenrobot/event/EventBus:isRegistered	(Ljava/lang/Object;)Z
    //   10: ifeq +58 -> 68
    //   13: getstatic 18	com/adobe/creativesdk/aviary/utils/EventBusUtils:S_INSTANCE	Lde/greenrobot/event/EventBus;
    //   16: aload_0
    //   17: invokevirtual 74	de/greenrobot/event/EventBus:unregister	(Ljava/lang/Object;)V
    //   20: getstatic 20	com/adobe/creativesdk/aviary/utils/EventBusUtils:count	I
    //   23: iconst_1
    //   24: isub
    //   25: putstatic 20	com/adobe/creativesdk/aviary/utils/EventBusUtils:count	I
    //   28: ldc 34
    //   30: new 36	java/lang/StringBuilder
    //   33: dup
    //   34: invokespecial 39	java/lang/StringBuilder:<init>	()V
    //   37: ldc 76
    //   39: invokevirtual 45	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   42: aload_0
    //   43: invokevirtual 48	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   46: ldc 50
    //   48: invokevirtual 45	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   51: getstatic 20	com/adobe/creativesdk/aviary/utils/EventBusUtils:count	I
    //   54: invokevirtual 53	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   57: invokevirtual 57	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   60: invokestatic 79	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   63: pop
    //   64: ldc 2
    //   66: monitorexit
    //   67: return
    //   68: ldc 34
    //   70: ldc 81
    //   72: invokestatic 71	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
    //   75: pop
    //   76: goto -12 -> 64
    //   79: astore_0
    //   80: ldc 2
    //   82: monitorexit
    //   83: aload_0
    //   84: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	85	0	paramObject	Object
    // Exception table:
    //   from	to	target	type
    //   3	64	79	finally
    //   68	76	79	finally
  }
}
