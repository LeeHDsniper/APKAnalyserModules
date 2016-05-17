import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.support.v4.app.FragmentActivity;
import com.tencent.mobileqq.activity.aio.PlusPanel;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.utils.TroopGagMgr.SelfGagInfo;
import com.tencent.mobileqq.widget.QQToast;

public class llf
  extends Handler
{
  public llf(TroopChatPie paramTroopChatPie, Looper paramLooper)
  {
    super(paramLooper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
    case 1: 
    case 2: 
    case 3: 
    case 4: 
      do
      {
        do
        {
          return;
          a.a(null, false);
          return;
          paramMessage = obj;
        } while (!(paramMessage instanceof TroopGagMgr.SelfGagInfo));
        a.a((TroopGagMgr.SelfGagInfo)paramMessage);
        return;
        boolean bool = ((Boolean)obj).booleanValue();
        a.j(bool);
        return;
      } while (TroopChatPie.i(a) == null);
      TroopChatPie.j(a).a();
      return;
    case 5: 
      String str = (String)obj;
      int i = arg1;
      QQToast.a(a.a, str, i).b(a.a.getTitleBarHeight());
      return;
    case 6: 
      a.aE();
      return;
    }
    a.ar();
  }
}
