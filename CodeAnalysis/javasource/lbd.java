import android.app.Activity;
import android.app.Dialog;
import android.graphics.drawable.ColorDrawable;
import android.os.Handler;
import android.support.v4.app.FragmentActivity;
import android.view.Window;
import com.tencent.biz.pubaccount.util.PAReportUtil;
import com.tencent.biz.pubaccount.util.PAReportUtil.AdverInfo;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivity;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.item.StructingMsgItemBuilder;
import com.tencent.mobileqq.app.DynamicMsgInfoManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.transfile.StructLongMessageDownloadProcessor;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.widget.PopupMenuDialog.MenuItem;
import com.tencent.widget.PopupMenuDialog.OnClickActionListener;
import java.util.ArrayList;
import org.json.JSONException;
import org.json.JSONObject;

public class lbd
  implements PopupMenuDialog.OnClickActionListener
{
  public lbd(StructingMsgItemBuilder paramStructingMsgItemBuilder, Activity paramActivity, ChatMessage paramChatMessage, AbsStructMsg paramAbsStructMsg, String paramString, ArrayList paramArrayList)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(PopupMenuDialog.MenuItem paramMenuItem)
  {
    Object localObject = new Dialog(jdField_a_of_type_AndroidAppActivity);
    ((Dialog)localObject).requestWindowFeature(1);
    ((Dialog)localObject).getWindow().setBackgroundDrawable(new ColorDrawable(0));
    ((Dialog)localObject).setContentView(2130903466);
    ((Dialog)localObject).show();
    new Handler(jdField_a_of_type_AndroidAppActivity.getMainLooper()).postDelayed(new lbe(this, (Dialog)localObject), 1500L);
    ChatActivityFacade.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataChatMessage);
    int i;
    if ((((jdField_a_of_type_AndroidAppActivity instanceof SplashActivity)) || ((jdField_a_of_type_AndroidAppActivity instanceof ChatActivity))) && (((FragmentActivity)jdField_a_of_type_AndroidAppActivity).getChatFragment() != null) && (((FragmentActivity)jdField_a_of_type_AndroidAppActivity).getChatFragment().a() != null))
    {
      ((FragmentActivity)jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_AndroidContentContext).getChatFragment().a().a(jdField_a_of_type_ComTencentMobileqqDataChatMessage);
      if (MsgProxyUtils.b(jdField_a_of_type_ComTencentMobileqqDataChatMessage)) {
        ((DynamicMsgInfoManager)jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(99)).b(MsgProxyUtils.b(jdField_a_of_type_ComTencentMobileqqDataChatMessage));
      }
      if ((StructLongMessageDownloadProcessor.b(jdField_a_of_type_ComTencentMobileqqDataChatMessage)) && ((jdField_a_of_type_ComTencentMobileqqDataChatMessage instanceof MessageForStructing)))
      {
        localObject = (MessageForStructing)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
        StructLongMessageDownloadProcessor.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, uniseq);
      }
      i = jdField_a_of_type_Int;
      if (jdField_a_of_type_ComTencentMobileqqStructmsgAbsStructMsg == null) {
        break label547;
      }
    }
    label547:
    for (long l = jdField_a_of_type_ComTencentMobileqqStructmsgAbsStructMsg.msgId;; l = 0L)
    {
      i = jdField_a_of_type_Int;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", jdField_a_of_type_JavaLangString, "0X8006320", "0X8006320", 0, 0, "" + l, "", "" + (i + 1), jdField_a_of_type_JavaLangString);
      if (jdField_a_of_type_JavaUtilArrayList.size() <= jdField_a_of_type_Int)
      {
        return;
        jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqDataChatMessage, false);
        return;
      }
      localObject = (PAReportUtil.AdverInfo)jdField_a_of_type_JavaUtilArrayList.get(jdField_a_of_type_Int);
      paramMenuItem = new JSONObject();
      try
      {
        paramMenuItem.put("puin", jdField_a_of_type_JavaLangString);
        paramMenuItem.put("type", b);
        paramMenuItem.put("index", c);
        paramMenuItem.put("name", d);
        paramMenuItem.put("net", e);
        paramMenuItem.put("mobile_imei", DeviceInfoUtil.a());
        paramMenuItem.put("obj", "");
        paramMenuItem.put("gdt_cli_data", jdField_a_of_type_ComTencentMobileqqDataChatMessage.getExtInfoFromExtStr("gdt_msgClick"));
        PAReportUtil.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataChatMessage.selfuin, paramMenuItem.toString(), "" + l);
        return;
      }
      catch (JSONException localJSONException)
      {
        for (;;)
        {
          localJSONException.printStackTrace();
        }
      }
    }
  }
}
