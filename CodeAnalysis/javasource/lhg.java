import android.app.Dialog;
import android.content.Intent;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.ChatActivity;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.MediaPlayerManager;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.HotChatPie;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.HotChatManager.HotChatStateWrapper;
import com.tencent.mobileqq.app.HotChatObserver;
import com.tencent.mobileqq.app.HotChatRecentUserMgr;
import com.tencent.mobileqq.app.HotchatSCHelper;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.HotChatInfo;
import com.tencent.mobileqq.data.MessageForPtt;
import com.tencent.mobileqq.hotchat.HCTopicSeatsView;
import com.tencent.mobileqq.hotchat.HotChatPttStageControl;
import com.tencent.mobileqq.hotchat.PKControl;
import com.tencent.mobileqq.hotchat.PkInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.nearby.HotChatUtil;
import com.tencent.mobileqq.nearby.NearbyUtils;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import tencent.im.oidb.hotchat.Common.WifiPOIInfo;

public class lhg
  extends HotChatObserver
{
  public lhg(HotChatPie paramHotChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(int paramInt)
  {
    if ((paramInt == 0) && (a.jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl != null))
    {
      HCTopicSeatsView localHCTopicSeatsView = a.jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.a();
      if (localHCTopicSeatsView != null) {
        localHCTopicSeatsView.a();
      }
    }
  }
  
  public void a(String paramString, HotChatManager.HotChatStateWrapper paramHotChatStateWrapper)
  {
    if (QLog.isColorLevel()) {
      NearbyUtils.a("Q.aio.TroopChatPie", new Object[] { "onPushExitHotChat", paramString, paramHotChatStateWrapper });
    }
    if (!Utils.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, paramString)) {}
    int i;
    do
    {
      return;
      if (a.jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl != null)
      {
        HCTopicSeatsView localHCTopicSeatsView = a.jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.a();
        if (localHCTopicSeatsView != null) {
          localHCTopicSeatsView.a();
        }
      }
      i = targetState;
    } while (i == 1);
    HotChatRecentUserMgr.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString, i);
  }
  
  protected void a(String paramString1, String paramString2, boolean paramBoolean, String paramString3, String paramString4, Boolean paramBoolean1)
  {
    if ((paramBoolean) && (paramString1 != null) && (paramString1.equals(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a)) && (a.jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl != null))
    {
      paramString1 = a.jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.a();
      if (paramString1 != null) {
        paramString1.a();
      }
    }
  }
  
  public void a(String paramString1, boolean paramBoolean, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.i("Q.aio.TroopChatPie", 2, "TroopChatPie.onExitHotChat  troopUin=" + paramString1);
    }
    if (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a.equals(paramString1))
    {
      if (a.jdField_a_of_type_ComTencentMobileqqHotchatPKControl != null) {
        a.jdField_a_of_type_ComTencentMobileqqHotchatPKControl.b();
      }
      if (a.jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl != null)
      {
        a.jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
        a.jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.d();
      }
      a.a(0);
    }
  }
  
  public void a(boolean paramBoolean, int paramInt1, String paramString1, String paramString2, long paramLong1, int paramInt2, int paramInt3, int paramInt4, long paramLong2, String paramString3)
  {
    if (!Utils.a(paramString1, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a)) {}
    do
    {
      return;
      QLog.d("PttShow", 1, "onGetHotChatTopicMsg isSuccess=" + paramBoolean + ", result=" + paramInt1 + ", troopUin=" + paramString1 + ", uuid=" + paramString2 + ", lStartMsgSeq=" + paramLong1 + ", nReqMsgNum=" + paramInt2 + ", Order=" + paramInt3 + ", lNextMsgSeq=" + paramLong2 + ", errorMsg=" + paramString3);
    } while ((!paramBoolean) || (paramInt1 != 0) || (TextUtils.isEmpty(paramString1)) || (!paramString1.equals(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a)) || (paramLong1 <= 0L) || (paramInt2 <= 0) || (paramLong2 < 0L));
    paramString2 = new ArrayList();
    if ((paramInt2 > paramLong1) && (paramInt3 == 0)) {}
    for (paramInt1 = (int)paramLong1;; paramInt1 = paramInt2)
    {
      int i = 0;
      if (i < paramInt2)
      {
        paramString1 = null;
        if ((paramInt3 == 0) && (paramLong1 > i)) {
          paramString1 = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, 1026, paramLong1 - paramInt1 + i + 1L);
        }
        for (;;)
        {
          if ((paramString1 != null) && ((paramString1 instanceof MessageForPtt)))
          {
            paramString1 = (MessageForPtt)paramString1;
            QLog.d("PttShow", 1, "onGetHotChatTopicMsg index=" + i + ", ptt=" + paramString1.toString());
            if (shmsgseq > a.jdField_h_of_type_Long) {
              a.jdField_h_of_type_Long = shmsgseq;
            }
            if (shmsgseq < a.g) {
              a.g = shmsgseq;
            }
            if (!a.jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(Long.valueOf(uniseq)))
            {
              a.jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(Long.valueOf(uniseq), paramString1);
              paramString2.add(paramString1);
            }
          }
          i += 1;
          break;
          if (paramInt3 == 1) {
            paramString1 = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, 1026, i + paramLong1);
          }
        }
      }
      QLog.d("PttShow", 1, "onGetHotChatTopicMsg pttList size=" + paramString2.size() + ", mMinPttSeq=" + a.g + ", mMaxPttSeq=" + a.jdField_h_of_type_Long);
      if ((a.jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl == null) || (paramString2.size() <= 0)) {
        break;
      }
      if (paramInt4 == 1) {
        a.jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.a(paramString2, false);
      }
      while (paramInt4 != 2)
      {
        HotChatPie.a(a, paramString2);
        return;
      }
      paramString1 = a.jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl;
      if (paramLong2 > 0L) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        paramString1.a(paramString2, paramBoolean);
        break;
      }
    }
  }
  
  public void a(boolean paramBoolean, HotChatInfo paramHotChatInfo, Common.WifiPOIInfo paramWifiPOIInfo, int paramInt, String paramString)
  {
    if (QLog.isColorLevel()) {
      NearbyUtils.a("Q.aio.TroopChatPie", new Object[] { "onQuickJoinHotChat", Boolean.valueOf(paramBoolean), paramString, paramHotChatInfo });
    }
    if (!paramBoolean) {
      if ((Utils.a(a.ai, paramString)) || ((a.jdField_a_of_type_ComTencentMobileqqDataHotChatInfo != null) && (Utils.a(a.jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.uuid, paramString))))
      {
        paramHotChatInfo = HotChatUtil.a(paramInt);
        QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, 1, paramHotChatInfo, 1).a();
      }
    }
    do
    {
      do
      {
        return;
        if ((Utils.a(a.ai, paramString)) && (paramHotChatInfo != null) && (!Utils.a(troopUin, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a)))
        {
          if (QLog.isColorLevel()) {
            NearbyUtils.a("Q.aio.TroopChatPie", new Object[] { "onQuickJoinHotChat_not_same_aio", String.format("uuid:%s, new:%s, old:%s", new Object[] { paramString, troopUin, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a }) });
          }
          MediaPlayerManager.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(false);
          paramWifiPOIInfo = new Intent(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, SplashActivity.class);
          paramWifiPOIInfo.putExtra("uin", troopUin);
          paramWifiPOIInfo.putExtra("uintype", 1);
          paramWifiPOIInfo.putExtra("troop_uin", troopCode);
          paramWifiPOIInfo.putExtra("uinname", name);
          paramWifiPOIInfo.addFlags(67108864);
          paramWifiPOIInfo.putExtra("hotnamecode", uuid);
          if (supportDemo) {}
          for (paramInt = 2;; paramInt = 0)
          {
            paramWifiPOIInfo.putExtra("HOTCHAT_EXTRA_FLAG", paramInt);
            paramHotChatInfo = AIOUtils.a(paramWifiPOIInfo, new int[] { 2 });
            paramHotChatInfo.setAction("com.tencent.mobileqq.action.MAINACTIVITY");
            a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.startActivity(paramHotChatInfo);
            if (!(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity instanceof ChatActivity)) {
              break;
            }
            a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.finish();
            return;
          }
        }
      } while ((paramHotChatInfo == null) || (!Utils.a(troopUin, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a)) || (a.jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl == null));
      paramHotChatInfo = a.jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.a();
      if (paramHotChatInfo != null) {
        paramHotChatInfo.a();
      }
    } while (!QLog.isDevelopLevel());
    NearbyUtils.a("PttShow", "onQuickJoinHotChat", new Object[] { paramHotChatInfo });
  }
  
  public void a(boolean paramBoolean, PkInfo paramPkInfo)
  {
    String str;
    if (QLog.isColorLevel())
    {
      if (paramPkInfo == null)
      {
        str = "null";
        QLog.d("Q.hotchat.pk", 2, "onGetHotChatPkActivity|isSuccess:" + paramBoolean + ",pkInfo:" + str);
      }
    }
    else if ((paramBoolean) && (paramPkInfo != null))
    {
      if (a.jdField_a_of_type_ComTencentMobileqqHotchatPKControl == null) {
        break label89;
      }
      a.jdField_a_of_type_ComTencentMobileqqHotchatPKControl.a(paramPkInfo);
    }
    label89:
    while (!QLog.isColorLevel())
    {
      return;
      str = paramPkInfo.toString();
      break;
    }
    QLog.d("Q.hotchat.pk", 2, "onGetHotChatPkActivity|pkControl is null");
  }
  
  public void a(boolean paramBoolean, String paramString1, int paramInt, String paramString2, Long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.TroopChatPie", 2, "onGetUserCreateHotChatAnnounce  isSuccess= " + paramBoolean + ", result=" + paramInt + ", memo=" + paramString2 + ", troopOwner=" + paramLong);
    }
    long l2 = 100L;
    long l1 = l2;
    if (paramBoolean)
    {
      l1 = l2;
      if (paramInt == 0)
      {
        l1 = l2;
        if (a.a(paramString1, paramString2, null)) {
          l1 = 30000L;
        }
      }
    }
    if (a.jdField_a_of_type_ComTencentMobileqqAppHotchatSCHelper != null) {
      a.jdField_a_of_type_ComTencentMobileqqAppHotchatSCHelper.b(l1);
    }
  }
  
  public void a(boolean paramBoolean, String paramString1, int paramInt, String paramString2, String paramString3)
  {
    if (QLog.isColorLevel()) {
      QLog.i("Q.aio.TroopChatPie", 2, "onKickHotChatMember.isSuccess=" + paramBoolean + ",groupuin=" + paramString1 + ",result=" + paramInt + ",memberuin=" + paramString2 + ",strError=" + paramString3);
    }
    if ((a.jdField_h_of_type_AndroidAppDialog != null) && (a.jdField_h_of_type_AndroidAppDialog.isShowing())) {
      a.jdField_h_of_type_AndroidAppDialog.dismiss();
    }
    if ((paramBoolean) && (paramInt == 0))
    {
      QQToast.a(a.a(), "删除热聊成员成功", 0).b(a.a().getTitleBarHeight());
      return;
    }
    QQToast.a(a.a(), "删除热聊成员失败", 0).b(a.a().getTitleBarHeight());
  }
  
  public void a(boolean paramBoolean, String paramString1, byte[] paramArrayOfByte, int paramInt, String paramString2, String paramString3, List paramList)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.TroopChatPie", 2, "onGetHotChatAnnounce  isSuccess= " + paramBoolean + ", result=" + paramInt + ", memo=" + paramString2 + ", jumpurl=" + paramString3);
    }
    long l2 = 100L;
    long l1 = l2;
    if (paramBoolean)
    {
      l1 = l2;
      if (paramInt == 0)
      {
        l1 = l2;
        if (a.a(paramString1, paramString2, paramString3)) {
          l1 = 30000L;
        }
      }
    }
    if (a.jdField_a_of_type_ComTencentMobileqqAppHotchatSCHelper != null) {
      a.jdField_a_of_type_ComTencentMobileqqAppHotchatSCHelper.b(l1);
    }
  }
  
  public void a(boolean paramBoolean1, boolean paramBoolean2, int paramInt1, String paramString1, String paramString2, int paramInt2, String paramString3, int paramInt3, int paramInt4)
  {
    if ((paramString1 == null) || (a.jdField_a_of_type_ComTencentMobileqqDataHotChatInfo == null) || (!paramString1.equals(a.jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.troopUin))) {}
    do
    {
      do
      {
        return;
        if (a.jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl != null)
        {
          HCTopicSeatsView localHCTopicSeatsView = a.jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.a();
          if (localHCTopicSeatsView != null) {
            localHCTopicSeatsView.a(paramBoolean1, paramBoolean2, paramInt1, paramString1, paramString2, paramInt2, paramString3, paramInt3, paramInt4);
          }
        }
      } while ((a.jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.getUserType(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getLongAccountUin()) != 0) || (a.f() != 2));
      a.aa();
    } while (!QLog.isDevelopLevel());
    NearbyUtils.a("PttShow", "onUpdatePttHotChatSeatsInfo", new Object[] { "hide audio panel" });
  }
}
