import android.view.View;
import com.tencent.mobileqq.activity.photo.PhotoCropAction;
import com.tencent.mobileqq.activity.photo.PhotoCropActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class mas
  implements ActionSheet.OnButtonClickListener
{
  public mas(PhotoCropAction paramPhotoCropAction, ActionSheet paramActionSheet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    if (paramInt != jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropAction.jdField_a_of_type_ArrayOfJavaLangString.length)
    {
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropAction.a(paramInt);
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropAction.jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.a();
    }
    jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
  }
}
