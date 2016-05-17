import android.os.Bundle;
import android.view.View;
import com.tencent.mobileqq.activity.aio.ChatAdapter1;
import com.tencent.mobileqq.activity.aio.item.StructingMsgItemBuilder.DynamicMsgViewCache;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.structmsg.StructMsgForGeneralShare;
import java.util.Iterator;
import java.util.List;

public class lkl
  implements Runnable
{
  public lkl(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Iterator localIterator = a.jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a().iterator();
    while (localIterator.hasNext())
    {
      Object localObject = (ChatMessage)localIterator.next();
      if (MessageForStructing.class.isInstance(localObject))
      {
        localObject = structingMsg;
        if (StructMsgForGeneralShare.class.isInstance(localObject))
        {
          localObject = (StructMsgForGeneralShare)localObject;
          if (isDynamicMsg)
          {
            if (a.jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder$DynamicMsgViewCache == null) {
              a.jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder$DynamicMsgViewCache = new StructingMsgItemBuilder.DynamicMsgViewCache();
            }
            if (a.jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder$DynamicMsgViewCache.get(dynamicMsgMergeKey) == null)
            {
              View localView = ((StructMsgForGeneralShare)localObject).getView(a.jdField_a_of_type_AndroidContentContext, null, a.jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a(), new Bundle());
              if (a.jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder$DynamicMsgViewCache.get(dynamicMsgMergeKey) == null) {
                a.jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder$DynamicMsgViewCache.put(dynamicMsgMergeKey, localView, null);
              }
            }
          }
        }
      }
    }
  }
}
