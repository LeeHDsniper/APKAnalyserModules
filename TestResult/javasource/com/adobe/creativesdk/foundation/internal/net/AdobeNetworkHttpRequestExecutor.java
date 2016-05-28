package com.adobe.creativesdk.foundation.internal.net;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class AdobeNetworkHttpRequestExecutor
  extends ThreadPoolExecutor
{
  private boolean _isPaused = false;
  private ReentrantLock pauseLock = new ReentrantLock();
  private Condition unpaused = pauseLock.newCondition();
  
  public AdobeNetworkHttpRequestExecutor(int paramInt1, int paramInt2, long paramLong, TimeUnit paramTimeUnit, BlockingQueue<Runnable> paramBlockingQueue)
  {
    super(paramInt1, paramInt2, paramLong, paramTimeUnit, paramBlockingQueue);
  }
  
  /* Error */
  protected void beforeExecute(Thread paramThread, Runnable paramRunnable)
  {
    // Byte code:
    //   0: aload_0
    //   1: aload_1
    //   2: aload_2
    //   3: invokespecial 38	java/util/concurrent/ThreadPoolExecutor:beforeExecute	(Ljava/lang/Thread;Ljava/lang/Runnable;)V
    //   6: aload_0
    //   7: getfield 23	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor:pauseLock	Ljava/util/concurrent/locks/ReentrantLock;
    //   10: invokevirtual 41	java/util/concurrent/locks/ReentrantLock:lock	()V
    //   13: aload_0
    //   14: getfield 16	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor:_isPaused	Z
    //   17: ifeq +28 -> 45
    //   20: aload_0
    //   21: getfield 29	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor:unpaused	Ljava/util/concurrent/locks/Condition;
    //   24: invokeinterface 46 1 0
    //   29: goto -16 -> 13
    //   32: astore_2
    //   33: aload_1
    //   34: invokevirtual 51	java/lang/Thread:interrupt	()V
    //   37: aload_0
    //   38: getfield 23	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor:pauseLock	Ljava/util/concurrent/locks/ReentrantLock;
    //   41: invokevirtual 54	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   44: return
    //   45: aload_0
    //   46: getfield 23	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor:pauseLock	Ljava/util/concurrent/locks/ReentrantLock;
    //   49: invokevirtual 54	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   52: return
    //   53: astore_1
    //   54: aload_0
    //   55: getfield 23	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor:pauseLock	Ljava/util/concurrent/locks/ReentrantLock;
    //   58: invokevirtual 54	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   61: aload_1
    //   62: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	63	0	this	AdobeNetworkHttpRequestExecutor
    //   0	63	1	paramThread	Thread
    //   0	63	2	paramRunnable	Runnable
    // Exception table:
    //   from	to	target	type
    //   13	29	32	java/lang/InterruptedException
    //   13	29	53	finally
    //   33	37	53	finally
  }
  
  /* Error */
  public void pause()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 23	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor:pauseLock	Ljava/util/concurrent/locks/ReentrantLock;
    //   6: invokevirtual 41	java/util/concurrent/locks/ReentrantLock:lock	()V
    //   9: aload_0
    //   10: iconst_1
    //   11: putfield 16	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor:_isPaused	Z
    //   14: aload_0
    //   15: getfield 23	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor:pauseLock	Ljava/util/concurrent/locks/ReentrantLock;
    //   18: invokevirtual 54	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   21: aload_0
    //   22: monitorexit
    //   23: return
    //   24: astore_1
    //   25: aload_0
    //   26: getfield 23	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor:pauseLock	Ljava/util/concurrent/locks/ReentrantLock;
    //   29: invokevirtual 54	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   32: aload_1
    //   33: athrow
    //   34: astore_1
    //   35: aload_0
    //   36: monitorexit
    //   37: aload_1
    //   38: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	39	0	this	AdobeNetworkHttpRequestExecutor
    //   24	9	1	localObject1	Object
    //   34	4	1	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   9	14	24	finally
    //   2	9	34	finally
    //   14	21	34	finally
    //   25	34	34	finally
  }
  
  /* Error */
  public void resume()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 23	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor:pauseLock	Ljava/util/concurrent/locks/ReentrantLock;
    //   6: invokevirtual 41	java/util/concurrent/locks/ReentrantLock:lock	()V
    //   9: aload_0
    //   10: iconst_0
    //   11: putfield 16	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor:_isPaused	Z
    //   14: aload_0
    //   15: getfield 29	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor:unpaused	Ljava/util/concurrent/locks/Condition;
    //   18: invokeinterface 59 1 0
    //   23: aload_0
    //   24: getfield 23	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor:pauseLock	Ljava/util/concurrent/locks/ReentrantLock;
    //   27: invokevirtual 54	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   30: aload_0
    //   31: monitorexit
    //   32: return
    //   33: astore_1
    //   34: aload_0
    //   35: getfield 23	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor:pauseLock	Ljava/util/concurrent/locks/ReentrantLock;
    //   38: invokevirtual 54	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   41: aload_1
    //   42: athrow
    //   43: astore_1
    //   44: aload_0
    //   45: monitorexit
    //   46: aload_1
    //   47: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	48	0	this	AdobeNetworkHttpRequestExecutor
    //   33	9	1	localObject1	Object
    //   43	4	1	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   9	23	33	finally
    //   2	9	43	finally
    //   23	30	43	finally
    //   34	43	43	finally
  }
}
