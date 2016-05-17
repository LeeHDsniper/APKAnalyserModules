import android.os.SystemClock;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivity;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.item.ShakeItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForShakeWindow;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class lab
  implements View.OnClickListener
{
  public lab(ShakeItemBuilder paramShakeItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.shakemsg", 2, "shake msg onClick() is called");
    }
    AIOUtils.l = true;
    if (ShakeItemBuilder.a(a)) {
      return;
    }
    if (SystemClock.uptimeMillis() - ShakeItemBuilder.a(a) < 3000L)
    {
      QLog.d("Q.msg.shakemsg", 2, "shake return cause:too much click in a very short time!");
      return;
    }
    paramView = (MessageForShakeWindow)AIOUtils.a(paramView);
    if (((a.jdField_a_of_type_AndroidContentContext instanceof ChatActivity)) || ((a.jdField_a_of_type_AndroidContentContext instanceof SplashActivity)))
    {
      FragmentActivity localFragmentActivity = (FragmentActivity)a.jdField_a_of_type_AndroidContentContext;
      ShakeItemBuilder.a(a, SystemClock.uptimeMillis());
      localFragmentActivity.getChatFragment().a().ac();
      a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(frienduin, false);
      return;
    }
    a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(frienduin, false);
  }
}
