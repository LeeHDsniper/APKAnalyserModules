import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.proxy.FTSDBManager;
import com.tencent.mobileqq.app.proxy.fts.FTSMsgOperator;
import com.tencent.mobileqq.app.proxy.fts.FTSMsgUpgrader;
import com.tencent.mobileqq.app.proxy.fts.FTSSyncHandler;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.fts.FTSDatatbase;
import com.tencent.qphone.base.util.QLog;

public class nlw
  implements Runnable
{
  public nlw(FTSMsgUpgrader paramFTSMsgUpgrader)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if ((!FTSMsgUpgrader.a(a)) && (FTSMsgUpgrader.a(a).a().a())) {
      if ((FTSMsgUpgrader.a(a) != null) && (FTSMsgUpgrader.a(a).a()))
      {
        if (!a.a) {
          FTSMsgUpgrader.a(a);
        }
        if (QLog.isColorLevel()) {
          QLog.d("Q.fts.FTSMsgUpgrader", 2, "upgrade history in handle hasReadNativeCursor = " + a.a + " mUpgradeCursor=" + FTSMsgUpgrader.a(a) + " mUpgradeMaxIndex=" + FTSMsgUpgrader.b(a));
        }
        if (a.a)
        {
          if (FTSMsgUpgrader.a(a) >= FTSMsgUpgrader.b(a)) {
            break label201;
          }
          if (!FTSMsgUpgrader.b(a)) {
            break label186;
          }
        }
      }
    }
    label186:
    label201:
    while (!QLog.isColorLevel())
    {
      do
      {
        FTSMsgUpgrader.a(a).postDelayed(this, 20L);
        do
        {
          return;
        } while (!QLog.isColorLevel());
        QLog.d("Q.fts.FTSMsgUpgrader", 2, "writeNativeIndex failed");
        return;
        if (QLog.isColorLevel()) {
          QLog.d("Q.fts.FTSMsgUpgrader", 2, "upgrade compeleted in handler");
        }
        FTSMsgUpgrader.b(a);
        FTSMsgUpgrader.a(a).c();
        return;
      } while (!QLog.isColorLevel());
      StringBuilder localStringBuilder = new StringBuilder().append("upgrade history in handle mDatabase = ");
      if (FTSMsgUpgrader.a(a) == null) {}
      for (String str = "null";; str = "@@@")
      {
        QLog.d("Q.fts.FTSMsgUpgrader", 2, str);
        return;
      }
    }
    QLog.d("Q.fts.FTSMsgUpgrader", 2, "upgrade history in handle isDestroy = " + FTSMsgUpgrader.a(a));
  }
}
