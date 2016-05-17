import android.os.Message;
import android.support.v4.app.FragmentActivity;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.NearbyChatPie;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.SendMessageHandler;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import mqq.os.MqqHandler;

public class lih
  extends MessageObserver
{
  public lih(NearbyChatPie paramNearbyChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(String paramString1, int paramInt1, int paramInt2, SendMessageHandler paramSendMessageHandler, long paramLong1, long paramLong2, String paramString2)
  {
    if ((paramString1 == null) || (!paramString1.equals(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) || (paramInt1 != a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int))
    {
      if (QLog.isColorLevel()) {
        QLog.d(a.ae, 2, "onUpdateSendMsgError exception uin " + paramString1 + " type " + paramInt1 + " uniseq " + paramLong2);
      }
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d(a.ae, 2, "onUpdateSendMsgError uin " + paramString1 + " type " + paramInt1 + " uniseq " + paramLong2 + " errorCode " + paramInt2);
    }
    if (paramInt1 == 1009) {
      switch (paramInt2)
      {
      }
    }
    for (;;)
    {
      a.a(196608);
      return;
      QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367341), 0).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
    }
  }
  
  protected void a(boolean paramBoolean, String paramString)
  {
    if ((paramString == null) || (paramString.length() == 0)) {}
    do
    {
      do
      {
        return;
      } while (!paramString.equals(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
      a.p = true;
      a.a(131072);
    } while (!NearbyChatPie.a(a));
    paramString = new Message();
    what = 41;
    obj = a.ah;
    NearbyChatPie.a(a).removeMessages(41);
    NearbyChatPie.b(a).sendMessage(paramString);
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
