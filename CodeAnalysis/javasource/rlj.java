import com.tencent.mobileqq.app.MessageObserver.StatictisInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.ProtoReqManager;
import com.tencent.mobileqq.transfile.ProtoReqManager.ProtoResp;
import com.tencent.qphone.base.util.QLog;
import java.util.concurrent.ConcurrentHashMap;
import mqq.app.NewIntent;

public class rlj
  implements Runnable
{
  public long a;
  public ProtoReqManager.ProtoResp a;
  public NewIntent a;
  public boolean a;
  long b;
  public boolean b;
  public long c;
  public boolean c;
  
  public rlj(ProtoReqManager paramProtoReqManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    c = false;
  }
  
  public void run()
  {
    QLog.d("Q.richmedia.ProtoReqManager", 2, "ProtoReqRunnable.run() : resp.startTime" + jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$ProtoResp.jdField_a_of_type_Long);
    jdField_a_of_type_Boolean = true;
    jdField_b_of_type_Long = System.currentTimeMillis();
    jdField_a_of_type_MqqAppNewIntent.putExtra("key_timeout", jdField_a_of_type_Long);
    MessageObserver.StatictisInfo localStatictisInfo = jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$ProtoResp.jdField_a_of_type_ComTencentMobileqqAppMessageObserver$StatictisInfo;
    d += 1;
    jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager.a.put(jdField_a_of_type_MqqAppNewIntent, jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$ProtoResp);
    jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager.a(jdField_a_of_type_MqqAppNewIntent);
  }
}
