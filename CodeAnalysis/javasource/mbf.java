import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.photo.PhotoListActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mbf
  implements DialogInterface.OnClickListener
{
  public mbf(PhotoListActivity paramPhotoListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface.dismiss();
    a.setResult(8001);
  }
}
