package com.tencent.mobileqq.activity.richmedia;

import android.os.Bundle;
import android.view.ViewGroup;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraAbility;
import com.tencent.qphone.base.util.QLog;

public class FlowCameraPtvActivity2
  extends FlowCameraActivity2
{
  public FlowCameraPtvActivity2()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(ViewGroup paramViewGroup)
  {
    super.a(paramViewGroup);
    if (QLog.isColorLevel()) {
      QLog.d("FlowCameraActivity", 2, "onCreateView");
    }
    if (!CameraAbility.a()) {}
  }
  
  void b()
  {
    super.b();
  }
  
  boolean b()
  {
    return true;
  }
  
  public void l()
  {
    super.l();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    a = false;
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
  }
}
