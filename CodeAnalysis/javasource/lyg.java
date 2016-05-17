import android.os.Bundle;
import com.tencent.mobileqq.activity.phone.ContactListView;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lyg
  extends FriendListObserver
{
  public lyg(ContactListView paramContactListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(String paramString) {}
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, String paramString, Bundle paramBundle)
  {
    if ((paramBoolean1) && (paramBoolean2) && (!paramBoolean3)) {
      a.j();
    }
  }
}
