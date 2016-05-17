import android.os.Bundle;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.message.BaseMessageProcessor.RequestBuilder;
import com.tencent.mobileqq.app.message.UncommonMessageProcessor;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageUtils;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.QLog;
import msf.msgsvc.msg_svc.PbSendMsgReq;

public class nlc
  implements BaseMessageProcessor.RequestBuilder
{
  public nlc(UncommonMessageProcessor paramUncommonMessageProcessor, MessageRecord paramMessageRecord, msg_svc.PbSendMsgReq paramPbSendMsgReq)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ToServiceMsg a()
  {
    long l = System.currentTimeMillis();
    ToServiceMsg localToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageUncommonMessageProcessor.a.a("MessageSvc.PbMultiMsgSend");
    extraData.putLong("uniseq", jdField_a_of_type_ComTencentMobileqqDataMessageRecord.uniseq);
    extraData.putInt("msgtype", jdField_a_of_type_ComTencentMobileqqDataMessageRecord.msgtype);
    extraData.putLong("key_msg_info_time_start", l);
    localToServiceMsg.putWupBuffer(jdField_a_of_type_MsfMsgsvcMsg_svc$PbSendMsgReq.toByteArray());
    localToServiceMsg.setTimeout(15000L);
    localToServiceMsg.setEnableFastResend(true);
    if (QLog.isColorLevel())
    {
      int i = MessageUtils.a(jdField_a_of_type_ComTencentMobileqqDataMessageRecord.msgUid);
      QLog.d("Q.msg.UncommonMessageProcessor", 2, "sendBlessMsg,  mr_uniseq:" + jdField_a_of_type_ComTencentMobileqqDataMessageRecord.uniseq + " msgSeq:" + jdField_a_of_type_ComTencentMobileqqDataMessageRecord.msgseq + " mr_shMsgseq:" + jdField_a_of_type_ComTencentMobileqqDataMessageRecord.shmsgseq + " mr_msgUid:" + jdField_a_of_type_ComTencentMobileqqDataMessageRecord.msgUid + " random:" + i);
    }
    return localToServiceMsg;
  }
}
