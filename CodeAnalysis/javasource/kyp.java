import android.content.Context;
import android.content.res.Resources;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.ProgressBar;
import com.tencent.common.config.AppSetting;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLImageView;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.MediaPlayerManager;
import com.tencent.mobileqq.activity.aio.item.MarketFaceItemBuilder;
import com.tencent.mobileqq.activity.aio.item.MarketFaceItemBuilder.Holder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.Emoticon;
import com.tencent.mobileqq.data.MessageForMarketFace;
import com.tencent.mobileqq.emoticon.EmojiManager;
import com.tencent.mobileqq.emoticonview.PicEmoticonInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.magicface.drawable.PngFrameUtil;
import com.tencent.mobileqq.magicface.view.MagicfaceViewController;
import com.tencent.mobileqq.msf.sdk.SettingCloneUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;

public class kyp
  extends URLImageView
{
  public kyp(MarketFaceItemBuilder paramMarketFaceItemBuilder, Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onLoadFialed(URLDrawable paramURLDrawable, Throwable paramThrowable)
  {
    super.onLoadFialed(paramURLDrawable, paramThrowable);
    paramThrowable = (MarketFaceItemBuilder.Holder)AIOUtils.a(this);
    jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(8);
    MessageForMarketFace localMessageForMarketFace = (MessageForMarketFace)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
    a.a(paramThrowable, paramURLDrawable);
    if (AppSetting.i) {
      jdField_a_of_type_AndroidWidgetFrameLayout.setContentDescription("表情下载失败");
    }
  }
  
  public void onLoadSuccessed(URLDrawable paramURLDrawable)
  {
    MarketFaceItemBuilder.Holder localHolder = (MarketFaceItemBuilder.Holder)AIOUtils.a(this);
    if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo != null) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.m != 3))
    {
      int j = paramURLDrawable.getIntrinsicWidth();
      int i = paramURLDrawable.getIntrinsicHeight();
      j = (j * a.r + (a.q >> 1)) / a.q;
      i = (i * a.r + (a.q >> 1)) / a.q;
      super.setImageDrawable(null);
      super.setLayoutParams(new FrameLayout.LayoutParams(j, i));
      super.setImageDrawable(paramURLDrawable);
      MessageForMarketFace localMessageForMarketFace = (MessageForMarketFace)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
      i = NetworkUtil.a(a.b);
      boolean bool = SettingCloneUtil.readValue(a.b, null, a.b.getString(2131367548), "qqsetting_auto_receive_magic_face_key", true);
      if (((i != 1) && (i != 3) && (i != 4)) || (2 != jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType) || (a.jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.f(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId)) || (!MagicfaceViewController.a()) || (((i == 3) || (i == 4)) && (!bool)))
      {
        float f = a.jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId);
        if ((f < 0.0F) || (1.0F == f)) {
          jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(8);
        }
      }
      a.a(localHolder, paramURLDrawable);
      if ((2 == jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType) && (a.jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.f(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId)))
      {
        if (PngFrameUtil.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.magicValue) != 1) {
          break label497;
        }
        f.setVisibility(8);
      }
      label367:
      if ((MarketFaceItemBuilder.jdField_a_of_type_Long != 0L) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo != null) && (MarketFaceItemBuilder.jdField_a_of_type_Long == jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a()))
      {
        if (!a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d()) {
          break label519;
        }
        QQToast.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 2131367775, 0).b(a.b.getResources().getDimensionPixelSize(2131492908));
      }
    }
    for (;;)
    {
      if (AppSetting.i) {
        jdField_a_of_type_AndroidWidgetFrameLayout.setContentDescription("");
      }
      return;
      super.setImageDrawable(null);
      super.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
      break;
      label497:
      f.setImageResource(2130837549);
      f.setVisibility(0);
      break label367;
      label519:
      MediaPlayerManager.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(jdField_a_of_type_ComTencentMobileqqDataChatMessage);
    }
  }
}
