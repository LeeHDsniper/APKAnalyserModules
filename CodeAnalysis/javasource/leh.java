import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.aio.photo.AIOImageProviderService;
import com.tencent.mobileqq.app.HotChatHelper;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;
import java.util.Iterator;
import java.util.List;
import mqq.app.AccountNotMatchException;

public class leh
  implements Runnable
{
  public leh(AIOImageProviderService paramAIOImageProviderService, long paramLong)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    try
    {
      QQAppInterface localQQAppInterface = (QQAppInterface)BaseApplicationImpl.a.getAppRuntime(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageProviderService.b);
      Iterator localIterator = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageProviderService.a.iterator();
      while (localIterator.hasNext())
      {
        MessageRecord localMessageRecord = (MessageRecord)localIterator.next();
        if (jdField_a_of_type_Long == uniseq)
        {
          HotChatHelper.a(localMessageRecord);
          localQQAppInterface.a().a(frienduin, istroop, uniseq, "extStr", extStr);
          if (QLog.isColorLevel()) {
            QLog.d("Q.hotchat", 2, "makeFlashPicReaded,uin:" + jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageProviderService.c + ",type:" + istroop + ",extStr" + extStr);
          }
        }
      }
      ReportController.b(localAccountNotMatchException, "CliOper", "", "", "0X8005979", "0X8005979", 0, 0, "", "", "", "");
    }
    catch (AccountNotMatchException localAccountNotMatchException)
    {
      QLog.d("Q.hotchat", 2, "setFlashPicReaded，account no match exception");
      return;
    }
  }
}
