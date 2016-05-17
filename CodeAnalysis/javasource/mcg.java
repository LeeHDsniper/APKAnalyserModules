import android.os.Handler;
import com.tencent.mobileqq.activity.qqcard.QQCardActivity;
import com.tencent.mobileqq.activity.qqcard.QQCardFolder;
import com.tencent.mobileqq.activity.qqcard.QQCardManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mcg
  implements Runnable
{
  public mcg(QQCardActivity paramQQCardActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    a.jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder = a.jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a(100);
    if (a.jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder != null) {
      a.jdField_a_of_type_JavaUtilList = a.jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a(a.jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder.folderId);
    }
    a.jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(2);
  }
}
