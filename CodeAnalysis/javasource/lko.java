import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.StrangerChatPie;
import com.tencent.mobileqq.app.ShieldListObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.Utils;
import java.util.List;

public class lko
  extends ShieldListObserver
{
  public lko(StrangerChatPie paramStrangerChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, List paramList)
  {
    
    if (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo == null) {
      return;
    }
    String str = a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
    if (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1006) {
      str = a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.f;
    }
    for (;;)
    {
      if (paramList == null) {}
      int k;
      for (int i = 0;; i = paramList.size())
      {
        int j = 0;
        k = 0;
        while ((k == 0) && (j < i))
        {
          if (Utils.a(String.valueOf(paramList.get(j)), str)) {
            k = 1;
          }
          j += 1;
        }
      }
      if (k == 0) {
        break;
      }
      ChatActivityUtils.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, paramBoolean, false);
      if (!paramBoolean) {
        break;
      }
      a.h();
      return;
    }
  }
  
  protected void b(boolean paramBoolean, List paramList)
  {
    int k = 0;
    ChatActivityUtils.b();
    if (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo == null) {
      return;
    }
    String str = a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
    if (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1006) {
      str = a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.f;
    }
    for (;;)
    {
      if (paramList == null) {}
      for (int i = 0;; i = paramList.size())
      {
        int j = 0;
        while ((k == 0) && (j < i))
        {
          if (Utils.a(String.valueOf(paramList.get(j)), str)) {
            k = 1;
          }
          j += 1;
        }
      }
      if (k == 0) {
        break;
      }
      ChatActivityUtils.b();
      if (!paramBoolean) {
        break;
      }
      a.h();
      return;
    }
  }
}
