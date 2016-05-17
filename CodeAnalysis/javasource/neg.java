import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.tencent.mobileqq.app.LBSHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.QQMapActivityProxy;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;

public class neg
  extends BroadcastReceiver
{
  public neg(QQMapActivityProxy paramQQMapActivityProxy)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    paramContext = paramIntent.getAction();
    if (paramContext.equals("com.tencent.mobileqq.addLbsObserver")) {
      if (QQMapActivityProxy.a(a) != null) {
        QQMapActivityProxy.a(a).a(QQMapActivityProxy.a(a));
      }
    }
    do
    {
      do
      {
        int i;
        int j;
        int k;
        int m;
        int n;
        do
        {
          String str;
          int i1;
          do
          {
            do
            {
              do
              {
                do
                {
                  return;
                  if (!paramContext.equals("com.tencent.mobileqq.removeLbsObserver")) {
                    break;
                  }
                } while (QQMapActivityProxy.a(a) == null);
                QQMapActivityProxy.a(a).b(QQMapActivityProxy.a(a));
                return;
                if (!paramContext.equals("com.tencent.mobileqq.getStreetViewUrl")) {
                  break;
                }
              } while (QQMapActivityProxy.a(a) == null);
              ((LBSHandler)QQMapActivityProxy.a(a).a(3)).b((int)(paramIntent.getDoubleExtra("latitude", 0.0D) * 1000000.0D), (int)(paramIntent.getDoubleExtra("longitude", 0.0D) * 1000000.0D));
              return;
              if (!paramContext.equals("com.tencent.mobileqq.unregisterReceiver")) {
                break;
              }
              try
              {
                QQMapActivityProxy.a(a).unregisterReceiver(QQMapActivityProxy.a(a));
                return;
              }
              catch (Exception paramContext) {}
            } while (!QLog.isColorLevel());
            QLog.i("QQMapActivityProxy", 2, "mBroadcastReceiver throw an exception when receive UNREGISTER_RECEIVER : " + paramContext.toString());
            return;
            if (!paramContext.equals("com.tencent.mobileqq.getLbsShareSearch")) {
              break;
            }
            i = paramIntent.getIntExtra("latitude", 0);
            j = paramIntent.getIntExtra("longitude", 0);
            k = paramIntent.getIntExtra("coordinate", 0);
            paramContext = paramIntent.getStringExtra("keyword");
            str = paramIntent.getStringExtra("category");
            m = paramIntent.getIntExtra("page", 0);
            n = paramIntent.getIntExtra("count", 0);
            i1 = paramIntent.getIntExtra("requireMyLbs", 0);
          } while (QQMapActivityProxy.a(a) == null);
          ((LBSHandler)QQMapActivityProxy.a(a).a(3)).a(i, j, k, paramContext, str, m, n, i1);
          return;
          if (!paramContext.equals("com.tencent.mobileqq.getLbsShareShop")) {
            break;
          }
          i = paramIntent.getIntExtra("latitude", 0);
          j = paramIntent.getIntExtra("longitude", 0);
          k = paramIntent.getIntExtra("coordinate", 0);
          m = paramIntent.getIntExtra("begin", 0);
          n = paramIntent.getIntExtra("count", 0);
        } while (QQMapActivityProxy.a(a) == null);
        ((LBSHandler)QQMapActivityProxy.a(a).a(3)).a(i, j, k, m, n);
        return;
      } while (!paramContext.equals("com.tencent.mobileqq.getShareShopDetail"));
      paramContext = paramIntent.getStringExtra("shop_id");
    } while ((TextUtils.isEmpty(paramContext)) || (QQMapActivityProxy.a(a) == null));
    paramIntent = new ArrayList();
    paramIntent.add(paramContext);
    ((LBSHandler)QQMapActivityProxy.a(a).a(3)).a(paramIntent);
  }
}
