import android.content.Context;
import android.widget.Toast;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class svu
  extends Toast
{
  public svu(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void show()
  {
    try
    {
      super.show();
      return;
    }
    catch (Throwable localThrowable)
    {
      while (!QLog.isColorLevel()) {}
      QLog.d("QQToast", 2, "", localThrowable);
    }
  }
}
