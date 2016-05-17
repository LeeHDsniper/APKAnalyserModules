import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder;
import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgListView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBEnumField;
import tencent.mobileim.structmsg.structmsg.StructMsg;

public class lst
  implements View.OnClickListener
{
  public lst(SystemMsgListView paramSystemMsgListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = (SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder)paramView.getTag();
    if (a.msg_type.get() == 1) {
      a.a(paramView);
    }
  }
}
