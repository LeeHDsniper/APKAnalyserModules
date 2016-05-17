import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import com.tencent.mobileqq.activity.photo.CameraPreviewActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class maj
  implements DialogInterface.OnDismissListener
{
  public maj(CameraPreviewActivity paramCameraPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    a.a = null;
  }
}
