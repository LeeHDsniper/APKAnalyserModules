import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.biz.anonymous.QQAnonymousDialog;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.os.MqqHandler;

class llc
  implements Runnable
{
  llc(lkx paramLkx)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (a.a.jdField_a_of_type_ComTencentBizAnonymousQQAnonymousDialog != null) {
      a.a.jdField_a_of_type_ComTencentBizAnonymousQQAnonymousDialog.dismiss();
    }
    a.a.k(true);
    TroopChatPie.d(a.a).postDelayed(new lld(this), 100L);
    if (!AnonymousChatHelper.a(a.a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)) {
      TroopChatPie.e(a.a).postDelayed(new lle(this), 200L);
    }
  }
}
