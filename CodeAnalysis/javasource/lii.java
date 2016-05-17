import android.text.TextUtils;
import com.tencent.mobileqq.activity.aio.rebuild.NearbyChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.nearby.NearbyRelevantObserver;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.XEditTextEx;

public class lii
  extends NearbyRelevantObserver
{
  public lii(NearbyChatPie paramNearbyChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(String paramString1, String paramString2, Object paramObject)
  {
    if (QLog.isDevelopLevel()) {
      QLog.i(a.ae, 4, "onAutoInput, [" + paramString1 + "," + paramString2 + "," + paramObject + "," + System.currentTimeMillis() + "]");
    }
    if (!"tag_nearby_chat".equals(paramString1)) {}
    while ((TextUtils.isEmpty(paramString2)) || (NearbyChatPie.a(a) == null)) {
      return;
    }
    a.af();
    NearbyChatPie.b(a).setText(paramString2);
    NearbyChatPie.c(a).selectAll();
    a.af = paramString2;
  }
}
