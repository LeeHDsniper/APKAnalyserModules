package com.tencent.mobileqq.activity.aio.anim;

import android.animation.ValueAnimator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.VersionUtils;
import com.tencent.widget.ListView;
import java.util.ArrayList;
import java.util.Iterator;
import ksa;
import mqq.app.MainService;

public class FloorJumperSet
  extends AIOAnimationConatiner.AIOAnimator
{
  static final long jdField_a_of_type_Long;
  public static final int b;
  public ArrayList a;
  ksa jdField_a_of_type_Ksa;
  private long b;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    long l;
    if (VersionUtils.e())
    {
      l = ValueAnimator.getFrameDelay();
      jdField_a_of_type_Long = l;
      if (!VersionUtils.e()) {
        break label39;
      }
    }
    label39:
    for (int i = 16;; i = 1)
    {
      jdField_b_of_type_Int = i;
      return;
      l = 16L;
      break;
    }
  }
  
  public FloorJumperSet(int paramInt, AIOAnimationConatiner paramAIOAnimationConatiner, ListView paramListView)
  {
    super(paramInt, paramAIOAnimationConatiner, paramListView);
    jdField_a_of_type_JavaUtilArrayList = new ArrayList(jdField_b_of_type_Int);
    jdField_b_of_type_Long = 0L;
  }
  
  protected void a(int paramInt)
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
    while (localIterator.hasNext())
    {
      FloorJumper localFloorJumper = (FloorJumper)localIterator.next();
      o += paramInt;
      m += paramInt;
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.offsetChildrenTopAndBottom(paramInt);
  }
  
  protected boolean a(int paramInt)
  {
    return paramInt == 2;
  }
  
  protected boolean a(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
    boolean bool = false;
    if (localIterator.hasNext())
    {
      if (((FloorJumper)localIterator.next()).a(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4)) {
        bool = true;
      }
      for (;;)
      {
        break;
        localIterator.remove();
      }
    }
    if (!bool)
    {
      c();
      d();
      return bool;
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.invalidate();
    return bool;
  }
  
  protected boolean a(Object... paramVarArgs)
  {
    int i = 0;
    if (jdField_a_of_type_JavaUtilArrayList.size() < jdField_b_of_type_Int)
    {
      if (MainService.sPwdPacketTime != 0L)
      {
        long l = System.currentTimeMillis() - MainService.sPwdPacketTime;
        if ((l < 60000L) && (l > 0L)) {
          if (jdField_a_of_type_JavaUtilArrayList.size() > jdField_b_of_type_Int / 3) {}
        }
      }
      for (i = 1;; i = 1)
      {
        if (i != 0)
        {
          FloorJumper localFloorJumper = new FloorJumper(jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner, jdField_a_of_type_ComTencentWidgetListView);
          jdField_a_of_type_JavaUtilArrayList.add(localFloorJumper);
          localFloorJumper.a(paramVarArgs);
        }
        if (jdField_a_of_type_Ksa == null)
        {
          jdField_a_of_type_Ksa = new ksa(this, null);
          if (jdField_b_of_type_Long == 0L) {
            jdField_a_of_type_ComTencentWidgetListView.postDelayed(jdField_a_of_type_Ksa, jdField_a_of_type_Long);
          }
        }
        return true;
        MainService.sPwdPacketTime = 0L;
      }
    }
    return false;
  }
  
  protected void b()
  {
    jdField_b_of_type_Long = 0L;
    Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
    int i = 0;
    if (localIterator.hasNext())
    {
      if (((FloorJumper)localIterator.next()).a(false)) {
        i = 1;
      }
      for (;;)
      {
        break;
        localIterator.remove();
      }
    }
    if ((i != 0) && (jdField_a_of_type_Ksa != null))
    {
      jdField_a_of_type_ComTencentWidgetListView.post(jdField_a_of_type_Ksa);
      return;
    }
    d();
  }
  
  protected void c()
  {
    if (jdField_a_of_type_Ksa != null)
    {
      jdField_a_of_type_ComTencentWidgetListView.removeCallbacks(jdField_a_of_type_Ksa);
      jdField_a_of_type_Ksa = null;
    }
  }
}
