import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.mobileqq.activity.phone.BaseActivityView.IPhoneContext;
import com.tencent.mobileqq.activity.phone.PhoneFrameActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lzc
  implements BaseActivityView.IPhoneContext
{
  public lzc(PhoneFrameActivity paramPhoneFrameActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public View a()
  {
    return a.jdField_a_of_type_AndroidViewView;
  }
  
  public ImageView a()
  {
    return a.jdField_a_of_type_AndroidWidgetImageView;
  }
  
  public TextView a()
  {
    return a.leftView;
  }
  
  public QQAppInterface a()
  {
    return a.app;
  }
  
  public View b()
  {
    return a.b;
  }
  
  public TextView b()
  {
    return a.rightViewText;
  }
  
  public TextView c()
  {
    return a.centerView;
  }
  
  public TextView d()
  {
    return a.jdField_a_of_type_AndroidWidgetTextView;
  }
}
