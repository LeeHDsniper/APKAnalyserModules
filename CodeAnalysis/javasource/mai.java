import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import com.tencent.mobileqq.activity.photo.CameraPreviewActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mai
  implements DialogInterface.OnCancelListener
{
  public mai(CameraPreviewActivity paramCameraPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onCancel(DialogInterface paramDialogInterface)
  {
    a.a = null;
  }
}
