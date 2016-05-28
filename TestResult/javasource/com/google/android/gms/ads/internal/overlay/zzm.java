package com.google.android.gms.ads.internal.overlay;

import android.content.Context;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageButton;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.internal.zzgk;

@zzgk
public class zzm
  extends FrameLayout
  implements View.OnClickListener
{
  private final ImageButton zzBk;
  private final zzo zzBl;
  
  public zzm(Context paramContext, int paramInt, zzo paramZzo)
  {
    super(paramContext);
    zzBl = paramZzo;
    setOnClickListener(this);
    zzBk = new ImageButton(paramContext);
    zzBk.setImageResource(17301527);
    zzBk.setBackgroundColor(0);
    zzBk.setOnClickListener(this);
    zzBk.setPadding(0, 0, 0, 0);
    zzBk.setContentDescription("Interstitial close button");
    paramInt = zzk.zzcE().zzb(paramContext, paramInt);
    addView(zzBk, new FrameLayout.LayoutParams(paramInt, paramInt, 17));
  }
  
  public void onClick(View paramView)
  {
    if (zzBl != null) {
      zzBl.zzey();
    }
  }
  
  public void zza(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramBoolean2)
    {
      if (paramBoolean1)
      {
        zzBk.setVisibility(4);
        return;
      }
      zzBk.setVisibility(8);
      return;
    }
    zzBk.setVisibility(0);
  }
}
