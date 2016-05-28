package com.adobe.creativesdk.foundation.internal.storage.controllers.multipage;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.OnItemTouchListener;
import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.View;

public class RecyclerItemClickListener
  implements RecyclerView.OnItemTouchListener
{
  GestureDetector mGestureDetector;
  private OnItemClickListener mListener;
  
  public RecyclerItemClickListener(Context paramContext, final RecyclerView paramRecyclerView, OnItemClickListener paramOnItemClickListener)
  {
    mListener = paramOnItemClickListener;
    mGestureDetector = new GestureDetector(paramContext, new GestureDetector.SimpleOnGestureListener()
    {
      public void onLongPress(MotionEvent paramAnonymousMotionEvent)
      {
        paramAnonymousMotionEvent = paramRecyclerView.findChildViewUnder(paramAnonymousMotionEvent.getX(), paramAnonymousMotionEvent.getY());
        if ((paramAnonymousMotionEvent != null) && (mListener != null)) {
          mListener.onItemLongClick(paramAnonymousMotionEvent, paramRecyclerView.getChildPosition(paramAnonymousMotionEvent));
        }
      }
      
      public boolean onSingleTapUp(MotionEvent paramAnonymousMotionEvent)
      {
        return true;
      }
    });
  }
  
  public boolean onInterceptTouchEvent(RecyclerView paramRecyclerView, MotionEvent paramMotionEvent)
  {
    View localView = paramRecyclerView.findChildViewUnder(paramMotionEvent.getX(), paramMotionEvent.getY());
    if ((localView != null) && (mListener != null) && (mGestureDetector.onTouchEvent(paramMotionEvent))) {
      mListener.onItemClick(localView, paramRecyclerView.getChildPosition(localView));
    }
    return false;
  }
  
  public void onRequestDisallowInterceptTouchEvent(boolean paramBoolean) {}
  
  public void onTouchEvent(RecyclerView paramRecyclerView, MotionEvent paramMotionEvent) {}
  
  public static abstract interface OnItemClickListener
  {
    public abstract void onItemClick(View paramView, int paramInt);
    
    public abstract void onItemLongClick(View paramView, int paramInt);
  }
}
