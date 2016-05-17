import com.tencent.mobileqq.app.BizTroopHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.lbs.LbsInfoMgr;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class niv
  implements Runnable
{
  public niv(LbsInfoMgr paramLbsInfoMgr)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    a.jdField_a_of_type_Long = System.currentTimeMillis();
    long l = System.currentTimeMillis();
    LbsInfoMgr.a(a).a(a.jdField_a_of_type_ComTencentMobileqqAppBizTroopObserver, true);
    LbsInfoMgr.a(a).a();
    if (QLog.isColorLevel()) {
      QLog.i("LbsInfoMgr", 2, "上报操作完成，耗时: " + (System.currentTimeMillis() - l));
    }
    if (QLog.isColorLevel()) {
      QLog.i("LbsInfoMgr", 2, "reportLbsInfoToServer: time = " + a.jdField_a_of_type_Long);
    }
  }
}
