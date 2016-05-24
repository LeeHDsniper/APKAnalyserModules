package com.google.android.gms.ads.doubleclick;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.internal.client.zzy;

public final class PublisherAdView
  extends ViewGroup
{
  private final zzy zznS;
  
  public PublisherAdView(Context paramContext)
  {
    super(paramContext);
    zznS = new zzy(this);
  }
  
  public PublisherAdView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    zznS = new zzy(this, paramAttributeSet, true);
  }
  
  public PublisherAdView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    zznS = new zzy(this, paramAttributeSet, true);
  }
  
  public void destroy()
  {
    zznS.destroy();
  }
  
  public AdListener getAdListener()
  {
    return zznS.getAdListener();
  }
  
  public AdSize getAdSize()
  {
    return zznS.getAdSize();
  }
  
  public AdSize[] getAdSizes()
  {
    return zznS.getAdSizes();
  }
  
  public String getAdUnitId()
  {
    return zznS.getAdUnitId();
  }
  
  public AppEventListener getAppEventListener()
  {
    return zznS.getAppEventListener();
  }
  
  public String getMediationAdapterClassName()
  {
    return zznS.getMediationAdapterClassName();
  }
  
  public OnCustomRenderedAdLoadedListener getOnCustomRenderedAdLoadedListener()
  {
    return zznS.getOnCustomRenderedAdLoadedListener();
  }
  
  public void loadAd(PublisherAdRequest paramPublisherAdRequest)
  {
    zznS.zza(paramPublisherAdRequest.zzaF());
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    View localView = getChildAt(0);
    if ((localView != null) && (localView.getVisibility() != 8))
    {
      int i = localView.getMeasuredWidth();
      int j = localView.getMeasuredHeight();
      paramInt1 = (paramInt3 - paramInt1 - i) / 2;
      paramInt2 = (paramInt4 - paramInt2 - j) / 2;
      localView.layout(paramInt1, paramInt2, i + paramInt1, j + paramInt2);
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i = 0;
    Object localObject = getChildAt(0);
    int j;
    if ((localObject != null) && (((View)localObject).getVisibility() != 8))
    {
      measureChild((View)localObject, paramInt1, paramInt2);
      j = ((View)localObject).getMeasuredWidth();
      i = ((View)localObject).getMeasuredHeight();
    }
    for (;;)
    {
      j = Math.max(j, getSuggestedMinimumWidth());
      i = Math.max(i, getSuggestedMinimumHeight());
      setMeasuredDimension(View.resolveSize(j, paramInt1), View.resolveSize(i, paramInt2));
      return;
      localObject = getAdSize();
      if (localObject != null)
      {
        Context localContext = getContext();
        j = ((AdSize)localObject).getWidthInPixels(localContext);
        i = ((AdSize)localObject).getHeightInPixels(localContext);
      }
      else
      {
        j = 0;
      }
    }
  }
  
  public void pause()
  {
    zznS.pause();
  }
  
  public void recordManualImpression()
  {
    zznS.recordManualImpression();
  }
  
  public void resume()
  {
    zznS.resume();
  }
  
  public void setAdListener(AdListener paramAdListener)
  {
    zznS.setAdListener(paramAdListener);
  }
  
  public void setAdSizes(AdSize... paramVarArgs)
  {
    if ((paramVarArgs == null) || (paramVarArgs.length < 1)) {
      throw new IllegalArgumentException("The supported ad sizes must contain at least one valid ad size.");
    }
    zznS.zza(paramVarArgs);
  }
  
  public void setAdUnitId(String paramString)
  {
    zznS.setAdUnitId(paramString);
  }
  
  public void setAppEventListener(AppEventListener paramAppEventListener)
  {
    zznS.setAppEventListener(paramAppEventListener);
  }
  
  public void setManualImpressionsEnabled(boolean paramBoolean)
  {
    zznS.setManualImpressionsEnabled(paramBoolean);
  }
  
  public void setOnCustomRenderedAdLoadedListener(OnCustomRenderedAdLoadedListener paramOnCustomRenderedAdLoadedListener)
  {
    zznS.setOnCustomRenderedAdLoadedListener(paramOnCustomRenderedAdLoadedListener);
  }
}
