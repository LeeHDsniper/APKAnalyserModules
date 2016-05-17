import android.content.res.Resources;
import android.support.v4.app.FragmentActivity;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.FriendChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.StrangerObserver;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import tencent.im.oidb.cmd0x5d4.oidb_0x5d4.DelResult;

public class lhc
  extends StrangerObserver
{
  public lhc(FriendChatPie paramFriendChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean, PBRepeatMessageField paramPBRepeatMessageField)
  {
    if (a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isFinishing()) {}
    label325:
    label326:
    for (;;)
    {
      return;
      if (a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog != null) {
        a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
      }
      if (paramBoolean)
      {
        paramPBRepeatMessageField = paramPBRepeatMessageField.get().iterator();
        paramBoolean = false;
        if (paramPBRepeatMessageField.hasNext())
        {
          if (!String.valueOf(nextuin.get()).equalsIgnoreCase(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
            break label325;
          }
          paramBoolean = true;
        }
      }
      for (;;)
      {
        break;
        if (!paramBoolean) {
          break label326;
        }
        if (QLog.isColorLevel()) {
          QLog.d("Q.aio.BaseChatPie", 2, "StrangerObserver : onDelete , result=" + paramBoolean);
        }
        paramPBRepeatMessageField = new ArrayList();
        paramPBRepeatMessageField.add(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        ChatActivityFacade.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, BaseApplication.getContext(), paramPBRepeatMessageField);
        paramPBRepeatMessageField = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
        if (paramPBRepeatMessageField != null)
        {
          RecentUser localRecentUser = paramPBRepeatMessageField.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          if (QLog.isDevelopLevel()) {
            QLog.d("Q.aio.BaseChatPie", 4, "StrangerObserver, delete Recent user");
          }
          paramPBRepeatMessageField.b(localRecentUser);
        }
        QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, 2, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131370714), 0).a();
        if (a.m) {
          a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.setResult(-1);
        }
        a.v();
        return;
        QQToast.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131370715), 0).a();
        return;
      }
    }
  }
}
