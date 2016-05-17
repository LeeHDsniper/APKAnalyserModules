import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.text.SpannableStringBuilder;
import android.text.method.LinkMovementMethod;
import android.text.style.ForegroundColorSpan;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.CustomizeStrategyFactory.OnCustomizeListener;
import com.tencent.mobileqq.activity.aio.CustomizeStrategyFactory.RedPacketInfo;
import com.tencent.mobileqq.activity.aio.item.QQWalletMsgItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForQQWalletMsg;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class kzk
  implements CustomizeStrategyFactory.OnCustomizeListener
{
  public kzk(QQWalletMsgItemBuilder paramQQWalletMsgItemBuilder, TextView paramTextView1, TextView paramTextView2, TextView paramTextView3, ImageView paramImageView, MessageForQQWalletMsg paramMessageForQQWalletMsg, TextView paramTextView4, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, CustomizeStrategyFactory.RedPacketInfo paramRedPacketInfo)
  {
    if (paramRedPacketInfo == null) {}
    while (b == null) {
      return;
    }
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    b.setVisibility(8);
    c.setVisibility(8);
    jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable(new BitmapDrawable(jdField_a_of_type_AndroidWidgetImageView.getResources(), b));
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_a_of_type_ComTencentMobileqqDataMessageForQQWalletMsg.customizeBg = b;
    QQAppInterface localQQAppInterface;
    if (!jdField_a_of_type_ComTencentMobileqqDataMessageForQQWalletMsg.isSend())
    {
      paramRedPacketInfo = new SpannableStringBuilder("QQ红包个性版");
      paramRedPacketInfo.setSpan(new ForegroundColorSpan(Color.parseColor("#FFFFFF")), 0, 4, 34);
      paramRedPacketInfo.setSpan(new ForegroundColorSpan(Color.parseColor("#D13D4B")), 4, paramRedPacketInfo.length(), 34);
      d.setText(paramRedPacketInfo);
      d.setMovementMethod(LinkMovementMethod.getInstance());
      d.setLayoutParams(QQWalletMsgItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemQQWalletMsgItemBuilder));
      d.setVisibility(0);
      d.setOnClickListener(QQWalletMsgItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemQQWalletMsgItemBuilder));
      localQQAppInterface = jdField_a_of_type_ComTencentMobileqqActivityAioItemQQWalletMsgItemBuilder.a;
      if (!jdField_a_of_type_Boolean) {
        break label280;
      }
    }
    label280:
    for (paramRedPacketInfo = "1";; paramRedPacketInfo = "0")
    {
      ReportController.b(localQQAppInterface, "CliOper", "", "", "0X8006133", "0X8006133", 0, 0, paramRedPacketInfo, "1", "", "");
      return;
      d.setTextColor(Color.parseColor("#00A5E0"));
      d.setText("查看领取详情");
      d.setLayoutParams(QQWalletMsgItemBuilder.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemQQWalletMsgItemBuilder));
      break;
    }
  }
}
