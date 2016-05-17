package com.tencent.mobileqq.activity.aio.tips;

import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.managers.TroopAssistantManager;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.data.TroopAioTips;
import com.tencent.mobileqq.widget.UpScrollHideView.onViewHideListener;
import com.tencent.qphone.base.util.QLog;
import lng;
import lnh;
import lni;

public class TroopAssistTipsBar
  implements TipsBarTask
{
  private static final String jdField_a_of_type_JavaLangString = TroopAssistTipsBar.class.getSimpleName();
  private View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener = new lni(this);
  private SessionInfo jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
  private TipsManager jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager;
  private BaseActivity jdField_a_of_type_ComTencentMobileqqAppBaseActivity;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  public TroopAioTips a;
  private UpScrollHideView.onViewHideListener jdField_a_of_type_ComTencentMobileqqWidgetUpScrollHideView$onViewHideListener = new lnh(this);
  private boolean jdField_a_of_type_Boolean = false;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public TroopAssistTipsBar(QQAppInterface paramQQAppInterface, TipsManager paramTipsManager, BaseActivity paramBaseActivity, SessionInfo paramSessionInfo, TroopAioTips paramTroopAioTips)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager = paramTipsManager;
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity = paramBaseActivity;
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
    jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips = paramTroopAioTips;
  }
  
  public int a()
  {
    return 3;
  }
  
  public View a(Object... paramVarArgs)
  {
    paramVarArgs = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131370275);
    String str = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131370282);
    paramVarArgs = ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, paramVarArgs, str, jdField_a_of_type_AndroidViewView$OnClickListener, jdField_a_of_type_ComTencentMobileqqWidgetUpScrollHideView$onViewHideListener);
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_msg", "", "AIOchat", "exp_setmsg", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
    return paramVarArgs;
  }
  
  public void a()
  {
    if ((a()) || (jdField_a_of_type_Boolean)) {
      TroopAssistantManager.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    }
  }
  
  public void a(int paramInt, Object... paramVarArgs)
  {
    if (paramInt != 1000) {}
    do
    {
      do
      {
        return;
      } while (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1);
      if ((jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips == null) || (!jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a())) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, "navigateBar is show, return ");
    return;
    ThreadManager.a(new lng(this), 8, null, true);
  }
  
  public boolean a()
  {
    return 3 == jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
  }
  
  public int[] a()
  {
    return null;
  }
  
  public int b()
  {
    return 20;
  }
}
