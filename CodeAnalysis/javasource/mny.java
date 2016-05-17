import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.activity.selectmember.TroopMemberListInnerFrame;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

class mny
  implements Runnable
{
  mny(mnx paramMnx)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    try
    {
      if (QLog.isColorLevel()) {
        QLog.d("TroopMemberListInnerFrame", 2, "read troop members from database after updating data from server");
      }
      a.a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getSharedPreferences("last_update_time" + a.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0).edit().putLong("key_last_update_time" + a.a.b, System.currentTimeMillis()).commit();
      a.a.jdField_a_of_type_AndroidOsHandler.removeMessages(1);
      Object localObject = TroopMemberListInnerFrame.a(a.a, a.a.b);
      localObject = a.a.jdField_a_of_type_AndroidOsHandler.obtainMessage(2, localObject);
      a.a.jdField_a_of_type_AndroidOsHandler.sendMessage((Message)localObject);
      return;
    }
    catch (Exception localException) {}
  }
}
