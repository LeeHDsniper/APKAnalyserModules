import com.tencent.mobileqq.activity.qqcard.NearByQQCardFragment;
import com.tencent.mobileqq.app.QQCardHandler;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.qcard.QQCardService;

public class mcf
  implements Runnable
{
  public mcf(NearByQQCardFragment paramNearByQQCardFragment, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (jdField_a_of_type_Boolean)
    {
      NearByQQCardFragment.a(jdField_a_of_type_ComTencentMobileqqActivityQqcardNearByQQCardFragment, 0L);
      NearByQQCardFragment.a(jdField_a_of_type_ComTencentMobileqqActivityQqcardNearByQQCardFragment, null);
      NearByQQCardFragment.a(jdField_a_of_type_ComTencentMobileqqActivityQqcardNearByQQCardFragment, QQCardService.a());
    }
    if (NearByQQCardFragment.a(jdField_a_of_type_ComTencentMobileqqActivityQqcardNearByQQCardFragment) == 0) {}
    for (int i = 2;; i = 3)
    {
      NearByQQCardFragment.a(jdField_a_of_type_ComTencentMobileqqActivityQqcardNearByQQCardFragment).a(NearByQQCardFragment.a(jdField_a_of_type_ComTencentMobileqqActivityQqcardNearByQQCardFragment), i, 1, NearByQQCardFragment.a(jdField_a_of_type_ComTencentMobileqqActivityQqcardNearByQQCardFragment), NearByQQCardFragment.a(jdField_a_of_type_ComTencentMobileqqActivityQqcardNearByQQCardFragment));
      return;
    }
  }
}
