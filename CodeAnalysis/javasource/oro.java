import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.app.FileTransferHandler;
import com.tencent.mobileqq.filemanager.core.OnlineFileSessionCenter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class oro
  implements Runnable
{
  public oro(FileTransferHandler paramFileTransferHandler, long paramLong, boolean paramBoolean, String paramString)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    QLog.i("FileTransferHandler<FileAssistant>", 1, "OLfilesession[" + jdField_a_of_type_Long + "]  handle recv onlinefile resp. sucess =" + jdField_a_of_type_Boolean);
    jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileTransferHandler.a.a().a(jdField_a_of_type_JavaLangString, jdField_a_of_type_Long, jdField_a_of_type_Boolean);
  }
}
