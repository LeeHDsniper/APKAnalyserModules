import com.tencent.mobileqq.app.asyncdb.cache.RecentUserCache;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import java.util.Comparator;

public class nha
  implements Comparator
{
  public nha(RecentUserCache paramRecentUserCache)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a(Entity paramEntity1, Entity paramEntity2)
  {
    long l3 = 2L;
    paramEntity1 = (RecentUser)paramEntity1;
    paramEntity2 = (RecentUser)paramEntity2;
    long l1 = Math.max(lastmsgtime, lastmsgdrafttime);
    long l2 = Math.max(lastmsgtime, lastmsgdrafttime);
    if (l1 > l2) {
      l1 = 3L;
    }
    for (;;)
    {
      l2 = l1;
      if (showUpTime > 0L) {
        l2 = l1 | 0x1000;
      }
      l1 = l3;
      if (showUpTime > 0L) {
        l1 = 0x2 | 0x1000;
      }
      if (l2 >= l1) {
        break;
      }
      return 1;
      if (l1 < l2) {
        l1 = 1L;
      } else {
        l1 = 2L;
      }
    }
    if (l2 == l1) {
      return 0;
    }
    return -1;
  }
}
