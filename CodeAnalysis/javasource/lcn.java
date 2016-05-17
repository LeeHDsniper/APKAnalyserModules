import android.app.Activity;
import android.view.View;
import com.tencent.av.utils.PstnUtils;
import com.tencent.av.utils.VideoActionSheet;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.VideoItemBuilder;
import com.tencent.mobileqq.data.MessageForVideo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class lcn
  implements ActionSheet.OnButtonClickListener
{
  public lcn(VideoItemBuilder paramVideoItemBuilder, VideoActionSheet paramVideoActionSheet, MessageForVideo paramMessageForVideo, int paramInt)
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
      VideoItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder, true, jdField_a_of_type_ComTencentMobileqqDataMessageForVideo);
      return;
      if (jdField_a_of_type_Int == 0)
      {
        VideoItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder, true, jdField_a_of_type_ComTencentMobileqqDataMessageForVideo);
        return;
      }
      if ((jdField_a_of_type_Int == 3) || (jdField_a_of_type_Int == 4))
      {
        ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (Activity)jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true, true, true, null, null, 1, 0);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8006407", "0X8006407", 3, 0, "", "", "", "");
        return;
      }
    } while (jdField_a_of_type_Int != 5);
    PstnUtils.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_AndroidContentContext, 2, 9);
  }
}
