import android.view.View;
import com.tencent.mobileqq.activity.aio.ChatAdapter1.AdapterGetViewListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.PublicAccountHandler;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ljx
  implements ChatAdapter1.AdapterGetViewListener
{
  public ljx(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, View paramView)
  {
    if ((paramInt != 0) || (!a.M) || (!a.N) || (a.jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler == null) || (!a.jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler.jdField_a_of_type_Boolean)) {}
    for (;;)
    {
      return;
      if (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo != null) {}
      try
      {
        if (Long.parseLong(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a) == a.jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler.jdField_a_of_type_Long)
        {
          a.P = true;
          a.jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler.jdField_a_of_type_Boolean = false;
          a.jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler.jdField_a_of_type_Long = 0L;
        }
        if (!a.P) {
          continue;
        }
        if ((paramView != null) && (paramView.getLayoutParams() != null)) {
          getLayoutParamsheight = 1;
        }
        a.aG();
        a.aH();
        return;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          localException.printStackTrace();
        }
      }
    }
  }
}
