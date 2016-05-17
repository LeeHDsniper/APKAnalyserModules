import android.os.Handler;
import android.os.Message;
import android.view.ViewGroup;
import android.widget.RelativeLayout.LayoutParams;
import com.tencent.image.URLImageView;
import com.tencent.mobileqq.activity.photo.PhotoCropForPortraitActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ExtensionInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.vas.AvatarPendantManager;
import com.tencent.mobileqq.vas.PendantInfo;

public class maw
  extends Handler
{
  public maw(PhotoCropForPortraitActivity paramPhotoCropForPortraitActivity, int paramInt1, int paramInt2, ExtensionInfo paramExtensionInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    if (-1 != what) {
      return;
    }
    paramMessage = new RelativeLayout.LayoutParams((int)(jdField_a_of_type_Int * 1.257D), (int)(b * 1.481D));
    paramMessage.addRule(14);
    topMargin = ((int)(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropForPortraitActivity.jdField_a_of_type_AndroidViewViewGroup.getHeight() * 0.5F - b * 0.5F * 1.705D));
    jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropForPortraitActivity.jdField_a_of_type_AndroidViewViewGroup.addView(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropForPortraitActivity.jdField_a_of_type_ComTencentImageURLImageView, paramMessage);
    ((AvatarPendantManager)jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropForPortraitActivity.app.getManager(45)).a(jdField_a_of_type_ComTencentMobileqqDataExtensionInfo.pendantId).a(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropForPortraitActivity.jdField_a_of_type_ComTencentImageURLImageView, 6, PendantInfo.k);
    jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropForPortraitActivity.jdField_a_of_type_ComTencentImageURLImageView.setVisibility(0);
  }
}
