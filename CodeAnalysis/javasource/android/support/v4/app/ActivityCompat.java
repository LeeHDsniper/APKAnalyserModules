package android.support.v4.app;

import android.app.Activity;
import android.os.Build.VERSION;
import android.support.v4.content.ContextCompat;

public class ActivityCompat
  extends ContextCompat
{
  public static void finishAffinity(Activity paramActivity)
  {
    if (Build.VERSION.SDK_INT >= 16)
    {
      ActivityCompatJB.finishAffinity(paramActivity);
      return;
    }
    paramActivity.finish();
  }
  
  public static void finishAfterTransition(Activity paramActivity)
  {
    if (Build.VERSION.SDK_INT >= 21)
    {
      ActivityCompat21.finishAfterTransition(paramActivity);
      return;
    }
    paramActivity.finish();
  }
}
