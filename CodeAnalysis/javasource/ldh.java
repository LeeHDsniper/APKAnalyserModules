import android.app.Activity;
import android.app.Dialog;
import android.content.res.Resources;
import android.os.Message;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryScene;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.widget.QQToast;
import java.io.File;
import mqq.os.MqqHandler;

public class ldh
  extends MqqHandler
{
  public ldh(AIOGalleryScene paramAIOGalleryScene)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    do
    {
      do
      {
        return;
        QQToast.a(AIOGalleryScene.c(a), 2131371154, 0).a();
        return;
        String str = AIOGalleryScene.d(a).getString(2131371155);
        paramMessage = (String)obj;
        QQToast.a(AIOGalleryScene.e(a), 2, str + paramMessage, 0).a();
        ImageUtil.a(AIOGalleryScene.f(a), paramMessage);
        return;
      } while (obj == null);
      paramMessage = new File((String)obj);
    } while (!paramMessage.exists());
    paramMessage = DialogUtil.a(AIOGalleryScene.g(a), 232, AIOGalleryScene.h(a).getResources().getString(2131371178), AIOGalleryScene.i(a).getResources().getString(2131371179), 2131371180, 2131368495, new ldi(this, paramMessage), new ldj(this));
    try
    {
      paramMessage.show();
      return;
    }
    catch (Throwable paramMessage) {}
  }
}
