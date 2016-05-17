import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.app.FileTransferHandler;
import com.tencent.mobileqq.filemanager.core.OnlineFileSessionCenter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class ors
  implements Runnable
{
  public ors(FileTransferHandler paramFileTransferHandler, long paramLong1, String paramString1, int paramInt, String paramString2, long paramLong2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    QLog.i("FileTransferHandler<FileAssistant>", 1, "OLfilesession[" + jdField_a_of_type_Long + "] upload competed:");
    jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileTransferHandler.a.a().a(jdField_a_of_type_JavaLangString, jdField_a_of_type_Long, jdField_a_of_type_Int, jdField_b_of_type_JavaLangString, jdField_b_of_type_Long);
  }
}
