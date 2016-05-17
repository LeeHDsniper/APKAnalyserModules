import android.text.TextUtils;
import com.tencent.mobileqq.activity.aio.ChatItemBuilder;
import com.tencent.mobileqq.activity.aio.item.RichStatItemBuilder;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SignatureHandler;
import com.tencent.mobileqq.data.MessageForRichState;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richstatus.RichStatus;
import com.tencent.qphone.base.util.QLog;

public class kzw
  implements Runnable
{
  public kzw(RichStatItemBuilder paramRichStatItemBuilder, MessageForRichState paramMessageForRichState)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (TextUtils.isEmpty(af))
    {
      ((FriendListHandler)jdField_a_of_type_ComTencentMobileqqActivityAioItemRichStatItemBuilder.a.a(1)).a(new String[] { jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.frienduin });
      if (QLog.isColorLevel()) {
        QLog.d(ChatItemBuilder.a, 2, "sign feedid is is null reget friend sign");
      }
    }
    SignatureHandler localSignatureHandler;
    do
    {
      return;
      localSignatureHandler = (SignatureHandler)jdField_a_of_type_ComTencentMobileqqActivityAioItemRichStatItemBuilder.a.a(41);
    } while (localSignatureHandler == null);
    localSignatureHandler.a(jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.frienduin, jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.feedId);
  }
}
