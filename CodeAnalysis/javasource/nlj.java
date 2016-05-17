import com.dataline.util.WaitEvent;
import com.tencent.mobileqq.app.proxy.DataLineMsgProxy;
import com.tencent.mobileqq.data.DataLineMsgRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class nlj
  implements Runnable
{
  public nlj(DataLineMsgProxy paramDataLineMsgProxy, DataLineMsgRecord paramDataLineMsgRecord, WaitEvent paramWaitEvent)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    DataLineMsgProxy.a(jdField_a_of_type_ComTencentMobileqqAppProxyDataLineMsgProxy, jdField_a_of_type_ComTencentMobileqqDataDataLineMsgRecord);
    jdField_a_of_type_ComDatalineUtilWaitEvent.a();
  }
}
