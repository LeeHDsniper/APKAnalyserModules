import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.app.FileTransferHandler;
import com.tencent.mobileqq.filemanager.core.OnlineFileSessionCenter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class orq
  implements Runnable
{
  public orq(FileTransferHandler paramFileTransferHandler, long paramLong, int paramInt, String paramString1, String paramString2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    QLog.i("FileTransferHandler<FileAssistant>", 1, "OLfilesession[" + jdField_a_of_type_Long + "] Handle upload failed notify. retCode =" + jdField_a_of_type_Int + "(1:cancel upload) reason=" + jdField_a_of_type_JavaLangString);
    if (1 == jdField_a_of_type_Int)
    {
      jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileTransferHandler.a.a().a(b, jdField_a_of_type_Long);
      return;
    }
    if (2 == jdField_a_of_type_Int)
    {
      jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileTransferHandler.a.a().a(b, jdField_a_of_type_Long);
      return;
    }
    if (3 == jdField_a_of_type_Int)
    {
      jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileTransferHandler.a.a().c(b, jdField_a_of_type_Long);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileTransferHandler.a.a().a(b, jdField_a_of_type_Long);
  }
}
