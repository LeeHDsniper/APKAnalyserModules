import android.app.Activity;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;

public final class lds
  implements DialogInterface.OnClickListener
{
  public lds(Activity paramActivity, File paramFile1, File paramFile2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    AIOGalleryUtils.a(jdField_a_of_type_AndroidAppActivity, jdField_a_of_type_JavaIoFile, b);
  }
}
