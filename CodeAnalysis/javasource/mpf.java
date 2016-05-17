import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import com.tencent.image.AbstractVideoImage;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPlayerActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mpf
  implements View.OnClickListener
{
  public mpf(ShortVideoPlayerActivity paramShortVideoPlayerActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (a.jdField_a_of_type_Boolean)
    {
      a.jdField_a_of_type_AndroidWidgetButton.setText("Pause");
      a.jdField_a_of_type_Boolean = false;
      AbstractVideoImage.resumeAll();
      return;
    }
    a.jdField_a_of_type_AndroidWidgetButton.setText("Resume");
    a.jdField_a_of_type_Boolean = true;
    AbstractVideoImage.pauseAll();
  }
}
