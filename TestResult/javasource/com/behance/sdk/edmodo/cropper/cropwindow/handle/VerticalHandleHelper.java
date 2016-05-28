package com.behance.sdk.edmodo.cropper.cropwindow.handle;

import android.graphics.Rect;
import com.behance.sdk.edmodo.cropper.cropwindow.edge.Edge;
import com.behance.sdk.edmodo.cropper.util.AspectRatioUtil;

class VerticalHandleHelper
  extends HandleHelper
{
  private Edge mEdge;
  
  VerticalHandleHelper(Edge paramEdge)
  {
    super(null, paramEdge);
    mEdge = paramEdge;
  }
  
  void updateCropWindow(float paramFloat1, float paramFloat2, float paramFloat3, Rect paramRect, float paramFloat4)
  {
    mEdge.adjustCoordinate(paramFloat1, paramFloat2, paramRect, paramFloat4, paramFloat3);
    float f1 = Edge.LEFT.getCoordinate();
    paramFloat1 = Edge.TOP.getCoordinate();
    float f2 = Edge.RIGHT.getCoordinate();
    paramFloat2 = Edge.BOTTOM.getCoordinate();
    f1 = (AspectRatioUtil.calculateHeight(f1, f2, paramFloat3) - (paramFloat2 - paramFloat1)) / 2.0F;
    Edge.TOP.setCoordinate(paramFloat1 - f1);
    Edge.BOTTOM.setCoordinate(paramFloat2 + f1);
    if ((Edge.TOP.isOutsideMargin(paramRect, paramFloat4)) && (!mEdge.isNewRectangleOutOfBounds(Edge.TOP, paramRect, paramFloat3)))
    {
      paramFloat1 = Edge.TOP.snapToRect(paramRect);
      Edge.BOTTOM.offset(-paramFloat1);
      mEdge.adjustCoordinate(paramFloat3);
    }
    if ((Edge.BOTTOM.isOutsideMargin(paramRect, paramFloat4)) && (!mEdge.isNewRectangleOutOfBounds(Edge.BOTTOM, paramRect, paramFloat3)))
    {
      paramFloat1 = Edge.BOTTOM.snapToRect(paramRect);
      Edge.TOP.offset(-paramFloat1);
      mEdge.adjustCoordinate(paramFloat3);
    }
  }
}
