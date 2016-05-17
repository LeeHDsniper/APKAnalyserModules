import VACDReport.ReportHeader;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

class mei
  implements Runnable
{
  mei(mea paramMea, List paramList)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    synchronized (mea.a(jdField_a_of_type_Mea))
    {
      ArrayList localArrayList = new ArrayList(8);
      Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
      while (localIterator.hasNext())
      {
        ReportHeader localReportHeader = (ReportHeader)localIterator.next();
        if ((localReportHeader != null) && (result == 0) && (mea.a(jdField_a_of_type_Mea).containsKey(Long.valueOf(seqno))))
        {
          localArrayList.add(Long.valueOf(seqno));
          mea.a(jdField_a_of_type_Mea).remove(Long.valueOf(seqno));
        }
      }
    }
    if (!localList.isEmpty()) {
      mea.a(jdField_a_of_type_Mea).a(localList);
    }
  }
}
