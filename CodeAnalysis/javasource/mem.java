import VACDReport.ReportBody;
import VACDReport.ReportHeader;
import VACDReport.ReportInfo;
import VACDReport.ReportItem;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Map;

class mem
  extends Handler
{
  mem(mek paramMek, Looper paramLooper)
  {
    super(paramLooper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message arg1)
  {
    Object localObject1 = (Object[])obj;
    ReportItem localReportItem2;
    long l;
    String str;
    switch (arg1)
    {
    default: 
      return;
    case 1: 
      synchronized (mek.a())
      {
        localObject5 = (ReportHeader)localObject1[1];
        localReportItem2 = (ReportItem)localObject1[2];
        localObject1 = (String)localObject1[0];
        ReportInfo localReportInfo = new ReportInfo();
        header = ((ReportHeader)localObject5);
        body = new ReportBody();
        body.sKey = ((String)localObject1);
        body.reportItems = new ArrayList(16);
        body.startTime = createTime;
        if (localReportItem2 != null) {
          body.reportItems.add(localReportItem2);
        }
        mek.a(a).put(Long.valueOf(seqno), localReportInfo);
        mek.a().notify();
        return;
      }
    case 2: 
      synchronized (mek.a())
      {
        l = ((Long)localObject2[0]).longValue();
        if (!mek.a(a, l))
        {
          if (QLog.isColorLevel()) {
            QLog.d("VACDReport", 2, "addReportItem seqno=" + l + " is illegal, please check call startReport first.");
          }
          return;
        }
      }
      localReportItem2 = (ReportItem)localObject3[2];
      localObject5 = (ReportInfo)mek.a(a).get(Long.valueOf(l));
      body.reportItems.add(localReportItem2);
      str = (String)localObject3[1];
      if (!TextUtils.isEmpty(str)) {
        body.sKey = str;
      }
      return;
    }
    synchronized (mek.a())
    {
      l = ((Long)str[0]).longValue();
      if (!mek.a(a, l))
      {
        if (QLog.isColorLevel()) {
          QLog.d("VACDReport", 2, "addReportItem seqno=" + l + " is illegal, please check call startReport first.");
        }
        return;
      }
    }
    ReportItem localReportItem1 = (ReportItem)localObject4[1];
    Object localObject5 = (ReportInfo)mek.a(a).remove(Long.valueOf(l));
    body.reportItems.add(localReportItem1);
    mek.a(a).a(l, body.reportItems);
    mek.a(a).a(l);
    mek.a(a);
  }
}
