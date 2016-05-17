import android.content.Context;
import android.content.Intent;
import android.text.style.ClickableSpan;
import android.view.View;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.item.DeviceTextItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;

public class kvo
  extends ClickableSpan
{
  public kvo(DeviceTextItemBuilder paramDeviceTextItemBuilder)
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
    paramView = new Intent(a.a, QQBrowserActivity.class);
    paramView.putExtra("url", "http://kf.qq.com/touch/apifaq/1211147RVfAV140617UV3MZn.html?ADTAG=veda.mobileqq.en");
    paramView.putExtra("hide_more_button", true);
    a.a.startActivity(paramView);
  }
}
