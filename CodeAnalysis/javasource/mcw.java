import android.os.Bundle;
import com.tencent.mobileqq.activity.qwallet.PreloadImgManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.mqsafeedit.BaseApplication;
import com.tencent.mobileqq.vip.DownloadTask;
import java.util.List;

class mcw
  implements Runnable
{
  mcw(mcv paramMcv, DownloadTask paramDownloadTask)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int j = jdField_a_of_type_ComTencentMobileqqVipDownloadTask.a.size();
    Bundle localBundle = jdField_a_of_type_ComTencentMobileqqVipDownloadTask.a();
    int i = 0;
    while (i < j)
    {
      String str = (String)jdField_a_of_type_ComTencentMobileqqVipDownloadTask.a.get(i);
      PreloadImgManager.a(jdField_a_of_type_Mcv.a, BaseApplication.getContext(), localBundle.getString(str), str);
      i += 1;
    }
  }
}
