package rx.android.content;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.support.v4.content.LocalBroadcastManager;
import rx.Observable.OnSubscribe;
import rx.Subscriber;
import rx.functions.Action0;
import rx.subscriptions.Subscriptions;

class OnSubscribeLocalBroadcastRegister
  implements Observable.OnSubscribe<Intent>
{
  private final Context context;
  private final IntentFilter intentFilter;
  
  public void call(final Subscriber<? super Intent> paramSubscriber)
  {
    final LocalBroadcastManager localLocalBroadcastManager = LocalBroadcastManager.getInstance(context);
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
        localLocalBroadcastManager.unregisterReceiver(local1);
      }
    }));
    localLocalBroadcastManager.registerReceiver(local1, intentFilter);
  }
}
