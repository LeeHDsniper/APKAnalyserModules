import android.graphics.drawable.BitmapDrawable;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.CustomizeStrategyFactory.OnCustomizeListener;
import com.tencent.mobileqq.activity.aio.CustomizeStrategyFactory.RedPacketInfo;
import com.tencent.mobileqq.activity.aio.item.QQWalletMsgItemBuilder;
import com.tencent.mobileqq.data.MessageForQQWalletMsg;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kzl
  implements CustomizeStrategyFactory.OnCustomizeListener
{
  public kzl(QQWalletMsgItemBuilder paramQQWalletMsgItemBuilder, RelativeLayout paramRelativeLayout, MessageForQQWalletMsg paramMessageForQQWalletMsg, TextView paramTextView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, CustomizeStrategyFactory.RedPacketInfo paramRedPacketInfo)
  {
    if (paramRedPacketInfo == null) {}
    while (a == null) {
      return;
    }
    jdField_a_of_type_AndroidWidgetRelativeLayout.setBackgroundDrawable(new BitmapDrawable(jdField_a_of_type_AndroidWidgetRelativeLayout.getResources(), a));
    if ((jdField_a_of_type_ComTencentMobileqqDataMessageForQQWalletMsg.messageType == 4) || (jdField_a_of_type_ComTencentMobileqqDataMessageForQQWalletMsg.messageType == 5) || (jdField_a_of_type_ComTencentMobileqqDataMessageForQQWalletMsg.messageType == 2001)) {
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    }
    jdField_a_of_type_ComTencentMobileqqDataMessageForQQWalletMsg.background = a;
  }
}
