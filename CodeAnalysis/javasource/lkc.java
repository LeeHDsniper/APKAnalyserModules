import android.support.v4.app.FragmentActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.PublicAccountObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lkc
  extends PublicAccountObserver
{
  public lkc(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt)
  {
    a.t(paramInt);
  }
  
  public void a(int paramInt, PublicAccountInfo paramPublicAccountInfo)
  {
    if (paramInt == 0) {
      a.c(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent());
    }
  }
  
  public void a(int paramInt, boolean paramBoolean)
  {
    if (paramBoolean) {
      a.c(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent());
    }
    if ((paramBoolean) && (!PublicAccountChatPie.a(a)))
    {
      localObject = (PublicAccountDataManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55);
      if (localObject == null) {
        break label102;
      }
    }
    label102:
    for (Object localObject = ((PublicAccountDataManager)localObject).b(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);; localObject = null)
    {
      if ((localObject != null) && (a.g != null) && (!PublicAccountChatPie.b(a))) {
        a.av();
      }
      return;
    }
  }
  
  public void b(int paramInt, PublicAccountInfo paramPublicAccountInfo)
  {
    if (paramInt == 0) {
      a.c(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent());
    }
  }
}
