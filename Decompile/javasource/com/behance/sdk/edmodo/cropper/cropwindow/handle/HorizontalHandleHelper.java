package com.behance.sdk.edmodo.cropper.cropwindow.handle;

import android.graphics.Rect;
import com.behance.sdk.edmodo.cropper.cropwindow.edge.Edge;
import com.behance.sdk.edmodo.cropper.util.AspectRatioUtil;

class HorizontalHandleHelper
  extends HandleHelper
{
  private Edge mEdge;
  
  HorizontalHandleHelper(Edge paramEdge)
  {
    super(paramEdge, null);
    mEdge = paramEdge;
  }
  
  void updateCropWindow(float paramFloat1, float paramFloat2, float paramFloat3, Rect paramRect, float paramFloat4)
  {
    mEdge.adjustCoordinate(paramFloat1, paramFloat2, paramRect, paramFloat4, paramFloat3);
    paramFloat1 = Edge.LEFT.getCoordinate();
    float f = Edge.TOP.getCoordinate();
    paramFloat2 = Edge.RIGHT.getCoordinate();
    f = (AspectRatioUtil.calculateWidth(f, Edge.BOTTOM.getCoordinate(), paramFloat3) - (paramFloat2 - paramFloat1)) / 2.0F;
    Edge.LEFT.setCoordinate(paramFloat1 - f);
    Edge.RIGHT.setCoordinate(paramFloat2 + f);
    if ((Edge.LEFT.isOutsideMargin(paramRect, paramFloat4)) && (!mEdge.isNewRectangleOutOfBounds(Edge.LEFT, paramRect, paramFloat3)))
    {
      paramFloat1 = Edge.LEFT.snapToRect(paramRect);
      Edge.RIGHT.offset(-paramFloat1);
      mEdge.adjustCoordinate(paramFloat3);
    }
    if ((Edge.RIGHT.isOutsideMargin(paramRect, paramFloat4)) && (!mEdge.isNewRectangleOutOfBounds(Edge.RIGHT, paramRect, paramFloat3)))
    {
      paramFloat1 = Edge.RIGHT.snapToRect(paramRect);
      Edge.LEFT.offset(-paramFloat1);
      mEdge.adjustCoordinate(paramFloat3);
    }
  }
}
