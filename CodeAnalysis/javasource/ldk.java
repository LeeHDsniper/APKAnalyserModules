import android.os.Handler;
import android.os.Looper;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryScene;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ActionSheet;
import java.io.File;

public class ldk
  implements Runnable
{
  public ldk(AIOGalleryScene paramAIOGalleryScene, File paramFile, ActionSheet paramActionSheet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.g != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.g.equals(jdField_a_of_type_JavaIoFile.getPath())) && (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.a(jdField_a_of_type_JavaIoFile).booleanValue())) {
      new Handler(Looper.getMainLooper()).post(new ldl(this));
    }
  }
}
