import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.ClipboardManager;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.messagesearch.MessageItem;
import com.tencent.mobileqq.activity.messagesearch.MessageSearchDialog;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class lwh
  implements View.OnClickListener
{
  public lwh(MessageSearchDialog paramMessageSearchDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    int i = paramView.getId();
    if (QLog.isColorLevel()) {
      QLog.i(MessageSearchDialog.jdField_a_of_type_JavaLangString, 2, "onClick, id = " + i);
    }
    Object localObject = a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageItem;
    if (a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageItem == null) {
      return;
    }
    switch (i)
    {
    default: 
      return;
    case 2131298639: 
      paramView = new Bundle();
      paramView.putInt("forward_type", -1);
      paramView.putString("forward_text", a.msg);
      localObject = new Intent();
      ((Intent)localObject).putExtras(paramView);
      ForwardBaseOption.a((Activity)a.jdField_a_of_type_AndroidContentContext, (Intent)localObject, 21);
      return;
    }
    ((ClipboardManager)a.jdField_a_of_type_AndroidContentContext.getSystemService("clipboard")).setText(a.msg);
  }
}
