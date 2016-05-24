package com.google.android.gms.ads.internal.formats;

import android.content.Context;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RoundRectShape;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzhv;

class zzb
  extends RelativeLayout
{
  private static final float[] zzvH = { 5.0F, 5.0F, 5.0F, 5.0F, 5.0F, 5.0F, 5.0F, 5.0F };
  private final RelativeLayout zzvI;
  
  public zzb(Context paramContext, zza paramZza)
  {
    super(paramContext);
    zzx.zzv(paramZza);
    Object localObject1 = new RelativeLayout.LayoutParams(-2, -2);
    ((RelativeLayout.LayoutParams)localObject1).addRule(10);
    ((RelativeLayout.LayoutParams)localObject1).addRule(11);
    Object localObject2 = new ShapeDrawable(new RoundRectShape(zzvH, null, null));
    ((ShapeDrawable)localObject2).getPaint().setColor(paramZza.getBackgroundColor());
    zzvI = new RelativeLayout(paramContext);
    zzvI.setLayoutParams((ViewGroup.LayoutParams)localObject1);
    zzp.zzbz().zza(zzvI, (Drawable)localObject2);
    localObject2 = new RelativeLayout.LayoutParams(-2, -2);
    localObject1 = new TextView(paramContext);
    ((TextView)localObject1).setLayoutParams((ViewGroup.LayoutParams)localObject2);
    ((TextView)localObject1).setId(1195835393);
    ((TextView)localObject1).setTypeface(Typeface.DEFAULT);
    ((TextView)localObject1).setText(paramZza.getText());
    ((TextView)localObject1).setTextColor(paramZza.getTextColor());
    ((TextView)localObject1).setTextSize(paramZza.getTextSize());
    ((TextView)localObject1).setPadding(zzk.zzcE().zzb(paramContext, 4), 0, zzk.zzcE().zzb(paramContext, 4), 0);
    localObject2 = new RelativeLayout.LayoutParams(-2, -2);
    ((RelativeLayout.LayoutParams)localObject2).addRule(1, ((TextView)localObject1).getId());
    paramContext = new ImageView(paramContext);
    paramContext.setLayoutParams((ViewGroup.LayoutParams)localObject2);
    paramContext.setId(1195835394);
    paramContext.setImageDrawable(paramZza.getIcon());
    zzvI.addView((View)localObject1);
    zzvI.addView(paramContext);
    addView(zzvI);
  }
  
  public ViewGroup zzdq()
  {
    return zzvI;
  }
}
