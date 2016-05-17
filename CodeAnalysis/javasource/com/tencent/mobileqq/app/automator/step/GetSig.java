package com.tencent.mobileqq.app.automator.step;

import android.os.Bundle;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ShieldListHandler;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.remote.ToServiceMsg;
import cooperation.qlink.QlinkReliableReport;
import nia;

public class GetSig
  extends AsyncStep
{
  private MessageObserver a;
  
  public GetSig()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void c()
  {
    ToServiceMsg localToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a("TransService.ReqGetSign");
    extraData.putInt("ssover", 1);
    extraData.putInt("app_id", AppSetting.a);
    extraData.putByte("a2type", (byte)4);
    extraData.putByteArray("enkey", jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.getUinSign());
    jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(localToServiceMsg);
  }
  
  protected int a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppMessageObserver == null)
    {
      jdField_a_of_type_ComTencentMobileqqAppMessageObserver = new nia(this, null);
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.c(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    }
    c();
    return 2;
  }
  
  public void a()
  {
    ((ShieldListHandler)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(18)).a();
    ReportController.a(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b, true);
    QlinkReliableReport.a();
  }
  
  public void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppMessageObserver != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.b(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
      jdField_a_of_type_ComTencentMobileqqAppMessageObserver = null;
    }
  }
}
