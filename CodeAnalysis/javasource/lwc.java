import android.content.Context;
import android.view.View;
import com.tencent.mobileqq.activity.messagesearch.C2CMessageResultAdapter;
import com.tencent.mobileqq.activity.messagesearch.C2CMessageSearchDialog;
import com.tencent.mobileqq.activity.messagesearch.MessageItem;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.BubbleContextMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AdapterView;
import com.tencent.widget.AdapterView.OnItemLongClickListener;

public class lwc
  implements AdapterView.OnItemLongClickListener
{
  public lwc(C2CMessageSearchDialog paramC2CMessageSearchDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean a(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.i(C2CMessageSearchDialog.jdField_a_of_type_JavaLangString, 2, "onLongClick, position = " + paramInt);
    }
    if ((a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.getCount() <= 0) || (paramInt <= 0)) {}
    do
    {
      return true;
      paramAdapterView = (MessageItem)a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.getItem(paramInt - 1);
    } while (paramAdapterView == null);
    a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageItem = paramAdapterView;
    paramView.setSelected(true);
    paramAdapterView = new QQCustomMenu();
    paramAdapterView.a(2131304469, "复制");
    paramAdapterView.a(2131298639, a.jdField_a_of_type_AndroidContentContext.getString(2131368986));
    a.jdField_a_of_type_ComTencentWidgetBubblePopupWindow = BubbleContextMenu.a(paramView, paramAdapterView, C2CMessageSearchDialog.a(a), new lwd(this, paramView));
    return true;
  }
}
