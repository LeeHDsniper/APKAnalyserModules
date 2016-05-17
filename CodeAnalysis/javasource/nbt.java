import android.database.ContentObserver;
import android.os.Handler;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class nbt
  extends ContentObserver
{
  public nbt(PhoneContactManagerImp paramPhoneContactManagerImp, Handler paramHandler)
  {
    super(paramHandler);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onChange(boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "Contact changed.");
    }
    a.g = true;
  }
}
