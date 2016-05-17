package oicq.wlogin_sdk.request;

import android.content.Context;
import oicq.wlogin_sdk.tools.util;

public class g
  extends Thread
{
  private Context a;
  
  public g(Context paramContext)
  {
    a = paramContext;
    setName("WtCleanThread");
  }
  
  public void run()
  {
    util.deleteExpireLog(a);
  }
}
