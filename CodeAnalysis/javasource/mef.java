import VACDReport.ReportInfo;
import VACDReport.ReportItem;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.Map;

class mef
  implements Runnable
{
  mef(mea paramMea, long paramLong, ReportItem paramReportItem)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    synchronized (mea.a(jdField_a_of_type_Mea))
    {
      mea.b(jdField_a_of_type_Mea).remove(Long.valueOf(jdField_a_of_type_Long));
      if (jdField_a_of_type_VACDReportReportItem != null) {
        mea.a(jdField_a_of_type_Mea).a(jdField_a_of_type_Long, jdField_a_of_type_VACDReportReportItem);
      }
      ReportInfo localReportInfo = mea.a(jdField_a_of_type_Mea).a(jdField_a_of_type_Long);
      mea.a(jdField_a_of_type_Mea, localReportInfo);
      return;
    }
  }
}
