package com.behance.sdk.ui.animations;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.TransitionDrawable;
import com.nostra13.universalimageloader.core.assist.LoadedFrom;
import com.nostra13.universalimageloader.core.display.BitmapDisplayer;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;

public class BehanceSDKCustomFadeInBitmapDisplayer
  implements BitmapDisplayer
{
  private final boolean animateFromDisk;
  private final boolean animateFromMemory;
  private final boolean animateFromNetwork;
  private final int durationMillis;
  
  public BehanceSDKCustomFadeInBitmapDisplayer(int paramInt, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    durationMillis = paramInt;
    animateFromNetwork = paramBoolean1;
    animateFromDisk = paramBoolean2;
    animateFromMemory = paramBoolean3;
  }
  
  public void display(Bitmap paramBitmap, ImageAware paramImageAware, LoadedFrom paramLoadedFrom)
  {
    if (((animateFromNetwork) && (paramLoadedFrom == LoadedFrom.NETWORK)) || ((animateFromDisk) && (paramLoadedFrom == LoadedFrom.DISC_CACHE)) || ((animateFromMemory) && (paramLoadedFrom == LoadedFrom.MEMORY_CACHE)))
    {
      paramBitmap = new TransitionDrawable(new Drawable[] { new ColorDrawable(15790320), new BitmapDrawable(null, paramBitmap) });
      paramBitmap.setCrossFadeEnabled(true);
      paramImageAware.setImageDrawable(paramBitmap);
      paramBitmap.startTransition(durationMillis);
      return;
    }
    paramImageAware.setImageBitmap(paramBitmap);
  }
}
