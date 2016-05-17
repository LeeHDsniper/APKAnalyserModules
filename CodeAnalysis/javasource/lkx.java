import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.widget.TextView;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.PlusPanel;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.TroopObserver;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.data.TroopMemberCardInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.multimsg.MultiMsgManager;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.troop.logic.TroopFeedsCenterLogic;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import mqq.app.MobileQQ;
import mqq.os.MqqHandler;

public class lkx
  extends TroopObserver
{
  public lkx(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(Boolean paramBoolean)
  {
    if ((TroopChatPie.c(a) != null) && (paramBoolean.booleanValue())) {
      TroopChatPie.d(a).a();
    }
  }
  
  protected void a(Boolean paramBoolean, ArrayList paramArrayList, List paramList)
  {
    if ((TroopChatPie.e(a) != null) && (paramBoolean.booleanValue())) {
      TroopChatPie.f(a).a();
    }
  }
  
  protected void a(boolean paramBoolean, long paramLong, int paramInt, TroopInfo paramTroopInfo)
  {
    if ((paramBoolean) && (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) && (paramTroopInfo != null) && (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(troopuin)))
    {
      a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d = troopname;
      a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d = a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d;
      a.b.setText(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
      if (AppSetting.i)
      {
        paramTroopInfo = a.b.getText() + a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131362063);
        a.b.setContentDescription(paramTroopInfo);
        a.a().setTitle(a.b.getText());
      }
    }
  }
  
  protected void a(boolean paramBoolean, long paramLong1, int paramInt1, List paramList, long paramLong2, int paramInt2, String paramString)
  {
    if (!Utils.a(String.valueOf(paramLong1), a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {}
    do
    {
      return;
      if (QLog.isColorLevel())
      {
        StringBuilder localStringBuilder = new StringBuilder(150);
        localStringBuilder.append("onOIDB0X899_0_Ret").append("| isSuccess = ").append(paramBoolean).append("| troopuin = ").append(paramLong1).append("| nFlag = ").append(paramInt1).append("| strErorMsg = ").append(paramString);
        QLog.i("Q.aio.TroopChatPie", 2, localStringBuilder.toString());
      }
    } while ((paramInt1 != 2) || (!paramBoolean));
    ThreadManager.a(new lky(this, paramList), 5, null, true);
  }
  
  protected void a(boolean paramBoolean, Object paramObject)
  {
    a.a(paramBoolean, paramObject);
  }
  
  protected void a(boolean paramBoolean, String paramString)
  {
    if ((paramBoolean) && (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) && (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(paramString)))
    {
      paramString = ((TroopManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      if (paramString != null)
      {
        a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d = troopname;
        a.b.setText(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
        if (AppSetting.i)
        {
          paramString = a.b.getText() + a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131362063);
          a.b.setContentDescription(paramString);
          a.a().setTitle(a.b.getText());
        }
      }
    }
  }
  
  protected void a(boolean paramBoolean, String paramString1, String paramString2, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.TroopChatPie.troop.notification_center.auto_pull_down", 2, "onTroopNewFeedsAutoPullDown, isSuc:" + paramBoolean + "troopUin" + paramString1 + ",feedsId:" + paramString2 + ",flag:" + paramInt);
    }
    if (!a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(paramString1)) {}
    while ((a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic == null) || (paramInt != 1)) {
      return;
    }
    a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.d();
  }
  
  protected void a(boolean paramBoolean, String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, int paramInt4, String paramString3)
  {
    if (paramBoolean)
    {
      if (paramInt4 == 0)
      {
        AnonymousChatHelper.a().a(paramString1, paramInt2, paramInt1, paramString2, paramInt3, null);
        TroopChatPie.f(a).postDelayed(new llc(this), 500L);
        return;
      }
      a.a(3, paramString3);
      return;
    }
    a.a(1, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131364814));
  }
  
  protected void a(boolean paramBoolean1, String paramString, boolean paramBoolean2, boolean paramBoolean3)
  {
    if (paramBoolean1)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.aio.TroopChatPie.troop.notification_center.show_red_dot", 2, "onTroopNewFeedsComing, isSuc:" + paramBoolean1 + "troopUin" + paramString + ",bDeleted:" + paramBoolean2);
      }
      if (!paramBoolean2) {
        break label81;
      }
      if (a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic != null) {
        a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.c();
      }
    }
    label81:
    do
    {
      do
      {
        return;
        paramString = ChatActivityUtils.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        if ((paramString == null) || (-1 != paramString.intValue())) {
          break;
        }
        if (a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic != null) {
          a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.e(true);
        }
      } while ((!paramBoolean3) || (a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic == null) || (!a.Q));
      a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.d(false);
      return;
    } while (a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic == null);
    a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.e(false);
  }
  
  protected void a(boolean paramBoolean1, ArrayList paramArrayList, boolean paramBoolean2)
  {
    try
    {
      if ((a.M) && (paramBoolean1))
      {
        a.M = false;
        ThreadManager.a(new lkz(this), 5, null, true);
      }
      return;
    }
    catch (Exception paramArrayList)
    {
      while (!QLog.isColorLevel()) {}
      QLog.i("Q.aio.TroopChatPie", 2, "onGetTroopMemberCard:" + paramArrayList.toString());
    }
  }
  
  protected void b(Boolean paramBoolean)
  {
    if ((TroopChatPie.g(a) != null) && (paramBoolean.booleanValue())) {
      TroopChatPie.h(a).a();
    }
  }
  
  protected void b(boolean paramBoolean, Object paramObject)
  {
    if (paramBoolean) {
      a.l();
    }
  }
  
  protected void b(boolean paramBoolean, String paramString1, String paramString2, int paramInt)
  {
    if ((a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(paramString1)) && (a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().equals(paramString2)) && (paramInt == 1))
    {
      if (QLog.isColorLevel()) {
        QLog.d(".troop.closeRcvMsgTmp", 2, "onOIDB0XA80_0_Ret: cmd==1," + paramBoolean + "," + paramString1 + "," + paramString2 + "," + a.dA);
      }
      if (!paramBoolean) {
        break label191;
      }
      a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_AIO", "", "AIOchat", "Get_history", 0, 0, paramString1, "", "", "");
      if (QLog.isColorLevel()) {
        QLog.d(".troop.closeRcvMsgTmp", 2, "onOIDB0XA80_0_Ret: pullRecentGroupMsg");
      }
    }
    label191:
    while (a.dA <= 0) {
      return;
    }
    a.r(1);
    paramString1 = a;
    dA -= 1;
  }
  
  protected void c(String paramString)
  {
    int i = 0;
    SharedPreferences localSharedPreferences = BaseApplicationImpl.getContext().getSharedPreferences("mobileQQ", 0);
    boolean bool = localSharedPreferences.getBoolean("HomeworkIcon_" + a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, false);
    if (!TextUtils.isEmpty(paramString)) {
      i = 1;
    }
    if (((bool) && (i == 0)) || ((!bool) && (i != 0)))
    {
      if (i != 0) {
        break label149;
      }
      localSharedPreferences.edit().remove("HomeworkIcon_" + a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).commit();
    }
    for (;;)
    {
      if (TroopChatPie.a(a) != null) {
        TroopChatPie.b(a).a();
      }
      return;
      label149:
      localSharedPreferences.edit().putBoolean("HomeworkIcon_" + a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true).commit();
    }
  }
  
  protected void c(boolean paramBoolean, Object paramObject)
  {
    TroopChatPie.g(a).removeMessages(24);
    HashMap localHashMap;
    int i;
    if ((a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog == null) || (!a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.isShowing()))
    {
      localHashMap = new HashMap();
      if ((!paramBoolean) && ((paramObject instanceof Integer))) {
        i = ((Integer)paramObject).intValue();
      }
    }
    for (;;)
    {
      localHashMap.put("result", i + "");
      localHashMap.put("netType", NetworkUtil.a(BaseApplication.getContext()) + "");
      StatisticCollector.a(BaseApplication.getContext()).a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "multiMsgNickTimeoutR", false, 30000L, 0L, localHashMap, "");
      return;
      if (!paramBoolean)
      {
        i = 1;
        continue;
        if (a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog != null) {
          a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
        }
        ab.clear();
        if ((paramBoolean) && (paramObject != null))
        {
          ab.putAll((Map)paramObject);
          if (QLog.isDevelopLevel()) {
            QLog.d("MultiMsg", 4, "onBatchTroopCardDefaultNick = " + paramObject);
          }
        }
        while (ab.size() == 0)
        {
          QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, 2131367396, 0).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
          return;
          if (QLog.isDevelopLevel()) {
            QLog.d("MultiMsg", 4, "onBatchTroopCardDefaultNick failed");
          }
        }
        a.a((Map)paramObject, aa);
      }
      else
      {
        i = 0;
      }
    }
  }
  
  protected void d(boolean paramBoolean, ArrayList paramArrayList)
  {
    if ((!paramBoolean) || (paramArrayList == null) || (paramArrayList.size() == 0)) {
      break label15;
    }
    label15:
    label50:
    label272:
    label273:
    for (;;)
    {
      return;
      if ((a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1000) || (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1020))
      {
        int i = 0;
        if (i < paramArrayList.size())
        {
          TroopMemberCardInfo localTroopMemberCardInfo = (TroopMemberCardInfo)paramArrayList.get(i);
          if ((localTroopMemberCardInfo != null) && (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(memberuin)))
          {
            paramArrayList = name;
            if ((paramArrayList != null) && (!"".equals(paramArrayList))) {
              break label272;
            }
            paramArrayList = nick;
          }
        }
        for (;;)
        {
          if ((paramArrayList == null) || ("".equals(paramArrayList))) {
            break label273;
          }
          a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d = paramArrayList;
          a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d = a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d;
          a.b.setText(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
          if (!AppSetting.i) {
            break;
          }
          paramArrayList = a.b.getText() + a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131362063);
          a.b.setContentDescription(paramArrayList);
          a.a().setTitle(a.b.getText());
          return;
          i += 1;
          break label50;
          break label15;
        }
      }
    }
  }
}
