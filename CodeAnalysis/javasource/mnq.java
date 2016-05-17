import com.tencent.mobileqq.activity.selectmember.TroopDiscussionDiscussion;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import java.util.Comparator;
import java.util.HashMap;

public class mnq
  implements Comparator
{
  public mnq(TroopDiscussionDiscussion paramTroopDiscussionDiscussion, HashMap paramHashMap)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a(Entity paramEntity1, Entity paramEntity2)
  {
    long l1 = lastMsgTime;
    long l2 = lastMsgTime;
    if (l1 == l2)
    {
      l1 = ((Long)jdField_a_of_type_JavaUtilHashMap.get(uin)).longValue();
      l2 = ((Long)jdField_a_of_type_JavaUtilHashMap.get(uin)).longValue();
      if (l1 < l2) {
        return -1;
      }
      if (l1 > l2) {
        return 1;
      }
      return 0;
    }
    if (l1 < l2) {
      return 1;
    }
    return -1;
  }
}
