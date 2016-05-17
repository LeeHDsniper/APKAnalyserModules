import android.os.Bundle;
import android.os.SystemClock;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.rebuild.BusinessCmrTmpChatPie;
import com.tencent.mobileqq.app.EnterpriseQQHandler;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.loginwelcome.LoginWelcomeManager;
import com.tencent.mobileqq.mp.mobileqq_mp.FollowResponse;
import com.tencent.mobileqq.mp.mobileqq_mp.RetInfo;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.qphone.base.util.QLog;
import mqq.observer.BusinessObserver;

public class lft
  implements BusinessObserver
{
  public lft(BusinessCmrTmpChatPie paramBusinessCmrTmpChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(int paramInt, boolean paramBoolean, Bundle paramBundle)
  {
    if (QLog.isColorLevel()) {
      QLog.d("BusinessChatPie", 2, "success:" + String.valueOf(paramBoolean));
    }
    if (!paramBoolean) {
      a.q(2131364336);
    }
    for (;;)
    {
      ChatActivityUtils.b();
      return;
      if (paramBoolean) {}
      try
      {
        paramBundle = paramBundle.getByteArray("data");
        if (paramBundle == null) {
          continue;
        }
        mobileqq_mp.FollowResponse localFollowResponse = new mobileqq_mp.FollowResponse();
        localFollowResponse.mergeFrom(paramBundle);
        paramInt = ret_info.get()).ret_code.get();
        if (paramInt == 0)
        {
          ((FriendListHandler)a.a.a(1)).a(true, false);
          paramBundle = (EnterpriseQQHandler)a.a.a(21);
          if (paramBundle != null) {
            paramBundle.a(SystemClock.uptimeMillis());
          }
          LoginWelcomeManager.a(a.a).d();
          continue;
        }
        if (paramInt == 58)
        {
          a.q(2131364340);
          continue;
        }
        a.q(2131364336);
      }
      catch (Exception paramBundle) {}
      a.q(2131364336);
    }
  }
}
