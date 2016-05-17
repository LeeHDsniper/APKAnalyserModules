import com.tencent.biz.pubaccount.PublicAccountManager;
import com.tencent.biz.ui.CustomMenuBar.OnMenuItemClickListener;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ljg
  implements CustomMenuBar.OnMenuItemClickListener
{
  public ljg(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(String paramString, int paramInt1, int paramInt2)
  {
    com.tencent.mobileqq.activity.aio.AIOUtils.l = true;
    a.jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager.a(paramString, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.a(), paramInt1, PublicAccountChatPie.a(a), PublicAccountChatPie.a(a), paramInt2, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
  }
}
