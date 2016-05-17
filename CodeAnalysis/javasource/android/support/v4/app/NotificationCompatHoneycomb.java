package android.support.v4.app;

import android.app.Notification;
import android.app.Notification.Builder;
import android.app.PendingIntent;
import android.content.Context;
import android.graphics.Bitmap;
import android.widget.RemoteViews;

class NotificationCompatHoneycomb
{
  NotificationCompatHoneycomb() {}
  
  static Notification add(Context paramContext, Notification paramNotification, CharSequence paramCharSequence1, CharSequence paramCharSequence2, CharSequence paramCharSequence3, RemoteViews paramRemoteViews, int paramInt, PendingIntent paramPendingIntent1, PendingIntent paramPendingIntent2, Bitmap paramBitmap)
  {
    paramContext = new Notification.Builder(paramContext).setWhen(when).setSmallIcon(icon, iconLevel).setContent(contentView).setTicker(tickerText, paramRemoteViews).setSound(sound, audioStreamType).setVibrate(vibrate).setLights(ledARGB, ledOnMS, ledOffMS);
    if ((flags & 0x2) != 0)
    {
      bool = true;
      paramContext = paramContext.setOngoing(bool);
      if ((flags & 0x8) == 0) {
        break label209;
      }
      bool = true;
      label108:
      paramContext = paramContext.setOnlyAlertOnce(bool);
      if ((flags & 0x10) == 0) {
        break label215;
      }
      bool = true;
      label128:
      paramContext = paramContext.setAutoCancel(bool).setDefaults(defaults).setContentTitle(paramCharSequence1).setContentText(paramCharSequence2).setContentInfo(paramCharSequence3).setContentIntent(paramPendingIntent1).setDeleteIntent(deleteIntent);
      if ((flags & 0x80) == 0) {
        break label221;
      }
    }
    label209:
    label215:
    label221:
    for (boolean bool = true;; bool = false)
    {
      return paramContext.setFullScreenIntent(paramPendingIntent2, bool).setLargeIcon(paramBitmap).setNumber(paramInt).getNotification();
      bool = false;
      break;
      bool = false;
      break label108;
      bool = false;
      break label128;
    }
  }
}
