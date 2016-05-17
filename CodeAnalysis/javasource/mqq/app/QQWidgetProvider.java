package mqq.app;

import android.appwidget.AppWidgetProvider;
import android.content.Context;
import android.content.Intent;

public class QQWidgetProvider
  extends AppWidgetProvider
{
  public QQWidgetProvider() {}
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    super.onReceive(paramContext, paramIntent);
    ((MobileQQ)paramContext.getApplicationContext()).onActivityCreate(this, paramIntent);
    onReceive(((MobileQQ)paramContext.getApplicationContext()).waitAppRuntime(null), paramContext, paramIntent);
  }
  
  public void onReceive(AppRuntime paramAppRuntime, Context paramContext, Intent paramIntent) {}
}
