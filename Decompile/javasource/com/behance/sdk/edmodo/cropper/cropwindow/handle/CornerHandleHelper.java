package com.behance.sdk.edmodo.cropper.cropwindow.handle;

import android.graphics.Rect;
import com.behance.sdk.edmodo.cropper.cropwindow.edge.Edge;
import com.behance.sdk.edmodo.cropper.cropwindow.edge.EdgePair;

class CornerHandleHelper
  extends HandleHelper
{
  CornerHandleHelper(Edge paramEdge1, Edge paramEdge2)
  {
    super(paramEdge1, paramEdge2);
  }
  
  void updateCropWindow(float paramFloat1, float paramFloat2, float paramFloat3, Rect paramRect, float paramFloat4)
  {
    Object localObject = getActiveEdges(paramFloat1, paramFloat2, paramFloat3);
    Edge localEdge = primary;
    localObject = secondary;
    localEdge.adjustCoordinate(paramFloat1, paramFloat2, paramRect, paramFloat4, paramFloat3);
    ((Edge)localObject).adjustCoordinate(paramFloat3);
    if (((Edge)localObject).isOutsideMargin(paramRect, paramFloat4))
    {
      ((Edge)localObject).snapToRect(paramRect);
      localEdge.adjustCoordinate(paramFloat3);
    }
  }
}
