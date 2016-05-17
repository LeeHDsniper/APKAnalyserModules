import android.content.SharedPreferences;
import com.tencent.mobileqq.activity.photo.PhotoListActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class may
  implements Runnable
{
  public may(PhotoListActivity paramPhotoListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if ((a.v) && (a.b()))
    {
      boolean bool = a.a.getBoolean("qzone_will_upload_to_qun_album" + a.r, false);
      a.runOnUiThread(new maz(this, bool));
    }
  }
}
