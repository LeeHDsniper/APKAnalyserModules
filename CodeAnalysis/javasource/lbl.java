import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.ChatItemBuilder;
import com.tencent.mobileqq.activity.aio.item.TextItemBuilder;
import com.tencent.mobileqq.data.MessageForText;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.JumpAction;
import com.tencent.mobileqq.utils.JumpParser;
import com.tencent.mobileqq.utils.httputils.PkgTools;
import com.tencent.qphone.base.util.QLog;

public class lbl
  implements View.OnClickListener
{
  public lbl(TextItemBuilder paramTextItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (TextItemBuilder.a(a)) {}
    do
    {
      do
      {
        do
        {
          return;
          localObject = AIOUtils.a(paramView);
          if ((localObject instanceof MessageForText)) {
            break;
          }
        } while (!QLog.isColorLevel());
        QLog.w(ChatItemBuilder.a, 2, "TextItemBuilder onClickListener: AIOUtils.getMessage(v) is not MessageForText");
        return;
        localObject = (MessageForText)localObject;
      } while (msgtype != 64533);
      AIOUtils.l = true;
      Object localObject = PkgTools.c(action);
      paramView = JumpParser.a(a.a, paramView.getContext(), (String)localObject);
    } while (paramView == null);
    paramView.b();
  }
}
