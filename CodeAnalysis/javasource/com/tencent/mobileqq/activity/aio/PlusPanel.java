package com.tencent.mobileqq.activity.aio;

import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.graphics.Shader.TileMode;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Environment;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.dataline.activities.LiteVideoActivity;
import com.tencent.av.core.VcSystemInfo;
import com.tencent.av.gaudio.AVNotifyCenter;
import com.tencent.av.gaudio.AVNotifyCenter.VideoRoomInfo;
import com.tencent.biz.AuthorizeConfig;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.biz.eqq.CrmUtils;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.biz.thridappshare.ThridAppShareHelper;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.device.datadef.DeviceInfo;
import com.tencent.device.devicemgr.SmartDeviceProxyMgr;
import com.tencent.device.file.DevVideoMsgProcessor;
import com.tencent.device.utils.SmartDeviceReport;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawable.URLDrawableOptions;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.HotChatDemoActivity;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.panel.AIOPanelUtiles;
import com.tencent.mobileqq.activity.aio.rebuild.DeviceMsgChatPie;
import com.tencent.mobileqq.activity.aio.rebuild.DiscussChatPie;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.activity.qwallet.TransactionActivity;
import com.tencent.mobileqq.activity.qwallet.report.VACDReportUtil;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.DpcNames;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.LBSHandler;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SecMsgManager;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.businessCard.BusinessCardManager;
import com.tencent.mobileqq.businessCard.activity.BusinessCardListActivity;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.dating.DatingUtil;
import com.tencent.mobileqq.emoticonview.EmoticonPagerRadioGroup;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter.fileAssistantReportData;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.TroopInfoManager;
import com.tencent.mobileqq.nearby.NearbyURLSafeUtil;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.servlet.GameCenterManagerImp;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils;
import com.tencent.mobileqq.shortvideo.VideoEnvironment;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.troop.data.TroopAIOAppInfo;
import com.tencent.mobileqq.troop.utils.TroopAppMgr;
import com.tencent.mobileqq.troop.utils.TroopBarUtils;
import com.tencent.mobileqq.troop.utils.TroopFileUtils;
import com.tencent.mobileqq.troop.utils.TroopGiftUtil;
import com.tencent.mobileqq.troop.utils.TroopTopicMgr;
import com.tencent.mobileqq.troop.utils.TroopUtils;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.DialogUtil.DialogOnClickAdapter;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.mobileqq.widget.QQViewPager;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.theme.SkinnableBitmapDrawable;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import cooperation.dingdong.DingdongPluginHelper;
import cooperation.secmsg.SecMsgHelper;
import cooperation.troop.TroopOrgProxyActivity;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kqr;
import kqs;
import kqt;
import kqu;
import kqv;
import org.json.JSONException;
import org.json.JSONObject;

public class PlusPanel
  extends RelativeLayout
  implements View.OnClickListener
{
  private static final int[] A = { 2131367188, 2130839127, 1101678813 };
  private static final int[] B = { 2131366331, 2130838089 };
  private static final int[] C = { 2131371652, 2130838072, 1104864062 };
  private static final int[] D = { 2131371664, 2130838082 };
  private static final int[] E = { 2131371655, 2130838071 };
  private static final int[] F = { 2131365109, 2130842918, 1104874204 };
  private static final int[] G = { 2131365741, 2130839746, 1104639410 };
  private static final int[] H = { 2131364213, 2130839135 };
  private static final int[] I = { 2131364214, 2130839189, 1104536706 };
  private static final int[] J = { 2131370771, 2130838090 };
  private static final int[] K = { 2131371819, 2130839223 };
  private static final int[] L = { 2131362472, 2130838067, 1104823592 };
  private static final int[] M = { 2131368866, 2130838085, 1104788679 };
  private static final int[] N = { 2131370897, 2130838076 };
  private static final int[] O = { 2131371828, 2130840664 };
  private static final int[] P = { 2131365097, 2130838088, 1105015724 };
  public static final int a = 1104864064;
  public static final String a = "200002";
  public static final int b = 1104864054;
  public static final String b = "0";
  public static final int c = 1104788673;
  public static final String c = "1";
  public static final int d = 1104651886;
  public static final int e = 100719166;
  public static final int f = 1104864062;
  public static final int g = 1101487426;
  public static final int h = 1104864066;
  public static final int i = 1105015724;
  public static final int j = 1104864068;
  public static final int k = 1104864070;
  public static final int l = 1104788679;
  public static final int m = 1104639410;
  public static final int n = 1104445552;
  public static final int o = 1104874204;
  public static final int p = 1104823592;
  public static final int q = 1101678813;
  public static final int r = 1104536706;
  public static final int s = 200002;
  public static final int t = 1105002396;
  private static final int[] t;
  private static final int[] v;
  private static final int[] x;
  private static final int[] y;
  private static final int[] z;
  private long jdField_a_of_type_Long = -1L;
  public Dialog a;
  private SparseArray jdField_a_of_type_AndroidUtilSparseArray;
  ThridAppShareHelper jdField_a_of_type_ComTencentBizThridappshareThridAppShareHelper = null;
  private BaseChatPie jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie;
  public PanelAdapter a;
  private SessionInfo jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private EmoticonPagerRadioGroup jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonPagerRadioGroup;
  private QQViewPager jdField_a_of_type_ComTencentMobileqqWidgetQQViewPager;
  ArrayList jdField_a_of_type_JavaUtilArrayList;
  private boolean jdField_a_of_type_Boolean;
  private final int[] jdField_a_of_type_ArrayOfInt = { 2131371859, 2130838080 };
  String[] jdField_a_of_type_ArrayOfJavaLangString = { "chat_tool_hongbao", "chat_tool_qwallettransfer" };
  private final int[][] jdField_a_of_type_Array2dOfInt = { l, k, x, q, C, z, m, t, v, M, A, I, G, F };
  private final int[] jdField_b_of_type_ArrayOfInt = { 2131367809, 2130838079, 1104864054 };
  private final int[][] jdField_b_of_type_Array2dOfInt = { jdField_b_of_type_ArrayOfInt, e, l, k, C, z, x, q, P, m, t, v, M, A, I, G, F, w, L };
  private final int[] c = { 2131367810, 2130838066 };
  private final int[] d = { 2131367821, 2130838086 };
  private final int[] e = { 2131367821, 2130838086, 1104788673 };
  private final int[] f = { 2131370771, 2130838090 };
  private final int[] g = { 2131362117, 2130838092 };
  private final int[] h = { 2131362387, 2130838091 };
  private final int[] i = { 2131367815, 2130838063 };
  private final int[] j = { 2131367816, 2130838063 };
  private final int[] k = { 2131367818, 2130838064, 100719166 };
  private final int[] l = { 2131367817, 2130838065, 1104651886 };
  private final int[] m = { 2131367825, 2130838073, 1104864068 };
  private final int[] n = { 2131367344, 2130838083 };
  private final int[] o = { 2131371845, 2130838087 };
  private final int[] p = { 2131367345, 2130838081 };
  private final int[] q = { 2131367346, 2130838083, 1104864066 };
  private final int[] r = { 2131367490, 2130838077 };
  private final int[] s = { 2131367347, 2130838084 };
  private final int[] u = { 2131366333, 2130838062 };
  private final int[] w = { 2131371794, 2130839600, 1104445552 };
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    t = new int[] { 2131368812, 2130838075, 1104864070 };
    v = new int[] { 2131370851, 2130839054 };
    x = new int[] { 2131364805, 2130839538, 1101487426 };
    y = new int[] { 2131364806, 2130839538 };
    z = new int[] { 2131367187, 2130839126, 1104864064 };
  }
  
  public PlusPanel(Context paramContext)
  {
    super(paramContext);
    jdField_a_of_type_AndroidAppDialog = null;
  }
  
  public PlusPanel(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_a_of_type_AndroidAppDialog = null;
  }
  
  private void a(int paramInt1, int paramInt2, boolean paramBoolean)
  {
    String str = "";
    switch (paramInt1)
    {
    }
    for (;;)
    {
      if (!str.equals("")) {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_AIO", "", "AIOchat", "Clk_plus", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, str, "", "");
      }
      if ((paramBoolean) && (paramInt2 != 0)) {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_open", "", "my_app", "open_app", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, String.valueOf(paramInt2), "", "");
      }
      return;
      str = "0";
      continue;
      str = "1";
      continue;
      str = "2";
      continue;
      str = "3";
      continue;
      str = "4";
      continue;
      str = "5";
      continue;
      str = "6";
      continue;
      str = "8";
      continue;
      str = "9";
      continue;
      str = "10";
      continue;
      str = "11";
      continue;
      str = "12";
      continue;
      str = "13";
      continue;
      str = "14";
      continue;
      str = "15";
      continue;
      str = "16";
      continue;
      str = "17";
      continue;
      str = "18";
    }
  }
  
  private void a(boolean paramBoolean)
  {
    Object localObject = (HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59);
    if ((localObject != null) && (((HotChatManager)localObject).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)))
    {
      if (paramBoolean) {
        jdField_a_of_type_JavaUtilArrayList.add(C);
      }
      if (((HotChatManager)localObject).c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
        jdField_a_of_type_JavaUtilArrayList.add(O);
      }
      jdField_a_of_type_JavaUtilArrayList.add(m);
      return;
    }
    if (jdField_a_of_type_AndroidUtilSparseArray != null) {
      jdField_a_of_type_AndroidUtilSparseArray.clear();
    }
    while (AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
    {
      jdField_a_of_type_JavaUtilArrayList.add(y);
      return;
      jdField_a_of_type_AndroidUtilSparseArray = new SparseArray();
    }
    jdField_a_of_type_JavaUtilArrayList.clear();
    localObject = (TroopAppMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(108);
    if (localObject == null)
    {
      localObject = null;
      label173:
      if ((localObject == null) || (((List)localObject).isEmpty())) {
        break label371;
      }
      localObject = ((List)localObject).iterator();
    }
    label197:
    label267:
    label364:
    label371:
    label383:
    label415:
    label428:
    label431:
    for (;;)
    {
      TroopAIOAppInfo localTroopAIOAppInfo;
      int i2;
      if (((Iterator)localObject).hasNext())
      {
        localTroopAIOAppInfo = (TroopAIOAppInfo)((Iterator)localObject).next();
        if ((!TextUtils.isEmpty(minVersion)) && (AppSetting.a(minVersion) < 0)) {
          continue;
        }
        jdField_a_of_type_AndroidUtilSparseArray.put(appid, localTroopAIOAppInfo);
        int[][] arrayOfInt = jdField_b_of_type_Array2dOfInt;
        i2 = arrayOfInt.length;
        i1 = 0;
        if (i1 >= i2) {
          break label428;
        }
        int[] arrayOfInt1 = arrayOfInt[i1];
        if ((arrayOfInt1.length < 3) || (appid != arrayOfInt1[2])) {
          break label364;
        }
        jdField_a_of_type_JavaUtilArrayList.add(arrayOfInt1);
      }
      for (int i1 = 1;; i1 = 0)
      {
        if (i1 != 0) {
          break label431;
        }
        jdField_a_of_type_JavaUtilArrayList.add(new int[] { -appid, -appid, appid });
        break label197;
        break;
        localObject = ((TroopAppMgr)localObject).a(false);
        break label173;
        i1 += 1;
        break label267;
        localObject = jdField_a_of_type_Array2dOfInt;
        i2 = localObject.length;
        i1 = 0;
        if (i1 < i2)
        {
          localTroopAIOAppInfo = localObject[i1];
          if (localTroopAIOAppInfo != v) {
            break label415;
          }
          b("200002");
        }
        for (;;)
        {
          i1 += 1;
          break label383;
          break;
          jdField_a_of_type_JavaUtilArrayList.add(localTroopAIOAppInfo);
        }
      }
    }
  }
  
  private boolean a(String paramString)
  {
    SharedPreferences localSharedPreferences = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0);
    if (paramString.equals("chat_tool_audio")) {
      return localSharedPreferences.getBoolean(paramString, true);
    }
    if (paramString.equals("chat_tool_gaudio")) {
      return localSharedPreferences.getBoolean(paramString, true);
    }
    if (paramString.equals("chat_tool_gaudio_new")) {
      return localSharedPreferences.getBoolean(paramString, true);
    }
    return localSharedPreferences.getBoolean(paramString + "_" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), true);
  }
  
  private void b(String paramString)
  {
    if (jdField_a_of_type_ComTencentBizThridappshareThridAppShareHelper == null)
    {
      jdField_a_of_type_ComTencentBizThridappshareThridAppShareHelper = ThridAppShareHelper.a();
      jdField_a_of_type_ComTencentBizThridappshareThridAppShareHelper.b();
    }
    if (jdField_a_of_type_ComTencentBizThridappshareThridAppShareHelper.a(paramString))
    {
      if (!"200002".equals(paramString)) {
        break label53;
      }
      jdField_a_of_type_JavaUtilArrayList.add(v);
    }
    label53:
    do
    {
      return;
      if ("0".equals(paramString))
      {
        jdField_a_of_type_JavaUtilArrayList.add(H);
        return;
      }
    } while (!"1".equals(paramString));
    jdField_a_of_type_JavaUtilArrayList.add(I);
  }
  
  private void e()
  {
    ActionSheet localActionSheet = (ActionSheet)ActionSheetHelper.a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), null);
    localActionSheet.a(2131364780, 5);
    boolean bool = ((TroopInfoManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(36)).c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    if (bool) {}
    for (String str = BaseApplicationImpl.getContext().getResources().getString(2131364779);; str = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().getResources().getString(2131364778))
    {
      localActionSheet.a(str, 5);
      localActionSheet.d(2131366996);
      localActionSheet.a(new kqt(this, bool, localActionSheet));
      if (!localActionSheet.isShowing()) {
        localActionSheet.show();
      }
      return;
    }
  }
  
  private void f()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface == null) {
      if (QLog.isColorLevel()) {
        QLog.d("PlusPanel", 2, "reloadFriend app is null");
      }
    }
    do
    {
      return;
      if ((1024 == jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int) && (CrmUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)))
      {
        if (CrmUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int)) {
          jdField_a_of_type_JavaUtilArrayList.add(i);
        }
        jdField_a_of_type_JavaUtilArrayList.add(m);
        return;
      }
      jdField_a_of_type_JavaUtilArrayList.add(i);
      jdField_a_of_type_JavaUtilArrayList.add(f);
      jdField_a_of_type_JavaUtilArrayList.add(d);
      jdField_a_of_type_JavaUtilArrayList.add(G);
      jdField_a_of_type_JavaUtilArrayList.add(C);
      jdField_a_of_type_JavaUtilArrayList.add(B);
      jdField_a_of_type_JavaUtilArrayList.add(s);
      jdField_a_of_type_JavaUtilArrayList.add(n);
      jdField_a_of_type_JavaUtilArrayList.add(t);
      b("200002");
      jdField_a_of_type_JavaUtilArrayList.add(m);
      jdField_a_of_type_JavaUtilArrayList.add(M);
      BusinessCardManager localBusinessCardManager = (BusinessCardManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(111);
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null)
      {
        SecMsgManager localSecMsgManager = (SecMsgManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(56);
        if ((localSecMsgManager != null) && (localSecMsgManager.a())) {
          jdField_a_of_type_JavaUtilArrayList.add(D);
        }
      }
      if ((localBusinessCardManager != null) && (localBusinessCardManager.a(0))) {
        jdField_a_of_type_JavaUtilArrayList.add(N);
      }
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Vip_pay_mywallet", "", "wallet", "transferAIOshow", 0, 0, "", "", "", "");
      if (!ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
      {
        jdField_a_of_type_JavaUtilArrayList.remove(p);
        jdField_a_of_type_JavaUtilArrayList.remove(B);
        jdField_a_of_type_JavaUtilArrayList.remove(v);
        jdField_a_of_type_JavaUtilArrayList.remove(D);
        b("200002");
      }
      if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount() != null) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount().equals(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)))
      {
        jdField_a_of_type_JavaUtilArrayList.remove(B);
        jdField_a_of_type_JavaUtilArrayList.remove(v);
        jdField_a_of_type_JavaUtilArrayList.remove(D);
        b("200002");
        return;
      }
    } while (!ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo));
    jdField_a_of_type_JavaUtilArrayList.clear();
    jdField_a_of_type_JavaUtilArrayList.add(i);
    jdField_a_of_type_JavaUtilArrayList.add(f);
    jdField_a_of_type_JavaUtilArrayList.add(m);
  }
  
  public DeviceInfo a(long paramLong)
  {
    SmartDeviceProxyMgr localSmartDeviceProxyMgr = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
    if (localSmartDeviceProxyMgr != null) {
      return localSmartDeviceProxyMgr.a(paramLong);
    }
    return null;
  }
  
  public void a()
  {
    boolean bool = "1".equals(DeviceProfileManager.a().a(DeviceProfileManager.DpcNames.aio_hotchat_hongbao.name(), "1"));
    ShortVideoUtils.jdField_a_of_type_Boolean = ShortVideoUtils.b();
    int i1 = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int;
    if (QLog.isColorLevel())
    {
      QLog.d("PlusPanel", 2, "reload(): showHongBao=" + bool);
      QLog.d("PlusPanel", 2, "reload(): type=" + i1);
    }
    Object localObject1;
    if (jdField_a_of_type_JavaUtilArrayList == null)
    {
      jdField_a_of_type_JavaUtilArrayList = new ArrayList();
      if (QLog.isColorLevel()) {
        QLog.d("PlusPanel", 2, "reload(): iconList size" + jdField_a_of_type_JavaUtilArrayList.size());
      }
      if (i1 != 3000) {
        break label673;
      }
      jdField_a_of_type_JavaUtilArrayList.add(j);
      jdField_a_of_type_JavaUtilArrayList.add(J);
      jdField_a_of_type_JavaUtilArrayList.add(d);
      jdField_a_of_type_JavaUtilArrayList.add(G);
      jdField_a_of_type_JavaUtilArrayList.add(C);
      jdField_a_of_type_JavaUtilArrayList.add(u);
      jdField_a_of_type_JavaUtilArrayList.add(M);
      jdField_a_of_type_JavaUtilArrayList.add(n);
      localObject1 = (BusinessCardManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(111);
      jdField_a_of_type_JavaUtilArrayList.add(t);
      b("200002");
      jdField_a_of_type_JavaUtilArrayList.add(m);
      if ((localObject1 != null) && (((BusinessCardManager)localObject1).a(0))) {
        jdField_a_of_type_JavaUtilArrayList.add(N);
      }
      label320:
      if ((!VcSystemInfo.e()) || (!VcSystemInfo.f()))
      {
        jdField_a_of_type_JavaUtilArrayList.remove(f);
        jdField_a_of_type_JavaUtilArrayList.remove(i);
        jdField_a_of_type_JavaUtilArrayList.remove(j);
        jdField_a_of_type_JavaUtilArrayList.remove(k);
        jdField_a_of_type_JavaUtilArrayList.remove(l);
      }
      if ((i1 != 1) || (((HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59)).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
        break label1975;
      }
    }
    label435:
    label673:
    label1688:
    label1712:
    label1808:
    label1871:
    label1975:
    for (i1 = 1;; i1 = 0)
    {
      ArrayList localArrayList = new ArrayList();
      int i2 = 0;
      if (i2 < jdField_a_of_type_JavaUtilArrayList.size())
      {
        int[] arrayOfInt = (int[])jdField_a_of_type_JavaUtilArrayList.get(i2);
        PlusPanel.PluginData localPluginData = new PlusPanel.PluginData();
        Resources localResources;
        if ((i1 != 0) && (arrayOfInt.length >= 3) && (jdField_a_of_type_AndroidUtilSparseArray != null))
        {
          TroopAIOAppInfo localTroopAIOAppInfo = (TroopAIOAppInfo)jdField_a_of_type_AndroidUtilSparseArray.get(arrayOfInt[2]);
          if (localTroopAIOAppInfo != null)
          {
            localResources = BaseApplicationImpl.getContext().getResources();
            for (;;)
            {
              try
              {
                localObject1 = URLDrawable.URLDrawableOptions.obtain();
                if ((arrayOfInt.length < 2) || (arrayOfInt[1] <= 0)) {
                  continue;
                }
                i3 = arrayOfInt[1];
                mFailedDrawable = localResources.getDrawable(i3);
                mLoadingDrawable = localResources.getDrawable(i3);
                localObject1 = URLDrawable.getDrawable(iconUrl, (URLDrawable.URLDrawableOptions)localObject1);
              }
              catch (Exception localException2)
              {
                int i3;
                localObject2 = localResources.getDrawable(2130839547);
                continue;
              }
              jdField_a_of_type_AndroidGraphicsDrawableDrawable = ((Drawable)localObject1);
              jdField_a_of_type_Int = arrayOfInt[1];
              jdField_b_of_type_Int = appid;
              jdField_a_of_type_JavaLangString = name;
              jdField_a_of_type_Boolean = redPoint;
              jdField_b_of_type_JavaLangString = (jdField_a_of_type_JavaLangString + " 按钮");
              localArrayList.add(localPluginData);
              i2 += 1;
              break label435;
              jdField_a_of_type_JavaUtilArrayList.clear();
              break;
              if (i1 == 1)
              {
                a(bool);
                break label320;
              }
              if (i1 == 7100) {
                break label320;
              }
              if ((i1 == 1000) || (i1 == 1004))
              {
                jdField_a_of_type_JavaUtilArrayList.add(i);
                jdField_a_of_type_JavaUtilArrayList.add(f);
                jdField_a_of_type_JavaUtilArrayList.add(G);
                jdField_a_of_type_JavaUtilArrayList.add(n);
                jdField_a_of_type_JavaUtilArrayList.add(M);
                jdField_a_of_type_JavaUtilArrayList.add(m);
                jdField_a_of_type_JavaUtilArrayList.add(C);
                break label320;
              }
              if (i1 == 1006)
              {
                jdField_a_of_type_JavaUtilArrayList.add(i);
                jdField_a_of_type_JavaUtilArrayList.add(f);
                jdField_a_of_type_JavaUtilArrayList.add(G);
                jdField_a_of_type_JavaUtilArrayList.add(n);
                jdField_a_of_type_JavaUtilArrayList.add(M);
                jdField_a_of_type_JavaUtilArrayList.add(m);
                break label320;
              }
              if (i1 == 1020) {
                break label320;
              }
              if ((i1 == 1008) || (i1 == 1024))
              {
                if (CrmUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int)) {
                  jdField_a_of_type_JavaUtilArrayList.add(i);
                }
                jdField_a_of_type_JavaUtilArrayList.add(jdField_b_of_type_ArrayOfInt);
                jdField_a_of_type_JavaUtilArrayList.add(c);
                if (i1 == 1008)
                {
                  localObject1 = ((PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55)).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
                  if ((localObject1 != null) && ((accountFlag & 0x20000000) != 0) && (ShortVideoUtils.jdField_a_of_type_Boolean) && (VideoEnvironment.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)))
                  {
                    jdField_a_of_type_Boolean = true;
                    jdField_a_of_type_JavaUtilArrayList.add(e);
                  }
                  if ((localObject1 != null) && ((accountFlag & 0x10000000) != 0)) {
                    jdField_a_of_type_JavaUtilArrayList.add(0, jdField_a_of_type_ArrayOfInt);
                  }
                }
                if (PublicAccountUtil.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
                  break label320;
                }
                jdField_a_of_type_JavaUtilArrayList.add(m);
                break label320;
              }
              if ((i1 == 1005) || (i1 == 1003)) {
                break label320;
              }
              if (i1 == 1001)
              {
                jdField_a_of_type_JavaUtilArrayList.add(i);
                jdField_a_of_type_JavaUtilArrayList.add(f);
                jdField_a_of_type_JavaUtilArrayList.add(G);
                jdField_a_of_type_JavaUtilArrayList.add(n);
                localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().k(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
                if ((localObject1 != null) && (localObject1.length > 0) && (bool)) {
                  jdField_a_of_type_JavaUtilArrayList.add(C);
                }
                if (localObject1 != null) {
                  jdField_a_of_type_JavaUtilArrayList.add(E);
                }
                jdField_a_of_type_JavaUtilArrayList.add(m);
                break label320;
              }
              if (i1 == 1010)
              {
                jdField_a_of_type_JavaUtilArrayList.add(i);
                jdField_a_of_type_JavaUtilArrayList.add(f);
                jdField_a_of_type_JavaUtilArrayList.add(G);
                jdField_a_of_type_JavaUtilArrayList.add(n);
                localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().k(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
                if ((localObject1 != null) && (localObject1.length > 0)) {
                  jdField_a_of_type_JavaUtilArrayList.add(E);
                }
                jdField_a_of_type_JavaUtilArrayList.add(m);
                break label320;
              }
              if (i1 == 1021)
              {
                jdField_a_of_type_JavaUtilArrayList.add(i);
                jdField_a_of_type_JavaUtilArrayList.add(f);
                jdField_a_of_type_JavaUtilArrayList.add(G);
                break label320;
              }
              if ((i1 == 1022) || (i1 == 1009) || (i1 == 1024) || (i1 == 1023)) {
                break label320;
              }
              if (i1 == 6000)
              {
                jdField_a_of_type_JavaUtilArrayList.add(f);
                jdField_a_of_type_JavaUtilArrayList.add(n);
                jdField_a_of_type_JavaUtilArrayList.add(G);
                break label320;
              }
              if (i1 == 9501) {
                try
                {
                  l1 = Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
                  localObject1 = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
                  if ((localObject1 == null) || (!((SmartDeviceProxyMgr)localObject1).d(l1))) {
                    break label320;
                  }
                  jdField_a_of_type_JavaUtilArrayList.add(n);
                }
                catch (Exception localException1)
                {
                  localException1.printStackTrace();
                  long l1 = 0L;
                  continue;
                }
              }
              if ((i1 == 0) || (ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)))
              {
                f();
                break label320;
              }
              jdField_a_of_type_JavaUtilArrayList.add(m);
              break label320;
              i3 = 2130839547;
            }
          }
        }
        jdField_a_of_type_AndroidGraphicsDrawableDrawable = BaseApplicationImpl.getContext().getResources().getDrawable(arrayOfInt[1]);
        jdField_a_of_type_Int = arrayOfInt[1];
        jdField_a_of_type_JavaLangString = BaseApplicationImpl.getContext().getResources().getString(arrayOfInt[0]);
        Object localObject2 = (GameCenterManagerImp)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(11);
        if (localObject2 != null)
        {
          if (((GameCenterManagerImp)localObject2).a("999999.100004") != -1) {
            bool = true;
          }
        }
        else
        {
          if ((arrayOfInt != H) || (!a("chat_tool_dingyue"))) {
            break label1808;
          }
          jdField_a_of_type_Boolean = true;
          jdField_b_of_type_JavaLangString = (BaseApplicationImpl.getContext().getResources().getString(arrayOfInt[0]) + "按钮");
          if (AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
          {
            if (arrayOfInt != jdField_b_of_type_ArrayOfInt) {
              break label1871;
            }
            jdField_b_of_type_JavaLangString = BaseApplicationImpl.getContext().getResources().getString(2131364808);
          }
        }
        for (;;)
        {
          localArrayList.add(localPluginData);
          break;
          bool = false;
          break label1688;
          if ((arrayOfInt == B) && (a("chat_tool_qwallettransfer")))
          {
            jdField_a_of_type_Boolean = true;
            break label1712;
          }
          if ((arrayOfInt == G) && (a("chat_tool_qfav")))
          {
            jdField_a_of_type_Boolean = true;
            break label1712;
          }
          jdField_a_of_type_Boolean = false;
          break label1712;
          if (arrayOfInt == c) {
            jdField_b_of_type_JavaLangString = BaseApplicationImpl.getContext().getResources().getString(2131364807);
          }
        }
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioPanelAdapter.a(localArrayList);
      if (jdField_a_of_type_ComTencentMobileqqActivityAioPanelAdapter.getCount() > 1)
      {
        jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonPagerRadioGroup.a(jdField_a_of_type_ComTencentMobileqqActivityAioPanelAdapter.getCount(), false);
        jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonPagerRadioGroup.setVisibility(0);
      }
      for (;;)
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioPanelAdapter.notifyDataSetChanged();
        post(new kqr(this));
        return;
        jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonPagerRadioGroup.setVisibility(4);
      }
    }
  }
  
  public void a(BaseChatPie paramBaseChatPie, SessionInfo paramSessionInfo)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramBaseChatPie.a();
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie = paramBaseChatPie;
    jdField_a_of_type_ComTencentMobileqqWidgetQQViewPager = ((QQViewPager)findViewById(2131296905));
    jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonPagerRadioGroup = ((EmoticonPagerRadioGroup)findViewById(2131296906));
    jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonPagerRadioGroup.setViewPager(jdField_a_of_type_ComTencentMobileqqWidgetQQViewPager);
    jdField_a_of_type_ComTencentMobileqqActivityAioPanelAdapter = new PanelAdapter(BaseApplicationImpl.getContext());
    jdField_a_of_type_ComTencentMobileqqActivityAioPanelAdapter.a(this);
    jdField_a_of_type_ComTencentMobileqqWidgetQQViewPager.setAdapter(jdField_a_of_type_ComTencentMobileqqActivityAioPanelAdapter);
    paramBaseChatPie = getResources().getDrawable(2130842663);
    if ((paramBaseChatPie instanceof BitmapDrawable)) {
      paramBaseChatPie = ((BitmapDrawable)paramBaseChatPie).getBitmap();
    }
    for (;;)
    {
      paramBaseChatPie = new BitmapDrawable(paramBaseChatPie);
      if (paramBaseChatPie != null)
      {
        paramBaseChatPie.setTileModeXY(Shader.TileMode.REPEAT, Shader.TileMode.REPEAT);
        paramBaseChatPie.setDither(true);
        setBackgroundDrawable(paramBaseChatPie);
      }
      for (;;)
      {
        a();
        return;
        if (!(paramBaseChatPie instanceof SkinnableBitmapDrawable)) {
          break label191;
        }
        paramBaseChatPie = ((SkinnableBitmapDrawable)paramBaseChatPie).getBitmap();
        break;
        if (QLog.isColorLevel()) {
          QLog.d("AIOAudioPanel", 2, "PlusPanle background is null:");
        }
      }
      label191:
      paramBaseChatPie = null;
    }
  }
  
  void a(String paramString)
  {
    SharedPreferences localSharedPreferences = BaseApplicationImpl.getContext().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0);
    if (paramString.equals("chat_tool_audio")) {
      localSharedPreferences.edit().putBoolean(paramString, false).commit();
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioPanelAdapter.notifyDataSetChanged();
      return;
      if (paramString.equals("chat_tool_gaudio")) {
        localSharedPreferences.edit().putBoolean(paramString, false).commit();
      } else if (paramString.equals("chat_tool_gaudio_new")) {
        localSharedPreferences.edit().putBoolean(paramString, false).commit();
      } else {
        localSharedPreferences.edit().putBoolean(paramString + "_" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), false).commit();
      }
    }
  }
  
  public void b()
  {
    a();
  }
  
  public void c()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1)
    {
      a("chat_tool_gaudio_new");
      Object localObject = new HashMap();
      ((Map)localObject).put("MultiAVType", String.valueOf(10));
      ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true, true, null, (Map)localObject);
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.aa();
      b();
      if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie != null) {
        jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().setCanLock(false);
      }
      long l1 = Long.valueOf(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).longValue();
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a() == 0L)
      {
        localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(l1, 10);
        if ((localObject == null) || (jdField_a_of_type_Int <= 0)) {
          break label158;
        }
      }
    }
    return;
    label158:
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005928", "0X8005928", 0, 0, "", "", "", "");
  }
  
  void d()
  {
    if (QLog.isColorLevel()) {
      QLog.d("PlusPanel", 2, "showSelGAudioMembersActionSheet");
    }
    if ((jdField_a_of_type_AndroidAppDialog == null) || (jdField_a_of_type_AndroidAppDialog.isShowing())) {}
    try
    {
      jdField_a_of_type_AndroidAppDialog.dismiss();
      jdField_a_of_type_AndroidAppDialog = null;
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.aa();
      ActionSheet localActionSheet = ActionSheet.c(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a());
      localActionSheet.c(getResources().getString(2131363813));
      localActionSheet.c(getResources().getString(2131363814));
      localActionSheet.d(getResources().getString(2131367695));
      localActionSheet.a(new kqu(this, localActionSheet));
      localActionSheet.setOnDismissListener(new kqv(this));
      localActionSheet.setCanceledOnTouchOutside(true);
      jdField_a_of_type_AndroidAppDialog = localActionSheet;
      try
      {
        jdField_a_of_type_AndroidAppDialog.show();
        if ((jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie instanceof DiscussChatPie)) {
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie).a = localActionSheet;
        }
        return;
      }
      catch (Exception localException2)
      {
        for (;;)
        {
          localException2.printStackTrace();
        }
      }
    }
    catch (Exception localException1)
    {
      for (;;) {}
    }
  }
  
  public void onClick(View paramView)
  {
    PanelAdapter.ViewHolder localViewHolder = (PanelAdapter.ViewHolder)paramView.getTag();
    int i3 = jdField_a_of_type_Int;
    int i1 = 0;
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 9501) {}
    for (;;)
    {
      label455:
      boolean bool;
      try
      {
        paramView = a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
        if (paramView != null) {
          i1 = productId;
        }
      }
      catch (Exception paramView)
      {
        i1 = 0;
        continue;
        PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, getContext(), jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, i1);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800407A", "0X800407A", 0, 0, "", "", "", "");
        if (!AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
          continue;
        }
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_anon", "", "anon_aio", "Clk_shoot", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
        continue;
        if (VideoEnvironment.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)) {
          continue;
        }
        DialogUtil.a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), 230).setMessage("系统版本过低，不支持短视频功能").setPositiveButton(2131366997, new DialogUtil.DialogOnClickAdapter()).show();
        continue;
        if (!jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.n()) {
          continue;
        }
        jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.o(2);
        continue;
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c();
        jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.ae();
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 9501) {
          break label988;
        }
      }
      paramView = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
      switch (i3)
      {
      default: 
        if (i3 < 0)
        {
          if (-i3 == 1105002396) {
            TroopOrgProxyActivity.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          }
        }
        else
        {
          if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) && (!((HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59)).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)))
          {
            if (jdField_a_of_type_AndroidUtilSparseArray != null) {
              break label5838;
            }
            paramView = null;
            if ((paramView != null) && (redPoint)) {
              ThreadManager.a(new kqs(this, paramView), 8, null, false);
            }
            if ((paramView == null) || (!canRemove)) {
              break label5857;
            }
            bool = true;
            a(i3, jdField_b_of_type_Int, bool);
          }
          return;
        }
        break;
      case 2130838066: 
      case 2130838086: 
      case 2130838078: 
      case 2130838079: 
        label496:
        label509:
        paramView = new Intent();
        if (paramView != null) {
          if (DeviceMsgChatPie.K) {
            break label982;
          }
        }
        label803:
        label982:
        for (bool = true;; bool = false)
        {
          paramView.putExtra("isdevicesupportmultiupload", bool);
          PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, null, paramView);
          SmartDeviceReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString), "Usr_AIO_SendMsg", 3, 0, i1);
          if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie != null)
          {
            paramView = (TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20);
            if ((!TextUtils.isEmpty(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1)) {
              paramView.d(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true);
            }
            jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().setCanLock(false);
          }
          AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X8004079", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 9501) {
            SmartDeviceReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString), "Usr_AIO_SendMsg", 3, 0, i1);
          }
          if (!AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
            break;
          }
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_anon", "", "anon_aio", "Clk_pic", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
          break;
        }
        label988:
        if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) && (((HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59)).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)))
        {
          paramView = new Intent();
          paramView.putExtra("filter_photolist_troopalbum_toolbar", true);
        }
        break;
      }
      for (;;)
      {
        PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramView);
        break label803;
        TroopGiftUtil.a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "pluspanel", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        paramView = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        if (paramView == null) {
          break;
        }
        if (paramView.isTroopOwner(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a())) {
          i1 = 0;
        }
        for (;;)
        {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_flower", "", "grp_aio", "Clk_addpa", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString + "", i1 + "", "", "");
          break;
          if (paramView.isAdmin()) {
            i1 = 1;
          } else {
            i1 = 2;
          }
        }
        if (QLog.isColorLevel()) {
          QLog.i("testing", 2, "deliver flowers!");
        }
        paramView = getContext();
        String str = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
        Object localObject2 = Utils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().k(str));
        if (TextUtils.isEmpty((CharSequence)localObject2)) {
          break;
        }
        if (Friends.isValidUin(str))
        {
          str = String.format("http://imgcache.qq.com/club/client/flower/release/html/index.html?strangerUin=%s&sign=%s&sourceType=%d&ADTAG=%s&groupCode=%s&_wv=2147347&_bid=2050", new Object[] { NearbyURLSafeUtil.a(str), ((String)localObject2).toLowerCase(), Integer.valueOf(1), "aio.plus.s", "" });
          localObject2 = new Intent(paramView, QQBrowserActivity.class);
          ((Intent)localObject2).putExtra("url", str);
          paramView.startActivity((Intent)localObject2);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80052BE", "0X80052BE", 0, 0, "", "", "", "");
          break;
        }
        QQToast.a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), 2131371195, 0).b(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().getTitleBarHeight());
        break;
        paramView = (HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59);
        if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) && (!paramView.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
          e();
        }
        for (;;)
        {
          AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X800407F", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          break;
          PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a());
          if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie != null) {
            jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().setCanLock(false);
          }
        }
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1)
        {
          a("chat_tool_gaudio");
          paramView = new HashMap();
          paramView.put("isVideo", "true");
          paramView.put("MultiAVType", String.valueOf(10));
          ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true, true, null, paramView);
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.aa();
          b();
          if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie != null) {
            jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().setCanLock(false);
          }
          l1 = Long.valueOf(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).longValue();
          if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a() != l1) {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005677", "0X8005677", 0, 0, "", "", "", "");
          }
          if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a() != 0L) {
            break;
          }
          paramView = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(l1, 10);
          if ((paramView != null) && (jdField_a_of_type_Int > 0)) {
            break;
          }
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005929", "0X8005929", 0, 0, "", "", "", "");
          break;
        }
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000)
        {
          a("chat_tool_gaudio");
          paramView = new HashMap();
          paramView.put("isVideo", "true");
          ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true, true, null, paramView);
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.aa();
          b();
          if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie != null) {
            jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().setCanLock(false);
          }
          l1 = Long.valueOf(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).longValue();
          if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a() == l1) {
            break;
          }
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005676", "0X8005676", 0, 0, "", "", "", "");
          break;
        }
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1001)
        {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005153", "0X8005153", 0, 0, "", "", "", "");
          if (LBSHandler.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
            break label2175;
          }
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.c(BaseApplicationImpl.getContext().getString(2131371198));
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005155", "0X8005155", 0, 0, "", "", "", "");
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005155", "0X8005155", 0, 0, "", "", "", "");
          break;
        }
        if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1010) && (!DatingUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)))
        {
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.c(BaseApplicationImpl.getContext().getString(2131371198));
          break;
        }
        label2175:
        jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.ae();
        PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, false, null, null);
        if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie != null)
        {
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.aa();
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().setCanLock(false);
        }
        AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X8004086", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        break;
        if (!(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie instanceof PublicAccountChatPie)) {
          break;
        }
        jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie).i.performClick();
        break;
        d();
        break;
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000)
        {
          a("chat_tool_gaudio");
          PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true, true, null, 0);
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.aa();
          b();
          if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie != null) {
            jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().setCanLock(false);
          }
          l1 = Long.valueOf(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).longValue();
          if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a() == l1) {
            break;
          }
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004085", "0X8004085", 0, 0, "", "", "", "");
          break;
        }
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1)
        {
          a("chat_tool_gaudio");
          paramView = new HashMap();
          paramView.put("MultiAVType", String.valueOf(2));
          ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true, true, null, paramView);
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.aa();
          b();
          if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie != null) {
            jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().setCanLock(false);
          }
          l1 = Long.valueOf(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).longValue();
          if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(1, l1)) {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80046CE", "0X80046CE", 0, 0, "", "", "", "");
          }
          AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X8005CB5", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          break;
        }
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1001)
        {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005152", "0X8005152", 0, 0, "", "", "", "");
          if (LBSHandler.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
            break label2829;
          }
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.c(BaseApplicationImpl.getContext().getString(2131371197));
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005154", "0X8005154", 0, 0, "", "", "", "");
          break;
        }
        if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1010) && (!DatingUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)))
        {
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.c(BaseApplicationImpl.getContext().getString(2131371197));
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80049C8", "0X80049C8", 0, 0, "", "", "", "");
          break;
        }
        label2829:
        a("chat_tool_audio");
        jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.aa();
        b();
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1024) {
          if (CrmUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int))
          {
            CrmUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, "IvrAIOBottomButtonEngineFalse");
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004651", "0X8004651", 0, 0, "", "", "", "");
          }
        }
        for (;;)
        {
          if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie != null) {
            jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().setCanLock(false);
          }
          AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X800407B", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          break;
          QQToast.a(BaseApplicationImpl.getContext(), 2131363456, 1).b(BaseApplicationImpl.getContext().getResources().getDimensionPixelSize(2131492908));
          if (QLog.isColorLevel())
          {
            QLog.d("AIOAudioPanel", 2, "Don't support ivr");
            continue;
            PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, true, null, null);
          }
        }
        Environment.getExternalStorageState();
        long l1 = 0L;
        try
        {
          long l2 = Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          l1 = l2;
        }
        catch (Exception localException)
        {
          for (;;)
          {
            localException.printStackTrace();
            continue;
            if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 9501) && (paramView != null) && (paramView.d(l1)))
            {
              PlusPanelUtils.d(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
            }
            else
            {
              AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X800407C", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
              paramView = new FileManagerReporter.fileAssistantReportData();
              jdField_b_of_type_JavaLangString = "send_file";
              jdField_a_of_type_Int = 1;
              FileManagerReporter.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), paramView);
              PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
            }
          }
        }
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1)
        {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800407E", "0X800407E", 0, 0, "", "", "", "");
          PlusPanelUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
          if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie == null) {
            break;
          }
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().setCanLock(false);
          break;
        }
        a("chat_tool_qlink_file");
        b();
        FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800407D", "0X800407D", 0, 0, "", "", "", "");
        break;
        i1 = 1;
        if (jdField_a_of_type_Long == -1L)
        {
          label3377:
          if (i1 == 0) {
            break label3446;
          }
          ChatActivityFacade.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
          jdField_a_of_type_Long = System.currentTimeMillis();
        }
        for (;;)
        {
          AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X8004081", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          break;
          if (System.currentTimeMillis() - jdField_a_of_type_Long >= 10000L) {
            break label3377;
          }
          i1 = 0;
          break label3377;
          label3446:
          QQToast.a(BaseApplicationImpl.getContext(), "歇一会再发送窗口抖动吧", 0).a();
        }
        paramView = new Bundle();
        paramView.putInt("forward_type", 23);
        paramView.putInt("curent_aio_uin_type", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        paramView.putString("curent_aio_uinname", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
        paramView.putString("curent_aio_uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        paramView.putString("curent_aio_troop_uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_JavaLangString);
        Object localObject1 = new Intent();
        ((Intent)localObject1).putExtras(paramView);
        ForwardBaseOption.a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), (Intent)localObject1, 21);
        AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X80056B3", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        break;
        paramView = new Bundle();
        paramView.putInt("forward_type", 23);
        paramView.putInt("curent_aio_uin_type", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        paramView.putString("curent_aio_uinname", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
        paramView.putString("curent_aio_uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        paramView.putString("curent_aio_troop_uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_JavaLangString);
        localObject1 = new Intent(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), BusinessCardListActivity.class);
        ((Intent)localObject1).putExtras(paramView);
        ((Intent)localObject1).putExtra("Extra_Entrance", 3);
        jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().startActivityForResult((Intent)localObject1, 21);
        AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X80064F3", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        break;
        if ((jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie == null) || (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a() == null)) {
          break label509;
        }
        paramView = AuthorizeConfig.a().a("aio_qqMusicShare", "");
        PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, paramView);
        jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().setCanLock(false);
        AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X8004083", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        break;
        ThridAppShareHelper.a().a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), "200002", "http://m.dianping.com/qq/aiodwonload", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
        ThridAppShareHelper.a("200002", "click_app", "", "", "");
        AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X8005CB2", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        break;
        TroopUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "0");
        AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X8005CB6", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        break;
        paramView = new Bundle();
        paramView.putString("troop_uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        paramView.putBoolean("hide_operation_bar", true);
        paramView.putBoolean("hide_more_button", true);
        paramView.putBoolean("isScreenOrientationPortrait", true);
        TroopUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), paramView);
        AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X8005CB8", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        break;
        if (!AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
        {
          a("chat_tool_anonymous");
          b();
          if (!(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie instanceof TroopChatPie)) {
            break label509;
          }
          ((TroopChatPie)jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie).a(2, "");
          ((TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20)).a(1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          ReportController.a(null, "P_CliOper", "Grp_anon", "", "norm_aio", "Clk_anon", 0, 0, String.valueOf(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString), "", "", "");
          AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X8005CB4", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          break;
        }
        if (!(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie instanceof TroopChatPie)) {
          break label509;
        }
        ((TroopChatPie)jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie).k(false);
        ReportController.a(null, "P_CliOper", "Grp_anon", "", "norm_aio", "Clk_quit", 0, 0, String.valueOf(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString), "", "", "");
        break;
        a("chat_tool_qwallettransfer");
        b();
        paramView = new Intent(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), TransactionActivity.class);
        paramView.putExtra("come_from", 2);
        localObject1 = new JSONObject();
        try
        {
          ((JSONObject)localObject1).put("targetUin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          ((JSONObject)localObject1).put("targetNickname", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
          ((JSONObject)localObject1).put("sign", "");
          paramView.putExtra("extra_data", ((JSONObject)localObject1).toString());
          paramView.putExtra("app_info", "appid#20000001|bargainor_id#1000026901|channel#aio");
          paramView.putExtra("vacreport_key_seq", VACDReportUtil.a(null, "qqwallet", "transfer", "click", "sessionType=" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, 0, null));
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().startActivity(paramView);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Vip_pay_mywallet", "", "wallet", "transferAIOclick", 0, 0, "", "", "", "");
          AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X8005CB0", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        }
        catch (JSONException localJSONException)
        {
          for (;;)
          {
            localJSONException.printStackTrace();
          }
        }
        DevVideoMsgProcessor.a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a());
        if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 9501) || (TextUtils.isEmpty(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
          break;
        }
        SmartDeviceReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString), "Usr_AIO_SendMsg", 4, 0, i1);
        break;
        localObject1 = new Intent(BaseApplicationImpl.getContext(), LiteVideoActivity.class);
        int i2 = 1;
        if (paramView != null) {}
        label5838:
        label5857:
        label5863:
        for (;;)
        {
          try
          {
            if (!paramView.a()) {
              break label5863;
            }
            bool = paramView.a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString), 9);
            if (!bool) {
              break label5863;
            }
            i2 = 1;
          }
          catch (Exception paramView)
          {
            paramView.printStackTrace();
            continue;
          }
          ((Intent)localObject1).putExtra("maxCount", i2);
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().startActivityForResult((Intent)localObject1, 81);
          if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 9501) || (TextUtils.isEmpty(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
            break;
          }
          SmartDeviceReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString), "Usr_AIO_SendMsg", 5, 0, i1);
          break;
          b();
          if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 0)
          {
            new PlusPanelUtils().b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, 0);
            break;
          }
          PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, null, 0);
          break;
          paramView = new Intent();
          paramView.putExtra("friendUin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          paramView.putExtra("nickName", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
          SecMsgHelper.a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 2, paramView);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "AnonyMsg", "clk_aio_creat", 0, 0, "", "", "", "");
          AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X8005CB3", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          break;
          a("chat_tool_qfav");
          b();
          if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie == null) {
            break;
          }
          PlusPanelUtils.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().setCanLock(false);
          AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X8005CB1", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          break;
          a("chat_tool_dingyue");
          b();
          paramView = new Intent(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), QQBrowserActivity.class);
          paramView.putExtra("url", "http://buluo.qq.com/cgi-bin/bar/group_subscribe/entrance?gid=" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().startActivity(paramView);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_AIO", "", "add_page", "Clk_sub", 0, 0, "", "", "", "");
          break;
          a("chat_tool_toupiao");
          b();
          paramView = new Intent(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), QQBrowserActivity.class);
          paramView.putExtra("url", "http://client.qun.qq.com/qqweb/m/qun/vote/index.html?_wv=1031&_bid=2035&groupuin=" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString + "&src=3");
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().startActivity(paramView);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_AIO", "", "add_page", "Clk_vote", 0, 0, "", "", "", "");
          AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X8005CB9", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          break;
          paramView = new Intent();
          paramView.putExtra("_src_type_", DingdongPluginHelper.b(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int));
          paramView.putExtra("_src_code_", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          DingdongPluginHelper.a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), "com.dingdong.business.base.activity.DingdongDingActivity", paramView, -1);
          break;
          paramView = new Intent(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), QQBrowserActivity.class);
          paramView.putExtra("url", "https://mqq.tenpay.com/v2/hybrid/www/mobile_qq/aareceive/index.shtml" + "?_wv=1793" + "&f=6" + "&uintype=3000" + "&touin=" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          paramView.putExtra("app_info", "appid#20000002|bargainor_id#1000026801|channel#aio");
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().startActivity(paramView);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Vip_pay_mywallet", "", "wallet", "shoukuan_AIOclick", 0, 0, "", "", "", "");
          AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X8005CBB", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          break;
          paramView = new Intent(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), HotChatDemoActivity.class);
          paramView.putExtra("troop_uin", jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_JavaLangString);
          paramView.putExtra("uin", jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          paramView.putExtra("uintype", jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          paramView.putExtra("uinname", jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
          paramView.putExtra("entrance", 1);
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().startActivity(paramView);
          break;
          l1 = Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          paramView = "";
          if (TroopFileUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, l1)) {
            paramView = "role=teacher&";
          }
          localObject1 = new Intent(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), QQBrowserActivity.class);
          ((Intent)localObject1).putExtra("url", "http://qun.qq.com/homework/features/index.html?_wv=1027&_bid=2146#" + paramView + "gid=" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString + "&src=0");
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().startActivity((Intent)localObject1);
          AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X8005CBA", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          break;
          paramView = (TroopTopicMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(97);
          if (paramView == null) {
            break;
          }
          TroopBarUtils.a.clear();
          paramView.a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_talk", "", "Grp_plus", "Clk_app", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
          break;
          if (paramView == null) {
            break;
          }
          localObject1 = a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
          if (localObject1 == null) {
            break;
          }
          paramView.a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), (DeviceInfo)localObject1, false);
          break;
          if ((jdField_a_of_type_AndroidUtilSparseArray == null) || (jdField_a_of_type_AndroidUtilSparseArray.indexOfKey(jdField_b_of_type_Int) < 0)) {
            break;
          }
          paramView = (TroopAIOAppInfo)jdField_a_of_type_AndroidUtilSparseArray.get(jdField_b_of_type_Int);
          localObject1 = new Intent(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), QQBrowserActivity.class);
          if ((paramView == null) || (url == null)) {
            break;
          }
          ((Intent)localObject1).putExtra("url", url.replace("$GCODE$", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).replace("$APPID$", String.valueOf(jdField_b_of_type_Int)));
          jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().startActivity((Intent)localObject1);
          break;
          paramView = (TroopAIOAppInfo)jdField_a_of_type_AndroidUtilSparseArray.get(jdField_b_of_type_Int);
          break label455;
          bool = false;
          break label496;
        }
        paramView = null;
      }
      i1 = 0;
    }
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    int i1 = paramMotionEvent.getAction() & 0xFF;
    if (i1 == 0) {
      getParent().requestDisallowInterceptTouchEvent(true);
    }
    for (;;)
    {
      return super.onInterceptTouchEvent(paramMotionEvent);
      if ((i1 == 1) || (i1 == 3)) {
        getParent().requestDisallowInterceptTouchEvent(false);
      }
    }
  }
}
