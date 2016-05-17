package com.tencent.mobileqq.activity.recent;

import android.view.View;

public abstract interface OnRecentUserOpsListener
{
  public abstract void a(View paramView, RecentBaseData paramRecentBaseData, String paramString, boolean paramBoolean);
  
  public abstract void a(View paramView, Object paramObject);
  
  public abstract void a(RecentBaseData paramRecentBaseData, String paramString);
  
  public abstract void a(String paramString1, RecentBaseData paramRecentBaseData, String paramString2);
}
