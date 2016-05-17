import android.content.Intent;
import com.tencent.mobileqq.activity.ContactSyncJumpActivity;
import com.tencent.mobileqq.activity.phone.PhoneFrameActivity;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;

public class ips
  extends ContactBindObserver
{
  public ips(ContactSyncJumpActivity paramContactSyncJumpActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramBoolean1)
    {
      int i = ContactSyncJumpActivity.a(a).d();
      if ((i == 1) || (i == 2))
      {
        a.startActivity(new Intent(a, PhoneFrameActivity.class));
        a.finish();
      }
    }
  }
}
