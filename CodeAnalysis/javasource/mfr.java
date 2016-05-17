import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ExpiredPushBanner;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.struct.PushBanner;
import java.util.List;

class mfr
  implements Runnable
{
  mfr(mfq paramMfq, PushBanner paramPushBanner)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int i = 0;
    EntityManager localEntityManager = ajdField_a_of_type_Mfq.a).app.a().createEntityManager();
    ExpiredPushBanner localExpiredPushBanner = new ExpiredPushBanner();
    List localList = localEntityManager.a(ExpiredPushBanner.class, false, null, null, null, null, "endtime", null);
    if (localList != null) {
      while (i < localList.size() - 9)
      {
        localEntityManager.b((ExpiredPushBanner)localList.get(i));
        i += 1;
      }
    }
    long l3 = Long.parseLong(jdField_a_of_type_ComTencentMobileqqStructPushBanner.a);
    long l2 = 0L;
    long l1 = l2;
    if (jdField_a_of_type_ComTencentMobileqqStructPushBanner.c != null)
    {
      l1 = l2;
      if (jdField_a_of_type_ComTencentMobileqqStructPushBanner.c.contains("|")) {
        l1 = Long.parseLong(jdField_a_of_type_ComTencentMobileqqStructPushBanner.c.substring(jdField_a_of_type_ComTencentMobileqqStructPushBanner.c.indexOf("|") + 1));
      }
    }
    cid = l3;
    md5 = jdField_a_of_type_ComTencentMobileqqStructPushBanner.m;
    endtime = l1;
    localEntityManager.a(localExpiredPushBanner);
  }
}
