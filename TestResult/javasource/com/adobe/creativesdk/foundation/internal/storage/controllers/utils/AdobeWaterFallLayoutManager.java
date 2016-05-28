package com.adobe.creativesdk.foundation.internal.storage.controllers.utils;

import org.lucasr.twowayview.TwoWayLayoutManager.Orientation;
import org.lucasr.twowayview.widget.StaggeredGridLayoutManager;
import org.lucasr.twowayview.widget.StaggeredGridLayoutManager.LayoutParams;

public class AdobeWaterFallLayoutManager
  extends StaggeredGridLayoutManager
{
  private SectionDetailsDelegate _clientSectionsDelegate;
  private int _singleSpanSize = -1;
  
  public AdobeWaterFallLayoutManager(int paramInt)
  {
    super(TwoWayLayoutManager.Orientation.VERTICAL, paramInt, 1);
  }
  
  private int getSpanForSectionItem(int paramInt, boolean paramBoolean)
  {
    int i = _clientSectionsDelegate.getGCMOfSpans();
    if (paramBoolean) {
      return i;
    }
    getNumColumns();
    return i / _clientSectionsDelegate.getNumColumnsInSection(paramInt);
  }
  
  public StaggeredGridLayoutManager.LayoutParams getLayoutParamsForItem(StaggeredGridLayoutManager.LayoutParams paramLayoutParams, int paramInt, boolean paramBoolean)
  {
    paramLayoutParams = new StaggeredGridLayoutManager.LayoutParams(paramLayoutParams);
    span = getSpanForSectionItem(paramInt, paramBoolean);
    return paramLayoutParams;
  }
  
  public void setClientSectionsDelegate(SectionDetailsDelegate paramSectionDetailsDelegate)
  {
    _clientSectionsDelegate = paramSectionDetailsDelegate;
  }
  
  public static abstract interface SectionDetailsDelegate
  {
    public abstract int getGCMOfSpans();
    
    public abstract int getNumColumnsInSection(int paramInt);
  }
}
