package com.tencent.mobileqq.activity.qwallet.report;

import VACDReport.ReportHeader;
import VACDReport.ReportItem;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.SystemClock;
import android.text.TextUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.qphone.base.util.QLog;
import mek;
import mqq.app.AppRuntime;
import mqq.app.MobileQQ;

public class VACDReportUtil
{
  public VACDReportUtil()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static long a(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, int paramInt, String paramString6)
  {
    return a(paramString1, paramString2, paramString3, paramString4, paramString5, paramInt, paramString6, SystemClock.uptimeMillis());
  }
  
  public static long a(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, int paramInt, String paramString6, long paramLong)
  {
    paramString3 = a(paramString2, paramString3);
    paramString2 = null;
    if (!TextUtils.isEmpty(paramString4))
    {
      paramString2 = new ReportItem();
      step = paramString4;
      params = paramString5;
      result = paramInt;
      failReason = paramString6;
      createTime = paramLong;
    }
    if (QLog.isColorLevel())
    {
      paramString4 = new StringBuilder(128);
      paramString4.append("startReport header=" + paramString3.toString());
      if (paramString2 != null) {
        paramString4.append(" ,item=" + paramString2.toString());
      }
      paramString4.append(" ,createTime=").append(serverTime);
      QLog.d("VACDReport", 2, paramString4.toString());
    }
    if (a(BaseApplicationImpl.a())) {
      mek.a().a(paramString1, paramString3, paramString2);
    }
    for (;;)
    {
      return seqno;
      paramString4 = new Intent(BaseApplicationImpl.a(), VACDReportReceiver.class);
      paramString4.putExtra("vacdReport_extra:header", paramString3);
      paramString4.putExtra("vacdReport_extra:seqno", seqno);
      paramString4.putExtra("vacdReport_extra:sKey", paramString1);
      paramString4.putExtra("vacdReport_extra:step", "vacdReport_step:start");
      if (paramString2 != null) {
        paramString4.putExtra("vacdReport_extra:item", paramString2);
      }
      BaseApplicationImpl.a().sendBroadcast(paramString4);
    }
  }
  
  private static ReportHeader a(String paramString1, String paramString2)
  {
    ReportHeader localReportHeader = new ReportHeader();
    StringBuilder localStringBuilder = new StringBuilder("Android|");
    localStringBuilder.append(Build.VERSION.RELEASE);
    localStringBuilder.append("|").append(Build.MODEL);
    platform = localStringBuilder.toString();
    sModule = paramString1;
    sAction = paramString2;
    version = "6.3.3";
    long l = NetConnInfoCenter.getServerTimeMillis();
    seqno = l;
    try
    {
      uin = Long.parseLong(BaseApplicationImpl.a().a().getAccount());
      iNetType = NetworkUtil.a(BaseApplicationImpl.a());
      result = 0;
      createTime = SystemClock.uptimeMillis();
      serverTime = l;
      return localReportHeader;
    }
    catch (Exception paramString1)
    {
      for (;;)
      {
        uin = 10000L;
      }
    }
  }
  
  public static void a()
  {
    mek.a().a();
  }
  
  public static void a(long paramLong, String paramString1, String paramString2, int paramInt, String paramString3)
  {
    ReportItem localReportItem = null;
    if (!TextUtils.isEmpty(paramString1))
    {
      localReportItem = new ReportItem();
      step = paramString1;
      params = paramString2;
      result = paramInt;
      failReason = paramString3;
      createTime = SystemClock.uptimeMillis();
    }
    if (QLog.isColorLevel())
    {
      paramString1 = new StringBuilder(128);
      paramString1.append("endReport seqno=").append(paramLong);
      if (localReportItem != null) {
        paramString1.append(" ,item=").append(localReportItem.toString());
      }
      paramString1.append(" ,createTime=").append(NetConnInfoCenter.getServerTimeMillis());
      QLog.d("VACDReport", 2, paramString1.toString());
    }
    paramString1 = new Intent(BaseApplicationImpl.a(), VACDReportReceiver.class);
    paramString1.putExtra("vacdReport_extra:step", "vacdReport_step:end");
    paramString1.putExtra("vacdReport_extra:seqno", paramLong);
    if (localReportItem != null) {
      paramString1.putExtra("vacdReport_extra:item", localReportItem);
    }
    BaseApplicationImpl.a().sendBroadcast(paramString1);
  }
  
  public static void a(long paramLong, String paramString1, String paramString2, String paramString3, int paramInt, String paramString4)
  {
    ReportItem localReportItem = new ReportItem();
    step = paramString2;
    params = paramString3;
    result = paramInt;
    failReason = paramString4;
    createTime = SystemClock.uptimeMillis();
    if (QLog.isColorLevel())
    {
      paramString2 = new StringBuilder(128);
      paramString2.append("addReportItem seqno=").append(paramLong);
      if (localReportItem != null) {
        paramString2.append(" ,item=").append(localReportItem.toString());
      }
      paramString2.append(" ,createTime=").append(NetConnInfoCenter.getServerTimeMillis());
      QLog.d("VACDReport", 2, paramString2.toString());
    }
    if (a(BaseApplicationImpl.a()))
    {
      mek.a().a(paramLong, paramString1, localReportItem);
      return;
    }
    paramString2 = new Intent(BaseApplicationImpl.a(), VACDReportReceiver.class);
    paramString2.putExtra("vacdReport_extra:step", "vacdReport_step:add");
    paramString2.putExtra("vacdReport_extra:seqno", paramLong);
    paramString2.putExtra("vacdReport_extra:sKey", paramString1);
    paramString2.putExtra("vacdReport_extra:item", localReportItem);
    BaseApplicationImpl.a().sendBroadcast(paramString2);
  }
  
  public static void a(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, int paramInt, String paramString6)
  {
    paramString2 = a(paramString2, paramString3);
    paramString3 = new ReportItem();
    step = paramString4;
    params = paramString5;
    result = paramInt;
    failReason = paramString6;
    createTime = createTime;
    if (QLog.isColorLevel())
    {
      paramString4 = new StringBuilder(128);
      paramString4.append("singleReport header=" + paramString2.toString());
      if (paramString3 != null) {
        paramString4.append(" ,item=" + paramString3.toString());
      }
      paramString4.append(" ,createTime=").append(serverTime);
      QLog.d("VACDReport", 2, paramString4.toString());
    }
    if (a(BaseApplicationImpl.a()))
    {
      mek.a().b(paramString1, paramString2, paramString3);
      return;
    }
    paramString4 = new Intent(BaseApplicationImpl.a(), VACDReportReceiver.class);
    paramString4.putExtra("vacdReport_extra:header", paramString2);
    paramString4.putExtra("vacdReport_extra:seqno", seqno);
    paramString4.putExtra("vacdReport_extra:sKey", paramString1);
    paramString4.putExtra("vacdReport_extra:step", "vacdReport_step:single");
    paramString4.putExtra("vacdReport_extra:item", paramString3);
    BaseApplicationImpl.a().sendBroadcast(paramString4);
  }
  
  private static boolean a(Context paramContext)
  {
    if (paramContext != null) {
      return TextUtils.equals(paramContext.getPackageName(), MobileQQ.processName);
    }
    return false;
  }
}
