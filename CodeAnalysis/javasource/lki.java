import android.os.Handler;
import android.text.TextUtils;
import com.tencent.biz.pubaccount.PublicAccountManager;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.AccountDetail;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;

public class lki
  implements Runnable
{
  public lki(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject = null;
    PublicAccountDataManager localPublicAccountDataManager = (PublicAccountDataManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55);
    if (localPublicAccountDataManager != null) {
      localObject = localPublicAccountDataManager.b(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    }
    boolean bool;
    if (localObject == null)
    {
      bool = a.t();
      a.s();
      if ((bool) && (TextUtils.isEmpty(a.al)) && (localPublicAccountDataManager != null))
      {
        localObject = localPublicAccountDataManager.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
        if ((localObject != null) && (!TextUtils.isEmpty(summary))) {
          a.al = summary;
        }
      }
    }
    for (;;)
    {
      if (bool)
      {
        ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004EFB", "0X8004EFB", 0, 0, "", "", "", "");
        a.H = true;
        a.jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(3);
      }
      for (;;)
      {
        localObject = "0";
        if (bool) {
          localObject = "1";
        }
        long l = NetConnInfoCenter.getServerTime();
        if (QLog.isColorLevel()) {
          QLog.d("struct_log_tag", 2, "PublicAccountChatPie :CliOper|" + a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a + "|" + "0X8005619" + "|" + "0X8005619" + 0 + "|" + 0 + "|" + Long.toString(l) + "|" + (String)localObject);
        }
        ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "0X8005619", "0X8005619", 0, 0, Long.toString(l), (String)localObject, "", "");
        return;
        if (!PublicAccountChatPie.a(a)) {
          a.jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, new lkj(this));
        }
      }
      bool = false;
    }
  }
}
