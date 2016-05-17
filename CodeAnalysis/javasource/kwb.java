import android.support.v4.util.MQLruCache;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.aio.item.FlashPicItemBuilder.FlashPicAIOThumbView;
import com.tencent.mobileqq.app.HotChatHelper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.net.URL;

public class kwb
  implements Runnable
{
  public kwb(FlashPicItemBuilder.FlashPicAIOThumbView paramFlashPicAIOThumbView, URLDrawable paramURLDrawable)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    try
    {
      synchronized (BaseApplicationImpl.a)
      {
        String str = HotChatHelper.b(jdField_a_of_type_ComTencentImageURLDrawable.getURL().toString());
        BaseApplicationImpl.a.put(str, jdField_a_of_type_ComTencentImageURLDrawable);
        return;
      }
      return;
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.hotchat", 2, "cache flashpic abumb exception:" + localException);
      }
    }
  }
}
