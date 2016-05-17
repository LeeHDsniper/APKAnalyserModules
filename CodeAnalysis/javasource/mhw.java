import android.support.v4.view.ViewPager;
import com.tencent.mobileqq.activity.recent.RecommendCallHelper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mhw
  implements Runnable
{
  private float jdField_a_of_type_Float;
  
  public mhw(RecommendCallHelper paramRecommendCallHelper, float paramFloat)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Float = paramFloat;
  }
  
  public void run()
  {
    try
    {
      if ((jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.jdField_a_of_type_AndroidSupportV4ViewViewPager != null) && (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.jdField_a_of_type_AndroidSupportV4ViewViewPager.getVisibility() == 0))
      {
        if ((jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.jdField_a_of_type_AndroidSupportV4ViewViewPager.isFakeDragging()) || (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.jdField_a_of_type_AndroidSupportV4ViewViewPager.beginFakeDrag()))
        {
          jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.jdField_a_of_type_AndroidSupportV4ViewViewPager.fakeDragBy(jdField_a_of_type_Float);
          return;
        }
        jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.jdField_a_of_type_AndroidSupportV4ViewViewPager.endFakeDrag();
        jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.jdField_a_of_type_Boolean = false;
        return;
      }
    }
    catch (Exception localException1)
    {
      try
      {
        jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.jdField_a_of_type_AndroidSupportV4ViewViewPager.endFakeDrag();
        jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.jdField_a_of_type_Boolean = false;
        return;
        if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.jdField_a_of_type_AndroidSupportV4ViewViewPager != null)
        {
          jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.jdField_a_of_type_AndroidSupportV4ViewViewPager.endFakeDrag();
          jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.jdField_a_of_type_Boolean = false;
          return;
        }
      }
      catch (Exception localException2)
      {
        for (;;) {}
      }
    }
  }
}
