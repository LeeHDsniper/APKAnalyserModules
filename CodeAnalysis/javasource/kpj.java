import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.qphone.base.util.BaseApplication;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public final class kpj
  implements Runnable
{
  public kpj(QQAppInterface paramQQAppInterface, int paramInt, String paramString, long paramLong)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface == null) {}
    do
    {
      do
      {
        return;
        if (jdField_a_of_type_Int != 1) {
          break;
        }
        localObject = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(jdField_a_of_type_JavaLangString);
      } while (localObject == null);
      HashMap localHashMap = new HashMap(3);
      localHashMap.put("m_num", wMemberNum + "");
      StatisticCollector.a(BaseApplication.getContext()).a(null, "AIOWebTC", false, 0L, 0L, localHashMap, "", false);
      localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_JavaLangString, jdField_a_of_type_Int);
    } while (localObject == null);
    Object localObject = ((List)localObject).iterator();
    do
    {
      if (!((Iterator)localObject).hasNext()) {
        break;
      }
    } while (nextmsgUid != jdField_a_of_type_Long);
    for (int i = 1;; i = 2)
    {
      localObject = new HashMap(3);
      ((HashMap)localObject).put("m_i", i + "");
      StatisticCollector.a(BaseApplication.getContext()).a(null, "AIOWebmsgposition", false, 0L, 0L, (HashMap)localObject, "", false);
      return;
    }
  }
}
