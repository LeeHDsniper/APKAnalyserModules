import android.support.v4.view.ViewPager;
import com.tencent.mobileqq.activity.recent.RecommendCallHelper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class mht
  implements Runnable
{
  mht(mhs paramMhs)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (a.a.jdField_a_of_type_AndroidSupportV4ViewViewPager != null) {}
    try
    {
      a.a.jdField_a_of_type_AndroidSupportV4ViewViewPager.endFakeDrag();
      a.a.jdField_a_of_type_Boolean = false;
      RecommendCallHelper.a(a.a, 1000);
      return;
    }
    catch (Exception localException1) {}
    try
    {
      a.a.jdField_a_of_type_AndroidSupportV4ViewViewPager.endFakeDrag();
      a.a.jdField_a_of_type_Boolean = false;
      return;
    }
    catch (Exception localException2)
    {
      for (;;)
      {
        localException2.printStackTrace();
      }
    }
  }
}
