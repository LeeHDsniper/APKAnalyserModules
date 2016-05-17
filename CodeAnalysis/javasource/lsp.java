import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.systemmsg.FriendSystemMsgController;

public final class lsp
  implements Runnable
{
  public lsp(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    FriendSystemMsgController.a().c(a);
  }
}
