import android.content.Context;
import android.view.View;
import com.tencent.mobileqq.activity.messagesearch.MessageItem;
import com.tencent.mobileqq.activity.messagesearch.MessageResultAdapter;
import com.tencent.mobileqq.activity.messagesearch.MessageSearchDialog;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.BubbleContextMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AdapterView;
import com.tencent.widget.AdapterView.OnItemLongClickListener;
import com.tencent.widget.XListView;

public class lwl
  implements AdapterView.OnItemLongClickListener
{
  public lwl(MessageSearchDialog paramMessageSearchDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean a(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.i(MessageSearchDialog.jdField_a_of_type_JavaLangString, 2, "onLongClick, position = " + paramInt);
    }
    paramAdapterView = a.jdField_a_of_type_ComTencentWidgetXListView.a();
    if (paramAdapterView == a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageResultAdapter)
    {
      a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageItem = ((MessageItem)a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageResultAdapter.getItem(paramInt));
      paramView.setSelected(true);
      paramAdapterView = new QQCustomMenu();
      paramAdapterView.a(2131304469, "复制");
      paramAdapterView.a(2131298639, a.jdField_a_of_type_AndroidContentContext.getString(2131368986));
      a.jdField_a_of_type_ComTencentWidgetBubblePopupWindow = BubbleContextMenu.a(paramView, paramAdapterView, MessageSearchDialog.a(a), new lwm(this, paramView));
    }
    while (paramAdapterView != a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchSearchHistoryAdapter) {
      return true;
    }
    return true;
  }
}
