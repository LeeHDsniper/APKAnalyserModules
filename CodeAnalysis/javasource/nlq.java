import com.dataline.mpfile.MpfileTaskRecord;
import com.dataline.util.WaitEvent;
import com.tencent.mobileqq.app.proxy.MpfileTaskProxy;
import com.tencent.mobileqq.app.proxy.ProxyListener;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;

public class nlq
  implements Runnable
{
  public nlq(MpfileTaskProxy paramMpfileTaskProxy, Entity paramEntity, ProxyListener paramProxyListener, WaitEvent paramWaitEvent)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    MpfileTaskRecord localMpfileTaskRecord = ((MpfileTaskRecord)jdField_a_of_type_ComTencentMobileqqPersistenceEntity).clone();
    jdField_a_of_type_ComTencentMobileqqAppProxyMpfileTaskProxy.a.a(String.valueOf(0), 0, MpfileTaskRecord.tableName(), localMpfileTaskRecord, 0, jdField_a_of_type_ComTencentMobileqqAppProxyProxyListener);
    jdField_a_of_type_ComDatalineUtilWaitEvent.a();
  }
}
