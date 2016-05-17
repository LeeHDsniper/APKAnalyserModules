import com.tencent.mobileqq.app.message.ConversationProxy;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.NoColumnError;
import com.tencent.mobileqq.persistence.NoColumnErrorHandler;
import com.tencent.qphone.base.util.QLog;

public class njq
  implements NoColumnErrorHandler
{
  public njq(ConversationProxy paramConversationProxy)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(NoColumnError paramNoColumnError)
  {
    if ((paramNoColumnError != null) && (("unreadGiftCount".equals(mColumnName)) || ("unreadMark".equals(mColumnName))))
    {
      if (QLog.isColorLevel()) {
        QLog.w("Q.unread.Proxy", 2, paramNoColumnError.getMessage(), paramNoColumnError);
      }
      ConversationProxy.a(a, true);
    }
  }
}
