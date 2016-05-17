import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.httputils.HttpCommunicator;

public class spd
  extends Thread
{
  int jdField_a_of_type_Int;
  volatile boolean jdField_a_of_type_Boolean;
  
  spd(HttpCommunicator paramHttpCommunicator)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = -1;
    jdField_a_of_type_Boolean = false;
  }
  
  public void run() {}
}
