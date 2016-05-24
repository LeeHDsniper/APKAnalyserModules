package com.nostra13.universalimageloader.core.listener;

import android.graphics.Bitmap;
import android.view.View;
import com.nostra13.universalimageloader.core.assist.FailReason;

public class SimpleImageLoadingListener
  implements ImageLoadingListener
{
  public SimpleImageLoadingListener() {}
  
  public void onLoadingCancelled(String paramString, View paramView) {}
  
  public void onLoadingComplete(String paramString, View paramView, Bitmap paramBitmap) {}
  
  public void onLoadingFailed(String paramString, View paramView, FailReason paramFailReason) {}
  
  public void onLoadingStarted(String paramString, View paramView) {}
}
