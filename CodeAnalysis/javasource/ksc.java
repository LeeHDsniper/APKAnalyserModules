import android.view.View;
import android.view.animation.AnimationUtils;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.activity.aio.anim.AnimationPath;
import com.tencent.mobileqq.activity.aio.anim.AnimationPath.Values;
import com.tencent.mobileqq.activity.aio.anim.PathAnimation;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ListView;
import java.util.ArrayList;
import java.util.Iterator;

public class ksc
  implements Runnable
{
  private ksc(PathAnimation paramPathAnimation)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    long l3 = AnimationUtils.currentAnimationTimeMillis();
    Iterator localIterator = a.jdField_a_of_type_JavaUtilArrayList.iterator();
    long l2 = -1L;
    if (localIterator.hasNext())
    {
      AnimationPath.Values localValues = (AnimationPath.Values)localIterator.next();
      long l1;
      if (l3 < jdField_a_of_type_Long)
      {
        l1 = jdField_a_of_type_Long - l3;
        label63:
        if (l1 < 0L) {
          break label195;
        }
        if (l2 >= 0L) {
          break label186;
        }
        label75:
        a.a(jdField_a_of_type_AndroidViewView, localValues);
      }
      for (;;)
      {
        l2 = l1;
        break;
        if (!b)
        {
          l1 = jdField_a_of_type_ComTencentMobileqqActivityAioAnimAnimationPath.a(localValues, jdField_a_of_type_AndroidViewView.getWidth(), jdField_a_of_type_AndroidViewView.getHeight(), a.jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.getWidth(), a.jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.getHeight());
          b = true;
          break label63;
        }
        l1 = jdField_a_of_type_ComTencentMobileqqActivityAioAnimAnimationPath.a(l3 - jdField_a_of_type_Long, localValues);
        break label63;
        label186:
        l1 = Math.min(l2, l1);
        break label75;
        label195:
        a.jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.removeViewInLayout(jdField_a_of_type_AndroidViewView);
        localIterator.remove();
        l1 = l2;
      }
    }
    if (l2 >= 0L)
    {
      a.jdField_a_of_type_ComTencentWidgetListView.postDelayed(this, l2);
      a.jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.invalidate();
      return;
    }
    a.d();
  }
}
