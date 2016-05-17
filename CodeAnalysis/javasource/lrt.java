import com.tencent.mobileqq.activity.contact.newfriend.NewFriendActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.newfriend.NewFriendMessage;
import com.tencent.qphone.base.util.QLog;

public class lrt
  implements Runnable
{
  public lrt(NewFriendActivity paramNewFriendActivity, Object paramObject)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (QLog.isColorLevel()) {
      QLog.d("NewFriendManager", 2, "init red dot from NewFriendManager push");
    }
    if (NewFriendActivity.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendNewFriendActivity) != jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendNewFriendActivity.a(((NewFriendMessage)jdField_a_of_type_JavaLangObject).b())) {
      NewFriendActivity.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendNewFriendActivity);
    }
  }
}
