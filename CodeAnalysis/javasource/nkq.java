import com.tencent.mobileqq.app.message.SubAccountMessageProcessor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.servlet.QzoneSubAccountUnreadServlet.GetSubAccountUnreadListener;
import com.tencent.mobileqq.servlet.QzoneSubAccountUnreadServlet.GetSubAccountUnreadResponse;
import com.tencent.qphone.base.util.QLog;
import cooperation.qzone.util.QZoneLogTags;

public class nkq
  implements QzoneSubAccountUnreadServlet.GetSubAccountUnreadListener
{
  public nkq(SubAccountMessageProcessor paramSubAccountMessageProcessor)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(QzoneSubAccountUnreadServlet.GetSubAccountUnreadResponse paramGetSubAccountUnreadResponse)
  {
    if (paramGetSubAccountUnreadResponse != null) {
      a.a(paramGetSubAccountUnreadResponse, "2005060620050606", jdField_a_of_type_Long, jdField_a_of_type_JavaLangString, b);
    }
    while (!QLog.isColorLevel()) {
      return;
    }
    QLog.d(QZoneLogTags.j, 2, "cgetSubAccountQZoneMsg failed");
  }
}
