package android.support.multidex;

import android.app.Application;
import android.content.Context;

public class MultiDexApplication
  extends Application
{
  public MultiDexApplication() {}
  
  protected void attachBaseContext(Context paramContext)
  {
    super.attachBaseContext(paramContext);
    MultiDex.install(this);
  }
}
