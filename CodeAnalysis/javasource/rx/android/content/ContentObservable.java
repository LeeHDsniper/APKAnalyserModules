package rx.android.content;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import rx.Observable;

public final class ContentObservable
{
  public static Observable<Intent> fromBroadcast(Context paramContext, IntentFilter paramIntentFilter)
  {
    return Observable.create(new OnSubscribeBroadcastRegister(paramContext, paramIntentFilter, null, null));
  }
}
