package com.google.android.gms.internal;

import android.view.View;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;

abstract class zzio
{
  private final WeakReference<View> zzIT;
  
  public zzio(View paramView)
  {
    zzIT = new WeakReference(paramView);
  }
  
  public final void detach()
  {
    ViewTreeObserver localViewTreeObserver = getViewTreeObserver();
    if (localViewTreeObserver != null) {
      zzb(localViewTreeObserver);
    }
  }
  
  protected ViewTreeObserver getViewTreeObserver()
  {
    Object localObject = (View)zzIT.get();
    if (localObject == null) {
      localObject = null;
    }
    ViewTreeObserver localViewTreeObserver;
    do
    {
      return localObject;
      localViewTreeObserver = ((View)localObject).getViewTreeObserver();
      if (localViewTreeObserver == null) {
        break;
      }
      localObject = localViewTreeObserver;
    } while (localViewTreeObserver.isAlive());
    return null;
  }
  
  protected abstract void zza(ViewTreeObserver paramViewTreeObserver);
  
  protected abstract void zzb(ViewTreeObserver paramViewTreeObserver);
  
  public final void zzgL()
  {
    ViewTreeObserver localViewTreeObserver = getViewTreeObserver();
    if (localViewTreeObserver != null) {
      zza(localViewTreeObserver);
    }
  }
}
