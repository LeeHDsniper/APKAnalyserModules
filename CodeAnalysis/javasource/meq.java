import VACDReport.ReportHeader;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

class meq
  implements Runnable
{
  meq(mek paramMek, List paramList)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if ((jdField_a_of_type_JavaUtilList == null) || (jdField_a_of_type_JavaUtilList.isEmpty())) {
      if (QLog.isColorLevel()) {
        QLog.i("VACDReport", 2, "handleReponse headers is null or empty");
      }
    }
    ArrayList localArrayList;
    do
    {
      return;
      if (QLog.isColorLevel()) {
        QLog.d("VACDReport", 2, "handleReponse headers size = " + jdField_a_of_type_JavaUtilList.size());
      }
      localArrayList = new ArrayList(8);
      Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
      while (localIterator.hasNext())
      {
        ReportHeader localReportHeader = (ReportHeader)localIterator.next();
        if ((localReportHeader != null) && (result == 0)) {
          localArrayList.add(Long.valueOf(seqno));
        }
      }
    } while (localArrayList.isEmpty());
    mek.a(jdField_a_of_type_Mek).a(localArrayList);
  }
}
