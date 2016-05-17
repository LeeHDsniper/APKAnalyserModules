import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.app.FileTransferHandler;
import com.tencent.mobileqq.filemanager.core.OnlineFileSessionCenter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class orr
  implements Runnable
{
  public orr(FileTransferHandler paramFileTransferHandler, long paramLong, int paramInt1, int paramInt2, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    QLog.i("FileTransferHandler<FileAssistant>", 1, "OLfilesession[" + jdField_a_of_type_Long + "] Handle upload progress notify. speed=" + jdField_a_of_type_Int + " progress =" + b);
    jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileTransferHandler.a.a().a(jdField_a_of_type_JavaLangString, jdField_a_of_type_Long, jdField_a_of_type_Int, b);
  }
}
