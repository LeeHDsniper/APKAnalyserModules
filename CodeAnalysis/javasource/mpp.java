import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPreviewActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mpp
  implements DialogInterface.OnClickListener
{
  public mpp(ShortVideoPreviewActivity paramShortVideoPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    Object localObject = ShortVideoPreviewActivity.a(a);
    paramDialogInterface = ((Intent)localObject).getStringExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME");
    localObject = ((Intent)localObject).getStringExtra("PhotoConst.INIT_ACTIVITY_PACKAGE_NAME");
    Intent localIntent = new Intent();
    localIntent.setClassName((String)localObject, paramDialogInterface);
    localIntent.addFlags(603979776);
    localIntent.putExtra("file_send_path", a.d);
    localIntent.putExtra("file_send_size", a.a);
    localIntent.putExtra("file_send_duration", a.b);
    localIntent.putExtra("file_source", a.c);
    a.startActivity(localIntent);
    ShortVideoPreviewActivity.a(a);
    localObject = new Intent("key_video_select_confirm_ok_click");
    ((Intent)localObject).putExtra("className", paramDialogInterface);
    a.sendBroadcast((Intent)localObject);
  }
}
