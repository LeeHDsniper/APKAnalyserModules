package com.tencent.mobileqq.activity.aio.anim;

import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.animation.AnimationUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.VersionUtils;
import com.tencent.widget.ListView;
import java.util.ArrayList;
import ksc;

public class PathAnimation
  extends AIOAnimationConatiner.AIOAnimator
{
  public ArrayList a;
  private ksc a;
  
  public PathAnimation(int paramInt, AIOAnimationConatiner paramAIOAnimationConatiner, ListView paramListView)
  {
    super(paramInt, paramAIOAnimationConatiner, paramListView);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(View paramView, AnimationPath.Values paramValues)
  {
    if (!jdField_b_of_type_Boolean) {}
    do
    {
      return;
      int i = paramView.getLeft();
      int j = paramView.getWidth() / 2;
      int k = paramView.getTop();
      int m = paramView.getHeight() / 2;
      paramView.offsetTopAndBottom(jdField_d_of_type_Int - (k + m));
      paramView.offsetLeftAndRight(jdField_c_of_type_Int - (i + j));
    } while (!VersionUtils.e());
    paramView.setAlpha(f);
    paramView.setRotation(jdField_a_of_type_Float);
    paramView.setScaleX(jdField_d_of_type_Float);
    paramView.setScaleY(e);
    paramView.setRotationX(jdField_b_of_type_Float);
    paramView.setRotationY(jdField_c_of_type_Float);
  }
  
  protected boolean a(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    return false;
  }
  
  protected boolean a(Object... paramVarArgs)
  {
    try
    {
      Drawable[] arrayOfDrawable;
      long l1;
      AnimationPath localAnimationPath;
      int i;
      label82:
      View localView;
      int j;
      label159:
      AnimationPath.Values localValues;
      if ((paramVarArgs[0] instanceof Drawable[]))
      {
        arrayOfDrawable = (Drawable[])paramVarArgs[0];
        int k = ((Integer)paramVarArgs[1]).intValue();
        l1 = ((Long)paramVarArgs[2]).longValue();
        localAnimationPath = (AnimationPath)AIOAnimationConatiner.a.loadClass((String)paramVarArgs[3]).newInstance();
        jdField_a_of_type_JavaUtilArrayList = new ArrayList(k);
        long l2 = AnimationUtils.currentAnimationTimeMillis();
        i = 0;
        if (i >= k) {
          break label305;
        }
        localView = new View(jdField_a_of_type_ComTencentWidgetListView.getContext());
        Drawable localDrawable = arrayOfDrawable[((int)(Math.random() * arrayOfDrawable.length))];
        localView.setBackgroundDrawable(localDrawable);
        localView.layout(-localDrawable.getIntrinsicWidth(), -localDrawable.getIntrinsicHeight(), 0, 0);
        jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.addView(localView);
        if (i != 0) {
          break label272;
        }
        j = 0;
        localValues = new AnimationPath.Values();
        jdField_a_of_type_Long = (j + l2);
        jdField_a_of_type_AndroidViewView = localView;
        if (i != 0) {
          break label284;
        }
        paramVarArgs = localAnimationPath;
        label192:
        jdField_a_of_type_ComTencentMobileqqActivityAioAnimAnimationPath = paramVarArgs;
        if (!VersionUtils.e()) {
          break label295;
        }
        localView.setLayerType(2, null);
        localView.setPivotX(localDrawable.getIntrinsicWidth() / 2);
        localView.setPivotY(localDrawable.getIntrinsicHeight() / 2);
      }
      for (;;)
      {
        jdField_a_of_type_JavaUtilArrayList.add(localValues);
        i += 1;
        break label82;
        arrayOfDrawable = new Drawable[] { (Drawable)paramVarArgs[0] };
        break;
        label272:
        j = (int)(Math.random() * l1);
        break label159;
        label284:
        paramVarArgs = localAnimationPath.a();
        break label192;
        label295:
        localView.setTag(localValues);
      }
      label305:
      if (jdField_a_of_type_Ksc == null)
      {
        jdField_a_of_type_Ksc = new ksc(this, null);
        jdField_a_of_type_ComTencentWidgetListView.postDelayed(jdField_a_of_type_Ksc, 16L);
      }
      return true;
    }
    catch (Exception paramVarArgs) {}
    return false;
  }
  
  protected void c()
  {
    if (jdField_a_of_type_Ksc != null)
    {
      jdField_a_of_type_ComTencentWidgetListView.removeCallbacks(jdField_a_of_type_Ksc);
      jdField_a_of_type_Ksc = null;
    }
  }
}
