import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.contact.addcontact.TroopView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.XListView;
import java.lang.ref.WeakReference;

public class lrj
  extends Handler
{
  public WeakReference a;
  
  public lrj(TroopView paramTroopView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new WeakReference(paramTroopView);
  }
  
  public void handleMessage(Message paramMessage)
  {
    TroopView localTroopView = (TroopView)a.get();
    if (localTroopView == null) {}
    do
    {
      return;
      super.handleMessage(paramMessage);
      switch (what)
      {
      default: 
        return;
      case 0: 
        TroopView.a(localTroopView).H();
        return;
      case 1: 
        TroopView.a(localTroopView).H();
        TroopView.a(localTroopView, 1, 2131368310);
        return;
      }
    } while ((!TroopView.a(localTroopView)) || (TroopView.b(localTroopView)));
    TroopView.f(localTroopView, true);
    TroopView.a(localTroopView, false);
    return;
    TroopView.a(localTroopView, true);
    return;
    TroopView.b(localTroopView);
    return;
    TroopView.c(localTroopView);
  }
}
