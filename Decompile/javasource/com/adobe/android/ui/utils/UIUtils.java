package com.adobe.android.ui.utils;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build.VERSION;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.SeekBar;
import com.adobe.android.ui.R.attr;

public final class UIUtils
{
  public static final boolean AT_LEAST_16;
  public static final boolean AT_LEAST_21;
  
  static
  {
    boolean bool2 = true;
    if (Build.VERSION.SDK_INT >= 21)
    {
      bool1 = true;
      AT_LEAST_21 = bool1;
      if (Build.VERSION.SDK_INT < 16) {
        break label36;
      }
    }
    label36:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      AT_LEAST_16 = bool1;
      return;
      bool1 = false;
      break;
    }
  }
  
  public static boolean checkBits(int paramInt1, int paramInt2)
  {
    return (paramInt1 & paramInt2) == paramInt2;
  }
  
  @TargetApi(21)
  public static boolean clearDrawableTint(Drawable paramDrawable)
  {
    if (AT_LEAST_21) {
      paramDrawable.setTintList(null);
    }
    for (;;)
    {
      return true;
      paramDrawable.clearColorFilter();
    }
  }
  
  public static int getActionBarHeight(Context paramContext)
  {
    int i = R.attr.actionBarSize;
    paramContext = paramContext.getTheme().obtainStyledAttributes(new int[] { i });
    i = (int)paramContext.getDimension(0, 0.0F);
    paramContext.recycle();
    return i;
  }
  
  public static int getStatusBarHeight(Context paramContext)
  {
    int i = 0;
    int j = paramContext.getResources().getIdentifier("status_bar_height", "dimen", "android");
    if (j > 0) {
      i = paramContext.getResources().getDimensionPixelSize(j);
    }
    return i;
  }
  
  public static int getThemeColor(Context paramContext, int paramInt)
  {
    paramContext = paramContext.getTheme().obtainStyledAttributes(new int[] { paramInt });
    paramInt = paramContext.getColor(0, 0);
    paramContext.recycle();
    return paramInt;
  }
  
  @TargetApi(21)
  public static boolean setDrawableTint(Drawable paramDrawable, int paramInt)
  {
    if (AT_LEAST_21)
    {
      paramDrawable.setTint(paramInt);
      return true;
    }
    paramDrawable.setColorFilter(new PorterDuffColorFilter(paramInt, PorterDuff.Mode.SRC_ATOP));
    return true;
  }
  
  @TargetApi(21)
  public static boolean setIndeterminateProgressBarTint(ProgressBar paramProgressBar, int paramInt)
  {
    if (AT_LEAST_21) {
      paramProgressBar.setIndeterminateTintList(ColorStateList.valueOf(paramInt));
    }
    for (;;)
    {
      return true;
      paramProgressBar.getIndeterminateDrawable().setColorFilter(new PorterDuffColorFilter(paramInt, PorterDuff.Mode.SRC_ATOP));
    }
  }
  
  public static boolean setLayerDrawableTint(LayerDrawable paramLayerDrawable, int paramInt1, int paramInt2)
  {
    paramLayerDrawable = paramLayerDrawable.findDrawableByLayerId(paramInt1);
    if (paramLayerDrawable != null) {
      return setDrawableTint(paramLayerDrawable, paramInt2);
    }
    return false;
  }
  
  @TargetApi(21)
  public static boolean setSeekBarProgressTint(SeekBar paramSeekBar, int paramInt)
  {
    if (!AT_LEAST_16) {}
    Object localObject;
    do
    {
      do
      {
        do
        {
          return false;
          localObject = paramSeekBar.getProgressDrawable();
          if (!(localObject instanceof StateListDrawable)) {
            break;
          }
          localObject = (StateListDrawable)localObject;
          ((StateListDrawable)localObject).setState(new int[] { 16842910 });
          localObject = ((StateListDrawable)localObject).getCurrent();
        } while ((!(localObject instanceof LayerDrawable)) || (!setLayerDrawableTint((LayerDrawable)localObject, 16908301, paramInt)));
        return setSeekBarThumbTint(paramSeekBar, paramInt);
        if (!(localObject instanceof BitmapDrawable)) {
          break;
        }
      } while (!setDrawableTint((Drawable)localObject, paramInt));
      return setSeekBarThumbTint(paramSeekBar, paramInt);
    } while ((!(localObject instanceof LayerDrawable)) || (!setLayerDrawableTint((LayerDrawable)localObject, 16908301, paramInt)));
    return setSeekBarThumbTint(paramSeekBar, paramInt);
  }
  
  @TargetApi(21)
  public static boolean setSeekBarThumbTint(SeekBar paramSeekBar, int paramInt)
  {
    if (AT_LEAST_21) {
      paramSeekBar.setThumbTintList(ColorStateList.valueOf(paramInt));
    }
    for (;;)
    {
      return false;
      if (AT_LEAST_16) {
        paramSeekBar.getThumb().setColorFilter(paramInt, PorterDuff.Mode.SRC_ATOP);
      }
    }
  }
  
  @TargetApi(21)
  public static boolean setViewBackgroundTint(View paramView, int paramInt)
  {
    if (AT_LEAST_21)
    {
      paramView.setBackgroundTintList(ColorStateList.valueOf(paramInt));
      return true;
    }
    paramView = paramView.getBackground();
    if (paramView != null) {
      return setDrawableTint(paramView, paramInt);
    }
    return false;
  }
}
