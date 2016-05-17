import android.graphics.drawable.Drawable;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.ClearableEditText;
import com.tencent.mobileqq.widget.ClearableEditText.OnTextClearedListener;

public class stn
  implements View.OnTouchListener
{
  public stn(ClearableEditText paramClearableEditText)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    int i = 1;
    if (a.getCompoundDrawables()[2] == null) {}
    label107:
    for (;;)
    {
      return false;
      if (paramMotionEvent.getAction() == 1)
      {
        if (paramMotionEvent.getX() > a.getWidth() - a.getPaddingRight() - a.jdField_a_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicWidth()) {}
        for (;;)
        {
          if (i == 0) {
            break label107;
          }
          a.setText("");
          a.setClearButtonVisible(false);
          if (a.jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText$OnTextClearedListener == null) {
            break;
          }
          a.jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText$OnTextClearedListener.a();
          return false;
          i = 0;
        }
      }
    }
  }
}
