import com.tencent.mobileqq.activity.contact.addcontact.PublicView;
import com.tencent.mobileqq.app.PublicAccountObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.PullRefreshHeader;
import com.tencent.widget.XListView;

public class lqk
  extends PublicAccountObserver
{
  public lqk(PublicView paramPublicView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean)
  {
    if (true == paramBoolean)
    {
      PublicView.a(a).a(0);
      PublicView.a(a).sendEmptyMessage(1);
      PublicView.a(a).sendEmptyMessage(3);
      return;
    }
    PublicView.a(a).H();
    PublicView.a(a, 1, 2131368310);
    PublicView.b(a);
  }
}
