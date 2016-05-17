import com.dataline.mpfile.MpfileTaskRecord;
import com.dataline.util.WaitEvent;
import com.tencent.mobileqq.app.proxy.MpfileTaskProxy;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class nlt
  implements Runnable
{
  public nlt(MpfileTaskProxy paramMpfileTaskProxy, MpfileTaskRecord paramMpfileTaskRecord, WaitEvent paramWaitEvent)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentMobileqqAppProxyMpfileTaskProxy.a(jdField_a_of_type_ComDatalineMpfileMpfileTaskRecord, null);
    jdField_a_of_type_ComDatalineUtilWaitEvent.a();
  }
}
