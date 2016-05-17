import android.content.res.Resources;
import android.os.Handler;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.MessageHandler.MsgSendCostParams;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.TroopInfoManager;
import com.tencent.mobileqq.multimsg.MultiMsgManager;
import com.tencent.mobileqq.pb.PBEnumField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.systemmsg.MessageForSystemMsg;
import com.tencent.mobileqq.troop.data.TroopAioTips;
import com.tencent.mobileqq.utils.SendMessageHandler;
import com.tencent.qphone.base.util.QLog;
import java.util.List;
import tencent.mobileim.structmsg.structmsg.StructMsg;
import tencent.mobileim.structmsg.structmsg.SystemMsg;

public class lmd
  extends MessageObserver
{
  public lmd(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(String paramString, int paramInt1, int paramInt2)
  {
    if ((paramString == null) || (!paramString.equals(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) || (paramInt1 != a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int)) {}
    while (paramInt1 != 1) {
      return;
    }
    switch (paramInt2)
    {
    default: 
      return;
    case 1: 
    case 2: 
      paramString = a.b.obtainMessage(5, 1, 0, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367034));
      a.b.sendMessage(paramString);
    }
    for (;;)
    {
      a.v();
      return;
      paramString = a.b.obtainMessage(5, 1, 0, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367033));
      a.b.sendMessage(paramString);
    }
  }
  
  protected void a(String paramString1, int paramInt1, int paramInt2, SendMessageHandler paramSendMessageHandler, long paramLong1, long paramLong2, String paramString2)
  {
    if ((paramString1 == null) || (!paramString1.equals(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) || (paramInt1 != a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int))
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.aio.TroopChatPie", 2, "onUpdateSendMsgError exception uin " + paramString1 + " type " + paramInt1 + " uniseq " + paramLong2);
      }
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.TroopChatPie", 2, "onUpdateSendMsgError uin " + paramString1 + " type " + paramInt1 + " uniseq " + paramLong2);
    }
    if ((paramInt1 == 1) || (paramInt1 == 3000) || (paramInt1 == 0))
    {
      paramSendMessageHandler = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString1, paramInt1, paramLong2);
      if ((paramSendMessageHandler != null) && ((paramSendMessageHandler instanceof MessageForStructing)) && ("viewMultiMsg".equals(structingMsg.mMsgAction))) {
        MultiMsgManager.a().a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString1, paramInt1, paramLong2, false);
      }
    }
    if (paramInt1 == 1) {
      switch (paramInt2)
      {
      }
    }
    for (;;)
    {
      a.a(196608);
      return;
      paramString1 = a.b.obtainMessage(5, 1, 0, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367034));
      a.b.sendMessage(paramString1);
      continue;
      paramString1 = a.b.obtainMessage(5, 1, 0, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367033));
      a.b.sendMessage(paramString1);
      continue;
      paramString1 = paramString2;
      if (TextUtils.isEmpty(paramString2)) {
        paramString1 = a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131364816);
      }
      paramString1 = a.b.obtainMessage(5, 1, 0, paramString1);
      a.b.sendMessage(paramString1);
      continue;
      paramString1 = paramString2;
      if (TextUtils.isEmpty(paramString2)) {
        paramString1 = a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131364817);
      }
      paramString1 = a.b.obtainMessage(5, 1, 0, paramString1);
      a.b.sendMessage(paramString1);
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
      QLog.d("Q.aio.TroopChatPie.troop.revoked_troop_msg", 2, "isSuccess:" + paramBoolean1);
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
          long l = localTroopInfoManager.b(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          if (uniseq == l)
          {
            localTroopInfoManager.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, i);
            a.jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a(i);
            a.jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.d();
          }
          if (QLog.isColorLevel())
          {
            localObject = new StringBuilder("onMsgRevokeNotice==>");
            ((StringBuilder)localObject).append("navigateType:").append(i).append("|navigaeSeq:").append(l);
            QLog.d("Q.aio.TroopChatPie.troop.special_msg", 2, ((StringBuilder)localObject).toString());
          }
        }
      }
    }
    super.a(paramBoolean1, paramList, paramBoolean2);
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    Object localObject1;
    if (paramBoolean1)
    {
      if (QLog.isColorLevel()) {
        QLog.i("Q.aio.TroopChatPie", 2, "onGetSystemMsgFin.success");
      }
      List localList = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(AppConstants.av, 0);
      Object localObject2 = null;
      localObject1 = localObject2;
      if (localList != null)
      {
        localObject1 = localObject2;
        if (localList.size() - 1 >= 0) {
          localObject1 = (MessageRecord)localList.get(localList.size() - 1);
        }
      }
      if ((localObject1 != null) && ((localObject1 instanceof MessageForSystemMsg))) {
        break label100;
      }
    }
    label100:
    long l;
    do
    {
      int i;
      do
      {
        do
        {
          return;
          localObject1 = ((MessageForSystemMsg)localObject1).getSystemMsg();
        } while ((msg_type.get() != 2) || (msg.get() == null));
        i = msg.group_msg_type.get();
      } while ((i != 3) && (i != 15));
      l = msg.group_code.get();
    } while ((a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString == null) || (!a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equalsIgnoreCase("" + l)));
    a.aH();
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2, String paramString)
  {
    if (paramBoolean1) {
      a.E();
    }
  }
  
  protected void d(boolean paramBoolean, String paramString)
  {
    a.a(65536);
  }
}
