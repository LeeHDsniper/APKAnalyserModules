import android.content.Context;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.messagesearch.HistoryItem;
import com.tencent.mobileqq.activity.messagesearch.MessageItem;
import com.tencent.mobileqq.activity.messagesearch.MessageResultAdapter;
import com.tencent.mobileqq.activity.messagesearch.MessageSearchDialog;
import com.tencent.mobileqq.activity.messagesearch.SearchHistoryAdapter;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AdapterView;
import com.tencent.widget.AdapterView.OnItemClickListener;
import com.tencent.widget.XListView;

public class lwk
  implements AdapterView.OnItemClickListener
{
  public lwk(MessageSearchDialog paramMessageSearchDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.i(MessageSearchDialog.jdField_a_of_type_JavaLangString, 2, "onItemClick, position = " + paramInt);
    }
    paramAdapterView = a.jdField_a_of_type_ComTencentWidgetXListView.a();
    if (paramAdapterView == a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageResultAdapter)
    {
      paramAdapterView = (MessageItem)a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageResultAdapter.getItem(paramInt);
      a.jdField_a_of_type_ComTencentMobileqqDataMessageRecord = jdField_a_of_type_ComTencentMobileqqDataMessageRecord;
      a.j = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqDataMessageRecord);
      if (QLog.isColorLevel()) {
        QLog.i(MessageSearchDialog.jdField_a_of_type_JavaLangString, 2, "onItemClick, mRecordCount = " + a.j);
      }
      a.a(true);
      a.dismiss();
    }
    do
    {
      return;
      if (paramAdapterView == a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchSearchHistoryAdapter)
      {
        paramAdapterView = (HistoryItem)a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchSearchHistoryAdapter.getItem(paramInt);
        a.b = false;
        a.jdField_a_of_type_AndroidWidgetEditText.setText(jdField_a_of_type_JavaLangString);
        a.jdField_a_of_type_AndroidWidgetEditText.setSelection(jdField_a_of_type_JavaLangString.length());
        a.jdField_a_of_type_AndroidWidgetEditText.requestFocus();
        ((InputMethodManager)a.jdField_a_of_type_AndroidWidgetEditText.getContext().getSystemService("input_method")).toggleSoftInput(0, 2);
        return;
      }
    } while (!QLog.isColorLevel());
    QLog.i(MessageSearchDialog.jdField_a_of_type_JavaLangString, 2, "onItemClick, unknown data type");
  }
}
