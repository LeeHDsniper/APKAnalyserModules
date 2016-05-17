import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import com.tencent.mobileqq.activity.photo.PhotoPreviewActivity;
import com.tencent.mobileqq.activity.photo.ProGallery;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.BaseApplication;
import cooperation.photoplus.PhotoPlusBridgeActivity;
import java.util.ArrayList;

public class mbp
  implements View.OnClickListener
{
  public mbp(PhotoPreviewActivity paramPhotoPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (a.jdField_b_of_type_JavaUtilArrayList.size() > 0) {
      a.i = ((String)a.jdField_b_of_type_JavaUtilArrayList.get(0));
    }
    for (;;)
    {
      if (a.i != null)
      {
        ReportController.b(null, "CliOper", "", "", "0x8004B39", "0x8004B39", 0, 0, "", "", "", "");
        if (a.l) {
          ReportController.b(null, "CliOper", "", "", "0X8004D95", "0X8004D95", 0, 0, "", "", "", "");
        }
        paramView = new Intent(BaseApplication.getContext(), PhotoPlusBridgeActivity.class);
        paramView.putExtra("photo_path", a.i);
        paramView.putExtra("iswaitforsult", a.jdField_b_of_type_Boolean);
        paramView.putExtra("type", a.jdField_b_of_type_Int);
        paramView.putExtra("uin", a.e);
        paramView.putExtra("nick", a.f);
        paramView.putExtra("headDir", a.g);
        a.startActivityForResult(paramView, 100003);
        a.overridePendingTransition(2130968619, 2130968620);
        a.jdField_a_of_type_AndroidWidgetButton.setClickable(false);
        paramView = a.getIntent();
        if ((paramView != null) && (paramView.hasExtra("custom_photopreview_editbtn_reportActionName")))
        {
          paramView = paramView.getStringExtra("custom_photopreview_editbtn_reportActionName");
          if (paramView != null) {
            ReportController.b(null, "CliOper", "", "", paramView, paramView, 0, 0, "", "", "", "");
          }
        }
      }
      return;
      int i = a.jdField_a_of_type_ComTencentMobileqqActivityPhotoProGallery.s();
      if (i < a.jdField_a_of_type_JavaUtilArrayList.size()) {
        a.i = ((String)a.jdField_a_of_type_JavaUtilArrayList.get(i));
      }
    }
  }
}
