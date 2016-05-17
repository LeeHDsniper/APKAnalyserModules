import com.tencent.mobileqq.activity.contact.newfriend.RecommendListView;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;

public class lrz
  implements Runnable
{
  public lrz(RecommendListView paramRecommendListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    synchronized (RecommendListView.a(a))
    {
      if (!RecommendListView.a(a)) {
        return;
      }
      PhoneContactManager localPhoneContactManager = (PhoneContactManager)a.a.getManager(10);
      a.a.runOnUiThread(new lsa(this, null));
      return;
    }
  }
}
