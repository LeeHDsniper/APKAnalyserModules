package com.tencent.mobileqq.activity.richmedia;

import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;
import java.util.Calendar;

public abstract class FlowCameraConstant
{
  public static float a = 0.75F;
  public static final int a = 95;
  public static final String a = "flow_camera_height";
  public static final float b = 0.83F;
  public static final int b = 90;
  public static final String b = "flow_camera_use_surfaceview";
  public static final int c = 1000;
  public static final String c = "flow_camera_ptv_mode";
  public static int d = 2;
  public static final String d = "flow_camera_capture_mode";
  public static final int e = 1000;
  public static final String e = "flow_camera_video_mode";
  public static final int f = 1001;
  public static final String f = "flow_camera_show_panel";
  public static final int g = 1002;
  public static final String g = "flow_camera_show_ptv_guide";
  public static final int h = 20;
  public static final String h = "flow_key_ptv_max_time";
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public FlowCameraConstant() {}
  
  public static String a()
  {
    Calendar localCalendar = Calendar.getInstance();
    StringBuilder localStringBuilder = new StringBuilder(AppConstants.bj);
    localStringBuilder.append("IMG");
    localStringBuilder.append(localCalendar.get(1));
    int i = localCalendar.get(2) + 1;
    if (i < 10)
    {
      localObject = "0" + i;
      localStringBuilder.append(localObject);
      i = localCalendar.get(5);
      if (i >= 10) {
        break label300;
      }
      localObject = "0" + i;
      label108:
      localStringBuilder.append(localObject);
      i = localCalendar.get(11);
      if (i >= 10) {
        break label308;
      }
      localObject = "0" + i;
      label148:
      localStringBuilder.append(localObject);
      i = localCalendar.get(12);
      if (i >= 10) {
        break label316;
      }
      localObject = "0" + i;
      label188:
      localStringBuilder.append(localObject);
      i = localCalendar.get(13);
      if (i >= 10) {
        break label324;
      }
    }
    label300:
    label308:
    label316:
    label324:
    for (Object localObject = "0" + i;; localObject = Integer.valueOf(i))
    {
      localStringBuilder.append(localObject);
      if (new File(localStringBuilder.toString() + ".jpg").exists()) {
        break label332;
      }
      return localStringBuilder.toString() + ".jpg";
      localObject = Integer.valueOf(i);
      break;
      localObject = Integer.valueOf(i);
      break label108;
      localObject = Integer.valueOf(i);
      break label148;
      localObject = Integer.valueOf(i);
      break label188;
    }
    label332:
    localObject = new StringBuilder(localStringBuilder);
    int j = localStringBuilder.length();
    i = 1;
    for (;;)
    {
      if (i < Integer.MAX_VALUE)
      {
        ((StringBuilder)localObject).append('(');
        ((StringBuilder)localObject).append(i);
        ((StringBuilder)localObject).append(')');
        ((StringBuilder)localObject).append(".jpg");
        if (new File(((StringBuilder)localObject).toString()).exists()) {}
      }
      else
      {
        return ((StringBuilder)localObject).toString();
      }
      ((StringBuilder)localObject).delete(j, ((StringBuilder)localObject).length());
      i += 1;
    }
  }
}
