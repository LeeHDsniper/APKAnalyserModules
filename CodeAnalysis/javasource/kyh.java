import android.content.Context;
import android.content.Intent;
import android.support.v4.app.FragmentActivity;
import android.widget.ImageView;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.H5MagicPlayerActivity;
import com.tencent.mobileqq.activity.aio.item.MarketFaceItemBuilder;
import com.tencent.mobileqq.activity.aio.item.MarketFaceItemBuilder.Holder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.Emoticon;
import com.tencent.mobileqq.data.EmoticonPackage;
import com.tencent.mobileqq.emoticon.EmojiManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.magicface.view.MagicfaceViewController;
import com.tencent.mobileqq.model.EmoticonManager;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;
import java.io.Serializable;
import java.util.List;

class kyh
  implements Runnable
{
  kyh(kyg paramKyg, Emoticon paramEmoticon, String paramString, MarketFaceItemBuilder.Holder paramHolder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject1;
    if ((jdField_a_of_type_ComTencentMobileqqDataEmoticon != null) && (jdField_a_of_type_ComTencentMobileqqDataEmoticon.jobType == 2) && (jdField_a_of_type_Kyg.a.jdField_b_of_type_AndroidContentContext != null) && ((jdField_a_of_type_Kyg.a.jdField_b_of_type_AndroidContentContext instanceof FragmentActivity)))
    {
      localObject1 = (FragmentActivity)jdField_a_of_type_Kyg.a.jdField_b_of_type_AndroidContentContext;
      if ((((FragmentActivity)localObject1).getChatFragment() != null) && (((FragmentActivity)localObject1).getChatFragment().a() != null) && (MagicfaceViewController.a())) {
        ((FragmentActivity)localObject1).getChatFragment().a().a(jdField_a_of_type_ComTencentMobileqqDataEmoticon, 1, jdField_a_of_type_JavaLangString, false);
      }
      ReportController.b(jdField_a_of_type_Kyg.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "MbJieshou", "MbZidongBofang", 0, 0, "", "", "", "");
    }
    if ((jdField_a_of_type_ComTencentMobileqqDataEmoticon != null) && (jdField_a_of_type_ComTencentMobileqqDataEmoticon.jobType == 4) && (jdField_a_of_type_Kyg.a.jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a()))
    {
      if (!jdField_a_of_type_Kyg.a.d) {
        break label443;
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder$Holder.f.setVisibility(0);
      jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder$Holder.f.setImageResource(2130837549);
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_Kyg.a.jdField_b_of_type_JavaLangString, 2, "magicFaceIcon visible,h5source download sucess and needplay epId = " + jdField_a_of_type_ComTencentMobileqqDataEmoticon.epId);
      }
    }
    for (;;)
    {
      localObject1 = new Intent(jdField_a_of_type_Kyg.a.jdField_b_of_type_AndroidContentContext, H5MagicPlayerActivity.class);
      ((Intent)localObject1).putExtra("clickTime", System.currentTimeMillis());
      ((Intent)localObject1).putExtra("autoPlay", "1");
      ((Intent)localObject1).putExtra("senderUin", jdField_a_of_type_JavaLangString);
      ((Intent)localObject1).putExtra("selfUin", jdField_a_of_type_Kyg.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      ((Intent)localObject1).putExtra("sessionInfo", jdField_a_of_type_Kyg.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      ((Intent)localObject1).putExtra("emoticon", jdField_a_of_type_ComTencentMobileqqDataEmoticon);
      Object localObject2 = (EmoticonManager)jdField_a_of_type_Kyg.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(13);
      EmoticonPackage localEmoticonPackage = ((EmoticonManager)localObject2).a(jdField_a_of_type_ComTencentMobileqqDataEmoticon.epId);
      if (localEmoticonPackage != null)
      {
        localObject2 = ((EmoticonManager)localObject2).a(childEpId);
        if ((localObject2 != null) && (((List)localObject2).size() > 0)) {
          ((Intent)localObject1).putExtra("childEmoticon", (Serializable)((List)localObject2).get(0));
        }
      }
      jdField_a_of_type_Kyg.a.jdField_b_of_type_AndroidContentContext.startActivity((Intent)localObject1);
      return;
      label443:
      jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder$Holder.f.setVisibility(8);
    }
  }
}
