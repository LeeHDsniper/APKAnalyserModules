package mqq.os;

import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.os.MessageQueue;
import android.os.MessageQueue.IdleHandler;
import android.os.SystemClock;
import android.util.Log;
import android.util.Printer;
import com.tencent.qphone.base.util.QLog;

public class MqqMessageQueue
  implements Handler.Callback, MessageQueue.IdleHandler
{
  private static boolean DEBUG_QUEUE = false;
  private static final int MSG_HOOK = 1000;
  private static final int MSG_IDLE_TIMEOUT = 1001;
  private static final String TAG = "MqqMessage.Queue";
  private static MqqMessageQueue sSubMainQueue;
  private volatile boolean hookReqeusted = false;
  private volatile boolean idleHandlerAttached = false;
  Handler mHandler = new Handler(paramLooper, this)
  {
    public String toString()
    {
      return "MessageQueueHandler";
    }
  };
  Printer mLogging;
  MqqMessage mMessages;
  long msgCount = 0L;
  long totalCost = 0L;
  
  private MqqMessageQueue(Looper paramLooper) {}
  
  private void cancelHookReq()
  {
    mHandler.removeMessages(1000);
    hookReqeusted = false;
  }
  
  private boolean dequeue(boolean paramBoolean)
  {
    if ((DEBUG_QUEUE) && (QLog.isColorLevel())) {
      QLog.d("MqqMessage.Queue", 2, "enter dequeue, idle = " + paramBoolean);
    }
    MqqMessage localMqqMessage = next();
    if (localMqqMessage != null) {}
    for (String str = localMqqMessage.toString();; str = "null")
    {
      if (localMqqMessage != null) {}
      try
      {
        StringBuilder localStringBuilder;
        if (mLogging != null)
        {
          localStringBuilder = new StringBuilder(256);
          localStringBuilder.append(">>>>> Dispatching to ");
          localStringBuilder.append(target);
          localStringBuilder.append(" ");
          localStringBuilder.append(wrappedMsg.getCallback());
          localStringBuilder.append(": ");
          localStringBuilder.append(wrappedMsg.what);
          mLogging.println(localStringBuilder.toString());
        }
        long l = SystemClock.uptimeMillis();
        target.dispatchMessage(wrappedMsg);
        totalCost += SystemClock.uptimeMillis() - l;
        msgCount += 1L;
        if (mLogging != null)
        {
          localStringBuilder = new StringBuilder(256);
          localStringBuilder.append("<<<<< Finished to ");
          localStringBuilder.append(target);
          localStringBuilder.append(" ");
          localStringBuilder.append(wrappedMsg.getCallback());
          mLogging.println(localStringBuilder.toString());
        }
        localMqqMessage.recycle();
      }
      catch (Throwable localThrowable)
      {
        for (;;)
        {
          throwException(localThrowable);
        }
        if ((!DEBUG_QUEUE) || (!QLog.isColorLevel())) {
          break label420;
        }
        QLog.d("MqqMessage.Queue", 2, "dequeue, msg = null");
      }
      if ((DEBUG_QUEUE) && (msgCount % 100L == 0L) && (QLog.isColorLevel())) {
        QLog.d("MqqMessage.Queue", 2, new Object[] { "dequeue|", Long.valueOf(msgCount), "|", Long.valueOf(totalCost) });
      }
      if (localMqqMessage == null) {
        break;
      }
      if ((DEBUG_QUEUE) && (QLog.isColorLevel())) {
        QLog.d("MqqMessage.Queue", 2, new Object[] { "dequeue, msg = ", str });
      }
      return true;
    }
    label420:
    return false;
  }
  
  public static MqqMessageQueue getSubMainThreadQueue()
  {
    try
    {
      if (sSubMainQueue == null) {
        sSubMainQueue = new MqqMessageQueue(Looper.getMainLooper());
      }
      MqqMessageQueue localMqqMessageQueue = sSubMainQueue;
      return localMqqMessageQueue;
    }
    finally {}
  }
  
  private final void onQueueIdleTimeout()
  {
    if (dequeue(false)) {
      mHandler.sendEmptyMessage(1001);
    }
  }
  
  private void printDeletionLog(MqqMessage paramMqqMessage)
  {
    if ((DEBUG_QUEUE) && (QLog.isColorLevel())) {
      QLog.d("MqqMessage.Queue", 2, "removeMsg: " + paramMqqMessage.toString());
    }
  }
  
  private void reqHookIdleHandler()
  {
    if ((DEBUG_QUEUE) && (QLog.isColorLevel())) {
      QLog.d("MqqMessage.Queue", 2, new Object[] { "reqHook, attached = ", Boolean.valueOf(idleHandlerAttached), ", requested = ", Boolean.valueOf(hookReqeusted) });
    }
    if ((!idleHandlerAttached) && (!hookReqeusted))
    {
      hookReqeusted = true;
      mHandler.sendEmptyMessage(1000);
      return;
    }
    mHandler.sendEmptyMessageDelayed(1001, 1000L);
  }
  
  private void throwException(final Throwable paramThrowable)
  {
    new Thread()
    {
      public void run()
      {
        throw new RuntimeException("queueIdle encounter business crash. " + Log.getStackTraceString(paramThrowable));
      }
    }.start();
  }
  
  boolean enqueueMessage(MqqMessage paramMqqMessage, long paramLong)
  {
    if ((DEBUG_QUEUE) && (QLog.isColorLevel())) {
      QLog.d("MqqMessage.Queue", 2, "enqueueMessage: " + paramMqqMessage.toString());
    }
    for (;;)
    {
      MqqMessage localMqqMessage1;
      MqqMessage localMqqMessage2;
      try
      {
        when = paramLong;
        localMqqMessage1 = mMessages;
        if ((localMqqMessage1 != null) && (paramLong != 0L) && (paramLong >= when)) {
          break label145;
        }
        next = localMqqMessage1;
        mMessages = paramMqqMessage;
        reqHookIdleHandler();
        return true;
      }
      finally {}
      if ((localMqqMessage1 != null) && (when <= paramLong))
      {
        localMqqMessage2 = localMqqMessage1;
        localMqqMessage1 = next;
      }
      else
      {
        next = next;
        next = paramMqqMessage;
        continue;
        label145:
        localMqqMessage2 = null;
      }
    }
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    if ((DEBUG_QUEUE) && (QLog.isColorLevel())) {
      QLog.d("MqqMessage.Queue", 2, new Object[] { "handleMessage, what = ", Integer.valueOf(what), ", attached = ", Boolean.valueOf(idleHandlerAttached) });
    }
    if (what == 1000)
    {
      if (!idleHandlerAttached)
      {
        cancelHookReq();
        idleHandlerAttached = true;
        mHandler.getLooper().getQueue().addIdleHandler(this);
      }
      mHandler.sendEmptyMessageDelayed(1001, 1000L);
    }
    while (what != 1001) {
      return true;
    }
    onQueueIdleTimeout();
    return true;
  }
  
  final MqqMessage next()
  {
    for (;;)
    {
      try
      {
        long l1 = SystemClock.uptimeMillis();
        MqqMessage localMqqMessage = mMessages;
        if (localMqqMessage != null)
        {
          long l2 = when;
          if (l1 >= l2)
          {
            mMessages = next;
            next = null;
            return localMqqMessage;
          }
          int i = (int)Math.min(l2 - l1, 2147483647L);
          mHandler.removeMessages(1000);
          mHandler.sendEmptyMessageDelayed(1000, i);
          return null;
        }
      }
      finally {}
    }
  }
  
  public boolean queueIdle()
  {
    mHandler.removeMessages(1001);
    boolean bool = dequeue(true);
    if (bool)
    {
      mHandler.sendEmptyMessage(1000);
      return bool;
    }
    idleHandlerAttached = false;
    return bool;
  }
  
  void removeCallbacksAndMessages(MqqHandler paramMqqHandler, Object paramObject)
  {
    for (;;)
    {
      try
      {
        Object localObject1 = mMessages;
        Object localObject2 = localObject1;
        if (localObject1 != null)
        {
          localObject2 = localObject1;
          if (target == paramMqqHandler) {
            if (paramObject != null)
            {
              localObject2 = localObject1;
              if (wrappedMsg.obj != paramObject) {}
            }
            else
            {
              localObject2 = next;
              mMessages = ((MqqMessage)localObject2);
              printDeletionLog((MqqMessage)localObject1);
              ((MqqMessage)localObject1).recycle();
              localObject1 = localObject2;
              continue;
            }
          }
        }
        if (localObject2 == null) {
          break;
        }
        localObject1 = next;
        if ((localObject1 != null) && (target == paramMqqHandler) && ((paramObject == null) || (wrappedMsg.obj == paramObject)))
        {
          MqqMessage localMqqMessage = next;
          printDeletionLog((MqqMessage)localObject1);
          ((MqqMessage)localObject1).recycle();
          next = localMqqMessage;
        }
        else
        {
          localObject2 = localObject1;
        }
      }
      finally {}
    }
  }
  
  final void removeMessages(MqqHandler paramMqqHandler, Runnable paramRunnable, Object paramObject)
  {
    if (paramRunnable == null) {
      return;
    }
    for (;;)
    {
      try
      {
        Object localObject1 = mMessages;
        Object localObject2 = localObject1;
        if (localObject1 != null)
        {
          localObject2 = localObject1;
          if (target == paramMqqHandler)
          {
            localObject2 = localObject1;
            if (wrappedMsg.getCallback() == paramRunnable) {
              if (paramObject != null)
              {
                localObject2 = localObject1;
                if (wrappedMsg.obj != paramObject) {}
              }
              else
              {
                localObject2 = next;
                mMessages = ((MqqMessage)localObject2);
                printDeletionLog((MqqMessage)localObject1);
                ((MqqMessage)localObject1).recycle();
                localObject1 = localObject2;
                continue;
              }
            }
          }
        }
        if (localObject2 == null) {
          break;
        }
        localObject1 = next;
        if ((localObject1 != null) && (target == paramMqqHandler) && (wrappedMsg.getCallback() == paramRunnable) && ((paramObject == null) || (wrappedMsg.obj == paramObject)))
        {
          MqqMessage localMqqMessage = next;
          printDeletionLog((MqqMessage)localObject1);
          ((MqqMessage)localObject1).recycle();
          next = localMqqMessage;
        }
        else
        {
          localObject2 = localObject1;
        }
      }
      finally {}
    }
  }
  
  boolean removeMessages(MqqHandler paramMqqHandler, int paramInt, Object paramObject, boolean paramBoolean)
  {
    boolean bool2;
    for (;;)
    {
      Object localObject1;
      try
      {
        localObject1 = mMessages;
        boolean bool1 = false;
        bool2 = bool1;
        localObject2 = localObject1;
        if (localObject1 != null)
        {
          bool2 = bool1;
          localObject2 = localObject1;
          if (target == paramMqqHandler)
          {
            bool2 = bool1;
            localObject2 = localObject1;
            if (wrappedMsg.what == paramInt) {
              if (paramObject != null)
              {
                bool2 = bool1;
                localObject2 = localObject1;
                if (wrappedMsg.obj != paramObject) {}
              }
              else
              {
                if (!paramBoolean) {
                  return true;
                }
                bool1 = true;
                localObject2 = next;
                mMessages = ((MqqMessage)localObject2);
                printDeletionLog((MqqMessage)localObject1);
                ((MqqMessage)localObject1).recycle();
                localObject1 = localObject2;
                continue;
                bool2 = true;
                MqqMessage localMqqMessage = next;
                printDeletionLog((MqqMessage)localObject1);
                ((MqqMessage)localObject1).recycle();
                next = localMqqMessage;
              }
            }
          }
        }
        if (localObject2 == null) {
          break;
        }
        localObject1 = next;
        if ((localObject1 != null) && (target == paramMqqHandler) && (wrappedMsg.what == paramInt) && ((paramObject == null) || (wrappedMsg.obj == paramObject)))
        {
          if (paramBoolean) {
            continue;
          }
          return true;
        }
      }
      finally {}
      Object localObject2 = localObject1;
    }
    return bool2;
  }
  
  public void setDetailLogging(boolean paramBoolean)
  {
    DEBUG_QUEUE = paramBoolean;
    MqqMessage.DEBUG_MESSAGE = paramBoolean;
  }
  
  public void setMessageLogging(Printer paramPrinter)
  {
    mLogging = paramPrinter;
  }
}
