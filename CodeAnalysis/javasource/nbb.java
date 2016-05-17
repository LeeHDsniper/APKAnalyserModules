import android.content.SharedPreferences;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.contactsync.ContactSyncManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class nbb
  implements Runnable
{
  public nbb(PhoneContactManagerImp paramPhoneContactManagerImp)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    PhoneContactManagerImp.a(a, a.a());
    PhoneContactManagerImp.a(a);
    a.e = a.a.getLong("key_contacts_switches", 0L);
    ContactSyncManager localContactSyncManager = (ContactSyncManager)PhoneContactManagerImp.a(a).getManager(40);
  }
}
