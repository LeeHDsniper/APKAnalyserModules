import android.content.Context;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForMixedMsg;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.multimsg.MultiMsgManager;
import com.tencent.mobileqq.widget.QQToast;

public final class kpv
  implements CompoundButton.OnCheckedChangeListener
{
  public kpv()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onCheckedChanged(CompoundButton paramCompoundButton, boolean paramBoolean)
  {
    Object localObject = (ChatMessage)paramCompoundButton.getTag();
    if (localObject == null) {}
    while (paramBoolean == MultiMsgManager.a().a((ChatMessage)localObject)) {
      return;
    }
    if (!paramBoolean)
    {
      MultiMsgManager.a().a((ChatMessage)localObject, paramBoolean);
      return;
    }
    if (MultiMsgManager.a().b())
    {
      localObject = paramCompoundButton.getContext().getString(2131367391, new Object[] { Integer.valueOf(MultiMsgManager.a().a()) });
      QQToast.a(paramCompoundButton.getContext(), (CharSequence)localObject, 0).b(((BaseActivity)paramCompoundButton.getContext()).getTitleBarHeight());
      paramCompoundButton.setChecked(false);
      return;
    }
    if ((((localObject instanceof MessageForPic)) || ((localObject instanceof MessageForMixedMsg)) || (msgtype == 64500)) && (MultiMsgManager.a().c()))
    {
      localObject = paramCompoundButton.getContext().getString(2131367392, new Object[] { Integer.valueOf(MultiMsgManager.a().b()) });
      QQToast.a(paramCompoundButton.getContext(), (CharSequence)localObject, 0).b(((BaseActivity)paramCompoundButton.getContext()).getTitleBarHeight());
      paramCompoundButton.setChecked(false);
      return;
    }
    MultiMsgManager.a().a((ChatMessage)localObject, paramBoolean);
  }
}
