import android.app.Dialog;
import android.view.View;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.rebuild.HotChatPie;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.HotChatHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class lhj
  implements ActionSheet.OnButtonClickListener
{
  public lhj(HotChatPie paramHotChatPie, ActionSheet paramActionSheet, ChatMessage paramChatMessage, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
    switch (paramInt)
    {
    }
    do
    {
      return;
      jdField_a_of_type_ComTencentMobileqqActivityAioRebuildHotChatPie.a(jdField_a_of_type_ComTencentMobileqqDataChatMessage.senderuin, jdField_a_of_type_JavaLangString, false, 1);
      return;
      if (QLog.isColorLevel()) {
        QLog.i("Q.aio.TroopChatPie", 2, "del hot chat member onClick, uin=" + jdField_a_of_type_ComTencentMobileqqDataChatMessage.senderuin);
      }
      if (!NetworkUtil.e(BaseApplication.getContext()))
      {
        QQToast.a(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildHotChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityAioRebuildHotChatPie.a().getString(2131368714), 0).b(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildHotChatPie.a().getTitleBarHeight());
        return;
      }
    } while ((HotChatHandler)jdField_a_of_type_ComTencentMobileqqActivityAioRebuildHotChatPie.a.a(35) == null);
    paramView = new Dialog(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildHotChatPie.a(), 2131558942);
    paramView.setContentView(2130903227);
    TextView localTextView = (TextView)paramView.findViewById(2131296741);
    if (localTextView != null)
    {
      localTextView.requestFocus();
      localTextView.setText("删除成员后，该成员将无法再加入你的热聊房间，确认删除吗？");
    }
    localTextView = (TextView)paramView.findViewById(2131297739);
    if (localTextView != null)
    {
      localTextView.setText(2131366996);
      localTextView.setOnClickListener(new lhk(this, paramView));
    }
    localTextView = (TextView)paramView.findViewById(2131297740);
    if (localTextView != null)
    {
      localTextView.setText("确定");
      localTextView.setOnClickListener(new lhl(this, paramView));
    }
    paramView.show();
  }
}
