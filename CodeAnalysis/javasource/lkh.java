import android.support.v4.app.FragmentActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.DynamicMsgInfoManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lkh
  implements Runnable
{
  public lkh(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    DynamicMsgInfoManager localDynamicMsgInfoManager = (DynamicMsgInfoManager)a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.app.getManager(99);
    if (localDynamicMsgInfoManager != null)
    {
      localDynamicMsgInfoManager.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
      localDynamicMsgInfoManager.c(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    }
  }
}
