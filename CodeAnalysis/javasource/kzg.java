import android.app.Activity;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.aio.item.PttItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForPtt;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.qqfav.QfavBuilder;
import cooperation.qqfav.QfavReport;
import cooperation.qqfav.widget.QfavMicroPhoneDialog.Listener;

public class kzg
  implements QfavMicroPhoneDialog.Listener
{
  public kzg(PttItemBuilder paramPttItemBuilder, MessageForPtt paramMessageForPtt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(String paramString1, int paramInt, String paramString2)
  {
    QfavBuilder.a(paramString1, paramInt, paramString2).b(jdField_a_of_type_ComTencentMobileqqActivityAioItemPttItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataMessageForPtt).a((Activity)jdField_a_of_type_ComTencentMobileqqActivityAioItemPttItemBuilder.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioItemPttItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
    if ((!TextUtils.isEmpty(paramString2)) && (paramString2.length() > 0)) {}
    for (paramInt = 1;; paramInt = 0)
    {
      QfavReport.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemPttItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "User_AddFav", 4, 0, 6, paramInt, "", "");
      return;
    }
  }
}
