import com.tencent.mobileqq.app.message.SystemMessageProcessor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBUInt64Field;
import java.util.Comparator;
import tencent.mobileim.structmsg.structmsg.StructMsg;

public class nkr
  implements Comparator
{
  public nkr(SystemMessageProcessor paramSystemMessageProcessor)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a(structmsg.StructMsg paramStructMsg1, structmsg.StructMsg paramStructMsg2)
  {
    if (msg_time.get() < msg_time.get()) {
      return 1;
    }
    if (msg_time.get() > msg_time.get()) {
      return -1;
    }
    return 0;
  }
}
