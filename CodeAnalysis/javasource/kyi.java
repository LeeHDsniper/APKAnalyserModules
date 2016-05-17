import android.widget.ImageView;
import com.tencent.mobileqq.activity.aio.item.MarketFaceItemBuilder;
import com.tencent.mobileqq.activity.aio.item.MarketFaceItemBuilder.Holder;
import com.tencent.mobileqq.data.Emoticon;
import com.tencent.mobileqq.emoticon.EmojiManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

class kyi
  implements Runnable
{
  kyi(kyg paramKyg, MarketFaceItemBuilder.Holder paramHolder, Emoticon paramEmoticon)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder$Holder != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder$Holder.f != null))
    {
      if ((!jdField_a_of_type_Kyg.a.d) || (!jdField_a_of_type_Kyg.a.a.b())) {
        break label115;
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder$Holder.f.setVisibility(0);
      jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder$Holder.f.setImageResource(2130837549);
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_Kyg.a.b, 2, "magicFaceIcon visible,h5source download sucess and doesnot needplay epId = " + jdField_a_of_type_ComTencentMobileqqDataEmoticon.epId);
      }
    }
    return;
    label115:
    jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder$Holder.f.setVisibility(8);
  }
}
