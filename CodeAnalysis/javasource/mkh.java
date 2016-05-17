import android.os.Handler;
import android.os.Message;
import android.widget.ImageView;
import com.tencent.mobileqq.activity.selectmember.CreateFaceToFaceDiscussionActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mkh
  extends Handler
{
  public mkh(CreateFaceToFaceDiscussionActivity paramCreateFaceToFaceDiscussionActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    if (what == 0)
    {
      CreateFaceToFaceDiscussionActivity.a(a, 2);
      paramMessage = a.jdField_a_of_type_AndroidOsHandler.obtainMessage(0);
      a.jdField_a_of_type_AndroidOsHandler.sendMessageDelayed(paramMessage, a.jdField_a_of_type_Long);
    }
    while ((1 != what) || (a.jdField_b_of_type_Boolean)) {
      return;
    }
    a.jdField_a_of_type_JavaLangStringBuffer.delete(0, a.jdField_a_of_type_JavaLangStringBuffer.length());
    a.jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130840467);
    a.jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130840467);
    a.c.setImageResource(2130840467);
    a.d.setImageResource(2130840467);
    a.e.setEnabled(true);
    a.f.setEnabled(true);
    a.g.setEnabled(true);
    a.h.setEnabled(true);
    a.i.setEnabled(true);
    a.j.setEnabled(true);
    a.k.setEnabled(true);
    a.l.setEnabled(true);
    a.m.setEnabled(true);
    a.n.setEnabled(true);
    a.o.setEnabled(true);
  }
}
