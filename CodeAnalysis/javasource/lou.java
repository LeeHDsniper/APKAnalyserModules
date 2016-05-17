import com.tencent.mobileqq.activity.contact.CircleMemberListActivity;
import com.tencent.mobileqq.app.CircleManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.circle.IGroupObserver;

public class lou
  implements IGroupObserver
{
  public lou(CircleMemberListActivity paramCircleMemberListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean, int paramInt)
  {
    if (paramInt == 2) {
      CircleMemberListActivity.a(a);
    }
    if (paramBoolean)
    {
      a.jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(a.b, a.jdField_a_of_type_JavaUtilArrayList, false);
      a.jdField_a_of_type_Loz.notifyDataSetChanged();
    }
  }
}
