import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.tips.QQOperateTips;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.config.operation.QQOperateManager;
import com.tencent.mobileqq.config.operation.QQOperationRequestInfo;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.List;

public class lnb
  implements Runnable
{
  public lnb(QQOperateTips paramQQOperateTips)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject1 = QQOperateTips.a(a).a().a(aa).jdField_a_of_type_JavaLangString, aa).jdField_a_of_type_Int);
    int j = ((List)localObject1).size();
    Object localObject2;
    int i;
    if ((localObject1 != null) && (j > 0))
    {
      localObject2 = (ChatMessage)((List)localObject1).get(j - 1);
      if (localObject2 != null)
      {
        if (aa).jdField_a_of_type_Int != 0) {
          break label328;
        }
        QQOperateTips.a(a, time);
        QQOperateTips.b(a, uniseq);
      }
      if (QQOperateTips.a(a).a().a(aa).jdField_a_of_type_JavaLangString, aa).jdField_a_of_type_Int) <= 0) {
        break label360;
      }
      i = 1;
      label145:
      if (i != 0) {
        i = j;
      }
    }
    for (;;)
    {
      if (i > 0)
      {
        localObject2 = (ChatMessage)((List)localObject1).get(i - 1);
        if ((localObject2 == null) || (!isread)) {}
      }
      else
      {
        if (QLog.isDevelopLevel()) {
          QLog.d("QQOperateVoIP", 4, " from aio open .. unreadMsg index = " + QQOperateTips.a(a));
        }
        localObject2 = QQOperateManager.a(QQOperateTips.a(a));
        localObject1 = ((QQOperateManager)localObject2).a(aa).jdField_a_of_type_JavaLangString, aa).jdField_a_of_type_Int, QQOperateTips.a(a), (List)localObject1, true, QQOperateTips.a(a));
        if (jdField_a_of_type_Boolean)
        {
          localObject1 = jdField_a_of_type_JavaUtilArrayList;
          ((QQOperateManager)localObject2).a(aa).jdField_a_of_type_JavaLangString, aa).jdField_a_of_type_Int, (ArrayList)localObject1, QQOperateTips.a(a));
        }
        QQOperateTips.a(a, -1);
        return;
        label328:
        if (aa).jdField_a_of_type_Int != 3000) {
          break;
        }
        QQOperateTips.a(a, shmsgseq);
        break;
        label360:
        i = 0;
        break label145;
      }
      QQOperateTips.a(a, i - 1);
      i -= 1;
    }
  }
}
