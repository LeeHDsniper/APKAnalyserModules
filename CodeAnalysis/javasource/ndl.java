import android.content.Context;
import android.content.Intent;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class ndl
  implements Runnable
{
  ndl(ndk paramNdk, Context paramContext, Intent paramIntent)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    QQAppInterface.a(jdField_a_of_type_Ndk.a, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_AndroidContentIntent);
  }
}
