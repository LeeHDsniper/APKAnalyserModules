import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.item.FlashPicItemBuilder;
import com.tencent.mobileqq.activity.aio.item.FlashPicItemBuilder.FlashPicHolder;
import com.tencent.mobileqq.app.HotChatHelper;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kvz
  implements View.OnClickListener
{
  public kvz(FlashPicItemBuilder paramFlashPicItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = (FlashPicItemBuilder.FlashPicHolder)AIOUtils.a(paramView);
    MessageForPic localMessageForPic;
    if (paramView != null)
    {
      localMessageForPic = (MessageForPic)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
      if (!HotChatHelper.b(localMessageForPic))
      {
        if ((jdField_a_of_type_ComTencentImageURLDrawable.getStatus() != 0) || (jdField_a_of_type_ComTencentImageURLDrawable.isDownloadStarted())) {
          break label55;
        }
        jdField_a_of_type_ComTencentImageURLDrawable.startDownload();
      }
    }
    return;
    label55:
    FlashPicItemBuilder.a(a, localMessageForPic);
  }
}
