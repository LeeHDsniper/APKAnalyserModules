import android.content.res.Resources;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.photo.PhotoPreviewActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.PresendPicMgr;
import com.tencent.mobileqq.widget.NumberCheckBox;
import com.tencent.mobileqq.widget.QQToast;
import java.io.File;
import java.util.ArrayList;

public class mbn
  implements View.OnClickListener
{
  public mbn(PhotoPreviewActivity paramPhotoPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = PresendPicMgr.a(null);
    if (a.jdField_c_of_type_JavaUtilArrayList.contains(Integer.valueOf(a.j)))
    {
      a.jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox.setChecked(false);
      int i = a.jdField_c_of_type_JavaUtilArrayList.indexOf(Integer.valueOf(a.j));
      if (i >= 0)
      {
        a.b.remove(a.jdField_a_of_type_JavaUtilArrayList.get(a.j));
        a.jdField_c_of_type_JavaUtilArrayList.remove(i);
        if (paramView != null) {
          paramView.b((String)a.jdField_a_of_type_JavaUtilArrayList.get(a.j), 1014);
        }
      }
      a.c();
      return;
    }
    if (a.b.size() >= a.jdField_c_of_type_Int)
    {
      long l = System.currentTimeMillis();
      if (l - a.jdField_a_of_type_Long >= 700L)
      {
        QQToast.a(a, "最多只能选择" + a.jdField_c_of_type_Int + "张图片", 1000).b(a.d);
        a.jdField_a_of_type_Long = l;
      }
      a.jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox.setChecked(false);
      return;
    }
    if ((a.e == 2) && (a.j < a.jdField_a_of_type_JavaUtilArrayList.size()) && (a.j >= 0) && (new File((String)a.jdField_a_of_type_JavaUtilArrayList.get(a.j)).length() > 19922944L))
    {
      QQToast.a(a, a.getResources().getString(2131369812), 0).b(a.getResources().getDimensionPixelSize(2131492908));
      a.jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox.setChecked(false);
      return;
    }
    if ((paramView != null) && (a.j < a.jdField_a_of_type_JavaUtilArrayList.size()) && (a.j >= 0)) {
      paramView.a((String)a.jdField_a_of_type_JavaUtilArrayList.get(a.j), a.i);
    }
    paramView = (String)a.jdField_a_of_type_JavaUtilArrayList.get(a.j);
    if ((a.j < a.jdField_a_of_type_JavaUtilArrayList.size()) && (a.j >= 0))
    {
      a.b.add(paramView);
      a.jdField_c_of_type_JavaUtilArrayList.add(Integer.valueOf(a.j));
    }
    a.jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox.setCheckedNumber(a.b.indexOf(paramView) + 1);
    a.c();
  }
}
