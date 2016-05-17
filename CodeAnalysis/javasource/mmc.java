import com.tencent.mobileqq.activity.selectmember.RenMaiQuanMemberListInnerFrame;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.app.CircleManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.circle.IGroupObserver;

public class mmc
  implements IGroupObserver
{
  public mmc(RenMaiQuanMemberListInnerFrame paramRenMaiQuanMemberListInnerFrame)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean, int paramInt)
  {
    if (paramInt == 2) {
      a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.n();
    }
    if (paramBoolean)
    {
      a.jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(a.jdField_a_of_type_Int, a.jdField_a_of_type_JavaUtilArrayList, false);
      a.jdField_a_of_type_Mmd.notifyDataSetChanged();
    }
  }
}
