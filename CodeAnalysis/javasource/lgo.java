import android.os.Looper;
import android.support.v4.app.FragmentActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.DiscussChatPie;
import com.tencent.mobileqq.app.MessageHandler.MsgSendCostParams;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.TroopInfoManager;
import com.tencent.mobileqq.multimsg.MultiMsgManager;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.troop.data.TroopAioTips;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.utils.SendMessageHandler;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import java.util.List;

public class lgo
  extends MessageObserver
{
  public lgo(DiscussChatPie paramDiscussChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void c(String paramString)
  {
    try
    {
      if (!a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isFinishing()) {
        DialogUtil.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, 230, "发送失败", a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367724), new lgr(this, paramString), null).show();
      }
      return;
    }
    catch (Throwable paramString)
    {
      QLog.e("DiscussChatPie", 1, "ERR!! send_discussion_msg_failed_not_member:" + paramString.getMessage());
    }
  }
  
  protected void a(String paramString1, int paramInt1, int paramInt2, SendMessageHandler paramSendMessageHandler, long paramLong1, long paramLong2, String paramString2)
  {
    if ((paramString1 == null) || (!paramString1.equals(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) || (paramInt1 != a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int))
    {
      if (QLog.isColorLevel()) {
        QLog.d("DiscussChatPie", 2, "onUpdateSendMsgError exception uin " + paramString1 + " type " + paramInt1 + " uniseq " + paramLong2);
      }
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("DiscussChatPie", 2, "onUpdateSendMsgError uin " + paramString1 + " type " + paramInt1 + " uniseq " + paramLong2);
    }
    if ((paramInt1 == 1) || (paramInt1 == 3000) || (paramInt1 == 0))
    {
      paramSendMessageHandler = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString1, paramInt1, paramLong2);
      if ((paramSendMessageHandler != null) && ((paramSendMessageHandler instanceof MessageForStructing)) && ("viewMultiMsg".equals(structingMsg.mMsgAction))) {
        MultiMsgManager.a().a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString1, paramInt1, paramLong2, false);
      }
    }
    if (paramInt1 == 3000) {
      switch (paramInt2)
      {
      }
    }
    for (;;)
    {
      a.a(196608);
      return;
      QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, 2131367721, 1).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
      continue;
      QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, 2131367722, 1).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
      continue;
      DialogUtil.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, 230, "发送失败", a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131369193), new lgp(this, paramString1), null).show();
      continue;
      if (Looper.myLooper() != Looper.getMainLooper()) {
        a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.runOnUiThread(new lgq(this, paramString1));
      } else {
        c(paramString1);
      }
    }
  }
  
  protected void a(boolean paramBoolean, String paramString)
  {
    a(paramBoolean, paramString, null);
  }
  
  protected void a(boolean paramBoolean, String paramString, MessageHandler.MsgSendCostParams paramMsgSendCostParams)
  {
    MultiMsgManager.a().b("send struct msg  ");
    MultiMsgManager.a().c();
    MultiMsgManager.a().a("all cost time ");
    if ((paramString == null) || (paramString.length() == 0)) {}
    while (!paramString.equals(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
      return;
    }
    a.p = true;
    a.a(131072, paramMsgSendCostParams);
  }
  
  public void a(boolean paramBoolean1, List paramList, boolean paramBoolean2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("DiscussChatPie", 2, "onMsgRevokeNotice:" + paramBoolean1);
    }
    if (!paramBoolean1) {
      return;
    }
    if ((paramList != null) && (!paramList.isEmpty()))
    {
      Object localObject = (MessageRecord)paramList.get(0);
      if (a.jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null)
      {
        int i = a.jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a();
        if (i != -1)
        {
          TroopInfoManager localTroopInfoManager = (TroopInfoManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(36);
          long l = localTroopInfoManager.b(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString + "&" + 3000);
          if (uniseq == l)
          {
            localTroopInfoManager.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString + "&" + 3000, i);
            a.jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a(i);
            a.jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.d();
          }
          if (QLog.isColorLevel())
          {
            localObject = new StringBuilder("onMsgRevokeNotice==>");
            ((StringBuilder)localObject).append("navigateType:").append(i).append("|navigaeSeq:").append(l);
            QLog.d("DiscussChatPie.troop.special_msg", 2, ((StringBuilder)localObject).toString());
          }
        }
      }
    }
    super.a(paramBoolean1, paramList, paramBoolean2);
  }
  
  protected void d(boolean paramBoolean, String paramString)
  {
    a.a(65536);
  }
}
