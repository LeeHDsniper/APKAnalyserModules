import android.support.v4.view.ViewPager;
import com.tencent.mobileqq.activity.recent.RecommendCallHelper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mhs
  implements Runnable
{
  public mhs(RecommendCallHelper paramRecommendCallHelper)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (a.jdField_a_of_type_AndroidSupportV4ViewViewPager != null)
    {
      if ((a.jdField_a_of_type_AndroidSupportV4ViewViewPager.getChildCount() > 1) && (a.jdField_a_of_type_AndroidSupportV4ViewViewPager.getCurrentItem() == 0)) {
        break label68;
      }
      a.jdField_a_of_type_Boolean = false;
      if (a.jdField_a_of_type_AndroidSupportV4ViewViewPager.getChildCount() <= 1) {
        RecommendCallHelper.a(a, 0);
      }
    }
    label68:
    while ((!a.jdField_a_of_type_AndroidSupportV4ViewViewPager.isFakeDragging()) && (!a.jdField_a_of_type_AndroidSupportV4ViewViewPager.beginFakeDrag())) {
      return;
    }
    float f1 = a.jdField_a_of_type_AndroidSupportV4ViewViewPager.getWidth() / 40;
    int i = 0;
    int j = 30;
    while (i < 20)
    {
      float f2 = f1;
      if (i == 10)
      {
        f2 = -f1;
        j = 30;
      }
      a.jdField_a_of_type_AndroidSupportV4ViewViewPager.postDelayed(new mhw(a, f2), i * j);
      i += 1;
      f1 = f2;
    }
    a.jdField_a_of_type_AndroidSupportV4ViewViewPager.postDelayed(new mht(this), 700L);
  }
}
