package com.tencent.mobileqq.activity.aio.panel;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import com.dataline.activities.LiteVideoActivity;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.device.datadef.DeviceInfo;
import com.tencent.device.devicemgr.SmartDeviceProxyMgr;
import com.tencent.device.utils.SmartDeviceReport;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.aio.PlusPanelUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.photo.PhotoListPanel;
import com.tencent.mobileqq.activity.aio.photo.PhotoListPanel.SwipeUpAndDragListener;
import com.tencent.mobileqq.activity.photo.SendPhotoActivity;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richmedia.RichmediaService;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import mqq.manager.ServerConfigManager.ConfigType;

public class AIOPanelUtiles
{
  public static final String a = "flow_back";
  public static boolean a = false;
  public static final int[] a;
  public static final String b = "click_item";
  public static final int[] b = { 2, 2131371859, 2130837608 };
  public static final String c = "AIOPanelUtiles";
  public static final int[] c = { 3, 2131371860, 2130837587 };
  public static final String d = "sp_aio_hongbao_showed";
  public static final int[] d = { 3, 2131371860, 2130837589 };
  public static final int[] e = { 4, 2131371861, 2130837595 };
  public static final int[] f = { 4, 2131371861, 2130837597 };
  public static final int[] g = { 5, 2131371862, 2130837584 };
  public static final int[] h = { 5, 2131371862, 2130837586 };
  public static final int[] i = { 6, 2131371863, 2130837609 };
  public static final int[] j = { 8, 2131371865, 2130837602 };
  public static final int[] k = { 8, 2131371865, 2130837604 };
  public static final int[] l = { 9, 2131371866, 2130837605 };
  public static final int[] m = { 10, 2131371867, 2130837594 };
  public static final int[] n = { 12, 2131371869, 2130837610 };
  public static final int[] o = { 13, 2131371870, 2130837609 };
  public static final int[] p = { 14, 2131371871, 2130837593 };
  public static final int[] q = { 19, 2131371872, 2130837601 };
  public static final int[] r = { 16, 2131371874, 2130837590 };
  public static final int[] s = { 17, 2131371875, 2130837598 };
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ArrayOfInt = new int[] { 2, 2131371859, 2130837606 };
  }
  
  public AIOPanelUtiles() {}
  
  private static DeviceInfo a(QQAppInterface paramQQAppInterface, long paramLong)
  {
    paramQQAppInterface = (SmartDeviceProxyMgr)paramQQAppInterface.a(51);
    if (paramQQAppInterface != null) {
      return paramQQAppInterface.a(paramLong);
    }
    return null;
  }
  
  public static PhotoListPanel a(QQAppInterface paramQQAppInterface, BaseChatPie paramBaseChatPie, LinearLayout paramLinearLayout, PanelIconLinearLayout paramPanelIconLinearLayout, boolean paramBoolean)
  {
    PhotoListPanel localPhotoListPanel = (PhotoListPanel)View.inflate(jdField_a_of_type_AndroidContentContext, 2130904002, null);
    Intent localIntent = new Intent();
    String str2 = paramQQAppInterface.getAccount();
    Object localObject = ((FriendsManager)paramQQAppInterface.getManager(50)).c(str2);
    String str1 = "";
    if (localObject != null) {
      str1 = name;
    }
    localObject = paramQQAppInterface.a(1, str2, 0);
    boolean bool = paramQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    localIntent.putExtra("key_my_uin", str2);
    localIntent.putExtra("key_my_nick", str1);
    localIntent.putExtra("key_my_head_dir", (String)localObject);
    localIntent.putExtra("key_new_lbs_client", bool);
    localIntent.putExtra("custom_photolist_panel_editbtn_reportActionName", "0X8005E06");
    if ((paramBaseChatPie.b() == 9500) || (paramBaseChatPie.b() == 9501)) {
      localIntent.putExtra("PhotoConst.PHOTOLIST_KEY_FILTER_GIF_VIDEO", true);
    }
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) && (((HotChatManager)paramQQAppInterface.getManager(59)).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
      localIntent.putExtra("filter_photolist_troopalbum_toolbar", true);
    }
    localIntent.putExtra("PhotoConst.PHOTOLIST_KEY_SHOW_MEDIA", PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo));
    if (paramBoolean)
    {
      localIntent.putExtra("key_disable_quality_cb", true);
      localIntent.putExtra("key_disable_edit_btn", true);
      localIntent.putExtra("key_disable_send_btn", true);
      localIntent.putExtra("key_disable_presend", true);
      localIntent.putExtra("PhotoConst.PHOTOLIST_KEY_FILTER_GIF_VIDEO", true);
      localIntent.putExtra("PhotoConst.IS_SINGLE_MODE", true);
      localIntent.putExtra("filter_photolist_troopalbum_toolbar", true);
      localIntent.putExtra("PhotoConst.SEND_BUSINESS_TYPE", 1039);
      localIntent.putExtra("custom_photopreview_sendbtn_report", true);
      localIntent.putExtra("custom_photopreview_sendbtn_reportActionName", "0X8005978");
      localIntent.putExtra("custom_photopreview_sendbtn_album_reportReverse2", "1");
      paramQQAppInterface = (TroopHandler)paramQQAppInterface.a(20);
      if ((!TextUtils.isEmpty(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1)) {
        paramQQAppInterface.d(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true);
      }
    }
    localPhotoListPanel.a(paramBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, localIntent);
    paramQQAppInterface = new int[2];
    e.getLocationInWindow(paramQQAppInterface);
    paramQQAppInterface[0] += e.getWidth();
    paramQQAppInterface[1] -= paramLinearLayout.getHeight() + paramPanelIconLinearLayout.getHeight();
    localPhotoListPanel.setOnSwipeUpAndDragListener(new PhotoListPanel.SwipeUpAndDragListener(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, e, paramQQAppInterface, paramBaseChatPie.a(), null, localPhotoListPanel));
    return localPhotoListPanel;
  }
  
  public static void a(Activity paramActivity, SessionInfo paramSessionInfo, Intent paramIntent)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOPanelUtiles", 2, "sendPhotolistPanelEditPhoto start");
    }
    Object localObject = new Bundle();
    ((Bundle)localObject).putInt("key_presend_cancel_type", 1021);
    RichmediaService.d((Bundle)localObject);
    localObject = paramIntent.getStringArrayListExtra("PhotoConst.PHOTO_PATHS");
    int i1 = paramIntent.getIntExtra("PhotoConst.CURRENT_QUALITY_TYPE", 0);
    paramIntent = (Intent)localObject;
    if (localObject == null) {
      paramIntent = new ArrayList();
    }
    localObject = new Intent(paramActivity, SendPhotoActivity.class);
    ((Intent)localObject).putExtra("PhotoConst.SEND_BUSINESS_TYPE", 1007);
    ((Intent)localObject).putStringArrayListExtra("PhotoConst.PHOTO_PATHS", paramIntent);
    ((Intent)localObject).putExtra("uin", jdField_a_of_type_JavaLangString);
    ((Intent)localObject).putExtra("uintype", jdField_a_of_type_Int);
    ((Intent)localObject).putExtra("troop_uin", b);
    ((Intent)localObject).putExtra("PhotoConst.SEND_SIZE_SPEC", i1);
    ((Intent)localObject).putExtra("PhotoConst.HANDLE_DEST_RESULT", true);
    if (paramIntent.size() == 1) {
      ((Intent)localObject).putExtra("PhotoConst.SINGLE_PHOTO_PATH", paramIntent);
    }
    ((Intent)localObject).addFlags(603979776);
    if (QLog.isColorLevel()) {
      QLog.d("AIOPanelUtiles", 2, "sendPhotolistPanelEditPhoto selectedPhotoList = " + paramIntent.toString());
    }
    paramActivity.startActivity((Intent)localObject);
  }
  
  public static void a(QQAppInterface paramQQAppInterface)
  {
    if (paramQQAppInterface == null) {}
    for (;;)
    {
      return;
      paramQQAppInterface = paramQQAppInterface.a(ServerConfigManager.ConfigType.common, "aio_pia");
      if ("1".equals(paramQQAppInterface)) {}
      for (jdField_a_of_type_Boolean = true; QLog.isColorLevel(); jdField_a_of_type_Boolean = false)
      {
        QLog.d("AIO_Panel", 2, "getAIOPanelConfig = " + paramQQAppInterface + " isPanelAdjust = " + jdField_a_of_type_Boolean);
        return;
      }
    }
  }
  
  public static void a(QQAppInterface paramQQAppInterface, FragmentActivity paramFragmentActivity)
  {
    HotChatManager localHotChatManager = (HotChatManager)paramQQAppInterface.getManager(59);
    PlusPanelUtils.a(paramQQAppInterface, paramFragmentActivity);
    paramFragmentActivity.setCanLock(false);
    ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X800407F", "0X800407F", 0, 0, "", "", "", "");
  }
  
  public static void a(QQAppInterface paramQQAppInterface, BaseChatPie paramBaseChatPie, SessionInfo paramSessionInfo)
  {
    Intent localIntent = new Intent(BaseApplicationImpl.getContext(), LiteVideoActivity.class);
    localIntent.putExtra("maxCount", 1);
    paramBaseChatPie.a().startActivityForResult(localIntent, 81);
    if ((jdField_a_of_type_Int == 9501) && (!TextUtils.isEmpty(jdField_a_of_type_JavaLangString))) {}
    try
    {
      paramBaseChatPie = a(paramQQAppInterface, Long.parseLong(jdField_a_of_type_JavaLangString));
      if (paramBaseChatPie == null) {
        break label101;
      }
      i1 = productId;
    }
    catch (Exception paramBaseChatPie)
    {
      for (;;)
      {
        int i1 = 0;
        continue;
        i1 = 0;
      }
    }
    SmartDeviceReport.a(paramQQAppInterface, Long.parseLong(jdField_a_of_type_JavaLangString), "Usr_AIO_SendMsg", 5, 0, i1);
  }
  
  public static void a(QQAppInterface paramQQAppInterface, String paramString, int paramInt)
  {
    int i1 = 1;
    if (paramInt == 0) {
      paramInt = i1;
    }
    for (;;)
    {
      ReportController.b(paramQQAppInterface, "CliOper", "", "", paramString, paramString, paramInt, 0, "", "", "", "");
      return;
      if (paramInt == 3000) {
        paramInt = 2;
      } else if (paramInt == 1) {
        paramInt = 3;
      } else if ((paramInt == 6000) || (paramInt == 6001) || (paramInt == 6002) || (paramInt == 1008) || (paramInt == 9500)) {
        paramInt = 5;
      } else {
        paramInt = 4;
      }
    }
  }
  
  public static void b(QQAppInterface paramQQAppInterface, BaseChatPie paramBaseChatPie, SessionInfo paramSessionInfo)
  {
    paramQQAppInterface.a().c();
    Object localObject = new Intent();
    ((Intent)localObject).putExtra("PhotoConst.PHOTOLIST_KEY_FILTER_GIF_VIDEO", true);
    ((Intent)localObject).putExtra("PhotoConst.IS_SINGLE_MODE", true);
    ((Intent)localObject).putExtra("filter_photolist_troopalbum_toolbar", true);
    ((Intent)localObject).putExtra("custom_photopreview_sendbtn_report", true);
    ((Intent)localObject).putExtra("custom_photopreview_sendbtn_reportActionName", "0X8005978");
    ((Intent)localObject).putExtra("custom_photopreview_sendbtn_album_reportReverse2", "1");
    ((Intent)localObject).putExtra("custom_photopreview_sendbtn_camera_reportReverse2", "2");
    ((Intent)localObject).putExtra("PhotoConst.SEND_BUSINESS_TYPE", 1039);
    if (paramBaseChatPie != null)
    {
      PlusPanelUtils.a(paramBaseChatPie.a(), paramSessionInfo, paramQQAppInterface, (Intent)localObject);
      localObject = (TroopHandler)paramQQAppInterface.a(20);
      if ((!TextUtils.isEmpty(jdField_a_of_type_JavaLangString)) && (jdField_a_of_type_Int == 1)) {
        ((TroopHandler)localObject).d(jdField_a_of_type_JavaLangString, true);
      }
      paramBaseChatPie.a().setCanLock(false);
    }
    ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X8005977", "0X8005977", 0, 0, "", "", "", "");
  }
}
