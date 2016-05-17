import com.tencent.mobileqq.filemanager.app.FileTransferHandler;
import com.tencent.mobileqq.filemanager.data.OnlineFileSessionInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class orm
  implements Runnable
{
  public orm(FileTransferHandler paramFileTransferHandler, int paramInt1, String paramString1, String paramString2, long paramLong1, short paramShort, boolean paramBoolean, int paramInt2, String paramString3, OnlineFileSessionInfo paramOnlineFileSessionInfo, long paramLong2, int paramInt3)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileTransferHandler.a(jdField_a_of_type_Int, jdField_a_of_type_JavaLangString, jdField_b_of_type_JavaLangString, jdField_a_of_type_Long, jdField_a_of_type_Short, jdField_a_of_type_Boolean, jdField_b_of_type_Int, jdField_c_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqFilemanagerDataOnlineFileSessionInfo, jdField_b_of_type_Long, jdField_c_of_type_Int);
  }
}
