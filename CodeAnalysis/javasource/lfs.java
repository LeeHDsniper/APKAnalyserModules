import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.BusinessCmrTmpChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lfs
  implements View.OnClickListener
{
  public lfs(BusinessCmrTmpChatPie paramBusinessCmrTmpChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = paramView.getTag();
    if ((paramView == null) || (!(paramView instanceof Integer))) {
      return;
    }
    String str = a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
    switch (((Integer)paramView).intValue())
    {
    default: 
      return;
    case 1: 
      ChatActivityUtils.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, str, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.e, true);
      return;
    case 2: 
      ChatActivityUtils.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, str, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.e, false);
      return;
    }
    a.au();
  }
}
