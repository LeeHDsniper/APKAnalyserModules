import VACDReport.ReportHeader;
import VACDReport.ReportInfo;
import VACDReport.ReportItem;
import VACDReport.ReportReq;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.qwallet.report.VACDReportServlet;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import mqq.app.AppRuntime;
import mqq.app.NewIntent;
import mqq.observer.BusinessObserver;
import mqq.os.MqqHandler;

class mea
{
  public static final int a = 668808;
  private static final long jdField_a_of_type_Long = 2100000L;
  public static final String a = "VACDReport";
  private static final mea jdField_a_of_type_Mea = new mea();
  private static final int jdField_b_of_type_Int = 1;
  private Handler jdField_a_of_type_AndroidOsHandler;
  private HandlerThread jdField_a_of_type_AndroidOsHandlerThread;
  private Map jdField_a_of_type_JavaUtilMap = Collections.synchronizedMap(new HashMap(16));
  private mej jdField_a_of_type_Mej = new mej(BaseApplicationImpl.a());
  private BusinessObserver jdField_a_of_type_MqqObserverBusinessObserver = new meh(this);
  private byte[] jdField_a_of_type_ArrayOfByte = new byte[0];
  private Map jdField_b_of_type_JavaUtilMap;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private mea()
  {
    b = Collections.synchronizedMap(new HashMap(8));
    ThreadManager.a().post(new meb(this));
    jdField_a_of_type_AndroidOsHandlerThread = new HandlerThread("LocalTimeOut");
    jdField_a_of_type_AndroidOsHandlerThread.start();
    jdField_a_of_type_AndroidOsHandler = new Handler(jdField_a_of_type_AndroidOsHandlerThread.getLooper());
    jdField_a_of_type_AndroidOsHandler.postDelayed(new mec(this), 2100000L);
  }
  
  public static mea a()
  {
    return jdField_a_of_type_Mea;
  }
  
  private void a(ReportInfo paramReportInfo)
  {
    if (paramReportInfo == null) {}
    do
    {
      return;
      jdField_a_of_type_JavaUtilMap.put(Long.valueOf(header.seqno), paramReportInfo);
    } while (jdField_a_of_type_JavaUtilMap.size() < 1);
    paramReportInfo = new ArrayList(jdField_a_of_type_JavaUtilMap.size());
    paramReportInfo.addAll(jdField_a_of_type_JavaUtilMap.values());
    a(paramReportInfo);
  }
  
  private void a(List paramList)
  {
    ReportReq localReportReq = new ReportReq();
    reports = new ArrayList(paramList);
    paramList = BaseApplicationImpl.a().a();
    NewIntent localNewIntent = new NewIntent(paramList.getApplication(), VACDReportServlet.class);
    localNewIntent.putExtra("req", localReportReq);
    localNewIntent.putExtra("cmd_type", 1);
    localNewIntent.setObserver(jdField_a_of_type_MqqObserverBusinessObserver);
    paramList.startServlet(localNewIntent);
  }
  
  private void b(List paramList)
  {
    if ((paramList == null) || (paramList.isEmpty()))
    {
      if (QLog.isColorLevel()) {
        QLog.i("VACDReport", 2, "handleReponse headers is null or empty");
      }
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.i("VACDReport", 2, "handleReponse headers size = " + paramList.size());
    }
    ThreadManager.b().post(new mei(this, paramList));
  }
  
  public void a()
  {
    synchronized (jdField_a_of_type_ArrayOfByte)
    {
      if (jdField_a_of_type_JavaUtilMap != null) {
        jdField_a_of_type_JavaUtilMap.clear();
      }
      if (b != null) {
        b.clear();
      }
      if (jdField_a_of_type_AndroidOsHandler != null) {
        jdField_a_of_type_AndroidOsHandler.removeCallbacksAndMessages(null);
      }
      if ((jdField_a_of_type_AndroidOsHandlerThread != null) && (jdField_a_of_type_AndroidOsHandlerThread.getLooper() != null)) {
        jdField_a_of_type_AndroidOsHandlerThread.getLooper().quit();
      }
      return;
    }
  }
  
  void a(long paramLong, ReportItem paramReportItem)
  {
    if (paramLong <= 0L)
    {
      if (QLog.isColorLevel()) {
        QLog.i("VACDReport", 2, "endReport:seqno is illegal return");
      }
      return;
    }
    ThreadManager.a().postDelayed(new mef(this, paramLong, paramReportItem), 100L);
  }
  
  void a(long paramLong, String paramString, ReportItem paramReportItem)
  {
    if (paramLong <= 0L) {
      if (QLog.isColorLevel()) {
        QLog.i("VACDReport", 2, "addReportItem:seqno is illegal return");
      }
    }
    do
    {
      return;
      if (paramReportItem != null) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.i("VACDReport", 2, "addReportItem:item is null return");
    return;
    ThreadManager.a().postDelayed(new mee(this, paramString, paramLong, paramReportItem), 100L);
  }
  
  void a(String paramString, ReportHeader paramReportHeader, ReportItem paramReportItem)
  {
    ThreadManager.a().post(new med(this, paramReportHeader, paramString, paramReportItem));
  }
  
  void b(String paramString, ReportHeader paramReportHeader, ReportItem paramReportItem)
  {
    if (paramReportHeader == null)
    {
      if (QLog.isColorLevel()) {
        QLog.i("VACDReport", 2, "singleReport:header is null return");
      }
      return;
    }
    ThreadManager.a().post(new meg(this, paramString, paramReportHeader, paramReportItem));
  }
}
