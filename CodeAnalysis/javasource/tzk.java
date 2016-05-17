import android.content.Context;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.push.BadgeUtilImpl;

public final class tzk
  implements Runnable
{
  public tzk(Context paramContext, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    BadgeUtilImpl.setBadge(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_Int);
  }
}
