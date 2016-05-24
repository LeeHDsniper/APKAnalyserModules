package com.adobe.android.ui.widget;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
import android.os.Vibrator;

public class VibrationHelper
{
  private static Vibrator mVibrator;
  private boolean mEnabled;
  private final VibrationHandler mHandler = new VibrationHandler();
  
  public VibrationHelper(Context paramContext, boolean paramBoolean)
  {
    initialize(paramContext);
    setEnabled(paramBoolean);
    if (!isAvailable()) {
      setEnabled(false);
    }
  }
  
  /* Error */
  private void initialize(Context paramContext)
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: getstatic 38	com/adobe/android/ui/widget/VibrationHelper:mVibrator	Landroid/os/Vibrator;
    //   6: astore_2
    //   7: aload_2
    //   8: ifnonnull +15 -> 23
    //   11: aload_1
    //   12: ldc 42
    //   14: invokevirtual 48	android/content/Context:getSystemService	(Ljava/lang/String;)Ljava/lang/Object;
    //   17: checkcast 50	android/os/Vibrator
    //   20: putstatic 38	com/adobe/android/ui/widget/VibrationHelper:mVibrator	Landroid/os/Vibrator;
    //   23: ldc 2
    //   25: monitorexit
    //   26: return
    //   27: astore_1
    //   28: ldc 52
    //   30: aload_1
    //   31: invokevirtual 56	java/lang/Exception:toString	()Ljava/lang/String;
    //   34: invokestatic 62	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;)I
    //   37: pop
    //   38: goto -15 -> 23
    //   41: astore_1
    //   42: ldc 2
    //   44: monitorexit
    //   45: aload_1
    //   46: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	47	0	this	VibrationHelper
    //   0	47	1	paramContext	Context
    //   6	2	2	localVibrator	Vibrator
    // Exception table:
    //   from	to	target	type
    //   11	23	27	java/lang/Exception
    //   3	7	41	finally
    //   11	23	41	finally
    //   23	26	41	finally
    //   28	38	41	finally
    //   42	45	41	finally
  }
  
  public boolean enabled()
  {
    return mEnabled;
  }
  
  public final boolean isAvailable()
  {
    return (mVibrator != null) && (mVibrator.hasVibrator());
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    if ((paramBoolean) && (mVibrator != null)) {}
    for (paramBoolean = true;; paramBoolean = false)
    {
      mEnabled = paramBoolean;
      return;
    }
  }
  
  public void vibrate(int paramInt)
  {
    if ((mEnabled) && (mHandler != null))
    {
      mHandler.removeMessages(101);
      Message localMessage = mHandler.obtainMessage(101);
      arg1 = paramInt;
      mHandler.sendMessage(localMessage);
    }
  }
  
  static class VibrationHandler
    extends Handler
  {
    VibrationHandler() {}
    
    public void handleMessage(Message paramMessage)
    {
      if ((what == 101) && (VibrationHelper.mVibrator != null)) {}
      try
      {
        VibrationHelper.mVibrator.vibrate(arg1);
        return;
      }
      catch (Throwable paramMessage) {}
    }
  }
}
