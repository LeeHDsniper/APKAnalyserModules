import android.content.res.Resources;
import android.view.View;
import android.widget.RelativeLayout;
import com.tencent.mobileqq.activity.photo.PhotoPreviewActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AdapterView;
import com.tencent.widget.AdapterView.OnItemClickListener;
import com.tencent.widget.immersive.ImmersiveUtils;
import com.tencent.widget.immersive.SystemBarCompact;

public class mbt
  implements AdapterView.OnItemClickListener
{
  public mbt(PhotoPreviewActivity paramPhotoPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if (a.jdField_a_of_type_Boolean)
    {
      a.jdField_a_of_type_Boolean = false;
      a.jdField_a_of_type_AndroidViewView.setVisibility(4);
      a.b.setVisibility(4);
      if (a.jdField_a_of_type_ComTencentWidgetImmersiveSystemBarCompact != null)
      {
        if (QLog.isColorLevel()) {
          QLog.d("PEAK", 2, "PhotoPreviewActivity setStatusBar black");
        }
        a.jdField_a_of_type_ComTencentWidgetImmersiveSystemBarCompact.a(0);
        a.jdField_a_of_type_ComTencentWidgetImmersiveSystemBarCompact.b(0);
      }
      if (ImmersiveUtils.isSupporImmersive() == 1)
      {
        paramAdapterView = (RelativeLayout)a.findViewById(2131298569);
        if (paramAdapterView != null) {
          paramAdapterView.setSystemUiVisibility(4);
        }
      }
    }
    do
    {
      do
      {
        return;
        a.jdField_a_of_type_Boolean = true;
        a.jdField_a_of_type_AndroidViewView.setVisibility(0);
        a.b.setVisibility(0);
        if (a.jdField_a_of_type_ComTencentWidgetImmersiveSystemBarCompact != null)
        {
          if (QLog.isColorLevel()) {
            QLog.d("PEAK", 2, "PhotoPreviewActivity setStatusBar blue");
          }
          paramInt = a.getResources().getColor(2131428205);
          a.jdField_a_of_type_ComTencentWidgetImmersiveSystemBarCompact.a(paramInt);
          a.jdField_a_of_type_ComTencentWidgetImmersiveSystemBarCompact.b(paramInt);
        }
      } while (ImmersiveUtils.isSupporImmersive() != 1);
      paramAdapterView = (RelativeLayout)a.findViewById(2131298569);
    } while (paramAdapterView == null);
    paramAdapterView.setSystemUiVisibility(0);
  }
}
