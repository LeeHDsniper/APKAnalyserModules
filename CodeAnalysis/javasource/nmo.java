import android.os.Message;
import com.tencent.mobileqq.activity.ChatHistoryForC2C;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.utils.MessageRoamHandler;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.Calendar;
import mqq.os.MqqHandler;

class nmo
  implements Runnable
{
  nmo(nmn paramNmn, long paramLong, int paramInt, String paramString, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int i = 0;
    Object localObject = Calendar.getInstance();
    ((Calendar)localObject).setTimeInMillis(jdField_a_of_type_Long * 1000L);
    if (QLog.isColorLevel()) {
      QLog.d("Q.roammsg", 2, "fetchMoreRoamMessage begin fetchNum: " + jdField_a_of_type_Int);
    }
    if (jdField_a_of_type_Nmn.a.a(jdField_a_of_type_JavaLangString, (Calendar)localObject, jdField_a_of_type_Boolean, jdField_a_of_type_Int)) {}
    do
    {
      return;
      localObject = jdField_a_of_type_Nmn.a.b.a(ChatHistoryForC2C.class);
    } while (localObject == null);
    Message localMessage = ((MqqHandler)localObject).obtainMessage(0);
    obj = Long.valueOf(jdField_a_of_type_Long);
    if (jdField_a_of_type_Boolean) {
      i = 1;
    }
    arg1 = i;
    ((MqqHandler)localObject).sendMessageDelayed(localMessage, 0L);
  }
}
