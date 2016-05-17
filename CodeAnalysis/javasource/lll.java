import android.support.v4.app.FragmentActivity;
import android.view.ViewGroup;
import com.tencent.biz.troop.feeds.TroopNewGuidePopWindow;
import com.tencent.mobileqq.activity.aio.ChatAdapter1;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.BizTroopObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.TroopInfoManager;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.PBBoolField;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.troop.data.TroopAioTips;
import com.tencent.mobileqq.troop.utils.TroopGagMgr.GagStatus;
import com.tencent.mobileqq.troop.utils.TroopNotificationHelper;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.XEditTextEx;
import java.io.UnsupportedEncodingException;
import tencent.im.lbs.member_lbs.NeighbourNumber;
import tencent.im.lbs.member_lbs.RspBody;

public class lll
  extends BizTroopObserver
{
  public lll(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(TroopGagMgr.GagStatus paramGagStatus)
  {
    if ((jdField_a_of_type_Int == 2) && (jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopGagMgr$SelfGagInfo != null) && (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(jdField_a_of_type_JavaLangString))) {
      a.a(jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopGagMgr$SelfGagInfo, true);
    }
  }
  
  protected void a(Object paramObject)
  {
    if (a.jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1 != null) {
      a.jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.notifyDataSetChanged();
    }
  }
  
  protected void a(boolean paramBoolean, String paramString, Object paramObject)
  {
    if (paramObject == null) {}
    for (;;)
    {
      return;
      paramString = (member_lbs.RspBody)paramObject;
      paramObject = (member_lbs.NeighbourNumber)msg_neighbour_number.get();
      long l2 = uint64_group_code.get();
      long l1;
      try
      {
        l1 = Long.parseLong(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        l2 = Long.valueOf(l2).longValue();
        if (l1 != l2) {
          continue;
        }
        if (((TroopInfoManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(36)).c(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
          break label120;
        }
        a.b(false);
        return;
      }
      catch (NumberFormatException paramString) {}
      if (QLog.isColorLevel())
      {
        QLog.d("Q.aio.TroopChatPie.troop.nearby_mem", 2, "onGetNearbyTroopMemberCount NumberFormatException", paramString);
        return;
        label120:
        l1 = uint64_neighbour_number.get();
        if (l1 > 0L) {
          a.b(uint64_neighbour_number.get());
        }
        if (QLog.isColorLevel()) {
          QLog.d("Q.aio.TroopChatPie.troop.nearby_mem", 2, "onGetNearbyTroopMemberCount uint64_neighbour_number:" + l1);
        }
        if (bool_show_tips.get()) {
          try
          {
            paramObject = new String(str_tips_wording.get().toByteArray(), "UTF-8");
            paramString = new String(str_tips_web_url.get().toByteArray(), "UTF-8");
            if (a.jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null)
            {
              a.jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_ComTencentMobileqqActivityAioAIOTipsController, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, paramObject, paramString);
              return;
            }
          }
          catch (UnsupportedEncodingException paramString) {}
        }
      }
    }
  }
  
  protected void b(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (!a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isResume()) {
      return;
    }
    if (paramBoolean1)
    {
      if (paramBoolean2) {}
      for (String str = a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131364781);; str = a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131364782))
      {
        QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getApplicationContext(), 2, str, 1).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
        a.d(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        return;
      }
    }
    QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getApplicationContext(), 1, 2131364783, 1).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
  }
  
  protected void c(boolean paramBoolean, Object paramObject)
  {
    long l = ((Long)paramObject).longValue();
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.TroopChatPie", 2, "onGetTroopNewGuide isSuccess = " + paramBoolean + ", troopUin = " + l);
    }
    if ((a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) && (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(String.valueOf(l))))
    {
      TroopNotificationHelper.e(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      TroopNotificationHelper.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      if ((a.jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow != null) && (a.jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow.isShowing())) {
        a.jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow.dismiss();
      }
      a.jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow = new TroopNewGuidePopWindow(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      paramObject = new int[2];
      TroopChatPie.a(a).getLocationOnScreen(paramObject);
      int i = a.a();
      int[] arrayOfInt = new int[2];
      TroopChatPie.b(a).getLocationInWindow(arrayOfInt);
      int j = arrayOfInt[1];
      int k = paramObject[1];
      a.jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow.a(i, j - k);
      a.jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow.a(2);
    }
  }
}
