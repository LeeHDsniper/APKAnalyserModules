package com.tencent.mobileqq.app.automator.step;

import com.tencent.biz.common.offline.OfflineExpire.OfflineExpireCheckUpdate;
import com.tencent.biz.common.report.BnrReport.BnrReportCheckUpdate;
import com.tencent.mobileqq.activity.aio.anim.AioAnimationConfigCheckUpdateItem;
import com.tencent.mobileqq.app.BusinessInfoCheckUpdateItem;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.GetRichSig;
import com.tencent.mobileqq.app.PreloadInfoCheckUpdateItem;
import com.tencent.mobileqq.app.PublicAccountHandler;
import com.tencent.mobileqq.app.PublicAccountHandler.PublicAccountCheckUpdateItem;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ReqDpcInfoNewItem;
import com.tencent.mobileqq.app.ReqGetSettingsItem;
import com.tencent.mobileqq.app.ReqSystemMsgNewItem;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.log.WebViewCheckUpdataItem;
import com.tencent.mobileqq.profile.ProfileCardCheckUpdate;
import com.tencent.mobileqq.qcall.PstnInfoCheckUpdateItem;
import com.tencent.mobileqq.service.message.GetBlackListItem;
import com.tencent.mobileqq.service.profile.GetSimpleInfoCheckUpdateItem;
import com.tencent.mobileqq.util.QQSettingUtil.UserBitFlagCheckUpdate;
import cooperation.qqwifi.QQWiFiHelper;
import nhr;

public class GetCheckUpdate
  extends AsyncStep
{
  nhr a;
  
  public GetCheckUpdate()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    FriendListHandler localFriendListHandler = (FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(1);
    if (h == 42) {}
    for (int i = 1;; i = 4)
    {
      localFriendListHandler.a(true, i);
      QQWiFiHelper.a(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b);
      return 2;
    }
  }
  
  public void a()
  {
    super.a();
    QQAppInterface localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b;
    if (h == 42)
    {
      PublicAccountHandler localPublicAccountHandler = (PublicAccountHandler)localQQAppInterface.a(11);
      if (localPublicAccountHandler.c())
      {
        Automator localAutomator = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator;
        localPublicAccountHandler.getClass();
        localAutomator.a(102, new PublicAccountHandler.PublicAccountCheckUpdateItem(localPublicAccountHandler));
      }
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(106, new QQSettingUtil.UserBitFlagCheckUpdate(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b));
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(118, new BnrReport.BnrReportCheckUpdate(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b));
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(127, new OfflineExpire.OfflineExpireCheckUpdate(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b));
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(117, new ReqDpcInfoNewItem(localQQAppInterface));
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(113, new GetSimpleInfoCheckUpdateItem(localQQAppInterface));
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(116, new GetBlackListItem(localQQAppInterface));
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(114, new ReqSystemMsgNewItem(localQQAppInterface));
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(115, new ReqGetSettingsItem(localQQAppInterface));
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(122, new ProfileCardCheckUpdate(localQQAppInterface));
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(119, new GetRichSig(localQQAppInterface));
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(120, new AioAnimationConfigCheckUpdateItem(localQQAppInterface));
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(110, new BusinessInfoCheckUpdateItem(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b, 110));
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(123, new PreloadInfoCheckUpdateItem(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b));
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(126, new WebViewCheckUpdataItem(localQQAppInterface));
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(128, new PstnInfoCheckUpdateItem(localQQAppInterface, 128));
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(129, new PstnInfoCheckUpdateItem(localQQAppInterface, 129));
    }
    if (jdField_a_of_type_Nhr == null)
    {
      jdField_a_of_type_Nhr = new nhr(this, null);
      localQQAppInterface.a(jdField_a_of_type_Nhr);
    }
  }
  
  public void b()
  {
    if (jdField_a_of_type_Nhr != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.b(jdField_a_of_type_Nhr);
      jdField_a_of_type_Nhr = null;
    }
  }
}
