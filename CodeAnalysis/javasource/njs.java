import com.tencent.mobileqq.app.message.DatalineMessageManager;
import com.tencent.mobileqq.data.DataLineMsgSet;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class njs
  implements Runnable
{
  public njs(DatalineMessageManager paramDatalineMessageManager, DataLineMsgSet paramDataLineMsgSet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentMobileqqAppMessageDatalineMessageManager.a(jdField_a_of_type_ComTencentMobileqqDataDataLineMsgSet);
  }
}
