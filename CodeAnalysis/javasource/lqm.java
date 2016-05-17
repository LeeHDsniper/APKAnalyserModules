import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.contact.addcontact.PublicView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.XListView;
import java.lang.ref.WeakReference;

public class lqm
  extends Handler
{
  private WeakReference a;
  
  public lqm(PublicView paramPublicView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new WeakReference(paramPublicView);
  }
  
  public void handleMessage(Message paramMessage)
  {
    PublicView localPublicView = (PublicView)a.get();
    if (localPublicView == null) {
      return;
    }
    switch (what)
    {
    default: 
      return;
    case 1: 
      PublicView.a(localPublicView).H();
      return;
    case 2: 
      PublicView.a(localPublicView).H();
      PublicView.a(localPublicView, 1, 2131368310);
      return;
    case 3: 
      PublicView.a(localPublicView, true);
      return;
    }
    PublicView.c(localPublicView);
  }
}
