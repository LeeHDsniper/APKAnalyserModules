package com.tencent.mobileqq.activity.qwallet.report;

import VACDReport.ReportHeader;
import VACDReport.ReportItem;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import mek;

public class VACDReportReceiver
  extends BroadcastReceiver
{
  static final String a = "vacdReport_step:start";
  static final String b = "vacdReport_step:add";
  static final String c = "vacdReport_step:end";
  static final String d = "vacdReport_step:single";
  static final String e = "vacdReport_extra:step";
  static final String f = "vacdReport_extra:seqno";
  static final String g = "vacdReport_extra:sKey";
  static final String h = "vacdReport_extra:header";
  static final String i = "vacdReport_extra:item";
  
  public VACDReportReceiver()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if (paramIntent == null) {}
    String str;
    ReportItem localReportItem;
    label124:
    do
    {
      return;
      str = paramIntent.getStringExtra("vacdReport_extra:step");
      long l = paramIntent.getLongExtra("vacdReport_extra:seqno", -1L);
      localReportItem = (ReportItem)paramIntent.getSerializableExtra("vacdReport_extra:item");
      StringBuilder localStringBuilder;
      if (QLog.isColorLevel())
      {
        localStringBuilder = new StringBuilder().append("onReceive:").append(l).append("|");
        if (localReportItem != null) {
          break label124;
        }
      }
      for (paramContext = "item is null";; paramContext = localReportItem.toString())
      {
        QLog.i("VACDReport", 2, paramContext);
        if (!"vacdReport_step:start".equals(str)) {
          break;
        }
        paramContext = paramIntent.getStringExtra("vacdReport_extra:sKey");
        paramIntent = (ReportHeader)paramIntent.getSerializableExtra("vacdReport_extra:header");
        mek.a().a(paramContext, paramIntent, localReportItem);
        return;
      }
      if ("vacdReport_step:add".equals(str))
      {
        paramContext = paramIntent.getStringExtra("vacdReport_extra:sKey");
        mek.a().a(l, paramContext, localReportItem);
        return;
      }
      if ("vacdReport_step:end".equals(str))
      {
        mek.a().a(l, localReportItem);
        return;
      }
    } while (!"vacdReport_step:single".equals(str));
    paramContext = paramIntent.getStringExtra("vacdReport_extra:sKey");
    paramIntent = (ReportHeader)paramIntent.getSerializableExtra("vacdReport_extra:header");
    mek.a().b(paramContext, paramIntent, localReportItem);
  }
}
