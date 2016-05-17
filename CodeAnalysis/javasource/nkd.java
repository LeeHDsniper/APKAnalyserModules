import android.os.Bundle;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.message.BaseMessageProcessor.RequestBuilder;
import com.tencent.mobileqq.app.message.OfflineFileMessageProcessor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageProtoCodec;
import com.tencent.mobileqq.service.message.TransMsgContext;
import com.tencent.qphone.base.remote.ToServiceMsg;
import msf.msgsvc.msg_svc.PbSendMsgReq;

public class nkd
  implements BaseMessageProcessor.RequestBuilder
{
  public nkd(OfflineFileMessageProcessor paramOfflineFileMessageProcessor, String paramString, long paramLong1, int paramInt1, long paramLong2, int paramInt2, byte[] paramArrayOfByte)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ToServiceMsg a()
  {
    ToServiceMsg localToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageOfflineFileMessageProcessor.jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a("MessageSvc.PbSendMsg");
    extraData.putString("uin", jdField_a_of_type_JavaLangString);
    extraData.putByte("cmd", (byte)0);
    extraData.putByte("keyType", (byte)0);
    extraData.putByte("sendType", (byte)0);
    extraData.putInt("busiType", 1025);
    extraData.putString("toUin", jdField_a_of_type_JavaLangString);
    extraData.putLong("sessionid", jdField_a_of_type_Long);
    extraData.putInt("random", jdField_a_of_type_Int);
    extraData.putLong("msgsize", 0L);
    localToServiceMsg.addAttribute("_tag_LOGSTR", String.valueOf(jdField_b_of_type_Long));
    extraData.putInt("ROUNTING_TYPE", 9);
    extraData.putInt("transC2CCmd", jdField_b_of_type_Int);
    TransMsgContext localTransMsgContext = new TransMsgContext();
    jdField_a_of_type_Int = jdField_b_of_type_Int;
    jdField_a_of_type_ArrayOfByte = jdField_a_of_type_ArrayOfByte;
    localToServiceMsg.putWupBuffer(MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageOfflineFileMessageProcessor.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 9, jdField_a_of_type_JavaLangString, localTransMsgContext, jdField_b_of_type_Long, jdField_a_of_type_Int).toByteArray());
    return localToServiceMsg;
  }
}
