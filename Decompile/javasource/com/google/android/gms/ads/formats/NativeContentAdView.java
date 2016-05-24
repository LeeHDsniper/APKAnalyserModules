package com.google.android.gms.ads.formats;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;

public final class NativeContentAdView
  extends NativeAdView
{
  public NativeContentAdView(Context paramContext)
  {
    super(paramContext);
  }
  
  public NativeContentAdView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public NativeContentAdView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  public NativeContentAdView(Context paramContext, AttributeSet paramAttributeSet, int paramInt1, int paramInt2)
  {
    super(paramContext, paramAttributeSet, paramInt1, paramInt2);
  }
  
  public final View getAdvertiserView()
  {
    return super.zzm("1004");
  }
  
  public final View getBodyView()
  {
    return super.zzm("1002");
  }
  
  public final View getCallToActionView()
  {
    return super.zzm("1003");
  }
  
  public final View getHeadlineView()
  {
    return super.zzm("1001");
  }
  
  public final View getImageView()
  {
    return super.zzm("1005");
  }
  
  public final View getLogoView()
  {
    return super.zzm("1006");
  }
  
  public final void setAdvertiserView(View paramView)
  {
    super.zza("1004", paramView);
  }
  
  public final void setBodyView(View paramView)
  {
    super.zza("1002", paramView);
  }
  
  public final void setCallToActionView(View paramView)
  {
    super.zza("1003", paramView);
  }
  
  public final void setHeadlineView(View paramView)
  {
    super.zza("1001", paramView);
  }
  
  public final void setImageView(View paramView)
  {
    super.zza("1005", paramView);
  }
  
  public final void setLogoView(View paramView)
  {
    super.zza("1006", paramView);
  }
}
