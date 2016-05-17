import com.tencent.mobileqq.app.message.HCTopicMessageProcessor;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.Comparator;

public class njx
  implements Comparator
{
  public njx(HCTopicMessageProcessor paramHCTopicMessageProcessor)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a(MessageRecord paramMessageRecord1, MessageRecord paramMessageRecord2)
  {
    return (int)((shmsgseq - shmsgseq) % 2L);
  }
}
