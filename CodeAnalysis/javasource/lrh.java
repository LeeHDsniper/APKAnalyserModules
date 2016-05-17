import android.app.Activity;
import com.tencent.biz.addContactTroopView.AddContactTroopHandler.IGetPopClassAndSearchCB;
import com.tencent.mobileqq.activity.contact.addcontact.ContactBaseView.IAddContactContext;
import com.tencent.mobileqq.activity.contact.addcontact.TroopView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lrh
  implements AddContactTroopHandler.IGetPopClassAndSearchCB
{
  public lrh(TroopView paramTroopView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a()
  {
    if ((a.a == null) || (a.a.a() == null) || (a.a.a().isFinishing())) {
      return;
    }
    TroopView.d(a, true);
    TroopView.e(a, true);
    TroopView.a(a).sendEmptyMessage(4);
  }
  
  public void b()
  {
    if ((a.a == null) || (a.a.a() == null) || (a.a.a().isFinishing())) {
      return;
    }
    TroopView.d(a, true);
    TroopView.e(a, false);
    TroopView.a(a).sendEmptyMessage(5);
  }
}
