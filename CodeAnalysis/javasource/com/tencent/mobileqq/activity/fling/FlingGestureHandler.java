package com.tencent.mobileqq.activity.fling;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.ref.WeakReference;

public class FlingGestureHandler
  extends FlingHandler
  implements TopGestureLayout.OnGestureListener
{
  private View a;
  public TopGestureLayout mTopLayout;
  
  public FlingGestureHandler(Activity paramActivity)
  {
    super(paramActivity);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private ViewGroup a(Activity paramActivity)
  {
    ViewGroup localViewGroup = (ViewGroup)paramActivity.getWindow().getDecorView();
    View localView = localViewGroup.getChildAt(0);
    paramActivity = localViewGroup;
    if (localView != null)
    {
      paramActivity = localViewGroup;
      if ((localView instanceof DragFrameLayout)) {
        paramActivity = (ViewGroup)localView;
      }
    }
    return paramActivity;
  }
  
  protected void a()
  {
    if (!b()) {}
    ViewGroup localViewGroup;
    do
    {
      Object localObject;
      do
      {
        return;
        localObject = (Activity)jdField_a_of_type_JavaLangRefWeakReference.get();
      } while (localObject == null);
      localViewGroup = a((Activity)localObject);
      if (mTopLayout == null)
      {
        jdField_a_of_type_AndroidViewView = localViewGroup.getChildAt(0);
        View localView = jdField_a_of_type_AndroidViewView;
        mTopLayout = new TopGestureLayout((Context)localObject);
        localObject = mTopLayout;
        ((TopGestureLayout)localObject).setOnFlingGesture(this);
        localViewGroup.addView((View)localObject);
        localViewGroup.removeView(localView);
        ((TopGestureLayout)localObject).addView(localView);
        return;
      }
    } while (a());
    localViewGroup.addView(mTopLayout);
    localViewGroup.removeView(jdField_a_of_type_AndroidViewView);
    mTopLayout.addView(jdField_a_of_type_AndroidViewView);
  }
  
  protected boolean a()
  {
    return (mTopLayout != null) && (mTopLayout.getParent() != null) && (jdField_a_of_type_AndroidViewView != null) && (jdField_a_of_type_AndroidViewView.getParent() == mTopLayout);
  }
  
  protected void b()
  {
    Object localObject = (Activity)jdField_a_of_type_JavaLangRefWeakReference.get();
    if (localObject == null) {}
    do
    {
      do
      {
        return;
        localObject = a((Activity)localObject);
      } while ((!a()) || (!mTopLayout.getParent().equals(localObject)));
      ((ViewGroup)localObject).removeView(mTopLayout);
    } while (!jdField_a_of_type_AndroidViewView.getParent().equals(mTopLayout));
    mTopLayout.removeView(jdField_a_of_type_AndroidViewView);
    ((ViewGroup)localObject).addView(jdField_a_of_type_AndroidViewView);
  }
  
  public void flingLToR()
  {
    Activity localActivity = (Activity)jdField_a_of_type_JavaLangRefWeakReference.get();
    if (localActivity != null) {
      localActivity.onBackPressed();
    }
  }
  
  public void setTopLayout(TopGestureLayout paramTopGestureLayout)
  {
    if ((!b()) && (paramTopGestureLayout == null)) {}
    Activity localActivity;
    do
    {
      return;
      localActivity = (Activity)jdField_a_of_type_JavaLangRefWeakReference.get();
    } while (localActivity == null);
    if (a())
    {
      b();
      jdField_a_of_type_AndroidViewView = a(localActivity).getChildAt(0);
      mTopLayout = paramTopGestureLayout;
      paramTopGestureLayout.setOnFlingGesture(this);
      a();
      return;
    }
    jdField_a_of_type_AndroidViewView = a(localActivity).getChildAt(0);
    mTopLayout = paramTopGestureLayout;
    paramTopGestureLayout.setOnFlingGesture(this);
  }
}
