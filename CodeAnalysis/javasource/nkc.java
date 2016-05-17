import android.os.Bundle;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.message.BaseMessageProcessor.RequestBuilder;
import com.tencent.mobileqq.app.message.OfflineFileMessageProcessor;
import com.tencent.mobileqq.filemanager.app.FileTransferObserver;
import com.tencent.mobileqq.filemanager.data.FMTransC2CMsgInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageProtoCodec;
import com.tencent.mobileqq.service.message.MessageUtils;
import com.tencent.mobileqq.service.message.TransMsgContext;
import com.tencent.qphone.base.remote.ToServiceMsg;
import msf.msgsvc.msg_svc.PbSendMsgReq;

public class nkc
  implements BaseMessageProcessor.RequestBuilder
{
  public nkc(OfflineFileMessageProcessor paramOfflineFileMessageProcessor, String paramString, FMTransC2CMsgInfo paramFMTransC2CMsgInfo, int paramInt, byte[] paramArrayOfByte)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ToServiceMsg a()
  {
    ToServiceMsg localToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageOfflineFileMessageProcessor.jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a("MessageSvc.PbSendMsg");
    extraData.putString("uin", jdField_a_of_type_JavaLangString);
    extraData.putLong("msgsize", 0L);
    extraData.putLong("uniseq", jdField_a_of_type_ComTencentMobileqqFilemanagerDataFMTransC2CMsgInfo.uniseq);
    extraData.putInt("SEND_MSG_CMD_MSG_TYPE", 1);
    extraData.putString("uuid", jdField_a_of_type_ComTencentMobileqqFilemanagerDataFMTransC2CMsgInfo.uuid);
    extraData.putByte("cmd", (byte)0);
    extraData.putByte("keyType", (byte)0);
    extraData.putInt("busiType", jdField_a_of_type_ComTencentMobileqqFilemanagerDataFMTransC2CMsgInfo.busiType);
    extraData.putString("toUin", jdField_a_of_type_JavaLangString);
    extraData.putLong("queueSeq", jdField_a_of_type_ComTencentMobileqqFilemanagerDataFMTransC2CMsgInfo.queueSeq);
    extraData.putLong("sessionid", jdField_a_of_type_ComTencentMobileqqFilemanagerDataFMTransC2CMsgInfo.sessionId);
    extraData.putInt("random", MessageUtils.b(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFMTransC2CMsgInfo.msgUid));
    localToServiceMsg.addAttribute("_tag_LOGSTR", String.valueOf(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFMTransC2CMsgInfo.msgSeq));
    extraData.putInt("ROUNTING_TYPE", 13);
    extraData.putInt("transC2CCmd", jdField_a_of_type_Int);
    TransMsgContext localTransMsgContext = new TransMsgContext();
    jdField_a_of_type_Int = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFMTransC2CMsgInfo.subCmd;
    jdField_a_of_type_ArrayOfByte = jdField_a_of_type_ArrayOfByte;
    msg_svc.PbSendMsgReq localPbSendMsgReq = MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageOfflineFileMessageProcessor.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 13, jdField_a_of_type_JavaLangString, localTransMsgContext, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFMTransC2CMsgInfo.msgSeq, MessageUtils.b(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFMTransC2CMsgInfo.msgUid));
    OfflineFileMessageProcessor.a(jdField_a_of_type_ComTencentMobileqqAppMessageOfflineFileMessageProcessor, localPbSendMsgReq, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFMTransC2CMsgInfo, localTransMsgContext);
    localToServiceMsg.putWupBuffer(localPbSendMsgReq.toByteArray());
    extraData.putLong(FileTransferObserver.class.getName(), jdField_a_of_type_ComTencentMobileqqFilemanagerDataFMTransC2CMsgInfo.observerSeq);
    return localToServiceMsg;
  }
}
