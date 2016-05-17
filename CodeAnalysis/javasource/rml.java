import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.CompressInfo;
import com.tencent.mobileqq.pic.compress.CompressOperator;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.transfile.TransferRequest;
import com.tencent.mobileqq.utils.StringUtil;
import com.tencent.qphone.base.util.QLog;

public class rml
  implements Runnable
{
  public rml(TransFileController paramTransFileController, String paramString, QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    CompressInfo localCompressInfo = new CompressInfo(jdField_a_of_type_JavaLangString, 0);
    f = 0;
    CompressOperator.a(localCompressInfo);
    if (QLog.isColorLevel()) {
      QLog.d("Q.nearby_people_card.upload_local_photo", 2, ".uploadPhoto(), img_path = " + e);
    }
    if (!StringUtil.b(e))
    {
      TransferRequest localTransferRequest = new TransferRequest();
      jdField_a_of_type_Boolean = true;
      i = e;
      b = 22;
      jdField_a_of_type_ComTencentMobileqqPicUpCallBack = new rmm(this);
      jdField_a_of_type_ComTencentMobileqqTransfileTransFileController.a(localTransferRequest);
    }
  }
}
