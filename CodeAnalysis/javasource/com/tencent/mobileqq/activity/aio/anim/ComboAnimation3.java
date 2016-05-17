package com.tencent.mobileqq.activity.aio.anim;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.AnimatorSet.Builder;
import android.animation.Keyframe;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.animation.Animation;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.VersionUtils;
import com.tencent.widget.ListView;
import krt;
import kru;
import krv;
import krx;
import kry;

public class ComboAnimation3
  extends AIOAnimationConatiner.AIOAnimator
{
  static final int jdField_b_of_type_Int = (int)(60.0F * agetResourcesgetDisplayMetricsdensity + 0.5F);
  public float a;
  long jdField_a_of_type_Long;
  private View jdField_a_of_type_AndroidViewView;
  public Drawable[] a;
  private View jdField_b_of_type_AndroidViewView;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ComboAnimation3(int paramInt, AIOAnimationConatiner paramAIOAnimationConatiner, ListView paramListView)
  {
    super(paramInt, paramAIOAnimationConatiner, paramListView);
    jdField_a_of_type_Float = 0.041666668F;
  }
  
  private boolean a(long paramLong)
  {
    int m = jdField_a_of_type_AndroidViewView.getLeft();
    int n = jdField_a_of_type_AndroidViewView.getWidth() / 2;
    int i = jdField_a_of_type_AndroidViewView.getTop();
    int j = jdField_a_of_type_AndroidViewView.getHeight() / 2;
    int i1 = jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.getWidth() / 2;
    int k = jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.getHeight() / 2;
    m = i1 - (m + n);
    i = k - (i + j);
    if ((m != 0) || (i != 0))
    {
      jdField_a_of_type_AndroidViewView.offsetLeftAndRight(m);
      jdField_a_of_type_AndroidViewView.offsetTopAndBottom(i);
      jdField_b_of_type_AndroidViewView.offsetLeftAndRight(m);
      jdField_b_of_type_AndroidViewView.offsetTopAndBottom(i);
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.invalidate();
    }
    return true;
  }
  
  protected void a(int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.offsetChildrenTopAndBottom(paramInt);
  }
  
  protected boolean a(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    return a(jdField_a_of_type_Long);
  }
  
  protected boolean a(Object... paramVarArgs)
  {
    boolean bool2 = false;
    int i = ((Integer)paramVarArgs[0]).intValue();
    jdField_a_of_type_Long = ((Long)paramVarArgs[1]).longValue();
    boolean bool1 = bool2;
    int i1;
    int j;
    int k;
    if (i > 0)
    {
      i1 = Integer.toString(i).length();
      if (i <= 99) {
        break label781;
      }
      jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable = new Drawable[4];
      jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[3] = jdField_a_of_type_ComTencentWidgetListView.getResources().getDrawable(2130837542);
      i = jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[3].getIntrinsicWidth();
      jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[2] = jdField_a_of_type_ComTencentWidgetListView.getResources().getDrawable(2130838281);
      j = jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[2].getIntrinsicWidth();
      jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[1] = jdField_a_of_type_ComTencentWidgetListView.getResources().getDrawable(2130838281);
      k = jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[1].getIntrinsicWidth() + (i + 0 + j);
      jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[0] = jdField_a_of_type_ComTencentWidgetListView.getResources().getDrawable(2130838282);
      i = jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[0].getIntrinsicWidth() + k;
      jdField_a_of_type_AndroidViewView = new kry(this, jdField_a_of_type_ComTencentWidgetListView.getContext());
      jdField_b_of_type_AndroidViewView = new kry(this, jdField_a_of_type_ComTencentWidgetListView.getContext());
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.addViewInLayout(jdField_a_of_type_AndroidViewView, -1, AIOAnimationConatiner.a, false);
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.addViewInLayout(jdField_b_of_type_AndroidViewView, -1, AIOAnimationConatiner.a, false);
      jdField_a_of_type_AndroidViewView.layout(0, 0, i, jdField_b_of_type_Int);
      jdField_b_of_type_AndroidViewView.layout(0, 0, i, jdField_b_of_type_Int);
      bool1 = bool2;
      if (a(jdField_a_of_type_Long))
      {
        if (!VersionUtils.e()) {
          break label867;
        }
        jdField_a_of_type_AndroidViewView.setLayerType(2, null);
        jdField_a_of_type_AndroidViewView.setPivotX(i / 2);
        jdField_a_of_type_AndroidViewView.setPivotY(jdField_b_of_type_Int / 2);
        jdField_b_of_type_AndroidViewView.setLayerType(2, null);
        jdField_b_of_type_AndroidViewView.setPivotX(i / 2);
        jdField_b_of_type_AndroidViewView.setPivotY(jdField_b_of_type_Int / 2);
        Object localObject1 = Keyframe.ofFloat(0.0F, 0.0F);
        Object localObject2 = Keyframe.ofFloat(11.0F * jdField_a_of_type_Float, 1.0F);
        Object localObject3 = Keyframe.ofFloat(20.0F * jdField_a_of_type_Float, 1.0F);
        Keyframe localKeyframe = Keyframe.ofFloat(1.0F, 0.0F);
        paramVarArgs = new Keyframe[4];
        paramVarArgs[0] = Keyframe.ofFloat(0.0F, 1.0F);
        paramVarArgs[1] = Keyframe.ofFloat(6.0F * jdField_a_of_type_Float, 1.5F);
        paramVarArgs[2] = Keyframe.ofFloat(11.0F * jdField_a_of_type_Float, 1.0F);
        paramVarArgs[3] = Keyframe.ofFloat(1.0F, 1.0F);
        localObject3 = PropertyValuesHolder.ofKeyframe("alpha", new Keyframe[] { localObject1, localObject2, localObject3, localKeyframe });
        localObject1 = PropertyValuesHolder.ofKeyframe("scaleX", paramVarArgs);
        localObject2 = PropertyValuesHolder.ofKeyframe("scaleY", paramVarArgs);
        paramVarArgs = ObjectAnimator.ofPropertyValuesHolder(jdField_a_of_type_AndroidViewView, new PropertyValuesHolder[] { localObject3 }).setDuration(1000L);
        localObject1 = ObjectAnimator.ofPropertyValuesHolder(jdField_a_of_type_AndroidViewView, new PropertyValuesHolder[] { localObject1 }).setDuration(1000L);
        localObject2 = ObjectAnimator.ofPropertyValuesHolder(jdField_a_of_type_AndroidViewView, new PropertyValuesHolder[] { localObject2 }).setDuration(1000L);
        localObject3 = new AnimatorSet();
        ((AnimatorSet)localObject3).addListener(new krt(this));
        ((AnimatorSet)localObject3).play(paramVarArgs).with((Animator)localObject1).with((Animator)localObject2);
        ((AnimatorSet)localObject3).start();
        jdField_a_of_type_AndroidViewView.setTag(localObject3);
        jdField_b_of_type_AndroidViewView.setAlpha(0.0F);
        paramVarArgs = ObjectAnimator.ofFloat(jdField_b_of_type_AndroidViewView, "alpha", new float[] { 0.5F, 0.0F }).setDuration(333L);
        localObject1 = ObjectAnimator.ofFloat(jdField_b_of_type_AndroidViewView, "scaleX", new float[] { 1.5F, 2.0F }).setDuration(333L);
        localObject2 = ObjectAnimator.ofFloat(jdField_b_of_type_AndroidViewView, "scaleY", new float[] { 1.5F, 2.0F }).setDuration(333L);
        localObject3 = new AnimatorSet();
        ((AnimatorSet)localObject3).play(paramVarArgs).with((Animator)localObject1).with((Animator)localObject2);
        ((AnimatorSet)localObject3).setStartDelay((jdField_a_of_type_Float * 5.0F * 1000.0F));
        ((AnimatorSet)localObject3).start();
        jdField_b_of_type_AndroidViewView.setTag(localObject3);
      }
    }
    for (;;)
    {
      bool1 = true;
      return bool1;
      label781:
      jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable = new Drawable[i1 + 1];
      int m = 0;
      j = 0;
      int n;
      do
      {
        jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[(i1 - m)] = jdField_a_of_type_ComTencentWidgetListView.getResources().getDrawable(i % 10 + 2130838272);
        k = j + jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[(i1 - m)].getIntrinsicWidth();
        m += 1;
        n = i / 10;
        j = k;
        i = n;
      } while (n > 0);
      break;
      label867:
      paramVarArgs = new kru(this);
      paramVarArgs.setDuration(1000L);
      paramVarArgs.setFillAfter(true);
      jdField_a_of_type_AndroidViewView.setAnimation(paramVarArgs);
      paramVarArgs.setAnimationListener(new krv(this));
      paramVarArgs = new krx(this);
      paramVarArgs.setDuration(1000L);
      paramVarArgs.setFillAfter(true);
      jdField_b_of_type_AndroidViewView.setAnimation(paramVarArgs);
    }
  }
  
  protected void c()
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.removeViewInLayout(jdField_a_of_type_AndroidViewView);
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.removeViewInLayout(jdField_b_of_type_AndroidViewView);
    if (VersionUtils.e())
    {
      Animator localAnimator1 = (Animator)jdField_a_of_type_AndroidViewView.getTag();
      Animator localAnimator2 = (Animator)jdField_b_of_type_AndroidViewView.getTag();
      if (localAnimator1 != null) {
        localAnimator1.cancel();
      }
      if (localAnimator2 != null) {
        localAnimator2.cancel();
      }
    }
    jdField_a_of_type_AndroidViewView = null;
    jdField_a_of_type_AndroidViewView = null;
  }
}
