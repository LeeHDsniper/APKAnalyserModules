import com.tencent.mobileqq.activity.aio.rebuild.HotChatPie;
import com.tencent.mobileqq.data.MessageForPtt;
import com.tencent.mobileqq.hotchat.PttShowRoomMng;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.Iterator;
import java.util.List;

public class lhi
  implements Runnable
{
  public lhi(HotChatPie paramHotChatPie, List paramList, PttShowRoomMng paramPttShowRoomMng)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
    while (localIterator.hasNext())
    {
      MessageForPtt localMessageForPtt = (MessageForPtt)localIterator.next();
      jdField_a_of_type_ComTencentMobileqqHotchatPttShowRoomMng.a(localMessageForPtt);
    }
  }
}
