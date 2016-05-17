import android.view.View;
import com.tencent.av.app.PstnSessionInfo;
import com.tencent.av.utils.PstnUtils;
import com.tencent.av.utils.VideoActionSheet;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.item.VideoItemBuilder;
import com.tencent.mobileqq.data.MessageForVideo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class lco
  implements ActionSheet.OnButtonClickListener
{
  public lco(VideoItemBuilder paramVideoItemBuilder, VideoActionSheet paramVideoActionSheet, MessageForVideo paramMessageForVideo, int paramInt, PstnSessionInfo paramPstnSessionInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    jdField_a_of_type_ComTencentAvUtilsVideoActionSheet.dismiss();
    switch (paramInt)
    {
    }
    do
    {
      return;
      VideoItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder, false, jdField_a_of_type_ComTencentMobileqqDataMessageForVideo);
      if (jdField_a_of_type_ComTencentMobileqqDataMessageForVideo.isVideo)
      {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005642", "0X8005642", 0, 0, "", "", "", "");
        return;
      }
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005243", "0X8005243", 0, 0, "", "", "", "");
      return;
      if (jdField_a_of_type_Int == 0)
      {
        VideoItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder, false, jdField_a_of_type_ComTencentMobileqqDataMessageForVideo);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005243", "0X8005243", 0, 0, "", "", "", "");
        return;
      }
      if ((jdField_a_of_type_Int == 1) || (jdField_a_of_type_Int == 2))
      {
        ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentAvAppPstnSessionInfo, 0);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8006406", "0X8006406", 6, 0, "", "", "", "");
        return;
      }
    } while (jdField_a_of_type_Int != 5);
    PstnUtils.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_AndroidContentContext, 1, 3);
  }
}
