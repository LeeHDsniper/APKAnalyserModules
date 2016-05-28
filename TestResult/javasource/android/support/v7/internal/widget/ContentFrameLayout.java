package android.support.v7.internal.widget;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View.MeasureSpec;
import android.widget.FrameLayout;

public class ContentFrameLayout
  extends FrameLayout
{
  private final Rect mDecorPadding = new Rect();
  private TypedValue mFixedHeightMajor;
  private TypedValue mFixedHeightMinor;
  private TypedValue mFixedWidthMajor;
  private TypedValue mFixedWidthMinor;
  private TypedValue mMinWidthMajor;
  private TypedValue mMinWidthMinor;
  
  public ContentFrameLayout(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public ContentFrameLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public ContentFrameLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  public void dispatchFitSystemWindows(Rect paramRect)
  {
    fitSystemWindows(paramRect);
  }
  
  public TypedValue getFixedHeightMajor()
  {
    if (mFixedHeightMajor == null) {
      mFixedHeightMajor = new TypedValue();
    }
    return mFixedHeightMajor;
  }
  
  public TypedValue getFixedHeightMinor()
  {
    if (mFixedHeightMinor == null) {
      mFixedHeightMinor = new TypedValue();
    }
    return mFixedHeightMinor;
  }
  
  public TypedValue getFixedWidthMajor()
  {
    if (mFixedWidthMajor == null) {
      mFixedWidthMajor = new TypedValue();
    }
    return mFixedWidthMajor;
  }
  
  public TypedValue getFixedWidthMinor()
  {
    if (mFixedWidthMinor == null) {
      mFixedWidthMinor = new TypedValue();
    }
    return mFixedWidthMinor;
  }
  
  public TypedValue getMinWidthMajor()
  {
    if (mMinWidthMajor == null) {
      mMinWidthMajor = new TypedValue();
    }
    return mMinWidthMajor;
  }
  
  public TypedValue getMinWidthMinor()
  {
    if (mMinWidthMinor == null) {
      mMinWidthMinor = new TypedValue();
    }
    return mMinWidthMinor;
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    DisplayMetrics localDisplayMetrics = getContext().getResources().getDisplayMetrics();
    int j;
    int i2;
    int n;
    int m;
    TypedValue localTypedValue;
    label68:
    int i;
    if (widthPixels < heightPixels)
    {
      j = 1;
      int i1 = View.MeasureSpec.getMode(paramInt1);
      i2 = View.MeasureSpec.getMode(paramInt2);
      n = 0;
      int k = n;
      m = paramInt1;
      if (i1 == Integer.MIN_VALUE)
      {
        if (j == 0) {
          break label424;
        }
        localTypedValue = mFixedWidthMinor;
        k = n;
        m = paramInt1;
        if (localTypedValue != null)
        {
          k = n;
          m = paramInt1;
          if (type != 0)
          {
            i = 0;
            if (type != 5) {
              break label433;
            }
            i = (int)localTypedValue.getDimension(localDisplayMetrics);
            label115:
            k = n;
            m = paramInt1;
            if (i > 0)
            {
              m = View.MeasureSpec.makeMeasureSpec(Math.min(i - (mDecorPadding.left + mDecorPadding.right), View.MeasureSpec.getSize(paramInt1)), 1073741824);
              k = 1;
            }
          }
        }
      }
      i = paramInt2;
      if (i2 == Integer.MIN_VALUE)
      {
        if (j == 0) {
          break label465;
        }
        localTypedValue = mFixedHeightMajor;
        label180:
        i = paramInt2;
        if (localTypedValue != null)
        {
          i = paramInt2;
          if (type != 0)
          {
            paramInt1 = 0;
            if (type != 5) {
              break label474;
            }
            paramInt1 = (int)localTypedValue.getDimension(localDisplayMetrics);
            label217:
            i = paramInt2;
            if (paramInt1 > 0) {
              i = View.MeasureSpec.makeMeasureSpec(Math.min(paramInt1 - (mDecorPadding.top + mDecorPadding.bottom), View.MeasureSpec.getSize(paramInt2)), 1073741824);
            }
          }
        }
      }
      super.onMeasure(m, i);
      i2 = getMeasuredWidth();
      m = 0;
      n = View.MeasureSpec.makeMeasureSpec(i2, 1073741824);
      paramInt2 = m;
      paramInt1 = n;
      if (k == 0)
      {
        paramInt2 = m;
        paramInt1 = n;
        if (i1 == Integer.MIN_VALUE)
        {
          if (j == 0) {
            break label506;
          }
          localTypedValue = mMinWidthMinor;
          label313:
          paramInt2 = m;
          paramInt1 = n;
          if (localTypedValue != null)
          {
            paramInt2 = m;
            paramInt1 = n;
            if (type != 0)
            {
              paramInt1 = 0;
              if (type != 5) {
                break label515;
              }
              paramInt1 = (int)localTypedValue.getDimension(localDisplayMetrics);
            }
          }
        }
      }
    }
    for (;;)
    {
      j = paramInt1;
      if (paramInt1 > 0) {
        j = paramInt1 - (mDecorPadding.left + mDecorPadding.right);
      }
      paramInt2 = m;
      paramInt1 = n;
      if (i2 < j)
      {
        paramInt1 = View.MeasureSpec.makeMeasureSpec(j, 1073741824);
        paramInt2 = 1;
      }
      if (paramInt2 != 0) {
        super.onMeasure(paramInt1, i);
      }
      return;
      j = 0;
      break;
      label424:
      localTypedValue = mFixedWidthMajor;
      break label68;
      label433:
      if (type != 6) {
        break label115;
      }
      i = (int)localTypedValue.getFraction(widthPixels, widthPixels);
      break label115;
      label465:
      localTypedValue = mFixedHeightMinor;
      break label180;
      label474:
      if (type != 6) {
        break label217;
      }
      paramInt1 = (int)localTypedValue.getFraction(heightPixels, heightPixels);
      break label217;
      label506:
      localTypedValue = mMinWidthMajor;
      break label313;
      label515:
      if (type == 6) {
        paramInt1 = (int)localTypedValue.getFraction(widthPixels, widthPixels);
      }
    }
  }
  
  public void setDecorPadding(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    mDecorPadding.set(paramInt1, paramInt2, paramInt3, paramInt4);
    if (ViewCompat.isLaidOut(this)) {
      requestLayout();
    }
  }
}
