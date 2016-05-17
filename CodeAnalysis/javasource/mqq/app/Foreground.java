package mqq.app;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import com.tencent.qphone.base.util.QLog;

public class Foreground
  implements Handler.Callback
{
  private static final int DELAY_BROADCAST = 400;
  private static final int MSG_BACK = 0;
  private static final int MSG_FORE = 1;
  public static final String TAG = "ApplicationLife";
  private static Context sContext;
  public static int sCountActivity = 0;
  private static Handler sHandler;
  private static String sProcessName;
  
  public Foreground() {}
  
  public static void init(Context paramContext, Looper paramLooper, String paramString)
  {
    if (sHandler == null) {
      try
      {
        if (sHandler == null)
        {
          sContext = paramContext;
          sProcessName = paramString;
          sHandler = new Handler(paramLooper, new Foreground());
        }
        return;
      }
      finally {}
    }
  }
  
  public static void onStart(AppRuntime paramAppRuntime)
  {
    int i = sCountActivity + 1;
    sCountActivity = i;
    if (i == 1)
    {
      long l = SystemClock.uptimeMillis();
      paramAppRuntime = sHandler.obtainMessage(1, (int)(l >>> 32), (int)(0xFFFFFFFFFFFFFFFF & l), paramAppRuntime);
      sHandler.sendMessageDelayed(paramAppRuntime, 400L);
    }
  }
  
  public static void onStop(AppRuntime paramAppRuntime)
  {
    int i = sCountActivity - 1;
    sCountActivity = i;
    if (i == 0)
    {
      long l = SystemClock.uptimeMillis();
      paramAppRuntime = sHandler.obtainMessage(0, (int)(l >>> 32), (int)(0xFFFFFFFFFFFFFFFF & l), paramAppRuntime);
      sHandler.sendMessageDelayed(paramAppRuntime, 400L);
    }
  }
  
  public static void setReady()
  {
    if (sCountActivity > 0)
    {
      l = SystemClock.uptimeMillis();
      localMessage = sHandler.obtainMessage(1, (int)(l >>> 32), (int)(l & 0xFFFFFFFFFFFFFFFF), null);
      sHandler.sendMessageDelayed(localMessage, 400L);
      return;
    }
    long l = SystemClock.uptimeMillis();
    Message localMessage = sHandler.obtainMessage(0, (int)(l >>> 32), (int)(l & 0xFFFFFFFFFFFFFFFF), null);
    sHandler.sendMessageDelayed(localMessage, 400L);
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    AppRuntime localAppRuntime = (AppRuntime)obj;
    long l = arg1 << 32 | arg2;
    if (QLog.isColorLevel()) {
      QLog.i("mqq", 2, what + ", " + sProcessName + ", " + l + ", " + sCountActivity);
    }
    if ((what == 1) && (sCountActivity > 0))
    {
      if (localAppRuntime != null) {
        localAppRuntime.onRunningForeground();
      }
      paramMessage = new Intent("com.tencent.process.starting");
      paramMessage.putExtra("runningProcessName", sProcessName);
      paramMessage.putExtra("runningtime", l);
      sContext.sendBroadcast(paramMessage);
    }
    while ((what != 0) || (sCountActivity != 0)) {
      return true;
    }
    if (localAppRuntime != null) {
      localAppRuntime.onRunningBackground();
    }
    paramMessage = new Intent("com.tencent.process.stopping");
    paramMessage.putExtra("runningProcessName", sProcessName);
    paramMessage.putExtra("runningtime", l);
    sContext.sendBroadcast(paramMessage);
    return true;
  }
}
