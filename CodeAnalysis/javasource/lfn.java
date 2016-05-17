import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.BusinessCmrTmpChatPie;
import com.tencent.mobileqq.app.EnterpriseQQHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.soso.SosoInterface.OnLocationListener;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoLbsInfo;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoLocation;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class lfn
  extends SosoInterface.OnLocationListener
{
  public lfn(BusinessCmrTmpChatPie paramBusinessCmrTmpChatPie, int paramInt, boolean paramBoolean1, boolean paramBoolean2, long paramLong, boolean paramBoolean3, boolean paramBoolean4, String paramString)
  {
    super(paramInt, paramBoolean1, paramBoolean2, paramLong, paramBoolean3, paramBoolean4, paramString);
    paramBoolean1 = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, SosoInterface.SosoLbsInfo paramSosoLbsInfo)
  {
    if (QLog.isColorLevel()) {
      QLog.d("BusinessChatPie", 2, "onLocationFinish(): BEGIN errCode=" + paramInt);
    }
    if ((paramInt == 0) && (paramSosoLbsInfo != null) && (a != null)) {
      if (a.jdField_b_of_type_JavaLangString == null) {
        break label169;
      }
    }
    label169:
    for (String str = a.jdField_b_of_type_JavaLangString;; str = "")
    {
      if (QLog.isColorLevel()) {
        QLog.d("BusinessChatPie", 2, "onLocationFinish() latitude=" + a.a + ", longitude=" + a.a + ", address=" + str);
      }
      ((EnterpriseQQHandler)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(21)).a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, a.a, a.jdField_b_of_type_Double, str);
      return;
    }
  }
}
