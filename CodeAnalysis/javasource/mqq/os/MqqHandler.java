package mqq.os;

import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.os.MessageQueue;
import android.os.SystemClock;
import android.util.Printer;
import java.util.concurrent.atomic.AtomicInteger;

public class MqqHandler
  implements IMqqMessageCallback
{
  private static boolean isEnableInited = false;
  private static boolean isMqqHandlerEnable;
  public static AtomicInteger sInjectCount = new AtomicInteger(0);
  boolean beInjected = false;
  Handler.Callback mCallback;
  final Looper mLooper;
  private NativeHandler mNativeHandler;
  MessageQueue mQueue;
  MqqMessageQueue mSubQueue;
  
  static
  {
    isMqqHandlerEnable = false;
  }
  
  public MqqHandler()
  {
    this(Looper.myLooper(), null);
  }
  
  public MqqHandler(Handler.Callback paramCallback)
  {
    this(Looper.myLooper(), paramCallback);
  }
  
  public MqqHandler(Looper paramLooper)
  {
    this(paramLooper, null);
  }
  
  public MqqHandler(Looper paramLooper, Handler.Callback paramCallback)
  {
    this(paramLooper, paramCallback, false);
  }
  
  public MqqHandler(Looper paramLooper, Handler.Callback paramCallback, boolean paramBoolean)
  {
    mLooper = paramLooper;
    if (mLooper == null) {
      throw new RuntimeException("Can't create handler inside thread that has not called Looper.prepare()");
    }
    mCallback = paramCallback;
    try
    {
      mQueue = paramLooper.getQueue();
      if ((mQueue != null) && (mLooper == Looper.getMainLooper()) && (isMqqHandlerEnable()) && (!paramBoolean))
      {
        beInjected = true;
        sInjectCount.incrementAndGet();
        mSubQueue = MqqMessageQueue.getSubMainThreadQueue();
      }
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        beInjected = false;
      }
    }
    mNativeHandler = new NativeHandler(paramLooper, paramCallback);
    mNativeHandler.mParentHandler = this;
  }
  
  private final Message getPostMessage(Runnable paramRunnable)
  {
    return Message.obtain(mNativeHandler, paramRunnable);
  }
  
  private final Message getPostMessage(Runnable paramRunnable, Object paramObject)
  {
    paramRunnable = Message.obtain(mNativeHandler, paramRunnable);
    obj = paramObject;
    return paramRunnable;
  }
  
  private final void handleCallback(Message paramMessage)
  {
    paramMessage.getCallback().run();
  }
  
  public static boolean isMqqHandlerEnable()
  {
    return true;
  }
  
  public static void setMqqHandlerEnable(boolean paramBoolean) {}
  
  public void dispatchMessage(Message paramMessage)
  {
    if (paramMessage.getCallback() != null) {
      handleCallback(paramMessage);
    }
    while ((mCallback != null) && (mCallback.handleMessage(paramMessage))) {
      return;
    }
    handleMessage(paramMessage);
  }
  
  public final void dump(Printer paramPrinter, String paramString)
  {
    if (beInjected) {
      return;
    }
    mNativeHandler.dump(paramPrinter, paramString);
  }
  
  public final Looper getLooper()
  {
    return mLooper;
  }
  
  public String getMessageName(Message paramMessage)
  {
    if (paramMessage.getCallback() != null) {
      return paramMessage.getCallback().getClass().getName();
    }
    return "0x" + Integer.toHexString(what);
  }
  
  public void handleMessage(Message paramMessage) {}
  
  public final boolean hasMessages(int paramInt)
  {
    if (beInjected) {
      return mSubQueue.removeMessages(this, paramInt, null, false);
    }
    return mNativeHandler.hasMessages(paramInt);
  }
  
  public final boolean hasMessages(int paramInt, Object paramObject)
  {
    if (beInjected) {
      return mSubQueue.removeMessages(this, paramInt, paramObject, false);
    }
    return mNativeHandler.hasMessages(paramInt, paramObject);
  }
  
  public final Message obtainMessage()
  {
    return Message.obtain(mNativeHandler);
  }
  
  public final Message obtainMessage(int paramInt)
  {
    return Message.obtain(mNativeHandler, paramInt);
  }
  
  public final Message obtainMessage(int paramInt1, int paramInt2, int paramInt3)
  {
    return Message.obtain(mNativeHandler, paramInt1, paramInt2, paramInt3);
  }
  
  public final Message obtainMessage(int paramInt1, int paramInt2, int paramInt3, Object paramObject)
  {
    return Message.obtain(mNativeHandler, paramInt1, paramInt2, paramInt3, paramObject);
  }
  
  public final Message obtainMessage(int paramInt, Object paramObject)
  {
    return Message.obtain(mNativeHandler, paramInt, paramObject);
  }
  
  public final boolean post(Runnable paramRunnable)
  {
    return sendMessageDelayed(getPostMessage(paramRunnable), 0L);
  }
  
  public final boolean postAtFrontOfQueue(Runnable paramRunnable)
  {
    return sendMessageAtFrontOfQueue(getPostMessage(paramRunnable));
  }
  
  public final boolean postAtTime(Runnable paramRunnable, long paramLong)
  {
    return sendMessageAtTime(getPostMessage(paramRunnable), paramLong);
  }
  
  public final boolean postAtTime(Runnable paramRunnable, Object paramObject, long paramLong)
  {
    return sendMessageAtTime(getPostMessage(paramRunnable, paramObject), paramLong);
  }
  
  public final boolean postDelayed(Runnable paramRunnable, long paramLong)
  {
    return sendMessageDelayed(getPostMessage(paramRunnable), paramLong);
  }
  
  public final void removeCallbacks(Runnable paramRunnable)
  {
    if (beInjected)
    {
      mSubQueue.removeMessages(this, paramRunnable, null);
      return;
    }
    mNativeHandler.removeCallbacks(paramRunnable);
  }
  
  public final void removeCallbacks(Runnable paramRunnable, Object paramObject)
  {
    if (beInjected)
    {
      mSubQueue.removeMessages(this, paramRunnable, paramObject);
      return;
    }
    mNativeHandler.removeCallbacks(paramRunnable, paramObject);
  }
  
  public final void removeCallbacksAndMessages(Object paramObject)
  {
    if (beInjected)
    {
      mSubQueue.removeCallbacksAndMessages(this, paramObject);
      return;
    }
    mNativeHandler.removeCallbacksAndMessages(paramObject);
  }
  
  public final void removeMessages(int paramInt)
  {
    if (beInjected)
    {
      mSubQueue.removeMessages(this, paramInt, null, true);
      return;
    }
    mNativeHandler.removeMessages(paramInt);
  }
  
  public final void removeMessages(int paramInt, Object paramObject)
  {
    if (beInjected)
    {
      mSubQueue.removeMessages(this, paramInt, paramObject, true);
      return;
    }
    mNativeHandler.removeMessages(paramInt, paramObject);
  }
  
  public final boolean sendEmptyMessage(int paramInt)
  {
    return sendEmptyMessageDelayed(paramInt, 0L);
  }
  
  public final boolean sendEmptyMessageAtTime(int paramInt, long paramLong)
  {
    Message localMessage = Message.obtain();
    what = paramInt;
    return sendMessageAtTime(localMessage, paramLong);
  }
  
  public final boolean sendEmptyMessageDelayed(int paramInt, long paramLong)
  {
    Message localMessage = Message.obtain();
    what = paramInt;
    return sendMessageDelayed(localMessage, paramLong);
  }
  
  public final boolean sendMessage(Message paramMessage)
  {
    return sendMessageDelayed(paramMessage, 0L);
  }
  
  public final boolean sendMessageAtFrontOfQueue(Message paramMessage)
  {
    if (beInjected)
    {
      MqqMessageQueue localMqqMessageQueue = mSubQueue;
      if (localMqqMessageQueue != null)
      {
        paramMessage = MqqMessage.obtain(paramMessage);
        target = this;
        return localMqqMessageQueue.enqueueMessage(paramMessage, 0L);
      }
      throw new RuntimeException(this + " sendMessageAtTime() called with no mSubQueue");
    }
    return mNativeHandler.sendMessageAtFrontOfQueue(paramMessage);
  }
  
  public boolean sendMessageAtTime(Message paramMessage, long paramLong)
  {
    if (beInjected)
    {
      MqqMessageQueue localMqqMessageQueue = mSubQueue;
      if (localMqqMessageQueue != null)
      {
        paramMessage = MqqMessage.obtain(paramMessage);
        target = this;
        return localMqqMessageQueue.enqueueMessage(paramMessage, paramLong);
      }
      throw new RuntimeException(this + " sendMessageAtTime() called with no mSubQueue");
    }
    return mNativeHandler.sendMessageAtTime(paramMessage, paramLong);
  }
  
  public final boolean sendMessageDelayed(Message paramMessage, long paramLong)
  {
    long l = paramLong;
    if (paramLong < 0L) {
      l = 0L;
    }
    return sendMessageAtTime(paramMessage, SystemClock.uptimeMillis() + l);
  }
  
  public String toString()
  {
    StringBuffer localStringBuffer = new StringBuffer(128);
    localStringBuffer.append("Handler (");
    localStringBuffer.append(getClass().getName());
    localStringBuffer.append(") {");
    localStringBuffer.append(Integer.toHexString(System.identityHashCode(this)));
    localStringBuffer.append("}");
    return localStringBuffer.toString();
  }
  
  private static class NativeHandler
    extends Handler
  {
    MqqHandler mParentHandler;
    
    public NativeHandler(Looper paramLooper, Handler.Callback paramCallback)
    {
      super(paramCallback);
    }
    
    public void dispatchMessage(Message paramMessage)
    {
      mParentHandler.dispatchMessage(paramMessage);
    }
  }
}
