package com.tencent.mobileqq.activity.richmedia;

import android.app.Activity;
import android.content.Intent;

public abstract interface FlowComponentInterface
{
  public static final int a = 0;
  public static final String a = "from_type";
  public static final int b = 1;
  public static final String b = "clip_strategy";
  public static final int c = 0;
  public static final String c = "enable_front";
  public static final int d = 1;
  public static final String d = "enable_local_video";
  public static final String e = "set_sdcard_min_size";
  public static final String f = "set_user_callback";
  
  public abstract void a(Activity paramActivity);
  
  public abstract void a(Activity paramActivity, int paramInt1, int paramInt2, Intent paramIntent);
  
  public abstract void a(Activity paramActivity, Intent paramIntent);
}
