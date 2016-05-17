import android.content.Context;
import android.content.res.Resources;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.contact.newfriend.BaseNewFriendView.INewFriendContext;
import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder;
import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgListView;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.SystemMessageProcessor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBEnumField;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.systemmsg.FriendSystemMsgController;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import java.util.List;
import tencent.mobileim.structmsg.structmsg.AddFrdSNInfo;
import tencent.mobileim.structmsg.structmsg.StructMsg;
import tencent.mobileim.structmsg.structmsg.SystemMsg;
import tencent.mobileim.structmsg.structmsg.SystemMsgAction;
import tencent.mobileim.structmsg.structmsg.SystemMsgActionInfo;

public class lsu
  implements View.OnClickListener
{
  public lsu(SystemMsgListView paramSystemMsgListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (!NetworkUtil.e(SystemMsgListView.a(a)))
    {
      QQToast.a(SystemMsgListView.a(a), SystemMsgListView.a(a).getResources().getString(2131367213), 0).b(a.a());
      return;
    }
    paramView = (SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder)paramView.getTag();
    SystemMsgListView.a(a, (structmsg.StructMsg)jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.get(), c);
    if (jdField_a_of_type_Int == 64525) {
      ((FriendListHandler)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1)).a(0, Long.parseLong(jdField_a_of_type_JavaLangString), 0L, null, (byte)0, jdField_b_of_type_JavaLangString, jdField_b_of_type_Long, jdField_a_of_type_Long);
    }
    Object localObject;
    for (int i = 1;; i = 1)
    {
      if (i != 0) {
        a.jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.c();
      }
      ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "frd_recommend", "Frd_accept", 0, 0, "1", "", "", "");
      return;
      long l1 = FriendSystemMsgController.a().b();
      paramView = FriendSystemMsgController.a().a(Long.valueOf(l1));
      if (paramView == null) {
        break label471;
      }
      i = msg_type.get();
      l1 = msg_seq.get();
      long l2 = req_uin.get();
      int j = msg.sub_type.get();
      int k = msg.src_id.get();
      int m = msg.sub_src_id.get();
      int n = msg.group_msg_type.get();
      localObject = msg.actions.get();
      if ((localObject == null) || (((List)localObject).size() <= 0)) {
        break;
      }
      localObject = (structmsg.SystemMsgActionInfo)get0action_info.get();
      remark.set("");
      group_id.set(0);
      structmsg.AddFrdSNInfo localAddFrdSNInfo = new structmsg.AddFrdSNInfo();
      uint32_not_see_dynamic.set(0);
      uint32_set_sn.set(0);
      addFrdSNInfo.set(localAddFrdSNInfo);
      a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(i, l1, l2, j, k, m, n, (structmsg.SystemMsgActionInfo)localObject, 0, paramView, false);
    }
    paramView = new StringBuilder().append("agree, ");
    if (localObject != null)
    {
      i = ((List)localObject).size();
      label446:
      QLog.d("Q.newfriendSystemMsgListView", 1, i);
    }
    for (;;)
    {
      i = 0;
      break;
      i = -1;
      break label446;
      label471:
      QLog.d("Q.newfriendSystemMsgListView", 1, "agree");
    }
  }
}
