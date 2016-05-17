import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import com.tencent.mobileqq.activity.aio.photo.AIOImageListScene;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ldy
  implements DialogInterface.OnDismissListener
{
  public ldy(AIOImageListScene paramAIOImageListScene)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    AIOImageListScene.a(a, null);
  }
}
