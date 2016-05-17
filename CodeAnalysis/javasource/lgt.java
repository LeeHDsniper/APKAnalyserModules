import android.content.Intent;
import android.support.v4.app.FragmentActivity;
import com.tencent.mobileqq.activity.aio.rebuild.FriendChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.VipUtils;

public class lgt
  implements Runnable
{
  public lgt(FriendChatPie paramFriendChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getStringExtra("uin"), a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getIntExtra("uintype", 0)).time < FriendChatPie.a(a)) {
      VipUtils.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "chat_history", "FriendAIO", "SilentCare", 0, 0, new String[] { a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getStringExtra("uin") });
    }
  }
}
