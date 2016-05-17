import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;
import java.util.List;

public class ljk
  implements Runnable
{
  public ljk(PublicAccountChatPie paramPublicAccountChatPie, String paramString, int paramInt, long paramLong1, long paramLong2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    List localList = jdField_a_of_type_ComTencentMobileqqActivityAioRebuildPublicAccountChatPie.a.a().b(jdField_a_of_type_JavaLangString, jdField_a_of_type_Int);
    boolean bool2 = false;
    boolean bool1 = bool2;
    int i;
    if (localList != null)
    {
      bool1 = bool2;
      if (!localList.isEmpty()) {
        i = localList.size() - 1;
      }
    }
    for (;;)
    {
      bool1 = bool2;
      if (i >= 0)
      {
        if ((getmsgUid == jdField_a_of_type_Long) && (getshmsgseq == b)) {
          bool1 = true;
        }
      }
      else
      {
        StatisticCollector.a(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildPublicAccountChatPie.a.a(), "show_msg_result", bool1, 0L, 0L, new HashMap(), "");
        if (QLog.isColorLevel()) {
          QLog.d("Q.aio.BaseChatPie", 2, "reportShowMsgResult uin = " + jdField_a_of_type_JavaLangString + " , type = " + jdField_a_of_type_Int + " , msguid = " + jdField_a_of_type_Long + " , result = " + bool1);
        }
        if ((!bool1) && (QLog.isColorLevel())) {
          QLog.d("Q.aio.BaseChatPie", 2, "lost msg uin = " + jdField_a_of_type_JavaLangString + " , type = " + jdField_a_of_type_Int + " , msguid = " + jdField_a_of_type_Long + " , msgseq = " + b);
        }
        return;
      }
      i -= 1;
    }
  }
}
