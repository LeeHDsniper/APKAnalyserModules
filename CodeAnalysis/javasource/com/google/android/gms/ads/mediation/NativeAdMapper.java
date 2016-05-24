package com.google.android.gms.ads.mediation;

import android.os.Bundle;
import android.view.View;

public abstract class NativeAdMapper
{
  protected Bundle mExtras = new Bundle();
  protected boolean mOverrideClickHandling;
  protected boolean mOverrideImpressionRecording;
  
  public NativeAdMapper() {}
  
  public final Bundle getExtras()
  {
    return mExtras;
  }
  
  public final boolean getOverrideClickHandling()
  {
    return mOverrideClickHandling;
  }
  
  public final boolean getOverrideImpressionRecording()
  {
    return mOverrideImpressionRecording;
  }
  
  public void handleClick(View paramView) {}
  
  public void recordImpression() {}
  
  public final void setExtras(Bundle paramBundle)
  {
    mExtras = paramBundle;
  }
  
  public final void setOverrideClickHandling(boolean paramBoolean)
  {
    mOverrideClickHandling = paramBoolean;
  }
  
  public final void setOverrideImpressionRecording(boolean paramBoolean)
  {
    mOverrideImpressionRecording = paramBoolean;
  }
  
  public void trackView(View paramView) {}
}
