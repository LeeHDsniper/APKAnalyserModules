import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.MsfServiceSdk;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.qphone.base.remote.ToServiceMsg;

public class reu
  implements Runnable
{
  public reu(StatisticCollector paramStatisticCollector, ToServiceMsg paramToServiceMsg)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    MsfServiceSdk.get().sendMsg(jdField_a_of_type_ComTencentQphoneBaseRemoteToServiceMsg);
  }
}
