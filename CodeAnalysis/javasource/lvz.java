import android.content.Context;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.mobileqq.activity.messagesearch.C2CMessageResultAdapter;
import com.tencent.mobileqq.activity.messagesearch.C2CMessageSearchDialog;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.VipUtils;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView;
import com.tencent.widget.AbsListView.OnScrollListener;

public class lvz
  implements AbsListView.OnScrollListener
{
  int jdField_a_of_type_Int;
  int b;
  int c;
  
  public lvz(C2CMessageSearchDialog paramC2CMessageSearchDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 0;
    b = 0;
    c = 0;
  }
  
  public void a(AbsListView paramAbsListView, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.i(C2CMessageSearchDialog.jdField_a_of_type_JavaLangString, 2, "onScrollStateChanged, reach bottom, scrollState " + paramInt + " firstVisibleItem: " + c + ", lastItem:" + jdField_a_of_type_Int + ", totalItemCount = " + b + ", mIsComplete: " + jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.d + ", requesting:" + jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_c_of_type_Boolean + ", mSearchMode: " + jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.t + ", mCurrentKeyword: " + jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_b_of_type_JavaLangString);
    }
    if (b == 0) {}
    do
    {
      do
      {
        return;
      } while ((jdField_a_of_type_Int != b) || (paramInt != 0));
      if ((c != 0) && (!jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_c_of_type_Boolean))
      {
        jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_c_of_type_Boolean = true;
        if (jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.t == 0)
        {
          if (QLog.isColorLevel()) {
            QLog.i(C2CMessageSearchDialog.jdField_a_of_type_JavaLangString, 2, "onScrollStateChanged searchRoamMessageLocal >>>>> isComplete: " + jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.d);
          }
          jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.a(jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_a_of_type_Long, jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_b_of_type_JavaLangString, 2);
          jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_c_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_a_of_type_AndroidContentContext.getString(2131367848));
          jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_b_of_type_AndroidViewView.setVisibility(0);
          jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_c_of_type_AndroidWidgetLinearLayout.findViewById(2131302377).setVisibility(0);
          jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_c_of_type_AndroidWidgetLinearLayout.setVisibility(0);
          return;
        }
        if (QLog.isColorLevel()) {
          QLog.i(C2CMessageSearchDialog.jdField_a_of_type_JavaLangString, 2, "onScrollStateChanged searchRoamMessageInCloud >>>>> isComplete: " + jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.d);
        }
        if (jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.d)
        {
          jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_c_of_type_AndroidWidgetTextView.setText("已展示全部搜索结果");
          jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_c_of_type_AndroidWidgetLinearLayout.findViewById(2131302377).setVisibility(8);
          jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_c_of_type_AndroidWidgetLinearLayout.setVisibility(0);
          jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_b_of_type_AndroidViewView.setVisibility(0);
          return;
        }
        jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_c_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_a_of_type_AndroidContentContext.getString(2131367844));
        jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_b_of_type_AndroidViewView.setVisibility(0);
        jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_c_of_type_AndroidWidgetLinearLayout.findViewById(2131302377).setVisibility(0);
        jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_c_of_type_AndroidWidgetLinearLayout.setVisibility(0);
        jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_a_of_type_Long = System.currentTimeMillis();
        jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.b(2);
        VipUtils.a(jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "chat_history", "ChatSearch", "Slip_resultup", 0, 0, new String[0]);
        return;
      }
    } while ((c != 0) || (jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_c_of_type_Boolean) || (!jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.d) || (jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.t != 1));
    jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_c_of_type_AndroidWidgetTextView.setText("已展示全部搜索结果");
    jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_c_of_type_AndroidWidgetLinearLayout.findViewById(2131302377).setVisibility(8);
    jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_c_of_type_AndroidWidgetLinearLayout.setVisibility(0);
    jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageSearchDialog.jdField_b_of_type_AndroidViewView.setVisibility(0);
  }
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    c = paramInt1;
    jdField_a_of_type_Int = (paramInt1 + paramInt2);
    b = paramInt3;
  }
}
