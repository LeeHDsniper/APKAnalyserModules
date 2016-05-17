import android.content.Intent;
import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.BaseApplication;

class lva
  implements Runnable
{
  lva(luz paramLuz, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_Luz.jdField_a_of_type_ComTencentMobileqqActivityMainMainAssistObserver.a(32, 16, Integer.valueOf(jdField_a_of_type_Int));
    Intent localIntent = new Intent("com.tencent.qq.syncQQMessage");
    jdField_a_of_type_Luz.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().sendBroadcast(localIntent);
  }
}
