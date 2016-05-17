import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.BusinessCmrTmpChatPie;
import com.tencent.mobileqq.app.ShieldListObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.Utils;
import java.util.List;

public class lfv
  extends ShieldListObserver
{
  public lfv(BusinessCmrTmpChatPie paramBusinessCmrTmpChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, List paramList)
  {
    if (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo == null) {}
    do
    {
      int k;
      do
      {
        return;
        String str = a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a;
        if (paramList == null) {}
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
      } while (k == 0);
      ChatActivityUtils.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, paramBoolean, false);
    } while (!paramBoolean);
    a.ar();
  }
  
  protected void b(boolean paramBoolean, List paramList)
  {
    int k = 0;
    if (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo == null) {}
    do
    {
      do
      {
        return;
        String str = a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a;
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
      } while (k == 0);
      ChatActivityUtils.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, paramBoolean, true);
    } while (!paramBoolean);
    a.ar();
  }
}
