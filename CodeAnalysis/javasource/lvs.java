import android.os.Message;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.messagesearch.C2CMessageResultAdapter;
import com.tencent.mobileqq.activity.messagesearch.MessageItem;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.ChatHistorySearchData;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.MqqWeakReferenceHandler;
import java.util.HashMap;
import java.util.List;

public class lvs
  implements Runnable
{
  public lvs(C2CMessageResultAdapter paramC2CMessageResultAdapter, String paramString, long paramLong, List paramList)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int j = 0;
    Object localObject = jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_JavaLangString);
    int i;
    MessageRecord localMessageRecord;
    if ((localObject != null) && (mSearchData1 != null) && (!mSearchData1.isEmpty()))
    {
      i = 0;
      while (i < mSearchData1.size())
      {
        localMessageRecord = (MessageRecord)mSearchData1.get(i);
        if (jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.a(localMessageRecord)) {
          jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.b.add(new MessageItem(jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMessageRecord));
        }
        i += 1;
      }
    }
    if ((localObject != null) && (mSearchData2 != null) && (!mSearchData2.isEmpty()))
    {
      localObject = jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, mSearchData2);
      if ((localObject != null) && (mSearchData1 != null))
      {
        i = j;
        while (i < mSearchData1.size())
        {
          localMessageRecord = (MessageRecord)mSearchData1.get(i);
          if (jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.a(localMessageRecord)) {
            jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.b.add(new MessageItem(jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMessageRecord));
          }
          i += 1;
        }
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("C2CMessageResultAdapter", 2, "localCacheMsgs size: " + jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.b.size());
    }
    localObject = new HashMap();
    ((HashMap)localObject).put("keyword", jdField_a_of_type_JavaLangString);
    ((HashMap)localObject).put("sequence", Long.valueOf(jdField_a_of_type_Long));
    ((HashMap)localObject).put("data", jdField_a_of_type_JavaUtilList);
    jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.obtainMessage(6, localObject).sendToTarget();
  }
}
