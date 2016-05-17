import android.app.Dialog;
import android.os.Handler;
import android.os.Message;
import android.view.ViewGroup.LayoutParams;
import android.widget.GridView;
import android.widget.HorizontalScrollView;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQToast;

public class mmq
  extends Handler
{
  public mmq(SelectMemberActivity paramSelectMemberActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    do
    {
      do
      {
        return;
        a.jdField_a_of_type_AndroidWidgetHorizontalScrollView.scrollTo(a.jdField_a_of_type_AndroidWidgetGridView.getLayoutParams().width, 0);
        return;
      } while ((a.jdField_a_of_type_AndroidAppDialog == null) || (!a.jdField_a_of_type_AndroidAppDialog.isShowing()));
      a.jdField_a_of_type_AndroidAppDialog.dismiss();
      if (a.i) {}
      for (int i = 2131369863;; i = 2131369864)
      {
        QQToast.a(a, 2, i, 1500).b(a.getTitleBarHeight());
        postDelayed(new mmr(this), 1500L);
        return;
      }
    } while ((a.jdField_a_of_type_AndroidAppDialog == null) || (!a.jdField_a_of_type_AndroidAppDialog.isShowing()));
    a.jdField_a_of_type_AndroidAppDialog.dismiss();
    String str = (String)obj;
    paramMessage = str;
    if (str == null) {
      paramMessage = a.getString(2131369865);
    }
    QQToast.a(a, 1, paramMessage, 1500).b(a.getTitleBarHeight());
  }
}
