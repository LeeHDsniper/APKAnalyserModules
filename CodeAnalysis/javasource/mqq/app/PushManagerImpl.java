package mqq.app;

import mqq.manager.PushManager;

class PushManagerImpl
  implements PushManager
{
  private AppRuntime app;
  private boolean registered;
  
  public PushManagerImpl(AppRuntime paramAppRuntime)
  {
    app = paramAppRuntime;
  }
  
  boolean isRegistered()
  {
    return registered;
  }
  
  public void onDestroy() {}
  
  public void registProxyMessagePush(int paramInt, String paramString1, String paramString2, String... paramVarArgs)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), BuiltInServlet.class);
    localNewIntent.putExtra("action", 1025);
    localNewIntent.putExtra("appid", paramInt);
    localNewIntent.putExtra("processName", paramString1);
    localNewIntent.putExtra("broadcastName", paramString2);
    localNewIntent.putExtra("commands", paramVarArgs);
    app.startServlet(localNewIntent);
  }
  
  public void unregistAllNotifyPush() {}
  
  public void unregistProxyMessagePush(int paramInt, String paramString)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), BuiltInServlet.class);
    localNewIntent.putExtra("action", 1026);
    localNewIntent.putExtra("appid", paramInt);
    localNewIntent.putExtra("processName", paramString);
    runNow = true;
    app.startServlet(localNewIntent);
  }
}
