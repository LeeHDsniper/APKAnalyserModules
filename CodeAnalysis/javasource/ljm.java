import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.AccountDetail;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.mp.mobileqq_mp.GetPublicAccountDetailInfoResponse;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;

class ljm
  implements Runnable
{
  ljm(ljl paramLjl, mobileqq_mp.GetPublicAccountDetailInfoResponse paramGetPublicAccountDetailInfoResponse)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    AccountDetail localAccountDetail = new AccountDetail(jdField_a_of_type_ComTencentMobileqqMpMobileqq_mp$GetPublicAccountDetailInfoResponse);
    EntityManager localEntityManager = jdField_a_of_type_Ljl.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_Ljl.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).createEntityManager();
    if (localEntityManager != null) {
      localEntityManager.b(localAccountDetail);
    }
    jdField_a_of_type_Ljl.a.jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo = PublicAccountInfo.createPublicAccount(localAccountDetail, 0L);
    jdField_a_of_type_Ljl.a.a(jdField_a_of_type_Ljl.a.jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo);
  }
}
