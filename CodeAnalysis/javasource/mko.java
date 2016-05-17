import com.tencent.mobileqq.activity.selectmember.DiscussionListInnerFrame;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import java.util.Comparator;
import java.util.HashMap;

public class mko
  implements Comparator
{
  public mko(DiscussionListInnerFrame paramDiscussionListInnerFrame, HashMap paramHashMap)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a(Entity paramEntity1, Entity paramEntity2)
  {
    long l1 = ((Long)jdField_a_of_type_JavaUtilHashMap.get(uin)).longValue();
    long l2 = ((Long)jdField_a_of_type_JavaUtilHashMap.get(uin)).longValue();
    if (l1 < l2) {
      return -1;
    }
    if (l1 > l2) {
      return 1;
    }
    return 0;
  }
}
