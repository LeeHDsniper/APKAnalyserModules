package mqq.observer;

import android.os.Bundle;

public abstract interface BusinessObserver
{
  public abstract void onReceive(int paramInt, boolean paramBoolean, Bundle paramBundle);
}
