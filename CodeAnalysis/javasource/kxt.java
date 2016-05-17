import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.view.View;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.lang.ref.WeakReference;

public class kxt
  extends ClickableSpan
{
  private WeakReference a;
  private WeakReference b;
  
  public kxt(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new WeakReference(paramQQAppInterface);
    b = new WeakReference(paramContext);
  }
  
  public void onClick(View paramView)
  {
    paramView = (QQAppInterface)a.get();
    if (((b.get() instanceof Activity)) && (paramView != null))
    {
      if (QLog.isColorLevel()) {
        QLog.d("GrayTipsItemBuilder", 2, "handleHotChatToSeeTip span click ");
      }
      HotChatManager.a(null, false);
    }
  }
  
  public void updateDrawState(TextPaint paramTextPaint)
  {
    paramTextPaint.setColor(Color.rgb(26, 144, 240));
  }
}
