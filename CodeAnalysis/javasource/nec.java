import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.concurrent.atomic.AtomicBoolean;
import msf.msgcomm.msg_comm.Msg;

public class nec
{
  public long a;
  public AtomicBoolean a;
  public msg_comm.Msg a;
  public long b;
  
  public nec(msg_comm.Msg paramMsg, long paramLong1, long paramLong2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Long = 0L;
    b = 0L;
    jdField_a_of_type_MsfMsgcommMsg_comm$Msg = null;
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean = null;
    jdField_a_of_type_MsfMsgcommMsg_comm$Msg = paramMsg;
    jdField_a_of_type_Long = paramLong1;
    b = paramLong2;
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean = new AtomicBoolean(false);
  }
}
