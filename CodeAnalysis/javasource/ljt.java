import com.tencent.biz.pubaccount.PublicAccountManager.refuseAcceptDone;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.AccountDetail;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;

public class ljt
  implements PublicAccountManager.refuseAcceptDone
{
  public ljt(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean)
  {
    a.au();
    if (!paramBoolean)
    {
      a.r(2131364336);
      return;
    }
    EntityManager localEntityManager = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    AccountDetail localAccountDetail = (AccountDetail)localEntityManager.a(AccountDetail.class, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    if (localAccountDetail != null) {
      localEntityManager.b(localAccountDetail);
    }
    localEntityManager.a();
    a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, 1008);
    a.v();
  }
}
