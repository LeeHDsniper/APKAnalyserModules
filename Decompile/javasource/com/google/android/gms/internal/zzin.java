package com.google.android.gms.internal;

import android.view.View;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnScrollChangedListener;
import java.lang.ref.WeakReference;

class zzin
  extends zzio
  implements ViewTreeObserver.OnScrollChangedListener
{
  private final WeakReference<ViewTreeObserver.OnScrollChangedListener> zzIS;
  
  public zzin(View paramView, ViewTreeObserver.OnScrollChangedListener paramOnScrollChangedListener)
  {
    super(paramView);
    zzIS = new WeakReference(paramOnScrollChangedListener);
  }
  
  public void onScrollChanged()
  {
    ViewTreeObserver.OnScrollChangedListener localOnScrollChangedListener = (ViewTreeObserver.OnScrollChangedListener)zzIS.get();
    if (localOnScrollChangedListener != null)
    {
      localOnScrollChangedListener.onScrollChanged();
      return;
    }
    detach();
  }
  
  protected void zza(ViewTreeObserver paramViewTreeObserver)
  {
    paramViewTreeObserver.addOnScrollChangedListener(this);
  }
  
  protected void zzb(ViewTreeObserver paramViewTreeObserver)
  {
    paramViewTreeObserver.removeOnScrollChangedListener(this);
  }
}
