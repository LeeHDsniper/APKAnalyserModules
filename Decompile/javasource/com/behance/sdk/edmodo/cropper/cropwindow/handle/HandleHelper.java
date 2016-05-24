package com.behance.sdk.edmodo.cropper.cropwindow.handle;

import android.graphics.Rect;
import com.behance.sdk.edmodo.cropper.cropwindow.edge.Edge;
import com.behance.sdk.edmodo.cropper.cropwindow.edge.EdgePair;
import com.behance.sdk.edmodo.cropper.util.AspectRatioUtil;

abstract class HandleHelper
{
  private EdgePair mActiveEdges;
  private Edge mHorizontalEdge;
  private Edge mVerticalEdge;
  
  HandleHelper(Edge paramEdge1, Edge paramEdge2)
  {
    mHorizontalEdge = paramEdge1;
    mVerticalEdge = paramEdge2;
    mActiveEdges = new EdgePair(mHorizontalEdge, mVerticalEdge);
  }
  
  private float getAspectRatio(float paramFloat1, float paramFloat2)
  {
    float f1;
    float f2;
    if (mVerticalEdge == Edge.LEFT)
    {
      f1 = paramFloat1;
      if (mHorizontalEdge != Edge.TOP) {
        break label64;
      }
      f2 = paramFloat2;
      label25:
      if (mVerticalEdge != Edge.RIGHT) {
        break label75;
      }
      label35:
      if (mHorizontalEdge != Edge.BOTTOM) {
        break label85;
      }
    }
    for (;;)
    {
      return AspectRatioUtil.calculateAspectRatio(f1, f2, paramFloat1, paramFloat2);
      f1 = Edge.LEFT.getCoordinate();
      break;
      label64:
      f2 = Edge.TOP.getCoordinate();
      break label25;
      label75:
      paramFloat1 = Edge.RIGHT.getCoordinate();
      break label35;
      label85:
      paramFloat2 = Edge.BOTTOM.getCoordinate();
    }
  }
  
  EdgePair getActiveEdges()
  {
    return mActiveEdges;
  }
  
  EdgePair getActiveEdges(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    if (getAspectRatio(paramFloat1, paramFloat2) > paramFloat3) {
      mActiveEdges.primary = mVerticalEdge;
    }
    for (mActiveEdges.secondary = mHorizontalEdge;; mActiveEdges.secondary = mVerticalEdge)
    {
      return mActiveEdges;
      mActiveEdges.primary = mHorizontalEdge;
    }
  }
  
  abstract void updateCropWindow(float paramFloat1, float paramFloat2, float paramFloat3, Rect paramRect, float paramFloat4);
  
  void updateCropWindow(float paramFloat1, float paramFloat2, Rect paramRect, float paramFloat3)
  {
    Object localObject = getActiveEdges();
    Edge localEdge = primary;
    localObject = secondary;
    if (localEdge != null) {
      localEdge.adjustCoordinate(paramFloat1, paramFloat2, paramRect, paramFloat3, 1.0F);
    }
    if (localObject != null) {
      ((Edge)localObject).adjustCoordinate(paramFloat1, paramFloat2, paramRect, paramFloat3, 1.0F);
    }
  }
}
