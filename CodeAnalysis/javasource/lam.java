import android.view.View;
import com.tencent.mobileqq.activity.aio.item.ShortVideoPTVItemBuilder;
import com.tencent.mobileqq.activity.aio.item.ShortVideoPTVItemBuilder.Holder;
import com.tencent.mobileqq.data.MessageForShortVideo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class lam
  implements ActionSheet.OnButtonClickListener
{
  public lam(ShortVideoPTVItemBuilder paramShortVideoPTVItemBuilder, MessageForShortVideo paramMessageForShortVideo, ShortVideoPTVItemBuilder.Holder paramHolder, ActionSheet paramActionSheet)
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
      if (jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.uiOperatorFlag == 2) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoPTVItemBuilder.b(jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo, jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoPTVItemBuilder$Holder);
      } else {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoPTVItemBuilder.a(jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo, jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoPTVItemBuilder$Holder);
      }
    }
  }
}
