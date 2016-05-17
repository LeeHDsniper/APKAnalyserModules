import android.app.Activity;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import com.tencent.mobileqq.activity.aio.item.StructingMsgItemBuilder;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class lbc
  implements View.OnClickListener
{
  public lbc(StructingMsgItemBuilder paramStructingMsgItemBuilder, ImageView paramImageView, ChatMessage paramChatMessage, String paramString, long paramLong)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    StructingMsgItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder, (Activity)jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_AndroidWidgetImageView, jdField_a_of_type_ComTencentMobileqqDataChatMessage);
    ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", jdField_a_of_type_JavaLangString, "0X800631E", "0X800631E", 0, 0, "" + jdField_a_of_type_Long, "", "", "");
  }
}
