import android.content.SharedPreferences;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindServlet;
import com.tencent.qphone.base.util.QLog;
import mqq.app.NewIntent;

public class nbs
  implements Runnable
{
  public nbs(PhoneContactManagerImp paramPhoneContactManagerImp)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    long l1 = a.a.getLong("key_req_last_login_time", 0L);
    long l2 = a.a.getLong("key_req_login_interval", 86400000L);
    if (QLog.isColorLevel())
    {
      localObject = new StringBuilder(100);
      ((StringBuilder)localObject).append("checkLastLogin, lastReqTime = ").append(l1);
      ((StringBuilder)localObject).append(", current = ").append(System.currentTimeMillis());
      ((StringBuilder)localObject).append(", interval = ").append(l2);
      ((StringBuilder)localObject).append(", isRequesting = ").append(PhoneContactManagerImp.a(a));
      QLog.d("PhoneContact.Manager", 2, ((StringBuilder)localObject).toString());
    }
    if ((PhoneContactManagerImp.a(a)) || (!a.c()) || (Math.abs(System.currentTimeMillis() - l1) < l2)) {
      return;
    }
    PhoneContactManagerImp.b(a, true);
    Object localObject = new NewIntent(PhoneContactManagerImp.a(a).getApplication(), ContactBindServlet.class);
    ((NewIntent)localObject).putExtra("req_type", 32);
    l1 = a.a.getLong("key_login_info_timestamp", 0L);
    ((NewIntent)localObject).putExtra("next_flag", 0);
    ((NewIntent)localObject).putExtra("time_stamp", l1);
    ((NewIntent)localObject).putExtra("unique_phone_no", a.a());
    PhoneContactManagerImp.a(a).startServlet((NewIntent)localObject);
  }
}
