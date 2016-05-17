import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.MsgAutoMonitorUtil;
import com.tencent.widget.TraceUtils;

public class nkj
  implements Runnable
{
  public nkj(QQMessageFacade paramQQMessageFacade)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    TraceUtils.a("initMsgCache");
    long l1 = System.currentTimeMillis();
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.QQMessageFacade", 2, "before refreshCache");
    }
    a.a().a();
    a.d();
    QQMessageFacade.a(a);
    a.notifyObservers(new RecentUser());
    if (QLog.isColorLevel())
    {
      QLog.d("Q.msg.QQMessageFacade", 2, "after refreshCache");
      long l2 = System.currentTimeMillis();
      MsgAutoMonitorUtil.a().a("MSG_InitCostTime", l2 - l1 + "");
    }
    TraceUtils.a();
  }
}
