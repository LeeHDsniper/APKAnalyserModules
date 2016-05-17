import android.app.Activity;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.aio.photo.AIOImageListScene;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class ldx
  implements DialogInterface.OnClickListener
{
  ldx(ldw paramLdw)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface.dismiss();
    AIOImageListScene.i(a.a).setResult(8001);
  }
}
