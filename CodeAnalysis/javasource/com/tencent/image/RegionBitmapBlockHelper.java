package com.tencent.image;

import android.graphics.Rect;
import java.util.Iterator;
import java.util.LinkedList;

public class RegionBitmapBlockHelper
{
  static final int REGION_BLOCK_SIZE = 400;
  private Rect mImageRect;
  
  public RegionBitmapBlockHelper(Rect paramRect)
  {
    mImageRect = paramRect;
  }
  
  public LinkedList<Rect> getBlocks(Rect paramRect)
  {
    if ((paramRect == null) || (paramRect.isEmpty()))
    {
      paramRect = null;
      return paramRect;
    }
    int k = left / 400;
    int m = right / 400 + 1;
    int i = top / 400;
    int n = bottom / 400 + 1;
    LinkedList localLinkedList = new LinkedList();
    for (;;)
    {
      paramRect = localLinkedList;
      if (i >= n) {
        break;
      }
      int j = k;
      while (j < m)
      {
        paramRect = new Rect();
        left = (j * 400);
        right = (left + 400);
        top = (i * 400);
        bottom = (top + 400);
        if ((j + 1 == m) || (i + 1 == n)) {
          paramRect.intersect(mImageRect);
        }
        localLinkedList.add(paramRect);
        j += 1;
      }
      i += 1;
    }
  }
  
  public LinkedList<Rect> getBlocksExceptRegion(Rect paramRect, LinkedList<Rect> paramLinkedList)
  {
    if ((paramRect == null) || (paramRect.isEmpty()))
    {
      paramLinkedList = null;
      return paramLinkedList;
    }
    LinkedList localLinkedList = new LinkedList();
    Iterator localIterator = paramLinkedList.iterator();
    for (;;)
    {
      paramLinkedList = localLinkedList;
      if (!localIterator.hasNext()) {
        break;
      }
      paramLinkedList = (Rect)localIterator.next();
      if (!Rect.intersects(paramRect, paramLinkedList)) {
        localLinkedList.add(paramLinkedList);
      }
    }
  }
}
