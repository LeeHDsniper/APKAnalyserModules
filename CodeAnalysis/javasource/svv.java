import android.content.Context;
import android.content.res.Resources;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.mobileqq.widget.QQToastNotifier;
import com.tencent.qphone.base.util.QLog;

public class svv
  extends Handler
{
  public svv(QQToastNotifier paramQQToastNotifier, Looper paramLooper)
  {
    super(paramLooper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    svw localSvw = (svw)obj;
    paramMessage = jdField_a_of_type_JavaLangString;
    if ((paramMessage == null) || (paramMessage.length() == 0)) {}
    for (;;)
    {
      try
      {
        String str = a.jdField_a_of_type_AndroidContentContext.getResources().getString(b);
        paramMessage = str;
        if (a.jdField_a_of_type_AndroidWidgetToast != null) {
          break label116;
        }
        a.jdField_a_of_type_AndroidWidgetToast = QQToast.a(a.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_Int, paramMessage, c).a(d);
        if (a.jdField_a_of_type_AndroidWidgetToast != null) {
          a.jdField_a_of_type_AndroidWidgetToast.show();
        }
        return;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
      }
      continue;
      try
      {
        label116:
        View localView = a.jdField_a_of_type_AndroidWidgetToast.getView();
        ((TextView)localView.findViewById(2131297768)).setText(paramMessage);
        ((ImageView)localView.findViewById(2131297767)).setImageResource(QQToast.a(jdField_a_of_type_Int));
        a.jdField_a_of_type_AndroidWidgetToast.setDuration(c);
      }
      catch (Throwable paramMessage)
      {
        paramMessage.printStackTrace();
        a.jdField_a_of_type_AndroidWidgetToast = null;
      }
      if (QLog.isColorLevel()) {
        QLog.i("QQToastNotifier", 2, paramMessage.toString());
      }
    }
  }
}
