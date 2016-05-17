import android.text.TextUtils;
import com.tencent.mobileqq.activity.contact.troop.TroopView;
import com.tencent.mobileqq.app.BizTroopObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class luf
  extends BizTroopObserver
{
  public luf(TroopView paramTroopView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(String paramString1, int paramInt1, int paramInt2, String paramString2)
  {
    if (paramInt2 == 0) {
      a.a();
    }
    while (TextUtils.isEmpty(paramString2)) {
      return;
    }
    a.a(paramString2);
  }
}
