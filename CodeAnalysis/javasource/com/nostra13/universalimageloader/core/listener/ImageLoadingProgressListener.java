package com.nostra13.universalimageloader.core.listener;

import android.view.View;

public abstract interface ImageLoadingProgressListener
{
  public abstract void onProgressUpdate(String paramString, View paramView, int paramInt1, int paramInt2);
}
