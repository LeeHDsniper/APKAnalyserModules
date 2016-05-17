import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.app.FileTransferHandler;
import com.tencent.mobileqq.filemanager.core.OnlineFileSessionCenter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class orn
  implements Runnable
{
  public orn(FileTransferHandler paramFileTransferHandler, long paramLong, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    QLog.i("FileTransferHandler<FileAssistant>", 1, "OLfilesession[" + jdField_a_of_type_Long + "]  handle cmd 0x211-0x1.save to weiyun");
    jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileTransferHandler.a.a().a(jdField_a_of_type_JavaLangString, jdField_a_of_type_Long, 4);
  }
}
