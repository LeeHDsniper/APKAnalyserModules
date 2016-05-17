package com.tencent.mobileqq.activity.aio.tips;

import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.biz.eqq.CrmUtils;
import com.tencent.biz.pubaccount.assistant.PubAccountAssistantManager;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;
import mqq.os.MqqHandler;

public class PubAccountAssistantTipsBar
  implements View.OnClickListener, TipsBarTask
{
  private static final String jdField_a_of_type_JavaLangString = PubAccountAssistantTipsBar.class.getSimpleName();
  private BaseChatPie jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie;
  private SessionInfo jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
  private TipsManager jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private MqqHandler jdField_a_of_type_MqqOsMqqHandler;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public PubAccountAssistantTipsBar(QQAppInterface paramQQAppInterface, SessionInfo paramSessionInfo, TipsManager paramTipsManager, BaseChatPie paramBaseChatPie, MqqHandler paramMqqHandler)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager = paramTipsManager;
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie = paramBaseChatPie;
    jdField_a_of_type_MqqOsMqqHandler = paramMqqHandler;
  }
  
  public int a()
  {
    return 7;
  }
  
  public View a(Object... paramVarArgs)
  {
    paramVarArgs = LayoutInflater.from(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a()).inflate(2130903698, null);
    paramVarArgs.setOnClickListener(this);
    return paramVarArgs;
  }
  
  public void a(int paramInt, Object... paramVarArgs)
  {
    boolean bool = true;
    if (paramInt != 1000) {
      return;
    }
    paramInt = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1008) {
      if ((paramInt < 5) || (!PubAccountAssistantManager.a().c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
        break label230;
      }
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "onAIOEvent() : ON_SHOW =====> showPubAccountAssistTip:" + bool);
      }
      if ((!bool) || (!jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(this, new Object[0]))) {
        break;
      }
      PubAccountAssistantManager.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), "mp_msg_zhushou_4", "share_succ", 0, 0, "", "", "", "");
      jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(30, 5000L);
      return;
      if ((!CrmUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) || (paramInt < 10) || (!PubAccountAssistantManager.a().c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
        label230:
        bool = false;
      }
    }
  }
  
  public int[] a()
  {
    return null;
  }
  
  public int b()
  {
    return 10;
  }
  
  public void onClick(View paramView)
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1008) || ((1024 == jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int) && (CrmUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))))
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.m();
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), "mp_msg_zhushou_5", "share_succ", 0, 0, "", "", "", "");
    }
  }
}
