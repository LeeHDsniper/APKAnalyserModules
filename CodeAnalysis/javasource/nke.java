import IMMsgBodyPack.MsgType0x210;
import com.tencent.av.service.QavWrapper;
import com.tencent.av.service.QavWrapper.OnReadyListener;
import com.tencent.mobileqq.app.message.OnLinePushMessageProcessor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class nke
  implements QavWrapper.OnReadyListener
{
  public nke(OnLinePushMessageProcessor paramOnLinePushMessageProcessor, MsgType0x210 paramMsgType0x210)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(QavWrapper paramQavWrapper)
  {
    paramQavWrapper.c(jdField_a_of_type_IMMsgBodyPackMsgType0x210.vProtobuf);
    paramQavWrapper.a();
  }
}
