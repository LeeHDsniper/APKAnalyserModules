import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.DiscussChatPie;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.DiscussionObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lgk
  extends DiscussionObserver
{
  public lgk(DiscussChatPie paramDiscussChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, String paramString)
  {
    if ((a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(paramString)) && (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000))
    {
      paramString = ((DiscussionManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(52)).a(paramString);
      if ((paramString != null) && (discussionName != null))
      {
        a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d = discussionName;
        a.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, uin, a.b);
      }
    }
  }
  
  protected void a(boolean paramBoolean, Object[] paramArrayOfObject)
  {
    String str = (String)paramArrayOfObject[0];
    boolean bool = ((Boolean)paramArrayOfObject[1]).booleanValue();
    if ((a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(str)) && (paramBoolean))
    {
      if (bool) {
        a.a(false, false);
      }
      if (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000)
      {
        paramArrayOfObject = ((DiscussionManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(52)).a(str);
        if ((paramArrayOfObject != null) && (discussionName != null))
        {
          a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d = discussionName;
          a.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, uin, a.b);
        }
      }
    }
  }
}
