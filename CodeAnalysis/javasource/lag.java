import android.view.View;
import com.tencent.image.Utils;
import com.tencent.mobileqq.activity.aio.item.ShortVideoItemBuilder;
import com.tencent.mobileqq.activity.aio.item.ShortVideoItemBuilder.Holder;
import com.tencent.mobileqq.data.MessageForShortVideo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;
import com.tencent.widget.ProgressPieView;

public class lag
  implements ActionSheet.OnButtonClickListener
{
  public lag(ShortVideoItemBuilder paramShortVideoItemBuilder, MessageForShortVideo paramMessageForShortVideo, ShortVideoItemBuilder.Holder paramHolder, ActionSheet paramActionSheet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    switch (paramInt)
    {
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
      return;
      if (jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.uiOperatorFlag == 2)
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoItemBuilder.b(jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo, jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoItemBuilder$Holder);
        jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoItemBuilder$Holder.a.setImageResource(2130842435);
      }
      else if (jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.uiOperatorFlag == 1)
      {
        if ((jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.md5 == null) && (jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.videoFileStatus == 1005))
        {
          jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoItemBuilder$Holder, true);
          Utils.executeAsyncTaskOnSerialExcuter(new lai(jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoItemBuilder.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo), new Void[0]);
        }
        else
        {
          jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoItemBuilder.a(jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo, jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoItemBuilder$Holder);
          jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoItemBuilder$Holder.a.setImageResource(2130842435);
        }
      }
    }
  }
}
