package com.nostra13.universalimageloader.core.display;

import android.graphics.Bitmap;
import com.nostra13.universalimageloader.core.assist.LoadedFrom;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;

public final class SimpleBitmapDisplayer
  implements BitmapDisplayer
{
  public SimpleBitmapDisplayer() {}
  
  public void display(Bitmap paramBitmap, ImageAware paramImageAware, LoadedFrom paramLoadedFrom)
  {
    paramImageAware.setImageBitmap(paramBitmap);
  }
}
