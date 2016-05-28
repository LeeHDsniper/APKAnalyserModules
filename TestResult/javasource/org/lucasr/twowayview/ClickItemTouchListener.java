package org.lucasr.twowayview;

import android.content.Context;
import android.os.Build.VERSION;
import android.support.v4.view.GestureDetectorCompat;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.OnItemTouchListener;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.View;

abstract class ClickItemTouchListener
  implements RecyclerView.OnItemTouchListener
{
  private final GestureDetectorCompat mGestureDetector;
  
  ClickItemTouchListener(RecyclerView paramRecyclerView)
  {
    mGestureDetector = new ItemClickGestureDetector(paramRecyclerView.getContext(), new ItemClickGestureListener(paramRecyclerView));
  }
  
  private boolean hasAdapter(RecyclerView paramRecyclerView)
  {
    return paramRecyclerView.getAdapter() != null;
  }
  
  private boolean isAttachedToWindow(RecyclerView paramRecyclerView)
  {
    if (Build.VERSION.SDK_INT >= 19) {
      return paramRecyclerView.isAttachedToWindow();
    }
    return paramRecyclerView.getHandler() != null;
  }
  
  public boolean onInterceptTouchEvent(RecyclerView paramRecyclerView, MotionEvent paramMotionEvent)
  {
    if ((!isAttachedToWindow(paramRecyclerView)) || (!hasAdapter(paramRecyclerView))) {
      return false;
    }
    mGestureDetector.onTouchEvent(paramMotionEvent);
    return false;
  }
  
  public void onRequestDisallowInterceptTouchEvent(boolean paramBoolean) {}
  
  public void onTouchEvent(RecyclerView paramRecyclerView, MotionEvent paramMotionEvent) {}
  
  abstract boolean performItemClick(RecyclerView paramRecyclerView, View paramView, int paramInt, long paramLong);
  
  abstract boolean performItemLongClick(RecyclerView paramRecyclerView, View paramView, int paramInt, long paramLong);
  
  private class ItemClickGestureDetector
    extends GestureDetectorCompat
  {
    private final ClickItemTouchListener.ItemClickGestureListener mGestureListener;
    
    public ItemClickGestureDetector(Context paramContext, ClickItemTouchListener.ItemClickGestureListener paramItemClickGestureListener)
    {
      super(paramItemClickGestureListener);
      mGestureListener = paramItemClickGestureListener;
    }
    
    public boolean onTouchEvent(MotionEvent paramMotionEvent)
    {
      boolean bool = super.onTouchEvent(paramMotionEvent);
      if ((paramMotionEvent.getAction() & 0xFF) == 1) {
        mGestureListener.dispatchSingleTapUpIfNeeded(paramMotionEvent);
      }
      return bool;
    }
  }
  
  private class ItemClickGestureListener
    extends GestureDetector.SimpleOnGestureListener
  {
    private final RecyclerView mHostView;
    private View mTargetChild;
    
    public ItemClickGestureListener(RecyclerView paramRecyclerView)
    {
      mHostView = paramRecyclerView;
    }
    
    public void dispatchSingleTapUpIfNeeded(MotionEvent paramMotionEvent)
    {
      if (mTargetChild != null) {
        onSingleTapUp(paramMotionEvent);
      }
    }
    
    public boolean onDown(MotionEvent paramMotionEvent)
    {
      int i = (int)paramMotionEvent.getX();
      int j = (int)paramMotionEvent.getY();
      mTargetChild = mHostView.findChildViewUnder(i, j);
      return mTargetChild != null;
    }
    
    public void onLongPress(MotionEvent paramMotionEvent)
    {
      if (mTargetChild == null) {}
      int i;
      long l;
      do
      {
        return;
        i = mHostView.getChildPosition(mTargetChild);
        l = mHostView.getAdapter().getItemId(i);
      } while (!performItemLongClick(mHostView, mTargetChild, i, l));
      mTargetChild.setPressed(false);
      mTargetChild = null;
    }
    
    public boolean onScroll(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
    {
      boolean bool = false;
      if (mTargetChild != null)
      {
        mTargetChild.setPressed(false);
        mTargetChild = null;
        bool = true;
      }
      return bool;
    }
    
    public void onShowPress(MotionEvent paramMotionEvent)
    {
      if (mTargetChild != null) {
        mTargetChild.setPressed(true);
      }
    }
    
    public boolean onSingleTapUp(MotionEvent paramMotionEvent)
    {
      boolean bool = false;
      if (mTargetChild != null)
      {
        mTargetChild.setPressed(false);
        int i = mHostView.getChildPosition(mTargetChild);
        long l = mHostView.getAdapter().getItemId(i);
        bool = performItemClick(mHostView, mTargetChild, i, l);
        mTargetChild = null;
      }
      return bool;
    }
  }
}
