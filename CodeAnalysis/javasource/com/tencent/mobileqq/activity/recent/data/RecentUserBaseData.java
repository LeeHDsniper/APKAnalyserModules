package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import com.tencent.mobileqq.activity.recent.RecentBaseData;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public abstract class RecentUserBaseData
  extends RecentBaseData
{
  protected static final String j = "%s,%s,%d条未读,%s";
  protected static final String k = "%s,%s,%s";
  public RecentUser a;
  
  public RecentUserBaseData(RecentUser paramRecentUser)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    if (paramRecentUser == null) {
      throw new NullPointerException("RecentUser is null");
    }
    a = paramRecentUser;
    switch (a.type)
    {
    }
    for (;;)
    {
      d();
      M &= 0xFF0F;
      if (a.showUpTime != 0L) {
        break;
      }
      M |= 0x10;
      return;
      M |= 0x1000;
      continue;
      M |= 0x2000;
    }
    M |= 0x20;
  }
  
  public int a()
  {
    return a.type;
  }
  
  public long a()
  {
    return a.lastmsgtime;
  }
  
  public RecentUser a()
  {
    return a;
  }
  
  public String a()
  {
    return a.uin;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    M &= 0xFF0F;
    if ((a.showUpTime == 0L) && (Long.MAX_VALUE - a.lastmsgtime > 4L))
    {
      M |= 0x10;
      return;
    }
    M |= 0x20;
  }
  
  public void a(RecentUser paramRecentUser)
  {
    a = paramRecentUser;
  }
  
  public final boolean a()
  {
    return (G == 1) || (G == 4);
  }
  
  public long b()
  {
    return a.lastmsgdrafttime;
  }
  
  public int c()
  {
    return a.msgType;
  }
  
  public String c()
  {
    return a.troopUin;
  }
  
  public int d()
  {
    return M;
  }
  
  public void d()
  {
    switch (a.type)
    {
    }
    do
    {
      return;
    } while (!a());
    M &= 0xFFF0FFFF;
    if (H != 0)
    {
      M |= 0x10000;
      return;
    }
    M |= 0x20000;
  }
}
