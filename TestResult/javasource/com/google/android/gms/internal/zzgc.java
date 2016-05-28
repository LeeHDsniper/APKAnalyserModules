package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.PopupWindow;
import com.google.android.gms.ads.internal.util.client.zzb;

@zzgk
public class zzgc
  extends zzgb
{
  private Object zzCK = new Object();
  private PopupWindow zzCL;
  private boolean zzCM = false;
  
  zzgc(Context paramContext, zzhj.zza paramZza, zzip paramZzip, zzga.zza paramZza1)
  {
    super(paramContext, paramZza, paramZzip, paramZza1);
  }
  
  private void zzfq()
  {
    synchronized (zzCK)
    {
      zzCM = true;
      if (((mContext instanceof Activity)) && (((Activity)mContext).isDestroyed())) {
        zzCL = null;
      }
      if (zzCL != null)
      {
        if (zzCL.isShowing()) {
          zzCL.dismiss();
        }
        zzCL = null;
      }
      return;
    }
  }
  
  public void onStop()
  {
    zzfq();
    super.onStop();
  }
  
  protected void zzfp()
  {
    if ((mContext instanceof Activity)) {}
    Object localObject2;
    for (Window localWindow = ((Activity)mContext).getWindow();; localObject2 = null)
    {
      if ((localWindow == null) || (localWindow.getDecorView() == null)) {}
      while (((Activity)mContext).isDestroyed()) {
        return;
      }
      FrameLayout localFrameLayout = new FrameLayout(mContext);
      localFrameLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
      localFrameLayout.addView(zzoL.getWebView(), -1, -1);
      synchronized (zzCK)
      {
        if (zzCM) {
          return;
        }
      }
      zzCL = new PopupWindow(localFrameLayout, 1, 1, false);
      zzCL.setOutsideTouchable(true);
      zzCL.setClippingEnabled(false);
      zzb.zzaC("Displaying the 1x1 popup off the screen.");
      try
      {
        zzCL.showAtLocation(localObject1.getDecorView(), 0, -1, -1);
        return;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          zzCL = null;
        }
      }
    }
  }
  
  protected void zzi(zzhj paramZzhj)
  {
    zzfq();
    super.zzi(paramZzhj);
  }
}
