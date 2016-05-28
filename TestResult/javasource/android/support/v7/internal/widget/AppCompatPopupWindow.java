package android.support.v7.internal.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build.VERSION;
import android.support.v7.appcompat.R.styleable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewTreeObserver.OnScrollChangedListener;
import android.widget.PopupWindow;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;

public class AppCompatPopupWindow
  extends PopupWindow
{
  private final boolean mOverlapAnchor;
  
  public AppCompatPopupWindow(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    paramContext = TintTypedArray.obtainStyledAttributes(paramContext, paramAttributeSet, R.styleable.PopupWindow, paramInt, 0);
    mOverlapAnchor = paramContext.getBoolean(R.styleable.PopupWindow_overlapAnchor, false);
    setBackgroundDrawable(paramContext.getDrawable(R.styleable.PopupWindow_android_popupBackground));
    paramContext.recycle();
    if (Build.VERSION.SDK_INT < 14) {
      wrapOnScrollChangedListener(this);
    }
  }
  
  private static void wrapOnScrollChangedListener(final PopupWindow paramPopupWindow)
  {
    try
    {
      Field localField1 = PopupWindow.class.getDeclaredField("mAnchor");
      localField1.setAccessible(true);
      Field localField2 = PopupWindow.class.getDeclaredField("mOnScrollChangedListener");
      localField2.setAccessible(true);
      localField2.set(paramPopupWindow, new ViewTreeObserver.OnScrollChangedListener()
      {
        public void onScrollChanged()
        {
          try
          {
            WeakReference localWeakReference = (WeakReference)val$fieldAnchor.get(paramPopupWindow);
            if (localWeakReference != null)
            {
              if (localWeakReference.get() == null) {
                return;
              }
              val$originalListener.onScrollChanged();
              return;
            }
          }
          catch (IllegalAccessException localIllegalAccessException) {}
        }
      });
      return;
    }
    catch (Exception paramPopupWindow)
    {
      Log.d("AppCompatPopupWindow", "Exception while installing workaround OnScrollChangedListener", paramPopupWindow);
    }
  }
  
  public void showAsDropDown(View paramView, int paramInt1, int paramInt2)
  {
    int i = paramInt2;
    if (Build.VERSION.SDK_INT < 21)
    {
      i = paramInt2;
      if (mOverlapAnchor) {
        i = paramInt2 - paramView.getHeight();
      }
    }
    super.showAsDropDown(paramView, paramInt1, i);
  }
  
  @TargetApi(19)
  public void showAsDropDown(View paramView, int paramInt1, int paramInt2, int paramInt3)
  {
    int i = paramInt2;
    if (Build.VERSION.SDK_INT < 21)
    {
      i = paramInt2;
      if (mOverlapAnchor) {
        i = paramInt2 - paramView.getHeight();
      }
    }
    super.showAsDropDown(paramView, paramInt1, i, paramInt3);
  }
  
  public void update(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int i = paramInt2;
    if (Build.VERSION.SDK_INT < 21)
    {
      i = paramInt2;
      if (mOverlapAnchor) {
        i = paramInt2 - paramView.getHeight();
      }
    }
    super.update(paramView, paramInt1, i, paramInt3, paramInt4);
  }
}
