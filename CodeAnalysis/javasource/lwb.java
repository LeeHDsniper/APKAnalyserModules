import android.view.View;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.messagesearch.C2CMessageResultAdapter;
import com.tencent.mobileqq.activity.messagesearch.C2CMessageSearchDialog;
import com.tencent.mobileqq.activity.messagesearch.MessageItem;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AdapterView;
import com.tencent.widget.AdapterView.OnItemClickListener;
import java.util.Set;

public class lwb
  implements AdapterView.OnItemClickListener
{
  public lwb(C2CMessageSearchDialog paramC2CMessageSearchDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.i(C2CMessageSearchDialog.jdField_a_of_type_JavaLangString, 2, "onItemClick, position = " + paramInt);
    }
    if ((a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.getCount() <= 0) || (paramInt <= 0)) {}
    do
    {
      return;
      paramAdapterView = (MessageItem)a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.getItem(paramInt - 1);
    } while (paramAdapterView == null);
    a.jdField_a_of_type_ComTencentMobileqqDataMessageRecord = jdField_a_of_type_ComTencentMobileqqDataMessageRecord;
    a.j = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqDataMessageRecord);
    if (QLog.isColorLevel()) {
      QLog.i(C2CMessageSearchDialog.jdField_a_of_type_JavaLangString, 2, "onItemClick, mRecordCount = " + a.j + ",needSearchInCloud:" + a.b);
    }
    boolean bool1;
    boolean bool2;
    if (a.b)
    {
      bool1 = C2CMessageSearchDialog.a(a).contains(Long.valueOf(a.jdField_a_of_type_ComTencentMobileqqDataMessageRecord.shmsgseq));
      bool2 = a.jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.a.contains(Long.valueOf(a.jdField_a_of_type_ComTencentMobileqqDataMessageRecord.shmsgseq));
      if ((!bool1) || (!bool2)) {
        break label302;
      }
      ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005FC5", "0X8005FC5", 0, 0, "", "", "", "");
    }
    for (;;)
    {
      a.a(true);
      a.dismiss();
      return;
      label302:
      if (bool1) {
        ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005FC4", "0X8005FC4", 0, 0, "", "", "", "");
      } else if (bool2) {
        ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005FC3", "0X8005FC3", 0, 0, "", "", "", "");
      }
    }
  }
}
