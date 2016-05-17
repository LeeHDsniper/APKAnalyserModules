import android.app.Activity;
import com.tencent.biz.addContactTroopView.AddContactTroopHandler.IGetPopClassAndSearchCB;
import com.tencent.mobileqq.activity.contact.addcontact.ContactBaseView.IAddContactContext;
import com.tencent.mobileqq.activity.contact.addcontact.TroopView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lrg
  implements AddContactTroopHandler.IGetPopClassAndSearchCB
{
  public lrg(TroopView paramTroopView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a()
  {
    if ((a.a == null) || (a.a.a() == null) || (a.a.a().isFinishing())) {
      return;
    }
    TroopView.b(a, true);
    TroopView.c(a, true);
    TroopView.a(a).sendEmptyMessage(4);
  }
  
  public void b()
  {
    if ((a.a == null) || (a.a.a() == null) || (a.a.a().isFinishing())) {
      return;
    }
    TroopView.b(a, true);
    TroopView.c(a, false);
    TroopView.a(a).sendEmptyMessage(5);
  }
}
