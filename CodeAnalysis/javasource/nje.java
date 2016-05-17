import android.os.Handler;
import com.tencent.mobileqq.app.message.BaseMessageManagerForTroopAndDisc;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.RefreshMessageContext;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.Iterator;
import java.util.List;

public class nje
  implements Runnable
{
  public nje(BaseMessageManagerForTroopAndDisc paramBaseMessageManagerForTroopAndDisc, QQMessageFacade.RefreshMessageContext paramRefreshMessageContext, String paramString, int paramInt, long paramLong, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManagerForTroopAndDisc.b(jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext);
    int j = 0;
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManagerForTroopAndDisc.a(jdField_a_of_type_JavaLangString, jdField_a_of_type_Int);
    ChatMessage localChatMessage;
    if (localObject != null)
    {
      localObject = ((List)localObject).iterator();
      do
      {
        if (!((Iterator)localObject).hasNext()) {
          break;
        }
        localChatMessage = (ChatMessage)((Iterator)localObject).next();
      } while (MsgProxyUtils.q(msgtype));
    }
    for (int i = (int)shmsgseq;; i = 0)
    {
      if (i <= jdField_a_of_type_Long + 1L) {}
      for (boolean bool = true; (j == i) || (i <= jdField_a_of_type_Long); bool = false)
      {
        if ((bool) && (jdField_a_of_type_Boolean)) {
          BaseMessageManagerForTroopAndDisc.a(jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManagerForTroopAndDisc, jdField_a_of_type_Int, jdField_a_of_type_JavaLangString, jdField_a_of_type_Long, jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManagerForTroopAndDisc.a(jdField_a_of_type_JavaLangString, jdField_a_of_type_Int));
        }
        jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.g = bool;
        jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManagerForTroopAndDisc.a.a(jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext);
        jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManagerForTroopAndDisc.a.a.post(new njf(this));
        return;
      }
      int k = (int)(i - jdField_a_of_type_Long);
      j = k;
      if (jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManagerForTroopAndDisc.a(jdField_a_of_type_JavaLangString, jdField_a_of_type_Int, k).size() != k)
      {
        j = k;
        if (k > 15) {
          j = 15;
        }
      }
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.d = j;
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.jdField_a_of_type_Int = 0;
      jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManagerForTroopAndDisc.b(jdField_a_of_type_JavaLangString, jdField_a_of_type_Int, j, jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext);
      j = i;
      break;
    }
  }
}
