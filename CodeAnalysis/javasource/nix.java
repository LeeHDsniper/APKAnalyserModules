import android.os.Bundle;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.message.AccostMessageProcessor;
import com.tencent.mobileqq.app.message.BaseMessageProcessor.RequestBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.QLog;

public class nix
  implements BaseMessageProcessor.RequestBuilder
{
  public nix(AccostMessageProcessor paramAccostMessageProcessor, byte[] paramArrayOfByte, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ToServiceMsg a()
  {
    ToServiceMsg localToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageAccostMessageProcessor.a.a("MessageSvc.GetMsgV4");
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageProcessor", 2, "--->getC2CMessage cChannel: 4vCookies: " + jdField_a_of_type_ArrayOfByte + ",cSyncFlag:" + jdField_a_of_type_Int);
    }
    extraData.putByte("cChannel", (byte)4);
    extraData.putByteArray("vCookies", jdField_a_of_type_ArrayOfByte);
    extraData.putInt("cSyncFlag", jdField_a_of_type_Int);
    extraData.putByte("onlineSyncFlag", (byte)1);
    return localToServiceMsg;
  }
}
