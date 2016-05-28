package com.nostra13.universalimageloader.core.imageaware;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;
import com.nostra13.universalimageloader.utils.L;
import java.lang.ref.Reference;
import java.lang.ref.WeakReference;

public abstract class ViewAware
  implements ImageAware
{
  protected boolean checkActualViewSize;
  protected Reference<View> viewRef;
  
  public ViewAware(View paramView)
  {
    this(paramView, true);
  }
  
  public ViewAware(View paramView, boolean paramBoolean)
  {
    if (paramView == null) {
      throw new IllegalArgumentException("view must not be null");
    }
    viewRef = new WeakReference(paramView);
    checkActualViewSize = paramBoolean;
  }
  
  public int getHeight()
  {
    View localView = (View)viewRef.get();
    if (localView != null)
    {
      ViewGroup.LayoutParams localLayoutParams = localView.getLayoutParams();
      int j = 0;
      int i = j;
      if (checkActualViewSize)
      {
        i = j;
        if (localLayoutParams != null)
        {
          i = j;
          if (height != -2) {
            i = localView.getHeight();
          }
        }
      }
      j = i;
      if (i <= 0)
      {
        j = i;
        if (localLayoutParams != null) {
          j = height;
        }
      }
      return j;
    }
    return 0;
  }
  
  public int getId()
  {
    View localView = (View)viewRef.get();
    if (localView == null) {
      return super.hashCode();
    }
    return localView.hashCode();
  }
  
  public ViewScaleType getScaleType()
  {
    return ViewScaleType.CROP;
  }
  
  public int getWidth()
  {
    View localView = (View)viewRef.get();
    if (localView != null)
    {
      ViewGroup.LayoutParams localLayoutParams = localView.getLayoutParams();
      int j = 0;
      int i = j;
      if (checkActualViewSize)
      {
        i = j;
        if (localLayoutParams != null)
        {
          i = j;
          if (width != -2) {
            i = localView.getWidth();
          }
        }
      }
      j = i;
      if (i <= 0)
      {
        j = i;
        if (localLayoutParams != null) {
          j = width;
        }
      }
      return j;
    }
    return 0;
  }
  
  public View getWrappedView()
  {
    return (View)viewRef.get();
  }
  
  public boolean isCollected()
  {
    return viewRef.get() == null;
  }
  
  public boolean setImageBitmap(Bitmap paramBitmap)
  {
    boolean bool = false;
    if (Looper.myLooper() == Looper.getMainLooper())
    {
      View localView = (View)viewRef.get();
      if (localView != null)
      {
        setImageBitmapInto(paramBitmap, localView);
        bool = true;
      }
      return bool;
    }
    L.w("Can't set a bitmap into view. You should call ImageLoader on UI thread for it.", new Object[0]);
    return false;
  }
  
  protected abstract void setImageBitmapInto(Bitmap paramBitmap, View paramView);
  
  public boolean setImageDrawable(Drawable paramDrawable)
  {
    boolean bool = false;
    if (Looper.myLooper() == Looper.getMainLooper())
    {
      View localView = (View)viewRef.get();
      if (localView != null)
      {
        setImageDrawableInto(paramDrawable, localView);
        bool = true;
      }
      return bool;
    }
    L.w("Can't set a drawable into view. You should call ImageLoader on UI thread for it.", new Object[0]);
    return false;
  }
  
  protected abstract void setImageDrawableInto(Drawable paramDrawable, View paramView);
}
