import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.aio.photo.AIOImageProviderService;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import mqq.app.AccountNotMatchException;

public class leg
  implements Runnable
{
  public leg(AIOImageProviderService paramAIOImageProviderService, long paramLong, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageProviderService.a;
    int i;
    if (localObject1 != null)
    {
      i = ((List)localObject1).size();
      if (i != 0) {}
    }
    else
    {
      return;
      break label44;
      break label44;
    }
    label44:
    do
    {
      do
      {
        localObject2 = new ArrayList(i);
        ((ArrayList)localObject2).addAll((Collection)localObject1);
        localObject1 = ((ArrayList)localObject2).iterator();
      } while (!((Iterator)localObject1).hasNext());
      Object localObject2 = (ChatMessage)((Iterator)localObject1).next();
      if (!MessageForPic.class.isInstance(localObject2)) {
        break;
      }
      localObject2 = (MessageForPic)localObject2;
      if ((localObject2 == null) || (uniseq != jdField_a_of_type_Long) || (subMsgId != jdField_a_of_type_Int)) {
        break;
      }
      try
      {
        if (QLog.isColorLevel()) {
          QLog.d("AIOImageProviderService", 2, "payFlow,id:" + jdField_a_of_type_Long + ",subId:" + jdField_a_of_type_Int);
        }
        localObject1 = (QQAppInterface)BaseApplicationImpl.a.getAppRuntime(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageProviderService.b);
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageProviderService.a((QQAppInterface)localObject1, (MessageForPic)localObject2);
        return;
      }
      catch (AccountNotMatchException localAccountNotMatchException) {}
    } while (!QLog.isColorLevel());
    QLog.d("AIOImageProviderService", 2, "no appRuntime");
  }
}
