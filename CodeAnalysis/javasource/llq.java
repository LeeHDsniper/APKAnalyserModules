import android.content.Context;
import android.os.Handler;
import android.support.v4.app.FragmentActivity;
import android.widget.Toast;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.managers.TroopRemindSettingManager;
import com.tencent.mobileqq.troop.utils.TroopAioADManager;
import com.tencent.mobileqq.troop.utils.TroopAppMgr;
import com.tencent.mobileqq.troop.widget.TroopUsageTimeReport;
import com.tencent.qqlive.mediaplayer.api.TVK_SDKMgr;
import java.util.Set;

public class llq
  implements Runnable
{
  public llq(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (TroopRemindSettingManager.a().a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface))
    {
      a.jdField_a_of_type_AndroidWidgetToast = ChatActivityUtils.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367336));
      a.jdField_a_of_type_AndroidWidgetToast.show();
      TroopRemindSettingManager.a().a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    }
    Object localObject = (DiscussionManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(52);
    if ((localObject != null) && (a.contains(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a)))
    {
      a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
      a.remove(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    }
    localObject = (TroopAppMgr)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(108);
    if (localObject != null)
    {
      if (a.dz != ((TroopAppMgr)localObject).a())
      {
        a.dz = ((TroopAppMgr)localObject).a();
        a.b.sendEmptyMessage(4);
      }
      if ((!((TroopAppMgr)localObject).a()) || (((TroopAppMgr)localObject).b())) {
        ((TroopAppMgr)localObject).a(true);
      }
    }
    if (!a.S)
    {
      localObject = (TroopAioADManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(132);
      ((TroopAioADManager)localObject).addObserver(a);
      ((TroopAioADManager)localObject).b(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
      a.S = true;
    }
    localObject = (TroopManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
    if ((localObject != null) && (((TroopManager)localObject).a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a) != null)) {
      a.b.sendEmptyMessage(6);
    }
    TVK_SDKMgr.initSdk(a.jdField_a_of_type_AndroidContentContext.getApplicationContext(), "qlZy1cUgJFUcdIxwLCxe2Bwl2Iy1G1W1Scj0JYW0q2gNAn3XAYvu6kgSaMFDI+caBVR6jDCu/2+MMP/ 5+bNIv+d+bn4ihMBUKcpWIDySGIAv7rlarJXCev4i7a0qQD2f3s6vtdD9YdQ81ZyeA+nD0MenBGrPPd GeDBvIFQSGz4jB4m6G4fa2abCqy1JQc+r+OGk6hVJQXMGpROgPiIGlF3o/sHuBblmfwvIDtYviSIKD4 UGd0IeJn/IqVI3vUZ3ETgea6FkqDoA00SrTlTYfJUJk/h2lk1rkibIkQMPZhVjI2HYDxV4y501Xj2vD fjFPoNJImVtMjdE2BIIEawxYKA==", "");
    TVK_SDKMgr.setDebugEnable(false);
    TVK_SDKMgr.setOnLogListener(new lmm(null));
    TroopUsageTimeReport.a().a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
    TroopUsageTimeReport.a().a();
    TroopUsageTimeReport.a().b();
  }
}
