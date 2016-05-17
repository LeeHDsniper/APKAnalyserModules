import com.tencent.mobileqq.activity.ChatActivityFacade.HongbaoParams;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.UncommonMessageProcessor;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;

public class nko
  implements Runnable
{
  public nko(QQMessageFacade paramQQMessageFacade, QQAppInterface paramQQAppInterface, MessageRecord paramMessageRecord, ArrayList paramArrayList, ChatActivityFacade.HongbaoParams paramHongbaoParams)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(jdField_a_of_type_ComTencentMobileqqDataMessageRecord, jdField_a_of_type_JavaUtilArrayList, jdField_a_of_type_ComTencentMobileqqActivityChatActivityFacade$HongbaoParams);
  }
}
