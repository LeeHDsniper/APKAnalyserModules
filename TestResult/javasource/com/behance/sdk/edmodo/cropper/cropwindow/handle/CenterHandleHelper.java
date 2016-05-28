package com.behance.sdk.edmodo.cropper.cropwindow.handle;

import android.graphics.Rect;
import com.behance.sdk.edmodo.cropper.cropwindow.edge.Edge;

class CenterHandleHelper
  extends HandleHelper
{
  CenterHandleHelper()
  {
    super(null, null);
  }
  
  void updateCropWindow(float paramFloat1, float paramFloat2, float paramFloat3, Rect paramRect, float paramFloat4)
  {
    updateCropWindow(paramFloat1, paramFloat2, paramRect, paramFloat4);
  }
  
  void updateCropWindow(float paramFloat1, float paramFloat2, Rect paramRect, float paramFloat3)
  {
    float f3 = Edge.LEFT.getCoordinate();
    float f1 = Edge.TOP.getCoordinate();
    float f4 = Edge.RIGHT.getCoordinate();
    float f2 = Edge.BOTTOM.getCoordinate();
    f3 = (f3 + f4) / 2.0F;
    f1 = (f1 + f2) / 2.0F;
    paramFloat1 -= f3;
    paramFloat2 -= f1;
    Edge.LEFT.offset(paramFloat1);
    Edge.TOP.offset(paramFloat2);
    Edge.RIGHT.offset(paramFloat1);
    Edge.BOTTOM.offset(paramFloat2);
    if (Edge.LEFT.isOutsideMargin(paramRect, paramFloat3))
    {
      paramFloat1 = Edge.LEFT.snapToRect(paramRect);
      Edge.RIGHT.offset(paramFloat1);
    }
    do
    {
      while (Edge.TOP.isOutsideMargin(paramRect, paramFloat3))
      {
        paramFloat1 = Edge.TOP.snapToRect(paramRect);
        Edge.BOTTOM.offset(paramFloat1);
        return;
        if (Edge.RIGHT.isOutsideMargin(paramRect, paramFloat3))
        {
          paramFloat1 = Edge.RIGHT.snapToRect(paramRect);
          Edge.LEFT.offset(paramFloat1);
        }
      }
    } while (!Edge.BOTTOM.isOutsideMargin(paramRect, paramFloat3));
    paramFloat1 = Edge.BOTTOM.snapToRect(paramRect);
    Edge.TOP.offset(paramFloat1);
  }
}
