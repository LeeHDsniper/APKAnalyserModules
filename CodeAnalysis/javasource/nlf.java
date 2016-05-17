import com.dataline.util.WaitEvent;
import com.tencent.mobileqq.app.proxy.DataLineMsgProxy;
import com.tencent.mobileqq.app.proxy.ProxyListener;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.data.DataLineMsgRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;

public class nlf
  implements Runnable
{
  public nlf(DataLineMsgProxy paramDataLineMsgProxy, Entity paramEntity, ProxyListener paramProxyListener, WaitEvent paramWaitEvent)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    DataLineMsgRecord localDataLineMsgRecord = ((DataLineMsgRecord)jdField_a_of_type_ComTencentMobileqqPersistenceEntity).clone();
    jdField_a_of_type_ComTencentMobileqqAppProxyDataLineMsgProxy.jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(String.valueOf(0), 0, jdField_a_of_type_ComTencentMobileqqAppProxyDataLineMsgProxy.jdField_a_of_type_JavaLangString, localDataLineMsgRecord, 0, jdField_a_of_type_ComTencentMobileqqAppProxyProxyListener);
    jdField_a_of_type_ComDatalineUtilWaitEvent.a();
  }
}
