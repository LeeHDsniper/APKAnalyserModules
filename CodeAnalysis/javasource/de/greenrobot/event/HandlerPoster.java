package de.greenrobot.event;

import android.os.Handler;
import android.os.Looper;

final class HandlerPoster
  extends Handler
{
  private final EventBus eventBus;
  private boolean handlerActive;
  private final int maxMillisInsideHandleMessage;
  private final PendingPostQueue queue;
  
  HandlerPoster(EventBus paramEventBus, Looper paramLooper, int paramInt)
  {
    super(paramLooper);
    eventBus = paramEventBus;
    maxMillisInsideHandleMessage = paramInt;
    queue = new PendingPostQueue();
  }
  
  void enqueue(Subscription paramSubscription, Object paramObject)
  {
    paramSubscription = PendingPost.obtainPendingPost(paramSubscription, paramObject);
    try
    {
      queue.enqueue(paramSubscription);
      if (!handlerActive)
      {
        handlerActive = true;
        if (!sendMessage(obtainMessage())) {
          throw new EventBusException("Could not send handler message");
        }
      }
    }
    finally {}
  }
  
  /* Error */
  public void handleMessage(android.os.Message paramMessage)
  {
    // Byte code:
    //   0: invokestatic 65	android/os/SystemClock:uptimeMillis	()J
    //   3: lstore_2
    //   4: aload_0
    //   5: getfield 28	de/greenrobot/event/HandlerPoster:queue	Lde/greenrobot/event/PendingPostQueue;
    //   8: invokevirtual 69	de/greenrobot/event/PendingPostQueue:poll	()Lde/greenrobot/event/PendingPost;
    //   11: astore 4
    //   13: aload 4
    //   15: astore_1
    //   16: aload 4
    //   18: ifnonnull +32 -> 50
    //   21: aload_0
    //   22: monitorenter
    //   23: aload_0
    //   24: getfield 28	de/greenrobot/event/HandlerPoster:queue	Lde/greenrobot/event/PendingPostQueue;
    //   27: invokevirtual 69	de/greenrobot/event/PendingPostQueue:poll	()Lde/greenrobot/event/PendingPost;
    //   30: astore_1
    //   31: aload_1
    //   32: ifnonnull +16 -> 48
    //   35: aload_0
    //   36: iconst_0
    //   37: putfield 42	de/greenrobot/event/HandlerPoster:handlerActive	Z
    //   40: aload_0
    //   41: monitorexit
    //   42: aload_0
    //   43: iconst_0
    //   44: putfield 42	de/greenrobot/event/HandlerPoster:handlerActive	Z
    //   47: return
    //   48: aload_0
    //   49: monitorexit
    //   50: aload_0
    //   51: getfield 19	de/greenrobot/event/HandlerPoster:eventBus	Lde/greenrobot/event/EventBus;
    //   54: aload_1
    //   55: invokevirtual 74	de/greenrobot/event/EventBus:invokeSubscriber	(Lde/greenrobot/event/PendingPost;)V
    //   58: invokestatic 65	android/os/SystemClock:uptimeMillis	()J
    //   61: lload_2
    //   62: lsub
    //   63: aload_0
    //   64: getfield 21	de/greenrobot/event/HandlerPoster:maxMillisInsideHandleMessage	I
    //   67: i2l
    //   68: lcmp
    //   69: iflt -65 -> 4
    //   72: aload_0
    //   73: aload_0
    //   74: invokevirtual 46	de/greenrobot/event/HandlerPoster:obtainMessage	()Landroid/os/Message;
    //   77: invokevirtual 50	de/greenrobot/event/HandlerPoster:sendMessage	(Landroid/os/Message;)Z
    //   80: ifne +26 -> 106
    //   83: new 52	de/greenrobot/event/EventBusException
    //   86: dup
    //   87: ldc 54
    //   89: invokespecial 57	de/greenrobot/event/EventBusException:<init>	(Ljava/lang/String;)V
    //   92: athrow
    //   93: astore_1
    //   94: aload_0
    //   95: iconst_0
    //   96: putfield 42	de/greenrobot/event/HandlerPoster:handlerActive	Z
    //   99: aload_1
    //   100: athrow
    //   101: astore_1
    //   102: aload_0
    //   103: monitorexit
    //   104: aload_1
    //   105: athrow
    //   106: aload_0
    //   107: iconst_1
    //   108: putfield 42	de/greenrobot/event/HandlerPoster:handlerActive	Z
    //   111: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	112	0	this	HandlerPoster
    //   0	112	1	paramMessage	android.os.Message
    //   3	59	2	l	long
    //   11	6	4	localPendingPost	PendingPost
    // Exception table:
    //   from	to	target	type
    //   0	4	93	finally
    //   4	13	93	finally
    //   21	23	93	finally
    //   50	93	93	finally
    //   104	106	93	finally
    //   23	31	101	finally
    //   35	42	101	finally
    //   48	50	101	finally
    //   102	104	101	finally
  }
}
