package mqq.app;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.util.Pair;
import com.tencent.mobileqq.msf.sdk.SettingCloneUtil;
import com.tencent.qphone.base.remote.SimpleAccount;
import com.tencent.qphone.base.util.QLog;
import java.util.List;
import java.util.Queue;

public class QQBroadcastReceiver
  extends BroadcastReceiver
{
  public QQBroadcastReceiver() {}
  
  public final void onReceive(Context paramContext, Intent paramIntent)
  {
    MobileQQ localMobileQQ = (MobileQQ)paramContext.getApplicationContext();
    long l = System.currentTimeMillis();
    Object localObject1;
    if (paramIntent == null)
    {
      localObject1 = "";
      localObject1 = Pair.create(Long.valueOf(l), localObject1);
      if ((localMobileQQ != null) && (broadcastInfoQueue != null))
      {
        if (broadcastInfoQueue.size() >= 5) {
          break label103;
        }
        broadcastInfoQueue.offer(localObject1);
      }
    }
    for (;;)
    {
      localMobileQQ.onActivityCreate(this, paramIntent);
      if ("Success".equals(MobileQQ.sInjectResult)) {
        break label130;
      }
      return;
      localObject1 = paramIntent.toString();
      break;
      label103:
      broadcastInfoQueue.poll();
      broadcastInfoQueue.offer(localObject1);
    }
    label130:
    AppRuntime localAppRuntime = localMobileQQ.waitAppRuntime(null);
    int i;
    if (paramIntent != null)
    {
      localObject1 = null;
      i = -1;
    }
    try
    {
      localObject2 = paramIntent.getStringExtra("k_pcactive_uin");
      localObject1 = localObject2;
      int j = paramIntent.getIntExtra("k_pcactive_retryIndex", -1);
      i = j;
      localObject1 = localObject2;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Object localObject2;
        localException.printStackTrace();
        continue;
        Object localObject3 = null;
      }
    }
    if ((!TextUtils.isEmpty((CharSequence)localObject1)) && (!"0".equals(localObject1)))
    {
      QLog.d("QQBroadcastReceiver", 1, "PCActive:active qq process");
      isPCActive = true;
      localMobileQQ.reportPCActive((String)localObject1, i);
      if (!SettingCloneUtil.readValue(localMobileQQ, localAppRuntime.getAccount(), null, "pcactive_has_notice", false)) {
        SettingCloneUtil.writeValue(localMobileQQ, localAppRuntime.getAccount(), null, "pcactive_notice_key", true);
      }
      if (!localAppRuntime.isLogin())
      {
        QLog.d("QQBroadcastReceiver", 1, "PCActive:Account is not login");
        localObject2 = localAppRuntime.getApplication().getAllAccounts();
        if (localObject2 == null) {
          break label377;
        }
        localObject2 = (SimpleAccount)((List)localObject2).get(0);
        if ((localObject2 != null) && (((String)localObject1).equals(((SimpleAccount)localObject2).getUin())) && (((SimpleAccount)localObject2).isLogined()))
        {
          QLog.d("QQBroadcastReceiver", 1, "PCActive:Show Notification");
          localAppRuntime.login((SimpleAccount)localObject2);
          localObject2 = new Intent("com.tencent.mobileqq.closeNotification");
          ((Intent)localObject2).putExtra("uin", (String)localObject1);
          paramContext.sendBroadcast((Intent)localObject2);
        }
      }
    }
    onReceive(localAppRuntime, paramContext, paramIntent);
  }
  
  public void onReceive(AppRuntime paramAppRuntime, Context paramContext, Intent paramIntent) {}
}
