package android.support.design.widget;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

class ViewGroupUtilsHoneycomb
{
  private static final Matrix IDENTITY = new Matrix();
  private static final ThreadLocal<Matrix> sMatrix = new ThreadLocal();
  private static final ThreadLocal<RectF> sRectF = new ThreadLocal();
  
  static void offsetDescendantMatrix(ViewParent paramViewParent, View paramView, Matrix paramMatrix)
  {
    Object localObject = paramView.getParent();
    if (((localObject instanceof View)) && (localObject != paramViewParent))
    {
      localObject = (View)localObject;
      offsetDescendantMatrix(paramViewParent, (View)localObject, paramMatrix);
      paramMatrix.preTranslate(-((View)localObject).getScrollX(), -((View)localObject).getScrollY());
    }
    paramMatrix.preTranslate(paramView.getLeft(), paramView.getTop());
    if (!paramView.getMatrix().isIdentity()) {
      paramMatrix.preConcat(paramView.getMatrix());
    }
  }
  
  public static void offsetDescendantRect(ViewGroup paramViewGroup, View paramView, Rect paramRect)
  {
    Matrix localMatrix = (Matrix)sMatrix.get();
    if (localMatrix == null)
    {
      localMatrix = new Matrix();
      sMatrix.set(localMatrix);
    }
    for (;;)
    {
      offsetDescendantMatrix(paramViewGroup, paramView, localMatrix);
      paramView = (RectF)sRectF.get();
      paramViewGroup = paramView;
      if (paramView == null) {
        paramViewGroup = new RectF();
      }
      paramViewGroup.set(paramRect);
      localMatrix.mapRect(paramViewGroup);
      paramRect.set((int)(left + 0.5F), (int)(top + 0.5F), (int)(right + 0.5F), (int)(bottom + 0.5F));
      return;
      localMatrix.set(IDENTITY);
    }
  }
}
