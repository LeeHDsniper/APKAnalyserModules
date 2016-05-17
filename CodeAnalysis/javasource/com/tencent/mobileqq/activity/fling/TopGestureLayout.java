package com.tencent.mobileqq.activity.fling;

import android.content.Context;
import android.graphics.Canvas;
import android.os.Build.VERSION;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.widget.RelativeLayout;
import com.tencent.mobileqq.activity.ChatFragment.InterceptTouchEventListener;
import com.tencent.mobileqq.activity.ChatFragment.MyDispatchDrawListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.immersive.ImmersiveUtils;
import java.lang.ref.WeakReference;

public class TopGestureLayout
  extends RelativeLayout
{
  public static final int FLAG_GESTURE_END = -1;
  public static final int FLAG_GESTURE_FLING_BT = 8;
  public static final int FLAG_GESTURE_FLING_LR = 1;
  public static final int FLAG_GESTURE_FLING_RL = 2;
  public static final int FLAG_GESTURE_FLING_TB = 4;
  public static final int FLAG_GESTURE_IDLE = 0;
  public static final String TAG = "TopGestureLayout";
  private int jdField_a_of_type_Int;
  private boolean jdField_a_of_type_Boolean;
  private int[] jdField_a_of_type_ArrayOfInt;
  private int jdField_b_of_type_Int;
  private boolean jdField_b_of_type_Boolean;
  public WeakReference mInterceptTouchEventListener;
  public ChatFragment.MyDispatchDrawListener mMyDispatchDrawListener;
  public TopGestureLayout.OnChangeMultiScreenListener mOnChangeMultiScreenListener;
  public TopGestureLayout.OnGestureListener mOnFlingGesture;
  public GestureDetector mTopGestureDetector;
  
  public TopGestureLayout(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_ArrayOfInt = new int[2];
    a(paramContext);
  }
  
  public TopGestureLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public TopGestureLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_ArrayOfInt = new int[2];
    a(paramContext);
  }
  
  public TopGestureLayout(Context paramContext, ChatFragment.MyDispatchDrawListener paramMyDispatchDrawListener, ChatFragment.InterceptTouchEventListener paramInterceptTouchEventListener)
  {
    super(paramContext);
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_ArrayOfInt = new int[2];
    a(paramContext);
    mMyDispatchDrawListener = paramMyDispatchDrawListener;
    mInterceptTouchEventListener = new WeakReference(paramInterceptTouchEventListener);
  }
  
  public void a(Context paramContext)
  {
    mTopGestureDetector = new GestureDetector(paramContext, new TopGestureLayout.TopGestureDetector(this, paramContext));
  }
  
  public void dispatchDraw(Canvas paramCanvas)
  {
    if (paramCanvas == null) {}
    for (;;)
    {
      return;
      try
      {
        super.dispatchDraw(paramCanvas);
        if (mMyDispatchDrawListener == null) {
          continue;
        }
        mMyDispatchDrawListener.a();
        return;
      }
      catch (Exception paramCanvas)
      {
        for (;;)
        {
          paramCanvas.printStackTrace();
        }
      }
    }
  }
  
  public int getPaddingTop()
  {
    if (Build.VERSION.SDK_INT >= 19) {
      return ImmersiveUtils.a(getContext());
    }
    return super.getPaddingTop();
  }
  
  public boolean hasGestureFlag(int paramInt)
  {
    return (!isGestureEnd()) && ((jdField_a_of_type_Int & paramInt) == paramInt);
  }
  
  public boolean isGestureEnd()
  {
    return jdField_a_of_type_Int == -1;
  }
  
  public boolean isGestureIdle()
  {
    return jdField_a_of_type_Int == 0;
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    if (!jdField_a_of_type_Boolean) {
      return false;
    }
    if ((mInterceptTouchEventListener != null) && (mInterceptTouchEventListener.get() != null) && (!((ChatFragment.InterceptTouchEventListener)mInterceptTouchEventListener.get()).a(paramMotionEvent))) {
      return false;
    }
    return mTopGestureDetector.onTouchEvent(paramMotionEvent);
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (paramMotionEvent.getAction() == 0) {}
    return mTopGestureDetector.onTouchEvent(paramMotionEvent);
  }
  
  public void setGestureFlag(int paramInt)
  {
    if ((paramInt == 0) || (paramInt == -1))
    {
      jdField_a_of_type_Int = paramInt;
      return;
    }
    jdField_a_of_type_Int = (jdField_a_of_type_Int & (paramInt ^ 0xFFFFFFFF) | paramInt);
  }
  
  public void setInterceptTouchFlag(boolean paramBoolean)
  {
    jdField_a_of_type_Boolean = paramBoolean;
  }
  
  public void setNotifyMultiScreenListener(TopGestureLayout.OnChangeMultiScreenListener paramOnChangeMultiScreenListener)
  {
    mOnChangeMultiScreenListener = paramOnChangeMultiScreenListener;
  }
  
  public void setOnFlingGesture(TopGestureLayout.OnGestureListener paramOnGestureListener)
  {
    mOnFlingGesture = paramOnGestureListener;
  }
  
  public void setPadding(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (Build.VERSION.SDK_INT >= 19)
    {
      super.setPadding(paramInt1, ImmersiveUtils.a(getContext()), paramInt3, paramInt4);
      return;
    }
    super.setPadding(paramInt1, paramInt2, paramInt3, paramInt4);
  }
}
