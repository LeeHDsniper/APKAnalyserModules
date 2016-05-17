import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.ViewGroup;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivity;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.item.StructingMsgItemBuilder;
import com.tencent.mobileqq.activity.aio.item.StructingMsgItemBuilder.DynamicMsgViewCache;
import com.tencent.mobileqq.activity.aio.item.StructingMsgItemBuilder.StructingMsgViewHolder;
import com.tencent.mobileqq.activity.aio.item.StructingMsgItemBuilder.ViewCache;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.structmsg.StructMsgForGeneralShare;
import com.tencent.widget.AbsListView.RecyclerListener;

public class lax
  implements AbsListView.RecyclerListener
{
  public lax(StructingMsgItemBuilder paramStructingMsgItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void b(View paramView)
  {
    if (paramView == null) {}
    Object localObject1;
    Object localObject2;
    do
    {
      do
      {
        do
        {
          do
          {
            do
            {
              return;
              localObject1 = AIOUtils.a(paramView);
            } while (!StructingMsgItemBuilder.StructingMsgViewHolder.class.isInstance(localObject1));
            localObject1 = (StructingMsgItemBuilder.StructingMsgViewHolder)localObject1;
          } while ((!StructingMsgItemBuilder.StructingMsgViewHolder.class.isInstance(localObject1)) || (jdField_a_of_type_AndroidWidgetRelativeLayout == null) || (!MessageForStructing.class.isInstance(jdField_a_of_type_ComTencentMobileqqDataChatMessage)) || (jdField_a_of_type_ComTencentMobileqqDataChatMessage == null) || (!(jdField_a_of_type_ComTencentMobileqqDataChatMessage instanceof MessageForStructing)));
          localObject1 = (MessageForStructing)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
        } while ((structingMsg == null) || (!(structingMsg instanceof StructMsgForGeneralShare)) || ((!(a.a instanceof ChatActivity)) && (!(a.a instanceof SplashActivity))));
        if (!structingMsg).isDynamicMsg) {
          break;
        }
        localObject2 = a.a).getChatFragment().a()).a;
        localObject1 = structingMsg).dynamicMsgMergeKey;
      } while (localObject2 == null);
      ((StructingMsgItemBuilder.DynamicMsgViewCache)localObject2).onMovedToScrapHeap((String)localObject1, (ViewGroup)paramView.findViewById(2131296325));
      return;
      localObject2 = ((FragmentActivity)a.a).getChatFragment().a().a();
      localObject1 = ((StructMsgForGeneralShare)structingMsg).getLayoutStr();
    } while (localObject2 == null);
    ((StructingMsgItemBuilder.ViewCache)localObject2).a((String)localObject1, (ViewGroup)paramView.findViewById(2131296325));
  }
}
