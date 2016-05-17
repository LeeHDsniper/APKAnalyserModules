import android.graphics.Rect;
import android.view.TouchDelegate;
import android.view.View;
import com.tencent.mobileqq.activity.aio.photo.PhotoListPanel.MyAdapter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class let
  implements Runnable
{
  public let(PhotoListPanel.MyAdapter paramMyAdapter, View paramView1, int paramInt, View paramView2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Rect localRect = new Rect();
    jdField_a_of_type_AndroidViewView.getHitRect(localRect);
    top -= jdField_a_of_type_Int;
    left -= jdField_a_of_type_Int;
    right += jdField_a_of_type_Int;
    bottom += jdField_a_of_type_Int;
    b.setTouchDelegate(new TouchDelegate(localRect, jdField_a_of_type_AndroidViewView));
  }
}
