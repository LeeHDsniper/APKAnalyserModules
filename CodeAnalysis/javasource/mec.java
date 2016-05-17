import VACDReport.ReportItem;
import android.os.Handler;
import android.os.SystemClock;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class mec
  implements Runnable
{
  mec(mea paramMea)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    synchronized (mea.a(a))
    {
      Iterator localIterator = mea.b(a).entrySet().iterator();
      long l1 = SystemClock.uptimeMillis();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        if (Math.abs(l1 - ((Long)localEntry.getValue()).longValue()) >= 2100000L)
        {
          ReportItem localReportItem = new ReportItem();
          step = "payresult";
          params = "";
          createTime = l1;
          result = 668808;
          failReason = "illegalEndReport";
          long l2 = ((Long)localEntry.getKey()).longValue();
          mea.a(a).a(l2, localReportItem);
          mea.a(a).put(Long.valueOf(l2), mea.a(a).a(l2));
          localIterator.remove();
        }
      }
    }
    if (mea.a(a).size() >= 1)
    {
      ArrayList localArrayList = new ArrayList(mea.a(a).size());
      localArrayList.addAll(mea.a(a).values());
      mea.a(a, localArrayList);
    }
    mea.a(a).postDelayed(this, 2100000L);
  }
}
