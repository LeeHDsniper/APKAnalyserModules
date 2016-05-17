import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.TroopObserver;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import cooperation.qwallet.plugin.QWalletHelper;

public final class krf
  extends TroopObserver
{
  public krf(SessionInfo paramSessionInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void c(boolean paramBoolean, long paramLong, int paramInt1, TroopInfo paramTroopInfo, int paramInt2, String paramString)
  {
    if (paramBoolean)
    {
      QWalletHelper.b(a.a);
      if (QLog.isColorLevel()) {
        QLog.d("PlusPanelUtils", 2, "onOIDB0X88D_0_Ret 群uin：" + a.a + " 群成员个数：" + wMemberNum);
      }
    }
  }
}
