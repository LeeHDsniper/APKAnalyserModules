import com.tencent.mobileqq.activity.aio.MediaPlayerManager;
import com.tencent.mobileqq.activity.aio.MediaPlayerManager.Listener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kqo
  implements Runnable
{
  public kqo(MediaPlayerManager paramMediaPlayerManager, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (MediaPlayerManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager) != null) {
      MediaPlayerManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager).d(jdField_a_of_type_Int);
    }
  }
}
