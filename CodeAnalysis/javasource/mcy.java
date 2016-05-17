import android.graphics.Bitmap;
import com.tencent.common.app.AppInterface;
import com.tencent.mobileqq.activity.qwallet.PreloadImgManager;
import com.tencent.mobileqq.activity.qwallet.PreloadImgManager.OnSingleDownloadCallback;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.vip.DownloadListener;
import com.tencent.mobileqq.vip.DownloadTask;
import java.io.File;
import java.util.List;
import java.util.Map;
import mqq.app.MobileQQ;

public class mcy
  extends DownloadListener
{
  public mcy(PreloadImgManager paramPreloadImgManager, File paramFile, AppInterface paramAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onDone(DownloadTask paramDownloadTask)
  {
    super.onDone(paramDownloadTask);
    List localList = (List)PreloadImgManager.a(jdField_a_of_type_ComTencentMobileqqActivityQwalletPreloadImgManager).get(c);
    int j;
    if ((localList != null) && (!localList.isEmpty()))
    {
      j = localList.size();
      if (!jdField_a_of_type_JavaIoFile.exists()) {
        break label171;
      }
      localObject = jdField_a_of_type_ComTencentMobileqqActivityQwalletPreloadImgManager;
      jdField_a_of_type_ComTencentCommonAppAppInterface.getApplication();
    }
    label171:
    for (Object localObject = PreloadImgManager.a((PreloadImgManager)localObject, MobileQQ.getContext(), jdField_a_of_type_JavaIoFile.getPath(), c);; localObject = null)
    {
      int i = 0;
      if (i < j)
      {
        PreloadImgManager.OnSingleDownloadCallback localOnSingleDownloadCallback = (PreloadImgManager.OnSingleDownloadCallback)localList.get(i);
        if (localOnSingleDownloadCallback == null) {}
        for (;;)
        {
          i += 1;
          break;
          if (localObject != null) {
            localOnSingleDownloadCallback.a((Bitmap)localObject);
          } else {
            localOnSingleDownloadCallback.a();
          }
        }
      }
      PreloadImgManager.a(jdField_a_of_type_ComTencentMobileqqActivityQwalletPreloadImgManager).remove(c);
      return;
    }
  }
}
