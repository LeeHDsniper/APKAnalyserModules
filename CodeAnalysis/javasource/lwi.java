import com.tencent.mobileqq.activity.messagesearch.MessageSearchDialog;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView;
import com.tencent.widget.AbsListView.OnScrollListener;
import com.tencent.widget.XListView;

public class lwi
  implements AbsListView.OnScrollListener
{
  int jdField_a_of_type_Int;
  int b;
  
  public lwi(MessageSearchDialog paramMessageSearchDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 0;
    b = 0;
  }
  
  public void a(AbsListView paramAbsListView, int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageSearchDialog.jdField_a_of_type_ComTencentWidgetXListView.a() == jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageSearchDialog.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchSearchHistoryAdapter) {}
    do
    {
      return;
      if (QLog.isColorLevel()) {
        QLog.i(MessageSearchDialog.jdField_a_of_type_JavaLangString, 2, "onScrollStateChanged, scrollState = " + paramInt + ", lastItem = " + jdField_a_of_type_Int + ", totalItemCount = " + b);
      }
    } while ((b == 0) || (jdField_a_of_type_Int != b) || (paramInt != 0));
    if (QLog.isColorLevel()) {
      QLog.i(MessageSearchDialog.jdField_a_of_type_JavaLangString, 2, "onScrollStateChanged, reach bottom, lastItem = " + jdField_a_of_type_Int + ", totalItemCount = " + b);
    }
    MessageSearchDialog.a(jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageSearchDialog);
  }
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    jdField_a_of_type_Int = (paramInt1 + paramInt2);
    b = paramInt3;
  }
}
