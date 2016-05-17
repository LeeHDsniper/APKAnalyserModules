import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.item.TroopFileItemBuilder;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.troop.TroopFileProxyActivity;
import cooperation.troop.TroopProxyActivity;

public class lby
  implements View.OnClickListener
{
  public lby(TroopFileItemBuilder paramTroopFileItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    ChatMessage localChatMessage = AIOUtils.a(paramView);
    paramView = (Activity)paramView.getContext();
    Intent localIntent = new Intent();
    if (localIntent == null) {
      return;
    }
    localIntent.putExtra(TroopProxyActivity.h, frienduin);
    TroopFileProxyActivity.a(paramView, localIntent);
  }
}
