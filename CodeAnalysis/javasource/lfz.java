import android.support.v4.app.FragmentActivity;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.BusinessCmrTmpChatPie;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.SendMessageHandler;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;

public class lfz
  extends MessageObserver
{
  public lfz(BusinessCmrTmpChatPie paramBusinessCmrTmpChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(String paramString1, int paramInt1, int paramInt2, SendMessageHandler paramSendMessageHandler, long paramLong1, long paramLong2, String paramString2)
  {
    if ((paramString1 == null) || (!paramString1.equals(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) || (paramInt1 != a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int))
    {
      if (QLog.isColorLevel()) {
        QLog.d("BusinessChatPie", 2, "onUpdateSendMsgError exception uin " + paramString1 + " type " + paramInt1 + " uniseq " + paramLong2);
      }
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("BusinessChatPie", 2, "onUpdateSendMsgError uin " + paramString1 + " type " + paramInt1 + " uniseq " + paramLong2);
    }
    if ((QLog.isColorLevel()) && (paramInt1 == 1024)) {
      QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, "errorCode" + paramInt2, 0).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
    }
    a.a(196608);
  }
  
  protected void a(boolean paramBoolean, String paramString)
  {
    if ((paramString == null) || (paramString.length() == 0)) {}
    while (!paramString.equals(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
      return;
    }
    a.p = true;
    a.a(131072);
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2, String paramString)
  {
    if (paramBoolean1) {
      a.E();
    }
  }
  
  protected void b(boolean paramBoolean, String paramString)
  {
    if ((paramString != null) && (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString != null) && (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(paramString)))
    {
      ChatActivityUtils.b();
      if (paramBoolean) {
        a.h();
      }
    }
  }
  
  protected void c(boolean paramBoolean, String paramString)
  {
    if ((paramString != null) && (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString != null) && (a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(paramString)))
    {
      ChatActivityUtils.b();
      if (paramBoolean) {
        a.h();
      }
    }
  }
  
  protected void d(boolean paramBoolean, String paramString)
  {
    a.a(65536);
  }
}
