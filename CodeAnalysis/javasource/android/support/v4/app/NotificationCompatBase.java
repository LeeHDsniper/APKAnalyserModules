package android.support.v4.app;

import android.app.PendingIntent;
import android.os.Bundle;

public class NotificationCompatBase
{
  public static abstract class Action
  {
    public abstract PendingIntent getActionIntent();
    
    public abstract Bundle getExtras();
    
    public abstract int getIcon();
    
    public abstract RemoteInputCompatBase.RemoteInput[] getRemoteInputs();
    
    public abstract CharSequence getTitle();
    
    public static abstract interface Factory {}
  }
}
