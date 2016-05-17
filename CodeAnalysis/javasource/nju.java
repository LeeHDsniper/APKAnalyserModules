import OnlinePushPack.MsgInfo;
import android.text.TextUtils;
import android.util.Pair;
import com.tencent.mobileqq.app.message.DiscMessageProcessor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.TimerTask;

public class nju
  extends TimerTask
{
  public nju(DiscMessageProcessor paramDiscMessageProcessor, ArrayList paramArrayList, long paramLong1, long paramLong2, String paramString, MsgInfo paramMsgInfo, long paramLong3)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (jdField_a_of_type_JavaUtilArrayList.contains(Long.valueOf(jdField_a_of_type_Long)))
    {
      jdField_a_of_type_JavaUtilArrayList.remove(Long.valueOf(jdField_a_of_type_Long));
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.DiscMsgPc.discuss", 2, "陌生人uin包括自己,移出");
      }
    }
    if (jdField_a_of_type_JavaUtilArrayList.size() != 0)
    {
      StringBuilder localStringBuilder = new StringBuilder(jdField_a_of_type_JavaUtilArrayList.size() * 8);
      int i = 0;
      if (i < jdField_a_of_type_JavaUtilArrayList.size())
      {
        String str2 = (String)jdField_a_of_type_JavaUtilArrayList.get(i)).second;
        String str1 = str2;
        if (TextUtils.isEmpty(str2))
        {
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.DiscMsgPc.discuss", 2, "coptype 9 server showName empty");
          }
          str1 = ContactUtils.c(jdField_a_of_type_ComTencentMobileqqAppMessageDiscMessageProcessor.a, String.valueOf(b), String.valueOf(jdField_a_of_type_JavaUtilArrayList.get(i)));
        }
        if (i == 0) {
          localStringBuilder.append(str1);
        }
        for (;;)
        {
          i += 1;
          break;
          localStringBuilder.append("、" + str1);
        }
      }
      localStringBuilder.append(jdField_a_of_type_JavaLangString);
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.DiscMsgPc.discuss", 2, "show yinsi tips" + localStringBuilder.toString());
      }
      DiscMessageProcessor.a(jdField_a_of_type_ComTencentMobileqqAppMessageDiscMessageProcessor, jdField_a_of_type_OnlinePushPackMsgInfo, jdField_a_of_type_Long, b, c, localStringBuilder.toString());
    }
  }
}
