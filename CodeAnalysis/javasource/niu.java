import com.tencent.mobileqq.app.fms.FullMessageSearchTask;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import java.util.Comparator;

public class niu
  implements Comparator
{
  public niu(FullMessageSearchTask paramFullMessageSearchTask)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a(Entity paramEntity1, Entity paramEntity2)
  {
    int j = -1;
    paramEntity1 = (RecentUser)paramEntity1;
    paramEntity2 = (RecentUser)paramEntity2;
    long l1 = Math.max(lastmsgtime, lastmsgdrafttime);
    long l2 = Math.max(lastmsgtime, lastmsgdrafttime);
    int i;
    if (l1 < l2)
    {
      i = 1;
      if (type != type) {
        break label80;
      }
    }
    label80:
    do
    {
      do
      {
        return i;
        if (l1 == l2)
        {
          i = 0;
          break;
        }
        i = -1;
        break;
        i = j;
      } while (type == 0);
      if (type == 0) {
        return 1;
      }
      i = j;
    } while (type - type > 0);
    return 1;
  }
}
