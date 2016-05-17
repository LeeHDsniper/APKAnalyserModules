import android.graphics.Bitmap;
import android.graphics.BitmapFactory.Options;
import com.tencent.mobileqq.activity.ProfileActivity.AllInOne;
import com.tencent.mobileqq.activity.pendant.AvatarPendantActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.BitmapManager;
import com.tencent.mobileqq.util.ProfileCardUtil;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

public class lxa
  implements Runnable
{
  public lxa(AvatarPendantActivity paramAvatarPendantActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    localObject1 = null;
    localObject2 = null;
    if (ProfileCardUtil.a()) {}
    for (;;)
    {
      try
      {
        localObject2 = ProfileCardUtil.b();
        Object localObject3 = new File((String)localObject2);
        BitmapFactory.Options localOptions = new BitmapFactory.Options();
        localObject3 = new FileInputStream((File)localObject3);
        inSampleSize = ((int)ImageUtil.a((InputStream)localObject3, 120, 120));
        ((InputStream)localObject3).close();
        localObject2 = BitmapManager.a((String)localObject2, localOptions);
        localObject1 = localObject2;
        localObject2 = localObject1;
        if (localObject1 != null) {}
        localObject1 = localObject2;
      }
      catch (Exception localException1)
      {
        try
        {
          localObject2 = a.app.a(localObject1, localObject1.getWidth(), localObject1.getHeight());
          localObject1 = localObject2;
          localObject2 = localObject1;
          if (localObject1 == null) {
            localObject2 = a.app.a(a.a.a, true);
          }
          if (localObject2 != null) {
            a.runOnUiThread(new lxb(this, (Bitmap)localObject2));
          }
          return;
        }
        catch (Exception localException2)
        {
          for (;;)
          {
            localObject2 = localObject1;
          }
        }
        localException1 = localException1;
        localObject2 = localObject1;
      }
      if (QLog.isColorLevel())
      {
        QLog.d("AvatarPendantActivity", 2, localException1.toString());
        localObject1 = localObject2;
      }
    }
  }
}
