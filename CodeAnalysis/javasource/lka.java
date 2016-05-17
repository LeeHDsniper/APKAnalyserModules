import android.view.View;
import android.widget.FrameLayout;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class lka
  implements Runnable
{
  public lka(PublicAccountChatPie paramPublicAccountChatPie, FrameLayout paramFrameLayout)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.delmsg", 2, "hor anim onAnimationEnd() is called,time is:" + System.currentTimeMillis());
    }
    jdField_a_of_type_AndroidWidgetFrameLayout.setVisibility(8);
    if (jdField_a_of_type_ComTencentMobileqqActivityAioRebuildPublicAccountChatPie.h != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioRebuildPublicAccountChatPie.h.setVisibility(0);
      jdField_a_of_type_ComTencentMobileqqActivityAioRebuildPublicAccountChatPie.h = null;
    }
  }
}
