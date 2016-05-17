import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.DatalineMessageManager;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.app.proxy.DataLineMsgProxy;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.DataLineMsgRecord;
import com.tencent.mobileqq.data.DataLineMsgSet;
import com.tencent.mobileqq.data.DataLineMsgSetList;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import java.util.Map;

public class njt
  implements Runnable
{
  public njt(DatalineMessageManager paramDatalineMessageManager, DataLineMsgSet paramDataLineMsgSet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    boolean bool = false;
    Object localObject1;
    int i;
    if (jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.a().a(jdField_a_of_type_ComTencentMobileqqDataDataLineMsgSet) > 0)
    {
      localObject1 = MsgProxyUtils.a(String.valueOf(jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.b), jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.jdField_a_of_type_Int);
      if (!jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.containsKey(localObject1)) {
        break label375;
      }
      bool = jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.get(localObject1)).hasReply;
      i = jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.get(localObject1)).counter;
      jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.remove(localObject1);
    }
    for (;;)
    {
      long l = jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.a().a().size();
      if (l > 0L)
      {
        localObject2 = jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.a().a();
        localObject1 = localObject2;
        if (msgtype == 60536)
        {
          localObject1 = localObject2;
          if (l > 1L) {
            localObject1 = jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.a().a().get((int)(l - 2L)).getLastItem();
          }
        }
        localObject2 = new QQMessageFacade.Message();
        if (localObject1 != null)
        {
          MessageRecord.copyMessageRecordBaseField((MessageRecord)localObject2, (MessageRecord)localObject1);
          emoRecentMsg = null;
          counter = i;
          hasReply = bool;
          jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a((QQMessageFacade.Message)localObject2);
          jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.put(MsgProxyUtils.a(String.valueOf(jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.b), jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.jdField_a_of_type_Int), localObject2);
        }
      }
      Object localObject2 = jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
      localObject1 = jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
      localObject2 = ((RecentUserProxy)localObject2).a(String.valueOf(jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.b), jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.jdField_a_of_type_Int);
      ((EntityManager)localObject1).a();
      if (localObject2 != null) {
        jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(localObject2);
      }
      return;
      label375:
      i = 0;
    }
  }
}
