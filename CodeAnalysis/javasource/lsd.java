import com.tencent.mobileqq.activity.contact.newfriend.BaseNewFriendView.INewFriendContext;
import com.tencent.mobileqq.activity.contact.newfriend.ContactRecommendActivity;
import com.tencent.mobileqq.activity.contact.newfriend.RecommendListView;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.qphone.base.util.QLog;

public class lsd
  extends ContactBindObserver
{
  public lsd(RecommendListView paramRecommendListView, PhoneContactManagerImp paramPhoneContactManagerImp)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, int paramInt)
  {
    if (RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView)) {
      RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView);
    }
    if ((RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView) == 1) && (!paramBoolean))
    {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.c();
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.a(2131367317, 1);
    }
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp != null) && (RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView) == 0) && (!jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.c())) {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(new lse(this));
    }
  }
  
  protected void b(boolean paramBoolean, int paramInt)
  {
    if (RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView)) {
      RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView);
    }
  }
  
  protected void c(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecommendListView", 2, "onGetRecommendedList ");
    }
    if (RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView) == 1)
    {
      if (RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView)) {
        RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView);
      }
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.c();
      if (!paramBoolean1) {
        jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.a(2131367317, 1);
      }
      Object localObject = (PhoneContactManagerImp)jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
      localObject = jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.getActivity();
      if ((localObject instanceof ContactRecommendActivity))
      {
        ((ContactRecommendActivity)localObject).a();
        if (QLog.isColorLevel()) {
          QLog.d("RecommendListView", 2, "onGetRecommendedList startMainActivity");
        }
      }
    }
  }
}
