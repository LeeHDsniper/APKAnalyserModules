package rx.android.content;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import rx.Observable.OnSubscribe;
import rx.Subscriber;
import rx.functions.Action0;
import rx.subscriptions.Subscriptions;

class OnSubscribeBroadcastRegister
  implements Observable.OnSubscribe<Intent>
{
  private final String broadcastPermission;
  private final Context context;
  private final IntentFilter intentFilter;
  private final Handler schedulerHandler;
  
  public OnSubscribeBroadcastRegister(Context paramContext, IntentFilter paramIntentFilter, String paramString, Handler paramHandler)
  {
    context = paramContext;
    intentFilter = paramIntentFilter;
    broadcastPermission = paramString;
    schedulerHandler = paramHandler;
  }
  
  public void call(final Subscriber<? super Intent> paramSubscriber)
  {
    final BroadcastReceiver local1 = new BroadcastReceiver()
    {
      public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
      {
        paramSubscriber.onNext(paramAnonymousIntent);
      }
    };
    paramSubscriber.add(Subscriptions.create(new Action0()
    {
      public void call()
      {
        context.unregisterReceiver(local1);
      }
    }));
    context.registerReceiver(local1, intentFilter, broadcastPermission, schedulerHandler);
  }
}
