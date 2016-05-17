import android.app.Activity;
import android.view.View;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.item.MarketFaceItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.Emoticon;
import com.tencent.mobileqq.data.MessageForMarketFace;
import com.tencent.mobileqq.emoticonview.PicEmoticonInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.vaswebviewplugin.EmojiHomeUiPlugin;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class kyn
  implements ActionSheet.OnButtonClickListener
{
  public kyn(MarketFaceItemBuilder paramMarketFaceItemBuilder, PicEmoticonInfo paramPicEmoticonInfo, ActionSheet paramActionSheet, MessageForMarketFace paramMessageForMarketFace)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    boolean bool = true;
    switch (paramInt)
    {
    default: 
      return;
    case 0: 
      if (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType != 1) {
        break;
      }
    }
    for (;;)
    {
      EmojiHomeUiPlugin.openEmojiDetailPage((Activity)jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder.b, jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), 8, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId, jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getSid(), bool);
      jdField_a_of_type_ComTencentWidgetActionSheet.cancel();
      return;
      ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder.b, jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a, jdField_a_of_type_ComTencentMobileqqDataMessageForMarketFace.uniseq);
      jdField_a_of_type_ComTencentWidgetActionSheet.cancel();
      return;
      bool = false;
    }
  }
}
