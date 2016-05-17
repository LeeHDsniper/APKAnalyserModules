import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.ChatItemBuilder;
import com.tencent.mobileqq.activity.aio.item.ReplyTextItemBuilder;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForReplyText;
import com.tencent.mobileqq.data.MessageForReplyText.SourceMsgInfo;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.JumpAction;
import com.tencent.mobileqq.utils.JumpParser;
import com.tencent.mobileqq.utils.httputils.PkgTools;
import com.tencent.qphone.base.util.QLog;

public class kzs
  implements View.OnClickListener
{
  public kzs(ReplyTextItemBuilder paramReplyTextItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (ReplyTextItemBuilder.a(a)) {}
    Object localObject;
    do
    {
      do
      {
        do
        {
          return;
          localObject = AIOUtils.a(paramView);
          if ((localObject instanceof MessageForReplyText)) {
            break;
          }
        } while (!QLog.isColorLevel());
        QLog.w(ChatItemBuilder.a, 2, "TextItemBuilder onClickListener: AIOUtils.getMessage(v) is not MessageForReplyText");
        return;
        localObject = (MessageForReplyText)localObject;
        if (msgtype == 64533)
        {
          AIOUtils.l = true;
          String str = PkgTools.c(action);
          paramView = JumpParser.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramView.getContext(), str);
          if (paramView != null) {
            paramView.b();
          }
        }
      } while (!(a.jdField_a_of_type_AndroidContentContext instanceof FragmentActivity));
      if (QLog.isColorLevel()) {
        QLog.w(ChatItemBuilder.a, 2, "TextItemBuilder onClickListener: isReplyMsg = true");
      }
      paramView = ((FragmentActivity)a.jdField_a_of_type_AndroidContentContext).getChatFragment().a();
    } while (!(paramView instanceof TroopChatPie));
    ((TroopChatPie)paramView).a(11, mSourceMsgInfo.mSourceMsgSeq, (int)(shmsgseq - mSourceMsgInfo.mSourceMsgSeq), (MessageRecord)localObject);
    MessageForReplyText.reportReplyMsg(null, "replyMsg_bubble", "clk_original", frienduin, (ChatMessage)localObject);
  }
}
