import android.content.res.Resources;
import android.view.View;
import android.widget.TextView;
import com.tencent.mobileqq.activity.photo.PhotoPreviewActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.NumberCheckBox;
import com.tencent.widget.AdapterView;
import com.tencent.widget.AdapterView.OnItemSelectedListener;
import java.util.ArrayList;

public class mbs
  implements AdapterView.OnItemSelectedListener
{
  public mbs(PhotoPreviewActivity paramPhotoPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(AdapterView paramAdapterView) {}
  
  public void b(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    a.j = paramInt;
    if (a.jdField_c_of_type_JavaUtilArrayList.contains(Integer.valueOf(a.j))) {
      a.jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox.setCheckedNumber(a.b.indexOf(a.jdField_a_of_type_JavaUtilArrayList.get(a.j)) + 1);
    }
    while (a.jdField_a_of_type_JavaUtilArrayList.size() > 1)
    {
      a.jdField_c_of_type_AndroidWidgetTextView.setText(paramInt + 1 + " / " + a.jdField_a_of_type_JavaUtilArrayList.size());
      return;
      a.jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox.setChecked(false);
    }
    a.jdField_c_of_type_AndroidWidgetTextView.setText(a.getResources().getString(2131368464));
  }
}
