import android.view.View;
import android.widget.ProgressBar;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.item.StructingMsgItemBuilder;
import com.tencent.mobileqq.app.TroopQZoneUploadAlbumHandler.Callback;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.structmsg.StructMsgForGeneralShare;

public class lbg
  implements TroopQZoneUploadAlbumHandler.Callback
{
  public lbg(StructingMsgItemBuilder paramStructingMsgItemBuilder, MessageForStructing paramMessageForStructing, BaseChatItemLayout paramBaseChatItemLayout)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(View paramView, long paramLong, int paramInt1, int paramInt2)
  {
    if (jdField_a_of_type_ComTencentMobileqqDataMessageForStructing.uniseq != paramLong) {}
    do
    {
      return;
      paramView = (StructMsgForGeneralShare)jdField_a_of_type_ComTencentMobileqqDataMessageForStructing.structingMsg;
      if (paramInt1 != 1001) {
        paramInt2 = 100;
      }
      paramView.setProgress(paramInt2);
      paramView = jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.findViewById(2131296360);
    } while (!(paramView instanceof ProgressBar));
    ((ProgressBar)paramView).setProgress(paramInt2);
    if (paramInt2 == 100) {}
    for (paramInt1 = 8;; paramInt1 = 0)
    {
      paramView.setVisibility(paramInt1);
      return;
    }
  }
}
