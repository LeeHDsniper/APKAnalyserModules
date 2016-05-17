import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ExpiredPushBanner;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.struct.PushBanner;
import java.util.List;

class mfm
  implements Runnable
{
  mfm(mfl paramMfl, int paramInt, List paramList)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int k = 0;
    EntityManager localEntityManager = ajdField_a_of_type_Mfl.a).app.a().createEntityManager();
    Object localObject = localEntityManager.a(ExpiredPushBanner.class, false, null, null, null, null, "endtime", null);
    int j = k;
    if (localObject != null)
    {
      int m = ((List)localObject).size() + jdField_a_of_type_Int - 10;
      j = k;
      if (m > 0)
      {
        int i = 0;
        for (;;)
        {
          j = k;
          if (i >= m) {
            break;
          }
          localEntityManager.b((ExpiredPushBanner)((List)localObject).get(i));
          i += 1;
        }
      }
    }
    while (j < jdField_a_of_type_JavaUtilList.size())
    {
      localObject = (PushBanner)jdField_a_of_type_JavaUtilList.get(j);
      if (localObject != null)
      {
        long l2 = 0L;
        long l1 = l2;
        if (c != null)
        {
          l1 = l2;
          if (c.contains("|")) {
            l1 = Long.parseLong(c.substring(c.indexOf("|") + 1));
          }
        }
        ExpiredPushBanner localExpiredPushBanner = new ExpiredPushBanner();
        cid = Long.parseLong(a);
        md5 = m;
        endtime = l1;
        localEntityManager.a(localExpiredPushBanner);
      }
      j += 1;
    }
  }
}
