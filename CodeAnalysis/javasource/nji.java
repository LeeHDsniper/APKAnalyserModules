import com.tencent.mobileqq.app.message.BaseMessageProcessorForTroopAndDisc;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.Comparator;

public class nji
  implements Comparator
{
  public nji(BaseMessageProcessorForTroopAndDisc paramBaseMessageProcessorForTroopAndDisc)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a(MessageRecord paramMessageRecord1, MessageRecord paramMessageRecord2)
  {
    return (int)((shmsgseq - shmsgseq) % 2L);
  }
}
