package com.behance.sdk.asynctask.params;

import android.content.Context;
import java.lang.ref.WeakReference;

public class BehanceSDKGetAlbumsTaskParams
{
  private WeakReference<Context> contextWeakReference;
  private boolean showImageSelectionSources;
  
  public BehanceSDKGetAlbumsTaskParams() {}
  
  public WeakReference<Context> getContextWeakReference()
  {
    return contextWeakReference;
  }
  
  public boolean isShowImageSelectionSources()
  {
    return showImageSelectionSources;
  }
  
  public void setContextWeakReference(WeakReference<Context> paramWeakReference)
  {
    contextWeakReference = paramWeakReference;
  }
  
  public void setShowImageSelectionSources(boolean paramBoolean)
  {
    showImageSelectionSources = paramBoolean;
  }
}
