import android.content.Context;
import android.os.Bundle;
import com.tencent.mobileqq.activity.contact.troop.NotificationView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.InvalidProtocolBufferMicroException;
import com.tencent.mobileqq.troop.utils.TroopBindPubAccountProtocol.FollowPublicAccountObserver;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import tencent.mobileim.structmsg.structmsg.StructMsg;

public class ltj
  extends TroopBindPubAccountProtocol.FollowPublicAccountObserver
{
  public ltj(NotificationView paramNotificationView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, Bundle paramBundle)
  {
    if ((paramBoolean) && (paramBundle != null)) {}
    while (a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog == null) {
      try
      {
        paramBundle = paramBundle.getByteArray("structMsg");
        structmsg.StructMsg localStructMsg = new structmsg.StructMsg();
        localStructMsg.mergeFrom(paramBundle);
        NotificationView.a(a, 1, localStructMsg);
        return;
      }
      catch (InvalidProtocolBufferMicroException paramBundle)
      {
        do
        {
          if (QLog.isColorLevel()) {
            QLog.e("NotificationView", 2, "structMsg merge error");
          }
        } while (a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog == null);
        a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
        QQToast.a(a.jdField_a_of_type_AndroidContentContext, a.jdField_a_of_type_AndroidContentContext.getString(2131364613), 0).b(a.a());
        return;
      }
    }
    a.jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
    QQToast.a(a.jdField_a_of_type_AndroidContentContext, a.jdField_a_of_type_AndroidContentContext.getString(2131364613), 0).b(a.a());
  }
}
