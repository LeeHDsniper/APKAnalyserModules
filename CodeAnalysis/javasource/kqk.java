import com.tencent.mobileqq.activity.aio.MediaPlayerManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kqk
  implements Runnable
{
  public kqk(MediaPlayerManager paramMediaPlayerManager, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (MediaPlayerManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager, jdField_a_of_type_Boolean)) {
      jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager.c();
    }
  }
}
