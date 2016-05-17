import com.tencent.common.app.BaseProtocolCoder;
import com.tencent.mobileqq.app.BusinessHandler;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.compatible.ActionListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.MobileQQService;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;

public class raf
  extends ActionListener
{
  public raf(MobileQQService paramMobileQQService)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    if ((paramFromServiceMsg != null) && ("VideoSvc.Send".equalsIgnoreCase(paramFromServiceMsg.getServiceCmd())))
    {
      localObject = a.a("VideoSvc.Send");
      if (localObject != null)
      {
        localObject = ((BaseProtocolCoder)localObject).a(paramToServiceMsg, paramFromServiceMsg);
        localMessageHandler = MobileQQService.a(a).a();
        if ((localMessageHandler != null) && (localObject != null)) {
          localMessageHandler.a(paramToServiceMsg, paramFromServiceMsg, localObject);
        }
      }
    }
    while (paramFromServiceMsg == null)
    {
      Object localObject;
      MessageHandler localMessageHandler;
      return;
    }
    a.a(paramFromServiceMsg.isSuccess(), paramToServiceMsg, paramFromServiceMsg, null);
  }
}
