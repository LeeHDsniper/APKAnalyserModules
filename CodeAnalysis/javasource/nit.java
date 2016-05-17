import com.tencent.mobileqq.app.fms.FullMessageSearchManager;
import com.tencent.mobileqq.app.fms.FullMessageSearchResult;
import com.tencent.mobileqq.app.fms.SearchListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class nit
  implements SearchListener
{
  public nit(FullMessageSearchManager paramFullMessageSearchManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(FullMessageSearchResult paramFullMessageSearchResult)
  {
    FullMessageSearchManager.a(a);
    a.notifyObservers(paramFullMessageSearchResult);
  }
}
