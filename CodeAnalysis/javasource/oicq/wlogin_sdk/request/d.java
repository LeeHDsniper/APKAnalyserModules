package oicq.wlogin_sdk.request;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import oicq.wlogin_sdk.tools.ErrMsg;

public class d
  extends Thread
{
  Runnable a = new e(this);
  private Context b;
  private ErrMsg c;
  
  public d(Context paramContext, ErrMsg paramErrMsg)
  {
    b = paramContext;
    a(paramErrMsg);
  }
  
  public void a(ErrMsg paramErrMsg)
  {
    if (paramErrMsg != null) {
      try
      {
        c = ((ErrMsg)paramErrMsg.clone());
        return;
      }
      catch (CloneNotSupportedException paramErrMsg)
      {
        paramErrMsg.printStackTrace();
        c = null;
        return;
      }
    }
    c = null;
  }
  
  public void run()
  {
    new Handler(Looper.getMainLooper()).post(a);
  }
}
