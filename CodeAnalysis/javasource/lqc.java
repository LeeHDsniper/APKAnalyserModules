import com.tencent.mobileqq.activity.contact.addcontact.ClassificationSearchFragment;
import com.tencent.mobileqq.activity.contact.addcontact.SearchResult;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lqc
  implements Runnable
{
  public lqc(ClassificationSearchFragment paramClassificationSearchFragment, SearchResult paramSearchResult)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    ClassificationSearchFragment localClassificationSearchFragment;
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchResult != null)
    {
      localClassificationSearchFragment = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment;
      if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchResult.a) {
        break label30;
      }
    }
    label30:
    for (int i = 1;; i = 0)
    {
      ClassificationSearchFragment.a(localClassificationSearchFragment, i);
      return;
    }
  }
}
