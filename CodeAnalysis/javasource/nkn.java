import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.BaseMessageManager;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.UncommonMessageProcessor;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.filemanager.core.FileManagerDataCenter;
import com.tencent.mobileqq.filemanager.data.FMConstants.revertMsgCallback;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class nkn
  implements FMConstants.revertMsgCallback
{
  public nkn(QQMessageFacade paramQQMessageFacade, MessageRecord paramMessageRecord, FileManagerEntity paramFileManagerEntity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a()
  {
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(jdField_a_of_type_ComTencentMobileqqDataMessageRecord.istroop).c(jdField_a_of_type_ComTencentMobileqqDataMessageRecord);
  }
  
  public void a(int paramInt, String paramString)
  {
    if ((paramInt == 59435) || (paramInt == 58533))
    {
      jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.status = 16;
      QQMessageFacade.a(jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade).a().c(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity);
    }
    QQMessageFacade.a(jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade).a().a().a(jdField_a_of_type_ComTencentMobileqqDataMessageRecord.frienduin, jdField_a_of_type_ComTencentMobileqqDataMessageRecord.istroop, UncommonMessageProcessor.k, 0);
  }
}
