import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.MobileQQService;

public class rag
  extends FriendListObserver
{
  public rag(MobileQQService paramMobileQQService)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, String paramString)
  {
    String str = MobileQQService.a(a).a();
    if ((paramBoolean) && (str != null) && (str.equals(paramString))) {
      MobileQQService.a(a).a(MobileQQService.a(a).a());
    }
  }
}
