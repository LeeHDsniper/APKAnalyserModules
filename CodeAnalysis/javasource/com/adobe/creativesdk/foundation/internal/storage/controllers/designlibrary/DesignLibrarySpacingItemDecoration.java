package com.adobe.creativesdk.foundation.internal.storage.controllers.designlibrary;

import android.graphics.Rect;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.State;
import android.view.View;

public class DesignLibrarySpacingItemDecoration
  extends RecyclerView.ItemDecoration
{
  int _horizontalSpacing;
  private boolean _isFixedColumn = false;
  private MultiColumnDelegate _multiColumnDelegate;
  private int _numFixedColumnsCount = 0;
  int _verticalSpacing;
  
  public DesignLibrarySpacingItemDecoration(int paramInt1, int paramInt2)
  {
    int j;
    int i;
    if ((paramInt1 & 0x1) == 0)
    {
      j = 1;
      i = paramInt1;
      if (j == 0) {
        i = paramInt1 + 1;
      }
      if ((paramInt2 & 0x1) != 0) {
        break label72;
      }
    }
    label72:
    for (paramInt1 = 1;; paramInt1 = 0)
    {
      j = paramInt2;
      if (paramInt1 == 0) {
        j = paramInt2 + 1;
      }
      _verticalSpacing = i;
      _horizontalSpacing = j;
      return;
      j = 0;
      break;
    }
  }
  
  public void getItemOffsets(Rect paramRect, View paramView, RecyclerView paramRecyclerView, RecyclerView.State paramState)
  {
    int j = paramRecyclerView.getChildPosition(paramView);
    int i = _verticalSpacing / 2;
    left = i;
    right = i;
    i = _horizontalSpacing / 2;
    bottom = i;
    top = i;
    i = 0;
    if (_isFixedColumn) {
      if (j >= _numFixedColumnsCount) {
        break label88;
      }
    }
    label88:
    for (i = 1;; i = 0)
    {
      if ((j == 0) || (i != 0)) {
        top = _verticalSpacing;
      }
      return;
    }
  }
  
  public void setFixedColumn(int paramInt)
  {
    _isFixedColumn = true;
    _numFixedColumnsCount = paramInt;
  }
  
  public void setMultiColumnDelegate(MultiColumnDelegate paramMultiColumnDelegate)
  {
    _isFixedColumn = false;
    _multiColumnDelegate = paramMultiColumnDelegate;
  }
  
  public static abstract interface MultiColumnDelegate {}
}
