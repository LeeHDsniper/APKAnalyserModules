import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.NearbyChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.NearbyPeopleCard;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;

public class lic
  implements Runnable
{
  public lic(NearbyChatPie paramNearbyChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    NearbyPeopleCard localNearbyPeopleCard = (NearbyPeopleCard)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager().a(NearbyPeopleCard.class, "uin=?", new String[] { a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a });
    if (localNearbyPeopleCard != null) {
      a.du = gender;
    }
  }
}
