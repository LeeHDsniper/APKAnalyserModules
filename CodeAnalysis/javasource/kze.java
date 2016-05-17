import android.os.IBinder;
import android.support.v4.app.FragmentActivity;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.PicItemBuilder;
import com.tencent.mobileqq.activity.aio.photo.AIOImageData;
import com.tencent.mobileqq.activity.aio.photo.AIORichMediaData;
import com.tencent.mobileqq.activity.aio.photo.IAIOImageProviderCallBack;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.utils.TroopBarUtils;
import com.tencent.mobileqq.troop.utils.TroopTopicMgr;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;

public class kze
  implements IAIOImageProviderCallBack
{
  public kze(PicItemBuilder paramPicItemBuilder, AIOImageData paramAIOImageData, MessageForPic paramMessageForPic)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(long paramLong1, int paramInt1, int paramInt2, int paramInt3, long paramLong2, boolean paramBoolean) {}
  
  public void a(long paramLong, int paramInt1, int paramInt2, int paramInt3, String paramString, boolean paramBoolean)
  {
    if ((paramLong == jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageData.e) && (paramInt1 == jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageData.i) && (1 == paramInt3))
    {
      if (QLog.isColorLevel()) {
        QLog.i("zivonchen", 2, "downloadImage id = " + paramLong + ", subId = " + paramInt1 + ", type = " + paramInt2 + ", result = " + paramInt3 + ", resultStr = " + paramString + ", isPart = " + paramBoolean);
      }
      TroopTopicMgr localTroopTopicMgr = (TroopTopicMgr)jdField_a_of_type_ComTencentMobileqqActivityAioItemPicItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(97);
      if ((localTroopTopicMgr != null) && ((jdField_a_of_type_ComTencentMobileqqActivityAioItemPicItemBuilder.jdField_a_of_type_AndroidContentContext instanceof FragmentActivity)))
      {
        TroopBarUtils.a.clear();
        localTroopTopicMgr.a(((FragmentActivity)jdField_a_of_type_ComTencentMobileqqActivityAioItemPicItemBuilder.jdField_a_of_type_AndroidContentContext).getChatFragment().a(), jdField_a_of_type_ComTencentMobileqqActivityAioItemPicItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, jdField_a_of_type_ComTencentMobileqqDataMessageForPic, paramString);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemPicItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_talk", "", "Grp_plus", "Clk_app", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioItemPicItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "", "", "");
        if (QLog.isColorLevel()) {
          QLog.d("IAIOImageProviderCallBack", 2, "image has new downloaded!");
        }
      }
    }
  }
  
  public void a(AIORichMediaData[] paramArrayOfAIORichMediaData, int paramInt) {}
  
  public IBinder asBinder()
  {
    return null;
  }
}
