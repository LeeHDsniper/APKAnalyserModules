import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.ClipboardManager;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.LinearLayout;
import com.tencent.mobileqq.activity.ForwardRecentActivity;
import com.tencent.mobileqq.activity.messagesearch.C2CMessageResultAdapter;
import com.tencent.mobileqq.activity.messagesearch.C2CMessageSearchDialog;
import com.tencent.mobileqq.activity.messagesearch.MessageItem;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.VipUtils;
import com.tencent.qphone.base.util.QLog;

public class lvy
  implements View.OnClickListener
{
  public lvy(C2CMessageSearchDialog paramC2CMessageSearchDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    int i = paramView.getId();
    if (QLog.isColorLevel()) {
      QLog.i(C2CMessageSearchDialog.jdField_a_of_type_JavaLangString, 2, "onClick, id = " + i);
    }
    switch (i)
    {
    default: 
    case 2131304469: 
    case 2131298639: 
      do
      {
        do
        {
          return;
        } while (a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageItem == null);
        ((ClipboardManager)a.jdField_a_of_type_AndroidContentContext.getSystemService("clipboard")).setText(a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageItem.a.msg);
        return;
      } while (a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageItem == null);
      paramView = new Bundle();
      paramView.putInt("forward_type", -1);
      paramView.putString("forward_text", a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageItem.a.msg);
      Intent localIntent = new Intent(a.jdField_a_of_type_AndroidContentContext, ForwardRecentActivity.class);
      localIntent.putExtras(paramView);
      ((Activity)a.jdField_a_of_type_AndroidContentContext).startActivityForResult(localIntent, 21);
      return;
    case 2131298385: 
      ((InputMethodManager)a.jdField_a_of_type_AndroidContentContext.getSystemService("input_method")).hideSoftInputFromWindow(a.jdField_a_of_type_AndroidWidgetEditText.getWindowToken(), 0);
      a.a();
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.i(C2CMessageSearchDialog.jdField_a_of_type_JavaLangString, 2, "OnClickListener, setMessageItems");
    }
    a.c = false;
    C2CMessageSearchDialog.a(a).setVisibility(8);
    C2CMessageSearchDialog.a(a, 0, null);
    a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.a(C2CMessageSearchDialog.a(a), a.b, a.jdField_a_of_type_Long);
    a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.notifyDataSetChanged();
    a.t = 1;
    VipUtils.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "chat_history", "ChatSearch", "Clk_cloudtips", 0, 0, new String[0]);
  }
}
