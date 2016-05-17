import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.style.ClickableSpan;
import android.view.View;
import com.tencent.mobileqq.activity.aio.item.DeviceTextItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;

public class kvn
  extends ClickableSpan
{
  public kvn(DeviceTextItemBuilder paramDeviceTextItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (!NetworkUtil.e(a.a))
    {
      QQToast.a(a.a, "当前网络连接不可用，请确认后再使用", 2000).a();
      return;
    }
    paramView = new Intent();
    paramView.setFlags(268435456);
    paramView.setAction("android.intent.action.VIEW");
    paramView.putExtra("devlock_open_source", "SmartDeviceMsg");
    paramView.setData(Uri.parse("mqqdevlock://devlock/open?"));
    a.a.startActivity(paramView);
  }
}
