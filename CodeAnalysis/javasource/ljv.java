import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.PublicAccountHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.soso.SosoInterface.OnLocationListener;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoLbsInfo;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoLocation;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class ljv
  extends SosoInterface.OnLocationListener
{
  public ljv(PublicAccountChatPie paramPublicAccountChatPie, int paramInt, boolean paramBoolean1, boolean paramBoolean2, long paramLong, boolean paramBoolean3, boolean paramBoolean4, String paramString)
  {
    super(paramInt, paramBoolean1, paramBoolean2, paramLong, paramBoolean3, paramBoolean4, paramString);
    paramBoolean1 = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, SosoInterface.SosoLbsInfo paramSosoLbsInfo)
  {
    double d3 = 0.0D;
    String str;
    if ((paramSosoLbsInfo != null) && (a != null) && (a.jdField_b_of_type_JavaLangString != null))
    {
      str = a.jdField_b_of_type_JavaLangString;
      if ((paramSosoLbsInfo == null) || (a == null)) {
        break label206;
      }
    }
    label206:
    for (double d1 = a.a;; d1 = 0.0D)
    {
      double d2 = d3;
      if (paramSosoLbsInfo != null)
      {
        d2 = d3;
        if (a != null) {
          d2 = a.jdField_b_of_type_Double;
        }
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.aio.BaseChatPie", 2, "onLocationUpdate() latitude=" + d1 + " longitude=" + d2 + ", address=" + str);
      }
      if (a.jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler == null) {
        a.jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler = ((PublicAccountHandler)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(11));
      }
      if (a.jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler != null) {
        a.jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, d1, d2, str);
      }
      return;
      str = "";
      break;
    }
  }
}
