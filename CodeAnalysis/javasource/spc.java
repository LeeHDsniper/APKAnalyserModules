import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.httputils.HttpCommunicator;
import com.tencent.mobileqq.utils.httputils.HttpMsg;
import com.tencent.mobileqq.utils.httputils.IHttpCommunicatorListener;
import java.net.HttpURLConnection;
import java.util.concurrent.atomic.AtomicBoolean;

public class spc
  extends Handler
{
  public static final int b = 0;
  public static final int c = 1;
  public int a;
  public HttpMsg a;
  public AtomicBoolean a;
  public AtomicBoolean b;
  
  public spc(HttpCommunicator paramHttpCommunicator, Looper paramLooper)
  {
    super(paramLooper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean = new AtomicBoolean();
    b = new AtomicBoolean();
  }
  
  public void a()
  {
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg != null)
      {
        jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator.a(jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg, "requeustInterupt", "msgId:" + jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.ai + " thread id:" + jdField_a_of_type_Int);
        jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.b.set(true);
        if (jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.jdField_a_of_type_JavaNetHttpURLConnection != null)
        {
          jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.jdField_a_of_type_JavaNetHttpURLConnection.disconnect();
          getLooper().getThread().interrupt();
        }
        jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator.a(this);
        jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.a(9361, 0, "preempted by higher msg");
        jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg.a().b(jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg, jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg);
        jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg = null;
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public void a(HttpMsg paramHttpMsg)
  {
    sendMessage(obtainMessage(0, paramHttpMsg));
  }
  
  public void handleMessage(Message arg1)
  {
    if (what == 0) {
      if ((obj != null) && ((obj instanceof HttpMsg)))
      {
        localHttpMsg = (HttpMsg)obj;
        if (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) {
          break label179;
        }
        jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator.a(localHttpMsg, this, false);
        if (jdField_a_of_type_JavaLangObject != null) {
          c.set(true);
        }
      }
    }
    label179:
    while (what != 1)
    {
      synchronized (jdField_a_of_type_JavaLangObject)
      {
        HttpMsg localHttpMsg;
        jdField_a_of_type_JavaLangObject.notify();
        if (b.get())
        {
          getLooper().quit();
          return;
        }
      }
      jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(false);
      jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg = null;
      obj = null;
      synchronized (HttpCommunicator.a(jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator))
      {
        HttpCommunicator.a(jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator);
        jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator.a("handleMsgFin thread index:" + jdField_a_of_type_Int);
        return;
      }
      jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(false);
      jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg = null;
      obj = null;
      return;
    }
    getLooper().quit();
  }
}
