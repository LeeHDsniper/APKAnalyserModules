package com.tencent.common.galleryactivity;

import android.graphics.Point;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.widget.Gallery;

public class AnimationUtils
{
  private static final float a = 1.5F;
  
  public AnimationUtils()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static float a(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    float f2 = 1.0F;
    float f1;
    if ((paramInt1 >= paramInt3) && (paramInt2 >= paramInt4 * paramInt1 / paramInt3)) {
      f1 = paramInt3 / paramInt1;
    }
    do
    {
      do
      {
        do
        {
          do
          {
            return f1;
            if (paramInt1 >= paramInt3) {
              break;
            }
            f1 = f2;
          } while (paramInt2 >= paramInt4);
          if ((paramInt1 >= paramInt3) && (paramInt2 < paramInt4 * paramInt1 / paramInt3)) {
            return paramInt3 / paramInt1;
          }
          if ((paramInt1 > paramInt3) || (paramInt2 > paramInt4)) {
            return Math.min(paramInt4 / paramInt2, paramInt3 / paramInt1);
          }
          f1 = f2;
        } while (paramInt1 >= paramInt3);
        f1 = f2;
      } while (paramInt1 <= paramInt3 / 2);
      f1 = f2;
    } while (paramInt4 <= paramInt3 / paramInt1 * paramInt2);
    return paramInt3 / paramInt1;
  }
  
  public static Rect a(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    return a(paramInt1, paramInt2, paramInt3, paramInt4, true);
  }
  
  public static Rect a(int paramInt1, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean)
  {
    float f = Gallery.a(paramInt1, paramInt2, paramInt3, paramInt4);
    int i;
    label65:
    label77:
    Rect localRect;
    if (paramInt2 >= paramInt1 * 3)
    {
      i = 1;
      if ((i == 0) || ((paramInt1 <= paramInt3) && (paramInt2 <= paramInt4)) || ((paramInt1 < URLDrawableHelper.f) && (paramInt2 < URLDrawableHelper.f))) {
        break label117;
      }
      f = Math.min(paramInt3 / paramInt1, Gallery.b);
      i = 49;
      if ((paramBoolean) || (f <= 1.0F)) {
        break label124;
      }
      localRect = new Rect(0, 0, paramInt1, paramInt2);
      if (i != 49) {
        break label141;
      }
      localRect.offset((paramInt3 - paramInt1) / 2, 0);
    }
    label117:
    label124:
    label141:
    while (i != 17)
    {
      return localRect;
      i = 0;
      break;
      i = 17;
      break label65;
      paramInt1 = (int)(paramInt1 * f);
      paramInt2 = (int)(f * paramInt2);
      break label77;
    }
    localRect.offset((paramInt3 - paramInt1) / 2, (paramInt4 - paramInt2) / 2);
    return localRect;
  }
  
  public static Rect a(View paramView)
  {
    Rect localRect = new Rect(paramView.getPaddingLeft(), paramView.getPaddingTop(), paramView.getWidth() - paramView.getPaddingRight(), paramView.getHeight() - paramView.getPaddingBottom());
    a(paramView, localRect);
    return localRect;
  }
  
  public static boolean a(View paramView, Rect paramRect)
  {
    int i = paramView.getWidth();
    int j = paramView.getHeight();
    ViewGroup localViewGroup = (ViewGroup)paramView.getParent();
    Point localPoint = new Point();
    if ((i > 0) && (j > 0))
    {
      Rect localRect = paramRect;
      if (paramRect == null)
      {
        localRect = new Rect();
        localRect.set(0, 0, i, j);
      }
      if (localPoint != null) {
        localPoint.set(-paramView.getScrollX(), -paramView.getScrollY());
      }
      localRect.offset((i - localRect.width()) / 2, (j - localRect.height()) / 2);
      return (localViewGroup == null) || (localViewGroup.getChildVisibleRect(paramView, localRect, localPoint));
    }
    return false;
  }
}
