import android.support.v4.app.FragmentActivity;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.StrangerChatPie;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.SendMessageHandler;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;

public class lkp
  extends MessageObserver
{
  public lkp(StrangerChatPie paramStrangerChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(String paramString1, int paramInt1, int paramInt2, SendMessageHandler paramSendMessageHandler, long paramLong1, long paramLong2, String paramString2)
  {
    if ((paramString1 == null) || (!paramString1.equals(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) || (paramInt1 != a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int))
    {
      if (QLog.isColorLevel()) {
        QLog.d("StrangerChatPie", 2, "onUpdateSendMsgError exception uin " + paramString1 + " type " + paramInt1 + " uniseq " + paramLong2);
      }
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("StrangerChatPie", 2, "onUpdateSendMsgError uin " + paramString1 + " type " + paramInt1 + " uniseq " + paramLong2 + " errorCode " + paramInt2);
    }
    if (paramInt1 == 1005) {
      switch (paramInt2)
      {
      default: 
        QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367340), 0).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
      }
    }
    for (;;)
    {
      a.a(196608);
      return;
      QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367339), 0).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
      continue;
      if (paramInt1 == 1004) {
        switch (paramInt2)
        {
        default: 
          break;
        case 102: 
        case 103: 
        case 104: 
          paramString1 = String.format(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367342), new Object[] { a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d });
          QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, paramString1, 0).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
          break;
        }
      } else if (paramInt1 == 1000) {
        switch (paramInt2)
        {
        default: 
          break;
        case 102: 
        case 103: 
        case 104: 
          paramString1 = String.format(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367343), new Object[] { a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d });
          QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, paramString1, 0).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
          break;
        }
      } else if (paramInt1 == 1020) {
        switch (paramInt2)
        {
        default: 
          break;
        case 40: 
        case 102: 
        case 103: 
        case 104: 
          paramString1 = (HotChatManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59);
          paramString1 = String.format(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131363911), new Object[] { a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d });
          QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, paramString1, 0).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
          break;
        }
      } else if (paramInt1 == 1006) {
        switch (paramInt2)
        {
        default: 
          break;
        case 1600: 
          QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367407), 0).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
          break;
        case 1601: 
          QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367407), 0).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
          break;
        case 1602: 
          QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367408), 0).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
          break;
        }
      } else if (paramInt1 == 1022) {
        switch (paramInt2)
        {
        default: 
          break;
        case 16: 
          ChatActivityFacade.d(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
          break;
        }
      } else if (paramInt1 == 1023) {
        QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, "errorCode" + paramInt2, 0).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
      } else if (paramInt1 == 1025) {
        switch (paramInt2)
        {
        default: 
          QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, "errorCode" + paramInt2, 0).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
          break;
        case 55: 
          QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, "已屏蔽的临时会话", 0).b(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
        }
      }
    }
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
