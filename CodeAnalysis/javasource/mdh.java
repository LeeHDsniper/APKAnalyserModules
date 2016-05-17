import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import com.tencent.mobileqq.activity.qwallet.SendHbActivity;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mdh
  implements DialogInterface.OnClickListener
{
  public mdh(SendHbActivity paramSendHbActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface = new Intent();
    paramDialogInterface.putExtra("hb_id", SendHbActivity.e(a));
    paramDialogInterface.putExtra("send_uin", SendHbActivity.b(a));
    paramDialogInterface.putExtra("hb_type", "1");
    paramDialogInterface.putExtra("forward_text", "发红包啦!");
    paramDialogInterface.putExtra("forward_type", 17);
    ForwardBaseOption.a(a, paramDialogInterface);
    a.a(SendHbActivity.b(a), a.a(), "hongbao.wrapped.send", "", "", 2, "");
  }
}
