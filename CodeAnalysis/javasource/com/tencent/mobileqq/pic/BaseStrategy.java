package com.tencent.mobileqq.pic;

import android.os.Bundle;
import com.tencent.mobileqq.activity.PredownloadTest.ConfigInfo;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.AccountDpcManager.DpcAccountNames;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.servlet.ReportServlet;
import com.tencent.qphone.base.util.QLog;
import mqq.app.NewIntent;
import mqq.observer.BusinessObserver;

public class BaseStrategy
  implements BusinessObserver
{
  public static final long a = 524288000L;
  public static final String a = "UseLocalFlowSet";
  public static final long b = 10485760L;
  public static final String b = "MaxWifiFlow";
  public static final long c = 10485760L;
  public static final String c = "Max4GFlow";
  public static final long d = 5242880L;
  public static final String d = "Max3GFlow";
  public static final String e = "Max2GFlow";
  public static final String f = "PreDownPolicy";
  public static long g = 0L;
  public static final String g = "PicDTPt2";
  public static long h = 0L;
  protected QQAppInterface a;
  protected long e;
  protected long f;
  protected long i = 524288000L;
  protected long j = 10485760L;
  protected long k = 10485760L;
  protected long l = 5242880L;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public BaseStrategy() {}
  
  public int a(long paramLong, int paramInt1, int paramInt2, boolean paramBoolean)
  {
    b();
    paramBoolean = DeviceProfileManager.a().a(DeviceProfileManager.AccountDpcManager.DpcAccountNames.picpredownload_whitelist.name());
    if (QLog.isColorLevel()) {
      Logger.a("PIC_TAG_PRELOAD", "isOverLimit", "isInDPCWhiteList:" + paramBoolean);
    }
    if ((paramInt2 == 0) || ((paramBoolean) && (paramInt2 != 3)))
    {
      if (f >= i)
      {
        PicReporter.a(paramInt2, i);
        Logger.a("PIC_TAG_PRELOAD", "isOverLimit", "result:true,netWokrType:" + paramInt2 + ",picTrafficFlowWIFI:" + f);
        return -8;
      }
    }
    else if (paramInt2 == 1)
    {
      if (e >= j)
      {
        PicReporter.a(paramInt2, j);
        Logger.a("PIC_TAG_PRELOAD", "isOverLimit", "result:true,netWokrType:" + paramInt2 + ",picTrafficFlowXG:" + e);
        return -8;
      }
    }
    else if (paramInt2 == 2)
    {
      if (e >= k)
      {
        PicReporter.a(paramInt2, k);
        Logger.a("PIC_TAG_PRELOAD", "isOverLimit", "result:true,netWokrType:" + paramInt2 + ",picTrafficFlowXG:" + e);
        return -8;
      }
    }
    else if ((paramInt2 == 3) && (e >= l))
    {
      PicReporter.a(paramInt2, l);
      Logger.a("PIC_TAG_PRELOAD", "isOverLimit", "result:true,netWokrType:" + paramInt2 + ",picTrafficFlowXG:" + e);
      return -8;
    }
    return 0;
  }
  
  public PredownloadTest.ConfigInfo a()
  {
    return null;
  }
  
  public void a()
  {
    g = PicPreDownloadUtils.a(a, "UseLocalFlowSet", 0L);
    h = PicPreDownloadUtils.a(a, "PicDTPt2", 0L);
    i = PicPreDownloadUtils.a(a, "MaxWifiFlow", 524288000L);
    j = PicPreDownloadUtils.a(a, "Max4GFlow", 10485760L);
    k = PicPreDownloadUtils.a(a, "Max3GFlow", 10485760L);
    l = PicPreDownloadUtils.a(a, "Max2GFlow", 5242880L);
  }
  
  public void a(PredownloadTest.ConfigInfo paramConfigInfo) {}
  
  public void a(QQAppInterface paramQQAppInterface)
  {
    a = paramQQAppInterface;
    paramQQAppInterface.registObserver(this);
    a();
  }
  
  public void b()
  {
    NewIntent localNewIntent = new NewIntent(a.getApplication(), ReportServlet.class);
    localNewIntent.putExtra("sendType", 3);
    localNewIntent.putExtra("tags", new String[] { "param_XGC2CPicDownloadFlow", "param_XGGroupPicDownloadFlow", "param_WIFIC2CPicDownloadFlow", "param_WIFIGroupPicDownloadFlow" });
    a.startServlet(localNewIntent);
  }
  
  public void onReceive(int paramInt, boolean paramBoolean, Bundle paramBundle)
  {
    if ((3 == paramInt) && (paramBoolean))
    {
      paramBundle = paramBundle.getLongArray("__base_tag_curentDay");
      if ((paramBundle != null) && (paramBundle.length == 4))
      {
        e = (paramBundle[0] + paramBundle[1]);
        f = (paramBundle[2] + paramBundle[3]);
        Logger.a("PIC_TAG_PRELOAD", "", "onReceive", "picTrafficFlowXG:" + e + ",C2CPicDownFlowXG:" + paramBundle[0] + ",Group/DiscussPicDownFlowXG:" + paramBundle[1] + ",\npicTrafficFlowWIFI:" + f + ",C2CPicDownFlowWIFI:" + paramBundle[2] + ",Group/DiscussPicDownFlowWIFI:" + paramBundle[3]);
      }
    }
  }
}
