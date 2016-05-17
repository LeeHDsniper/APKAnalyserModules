import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.widget.XListView;

public class mqm
  extends Handler
{
  public mqm(SpecailCareListActivity paramSpecailCareListActivity)
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
      return;
      a.jdField_a_of_type_ComTencentWidgetXListView.H();
      return;
      a.jdField_a_of_type_ComTencentWidgetXListView.H();
      QQToast.a(BaseApplication.getContext(), 1, 2131368714, 0).b(a.getTitleBarHeight());
      return;
      if (a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog == null) {
        a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = new QQProgressDialog(a, a.getTitleBarHeight());
      }
      a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.b(2131370694);
    } while ((a.isFinishing()) || (a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.isShowing()));
    a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.show();
  }
}
