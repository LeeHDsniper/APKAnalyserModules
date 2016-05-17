import android.os.Bundle;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.PublicAccountHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.loginwelcome.LoginWelcomeManager;
import com.tencent.mobileqq.mp.mobileqq_mp.FollowResponse;
import com.tencent.mobileqq.mp.mobileqq_mp.RetInfo;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;
import mqq.observer.BusinessObserver;

public class lju
  implements BusinessObserver
{
  public lju(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(int paramInt, boolean paramBoolean, Bundle paramBundle)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.BaseChatPie", 2, "success:" + String.valueOf(paramBoolean));
    }
    int k = 1;
    int j = 1;
    if (!paramBoolean)
    {
      a.r(2131364336);
      paramInt = j;
    }
    for (;;)
    {
      if (paramInt != 0) {
        a.au();
      }
      return;
      int i;
      if (paramBoolean) {
        i = k;
      }
      try
      {
        paramBundle = paramBundle.getByteArray("data");
        paramInt = j;
        if (paramBundle == null) {
          continue;
        }
        i = k;
        mobileqq_mp.FollowResponse localFollowResponse = new mobileqq_mp.FollowResponse();
        i = k;
        localFollowResponse.mergeFrom(paramBundle);
        i = k;
        paramInt = ret_info.get()).ret_code.get();
        if (paramInt == 0)
        {
          i = k;
          ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0x8005750", "0x8005750", 0, 0, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "", "", "");
          i = k;
          paramBundle = (PublicAccountDataManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55);
          if (paramBundle != null)
          {
            i = k;
            paramBundle = paramBundle.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
            if (paramBundle != null)
            {
              i = k;
              a.jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler.a(paramBundle);
              paramInt = 1;
              break label397;
            }
          }
        }
        label397:
        for (;;)
        {
          i = paramInt;
          a.G = true;
          i = paramInt;
          a.L = true;
          i = paramInt;
          a.av();
          i = paramInt;
          LoginWelcomeManager.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).d();
          break;
          i = k;
          a.s();
          paramInt = 0;
          break label397;
          i = k;
          a.s();
          paramInt = 0;
          continue;
          if (paramInt == 58)
          {
            i = k;
            a.r(2131364340);
            paramInt = j;
            break;
          }
          i = k;
          a.r(2131364336);
          paramInt = j;
          break;
          i = k;
          a.r(2131364336);
          paramInt = j;
          break;
        }
      }
      catch (Exception paramBundle)
      {
        paramInt = i;
      }
    }
  }
}
