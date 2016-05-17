import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.item.VideoVipItemBuilder;
import com.tencent.mobileqq.data.MessageForVideoVip;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class lcq
  implements View.OnClickListener
{
  public lcq(VideoVipItemBuilder paramVideoVipItemBuilder, MessageForVideoVip paramMessageForVideoVip, MessageRecord paramMessageRecord)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoVipItemBuilder.a(jdField_a_of_type_ComTencentMobileqqDataMessageForVideoVip.url);
    if (jdField_a_of_type_ComTencentMobileqqDataMessageRecord.istroop == 0)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoVipItemBuilder.a, "CliOper", "", "", "0X80063FF", "0X80063FF", 0, 0, "", "", "", "");
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoVipItemBuilder.a, "CliOper", "", "", "0X80063EF", "0X80063EF", 14, 0, "", "", "", "");
    }
    while (jdField_a_of_type_ComTencentMobileqqDataMessageRecord.istroop != 3000) {
      return;
    }
    ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoVipItemBuilder.a, "CliOper", "", "", "0X8006400", "0X8006400", 0, 0, "", "", "", "");
    ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoVipItemBuilder.a, "CliOper", "", "", "0X80063EF", "0X80063EF", 13, 0, "", "", "", "");
  }
}
