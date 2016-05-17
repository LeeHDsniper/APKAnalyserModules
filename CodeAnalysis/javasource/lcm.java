import android.view.View;
import com.tencent.av.utils.VideoActionSheet;
import com.tencent.av.utils.VideoMsgTools;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.VideoItemBuilder;
import com.tencent.mobileqq.data.MessageForVideo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class lcm
  implements ActionSheet.OnButtonClickListener
{
  public lcm(VideoItemBuilder paramVideoItemBuilder, VideoActionSheet paramVideoActionSheet, MessageForVideo paramMessageForVideo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    jdField_a_of_type_ComTencentAvUtilsVideoActionSheet.dismiss();
    switch (paramInt)
    {
    default: 
      return;
    case 0: 
      VideoItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder, true, jdField_a_of_type_ComTencentMobileqqDataMessageForVideo);
      return;
    }
    VideoMsgTools.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
    ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005DC7", "0X8005DC7", 0, 0, "", "", "", "");
  }
}
