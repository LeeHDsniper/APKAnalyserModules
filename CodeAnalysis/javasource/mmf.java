import com.tencent.mobileqq.activity.selectmember.RenMaiQuanTeamListInnerFrame;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.app.CircleManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.circle.IGroupObserver;

public class mmf
  implements IGroupObserver
{
  public mmf(RenMaiQuanTeamListInnerFrame paramRenMaiQuanTeamListInnerFrame)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean, int paramInt)
  {
    if (paramBoolean)
    {
      a.jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(a.jdField_a_of_type_JavaUtilArrayList);
      RenMaiQuanTeamListInnerFrame.a(a).notifyDataSetChanged();
    }
    if (paramInt == 2) {
      a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.n();
    }
  }
}
