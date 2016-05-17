import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.TroopGiftMsgItemBuilder;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForTroopGift;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.utils.TroopGiftManager;
import com.tencent.mobileqq.troop.utils.TroopGiftUtil;
import com.tencent.mobileqq.utils.Base64Util;

public class lcf
  implements View.OnClickListener
{
  private MessageForTroopGift jdField_a_of_type_ComTencentMobileqqDataMessageForTroopGift;
  private lcg jdField_a_of_type_Lcg;
  
  public lcf(TroopGiftMsgItemBuilder paramTroopGiftMsgItemBuilder, MessageForTroopGift paramMessageForTroopGift, lcg paramLcg)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqDataMessageForTroopGift = paramMessageForTroopGift;
    jdField_a_of_type_Lcg = paramLcg;
  }
  
  public void onClick(View paramView)
  {
    Object localObject;
    int i;
    if (paramView.getId() == 2131304242)
    {
      paramView = (TroopGiftManager)jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(112);
      if ((paramView != null) && (h == 1))
      {
        jdField_a_of_type_ComTencentMobileqqDataMessageForTroopGift.isLoading = false;
        paramView.a(jdField_a_of_type_Lcg);
        paramView.a(jdField_a_of_type_ComTencentMobileqqDataMessageForTroopGift);
        if (!jdField_a_of_type_ComTencentMobileqqDataMessageForTroopGift.isLoading) {
          paramView.b(jdField_a_of_type_Lcg);
        }
        if (paramView.a() == null)
        {
          localObject = ((FragmentActivity)jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_AndroidContentContext).getChatFragment();
          if ((localObject != null) && ((((ChatFragment)localObject).a() instanceof TroopChatPie))) {
            paramView.a((TroopChatPie)((ChatFragment)localObject).a());
          }
        }
        paramView.d();
        if (!jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.f().equals(jdField_a_of_type_ComTencentMobileqqDataMessageForTroopGift.senderuin)) {
          break label233;
        }
        i = 0;
      }
    }
    for (;;)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_flower", "", "grp_aio", "Clk_play", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, i + "", jdField_a_of_type_ComTencentMobileqqDataMessageForTroopGift.giftPicId + "", "");
      return;
      label233:
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.f().equals(jdField_a_of_type_ComTencentMobileqqDataMessageForTroopGift.receiverUin + ""))
      {
        i = 1;
        continue;
        if (paramView.getId() == 2131304237)
        {
          paramView = new Intent(jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_AndroidContentContext, QQBrowserActivity.class);
          localObject = "http://qun.qq.com/qunpay/gifts/index.html?troopUin=" + jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a + "&uin=" + jdField_a_of_type_ComTencentMobileqqDataMessageForTroopGift.receiverUin + "&name=" + Base64Util.encodeToString(jdField_a_of_type_ComTencentMobileqqDataMessageForTroopGift.subtitle.getBytes(), 2) + "&from=obj&_wv=1031&_bid=2204";
          paramView.putExtra("url", (String)localObject);
          paramView.putExtra("key_isReadModeEnabled", true);
          if (jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.f().equals(jdField_a_of_type_ComTencentMobileqqDataMessageForTroopGift.senderuin)) {
            i = 0;
          }
        }
        for (;;)
        {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_flower", "", "grp_aio", "Clk_obj", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, i + "", jdField_a_of_type_ComTencentMobileqqDataMessageForTroopGift.giftPicId + "", "");
          PublicAccountUtil.a(jdField_a_of_type_ComTencentMobileqqDataMessageForTroopGift, paramView, (String)localObject);
          jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_AndroidContentContext.startActivity(paramView);
          return;
          if (jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.f().equals(Long.valueOf(jdField_a_of_type_ComTencentMobileqqDataMessageForTroopGift.receiverUin)))
          {
            i = 1;
            continue;
            if (paramView.getId() != 2131304243) {
              break;
            }
            ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_flower", "", "grp_aio", "Clk_objtail", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "", "", "");
            TroopGiftUtil.a((Activity)jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "gift obj", jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
            return;
          }
          i = 2;
        }
      }
      else
      {
        i = 2;
      }
    }
  }
}
