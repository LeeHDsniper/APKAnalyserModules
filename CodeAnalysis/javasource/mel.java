import VACDReport.ReportBody;
import VACDReport.ReportInfo;
import VACDReport.ReportItem;
import android.os.Handler;
import android.os.SystemClock;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class mel
  implements Runnable
{
  mel(mek paramMek)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    synchronized ()
    {
      long l1 = SystemClock.uptimeMillis();
      Iterator localIterator = mek.a(a).entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        ReportInfo localReportInfo = (ReportInfo)localEntry.getValue();
        if ((localReportInfo != null) && (Math.abs(l1 - body.startTime) >= 2100000L))
        {
          ReportItem localReportItem = new ReportItem();
          step = "payresult";
          params = "";
          createTime = l1;
          result = 668808;
          failReason = "illegalEndReport";
          long l2 = ((Long)localEntry.getKey()).longValue();
          body.reportItems.add(localReportItem);
          mek.a(a).a(l2, body.reportItems);
          mek.a(a).a(l2);
          localIterator.remove();
        }
      }
    }
    mek.a(a);
    mek.a(a).postDelayed(this, 2100000L);
  }
}
