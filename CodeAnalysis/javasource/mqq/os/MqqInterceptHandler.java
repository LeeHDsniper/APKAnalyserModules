package mqq.os;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.MessageQueue;

public class MqqInterceptHandler
  extends Handler
  implements IMqqMessageCallback
{
  Handler mParentHandler = null;
  MqqMessageQueue mSubUIQueue;
  
  private MqqInterceptHandler(Handler paramHandler)
  {
    super(Looper.getMainLooper());
    mParentHandler = paramHandler;
    mSubUIQueue = MqqMessageQueue.getSubMainThreadQueue();
  }
  
  public static Handler createMqqHandler(Handler paramHandler)
  {
    if ((paramHandler.getLooper() != Looper.getMainLooper()) || ((paramHandler instanceof MqqInterceptHandler))) {}
    for (;;)
    {
      return null;
      try
      {
        MessageQueue localMessageQueue = Looper.getMainLooper().getQueue();
        if (localMessageQueue != null) {
          return new MqqInterceptHandler(paramHandler);
        }
      }
      catch (Throwable paramHandler) {}
    }
    return null;
  }
  
  public void dispatchMessage(Message paramMessage)
  {
    mParentHandler.dispatchMessage(paramMessage);
  }
  
  public boolean sendMessageAtTime(Message paramMessage, long paramLong)
  {
    MqqMessage localMqqMessage = MqqMessage.obtain(paramMessage);
    target = this;
    boolean bool2 = mSubUIQueue.enqueueMessage(localMqqMessage, paramLong);
    boolean bool1 = bool2;
    if (!bool2) {
      bool1 = mParentHandler.sendMessageAtTime(paramMessage, paramLong);
    }
    return bool1;
  }
}
