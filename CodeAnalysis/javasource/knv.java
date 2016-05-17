import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import com.tencent.mobileqq.activity.VerifyCodeActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.BitmapManager;
import com.tencent.mobileqq.widget.ClearableEditText;
import mqq.observer.ServerNotifyObserver;

public class knv
  extends ServerNotifyObserver
{
  public knv(VerifyCodeActivity paramVerifyCodeActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceiveVerifyCode(String paramString1, int paramInt, String paramString2, byte[] paramArrayOfByte)
  {
    a.b = false;
    if (a.jdField_a_of_type_Boolean)
    {
      a.jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText.setText("");
      Toast.makeText(a.getApplicationContext(), a.getString(2131367041), 0).show();
    }
    a.jdField_a_of_type_MqqObserverServerNotifyObserver.setKey(paramString1);
    a.jdField_a_of_type_MqqObserverServerNotifyObserver.setSeq(paramInt);
    a.jdField_a_of_type_AndroidWidgetTextView.setEnabled(true);
    if ((a.jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText.getText().toString() != null) && (a.jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText.getText().toString().length() > 4)) {
      VerifyCodeActivity.a(a, true);
    }
    if (paramArrayOfByte != null)
    {
      a.jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(BitmapManager.a(paramArrayOfByte, 0, paramArrayOfByte.length));
      a.a(false);
      return;
    }
    Toast.makeText(a.getApplicationContext(), a.getString(2131367042), 1).show();
  }
  
  public void onVerifyClose()
  {
    a.finish();
  }
}
