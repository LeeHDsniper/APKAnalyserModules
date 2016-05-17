import com.tencent.mobileqq.activity.aio.item.MarketFaceItemBuilder;
import com.tencent.mobileqq.activity.aio.item.MarketFaceItemBuilder.Holder;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.magicface.drawable.PngFrameManager.IMagicCallback;
import com.tencent.qphone.base.util.QLog;

public class kyf
  implements PngFrameManager.IMagicCallback
{
  public kyf(MarketFaceItemBuilder paramMarketFaceItemBuilder, ChatMessage paramChatMessage, MarketFaceItemBuilder.Holder paramHolder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(MarketFaceItemBuilder.Holder paramHolder)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder.b, 2, "func downloadVideoDetails, 【callback】 try to download video details.");
    }
    MarketFaceItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder, paramHolder);
  }
  
  public void a(boolean paramBoolean)
  {
    if (paramBoolean) {
      MarketFaceItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder, jdField_a_of_type_ComTencentMobileqqDataChatMessage, jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder$Holder);
    }
  }
}
