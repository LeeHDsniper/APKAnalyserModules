import VACDReport.ReportHeader;
import VACDReport.ReportItem;
import VACDReport.ReportReq;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
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

public class mek
{
  public static final int a = 668808;
  public static final long a = 2100000L;
  static final String jdField_a_of_type_JavaLangString = "VACDReport";
  private static mek jdField_a_of_type_Mek;
  private static byte[] jdField_a_of_type_ArrayOfByte = new byte[0];
  private static final int jdField_b_of_type_Int = 8;
  private static final int jdField_c_of_type_Int = 700;
  private static final int d = 1;
  private static final int e = 2;
  private static final int f = 3;
  private Handler jdField_a_of_type_AndroidOsHandler;
  private HandlerThread jdField_a_of_type_AndroidOsHandlerThread;
  private Map jdField_a_of_type_JavaUtilMap = Collections.synchronizedMap(new HashMap(8));
  private mej jdField_a_of_type_Mej = new mej(BaseApplicationImpl.a());
  private BusinessObserver jdField_a_of_type_MqqObserverBusinessObserver = new mep(this);
  private Handler jdField_b_of_type_AndroidOsHandler;
  private HandlerThread jdField_b_of_type_AndroidOsHandlerThread;
  private Handler jdField_c_of_type_AndroidOsHandler;
  private HandlerThread jdField_c_of_type_AndroidOsHandlerThread;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  mek() {}
  
  public static mek a()
  {
    if (jdField_a_of_type_Mek == null) {}
    synchronized (jdField_a_of_type_ArrayOfByte)
    {
      if (jdField_a_of_type_Mek == null) {
        jdField_a_of_type_Mek = new mek();
      }
      return jdField_a_of_type_Mek;
    }
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
  
  private boolean a(long paramLong)
  {
    return jdField_a_of_type_JavaUtilMap.containsKey(Long.valueOf(paramLong));
  }
  
  private void b()
  {
    if (jdField_b_of_type_AndroidOsHandlerThread == null)
    {
      jdField_b_of_type_AndroidOsHandlerThread = new HandlerThread("LocalTimeOut");
      jdField_b_of_type_AndroidOsHandlerThread.start();
      jdField_b_of_type_AndroidOsHandler = new Handler(jdField_b_of_type_AndroidOsHandlerThread.getLooper());
      jdField_b_of_type_AndroidOsHandler.postDelayed(new mel(this), 2100000L);
    }
  }
  
  private void b(List paramList)
  {
    ThreadManager.a(new meq(this, paramList), 10, null, true);
  }
  
  private void c()
  {
    if (jdField_c_of_type_AndroidOsHandlerThread == null)
    {
      jdField_c_of_type_AndroidOsHandlerThread = new HandlerThread("ReportCache");
      jdField_c_of_type_AndroidOsHandlerThread.start();
      jdField_c_of_type_AndroidOsHandler = new mem(this, jdField_c_of_type_AndroidOsHandlerThread.getLooper());
    }
  }
  
  private void d()
  {
    if (jdField_a_of_type_AndroidOsHandlerThread == null)
    {
      jdField_a_of_type_AndroidOsHandlerThread = new HandlerThread("Write");
      jdField_a_of_type_AndroidOsHandlerThread.start();
      jdField_a_of_type_AndroidOsHandler = new Handler(jdField_a_of_type_AndroidOsHandlerThread.getLooper());
      jdField_a_of_type_AndroidOsHandler.post(new men(this));
    }
  }
  
  private void e()
  {
    Map localMap = jdField_a_of_type_Mej.a();
    if ((localMap != null) && (!localMap.isEmpty())) {
      a(new ArrayList(localMap.values()));
    }
  }
  
  public void a()
  {
    synchronized (jdField_a_of_type_ArrayOfByte)
    {
      if (jdField_c_of_type_AndroidOsHandler != null) {
        jdField_c_of_type_AndroidOsHandler.removeCallbacksAndMessages(null);
      }
      if (jdField_c_of_type_AndroidOsHandlerThread != null) {
        jdField_c_of_type_AndroidOsHandlerThread.quit();
      }
      if (jdField_a_of_type_JavaUtilMap != null) {
        jdField_a_of_type_JavaUtilMap.clear();
      }
      if (jdField_a_of_type_AndroidOsHandlerThread != null) {
        jdField_a_of_type_AndroidOsHandlerThread.quit();
      }
      if (jdField_b_of_type_AndroidOsHandler != null) {
        jdField_b_of_type_AndroidOsHandler.removeCallbacksAndMessages(null);
      }
      if (jdField_b_of_type_AndroidOsHandlerThread != null) {
        jdField_b_of_type_AndroidOsHandlerThread.quit();
      }
      jdField_a_of_type_Mek = null;
      return;
    }
  }
  
  public void a(long paramLong, ReportItem paramReportItem)
  {
    if (jdField_c_of_type_AndroidOsHandler != null)
    {
      Message localMessage = jdField_c_of_type_AndroidOsHandler.obtainMessage();
      if (localMessage != null)
      {
        arg1 = 3;
        obj = new Object[] { Long.valueOf(paramLong), paramReportItem };
        jdField_c_of_type_AndroidOsHandler.sendMessageDelayed(localMessage, 10000L);
      }
    }
  }
  
  public void a(long paramLong, String paramString, ReportItem paramReportItem)
  {
    if (paramReportItem == null) {
      if (QLog.isColorLevel()) {
        QLog.d("VACDReport", 2, "addReportItem seqno=" + paramLong + "  item is null return.");
      }
    }
    Message localMessage;
    do
    {
      do
      {
        return;
      } while (jdField_c_of_type_AndroidOsHandler == null);
      localMessage = jdField_c_of_type_AndroidOsHandler.obtainMessage();
    } while (localMessage == null);
    arg1 = 2;
    obj = new Object[] { Long.valueOf(paramLong), paramString, paramReportItem };
    jdField_c_of_type_AndroidOsHandler.sendMessage(localMessage);
  }
  
  public void a(String paramString, ReportHeader paramReportHeader, ReportItem paramReportItem)
  {
    if (paramReportHeader == null) {
      if (QLog.isColorLevel()) {
        QLog.d("VACDReport", 2, "startReport header is null return");
      }
    }
    Message localMessage;
    do
    {
      do
      {
        do
        {
          return;
          if (seqno > 0L) {
            break;
          }
        } while (!QLog.isColorLevel());
        QLog.d("VACDReport", 2, "startReport header seqno=" + seqno + " is illegal!");
        return;
        d();
        c();
        b();
      } while (jdField_c_of_type_AndroidOsHandler == null);
      localMessage = jdField_c_of_type_AndroidOsHandler.obtainMessage();
    } while (localMessage == null);
    arg1 = 1;
    obj = new Object[] { paramString, paramReportHeader, paramReportItem };
    jdField_c_of_type_AndroidOsHandler.sendMessage(localMessage);
  }
  
  public void b(String paramString, ReportHeader paramReportHeader, ReportItem paramReportItem)
  {
    if (paramReportHeader == null) {
      if (QLog.isColorLevel()) {
        QLog.i("VACDReport", 2, "singleReport:header is null return");
      }
    }
    do
    {
      do
      {
        return;
        if (seqno > 0L) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.d("VACDReport", 2, "singleReport header seqno=" + seqno + " is illegal!");
      return;
      if (paramReportItem != null) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.i("VACDReport", 2, "singleReport:item is null return");
    return;
    ThreadManager.a(new meo(this, paramString, paramReportHeader, paramReportItem), 10, null, true);
  }
}
