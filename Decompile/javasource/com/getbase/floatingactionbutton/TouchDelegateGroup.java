package com.getbase.floatingactionbutton;

import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.TouchDelegate;
import android.view.View;
import java.util.ArrayList;

public class TouchDelegateGroup
  extends TouchDelegate
{
  private static final Rect USELESS_HACKY_RECT = new Rect();
  private TouchDelegate mCurrentTouchDelegate;
  private boolean mEnabled;
  private final ArrayList<TouchDelegate> mTouchDelegates = new ArrayList();
  
  public TouchDelegateGroup(View paramView)
  {
    super(USELESS_HACKY_RECT, paramView);
  }
  
  public void addTouchDelegate(TouchDelegate paramTouchDelegate)
  {
    mTouchDelegates.add(paramTouchDelegate);
  }
  
  public void clearTouchDelegates()
  {
    mTouchDelegates.clear();
    mCurrentTouchDelegate = null;
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool = true;
    if (!mEnabled)
    {
      bool = false;
      return bool;
    }
    Object localObject2 = null;
    Object localObject1;
    switch (paramMotionEvent.getAction())
    {
    default: 
      localObject1 = localObject2;
    }
    while ((localObject1 == null) || (!((TouchDelegate)localObject1).onTouchEvent(paramMotionEvent)))
    {
      return false;
      int i = 0;
      for (;;)
      {
        localObject1 = localObject2;
        if (i >= mTouchDelegates.size()) {
          break;
        }
        localObject1 = (TouchDelegate)mTouchDelegates.get(i);
        if (((TouchDelegate)localObject1).onTouchEvent(paramMotionEvent))
        {
          mCurrentTouchDelegate = ((TouchDelegate)localObject1);
          return true;
        }
        i += 1;
      }
      localObject1 = mCurrentTouchDelegate;
      continue;
      localObject1 = mCurrentTouchDelegate;
      mCurrentTouchDelegate = null;
    }
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    mEnabled = paramBoolean;
  }
}
