import android.os.MessageQueue.IdleHandler;
import com.tencent.mobileqq.activity.photo.SendPhotoActivity;
import com.tencent.mobileqq.activity.photo.SendPhotoActivity.sendPhotoTask;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.Logger;

public class mbx
  implements MessageQueue.IdleHandler
{
  public mbx(SendPhotoActivity paramSendPhotoActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean queueIdle()
  {
    Logger.a(SendPhotoActivity.jdField_a_of_type_JavaLangString, "queueIdle", "start");
    a.jdField_a_of_type_ComTencentMobileqqActivityPhotoSendPhotoActivity$sendPhotoTask = new SendPhotoActivity.sendPhotoTask(a, null);
    ThreadManager.a(a.jdField_a_of_type_ComTencentMobileqqActivityPhotoSendPhotoActivity$sendPhotoTask, 8, null, false);
    return false;
  }
}
