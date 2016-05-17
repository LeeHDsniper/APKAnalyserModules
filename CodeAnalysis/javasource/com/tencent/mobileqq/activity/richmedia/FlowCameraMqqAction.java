package com.tencent.mobileqq.activity.richmedia;

import android.app.Activity;
import android.content.Intent;
import com.tencent.av.camera.QavCameraUsage;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.photo.SendPhotoActivity;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import java.util.ArrayList;
import mqq.app.AppRuntime;

public class FlowCameraMqqAction
{
  public static int a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 0;
  }
  
  public FlowCameraMqqAction() {}
  
  public static String a(FlowActivity paramFlowActivity)
  {
    return paramFlowActivity.getAppRuntime().getAccount();
  }
  
  public static void a(Activity paramActivity, RMVideoStateMgr paramRMVideoStateMgr, float paramFloat, boolean paramBoolean, double paramDouble1, double paramDouble2, FlowComponentInterface paramFlowComponentInterface)
  {
    a(paramActivity, paramRMVideoStateMgr, paramFloat, paramBoolean, paramDouble1, paramDouble2, paramFlowComponentInterface, false);
  }
  
  public static void a(Activity paramActivity, RMVideoStateMgr paramRMVideoStateMgr, float paramFloat, boolean paramBoolean1, double paramDouble1, double paramDouble2, FlowComponentInterface paramFlowComponentInterface, boolean paramBoolean2)
  {
    String str1 = "";
    int i = 0;
    String str2 = "";
    try
    {
      SessionInfo localSessionInfo = (SessionInfo)paramActivity.getIntent().getParcelableExtra("PhotoConst.SEND_SESSION_INFO");
      if (localSessionInfo != null)
      {
        str1 = jdField_a_of_type_JavaLangString;
        i = jdField_a_of_type_Int;
        str2 = b;
      }
      paramActivity = new FlowSendTask(paramActivity, paramRMVideoStateMgr, str1, i, str2, paramFloat, paramBoolean1, paramDouble1, paramDouble2, paramFlowComponentInterface);
      paramActivity.a(paramBoolean2);
      paramActivity.execute(new Void[0]);
      if (paramBoolean1) {
        a("", "0X8005E94");
      }
      return;
    }
    catch (Exception paramActivity) {}
  }
  
  public static void a(Activity paramActivity, ArrayList paramArrayList)
  {
    SessionInfo localSessionInfo = (SessionInfo)paramActivity.getIntent().getParcelableExtra("PhotoConst.SEND_SESSION_INFO");
    Intent localIntent = new Intent(paramActivity, SendPhotoActivity.class);
    localIntent.putExtra("PhotoConst.SEND_BUSINESS_TYPE", 1008);
    localIntent.putStringArrayListExtra("PhotoConst.PHOTO_PATHS", paramArrayList);
    localIntent.putExtra("uin", jdField_a_of_type_JavaLangString);
    localIntent.putExtra("uintype", jdField_a_of_type_Int);
    localIntent.putExtra("troop_uin", b);
    localIntent.putExtra("PhotoConst.HANDLE_DEST_RESULT", true);
    paramActivity.startActivity(localIntent);
  }
  
  public static void a(String paramString1, String paramString2)
  {
    a(paramString1, paramString2, "");
  }
  
  public static void a(String paramString1, String paramString2, String paramString3)
  {
    ReportController.b(null, "CliOper", paramString1, "", paramString2, paramString2, jdField_a_of_type_Int, 0, paramString3, "", "", "");
  }
  
  public static boolean a()
  {
    return QavCameraUsage.b(BaseApplicationImpl.getContext());
  }
}
