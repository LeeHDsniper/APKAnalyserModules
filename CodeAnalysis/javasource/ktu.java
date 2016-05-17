import android.content.Context;
import android.support.v4.view.AccessibilityDelegateCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.view.View;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.aio.audiopanel.AudioPanel;
import com.tencent.mobileqq.activity.aio.audiopanel.PressToSpeakPanel;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.AccessibilityUtil;

public class ktu
  extends AccessibilityDelegateCompat
{
  public ktu(PressToSpeakPanel paramPressToSpeakPanel)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onInitializeAccessibilityNodeInfo(View paramView, AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat)
  {
    super.onInitializeAccessibilityNodeInfo(paramView, paramAccessibilityNodeInfoCompat);
    if ((AppSetting.i) && (PressToSpeakPanel.a(a) > 0) && (!PressToSpeakPanel.a(a)) && (PressToSpeakPanel.a(a).a() == 1))
    {
      PressToSpeakPanel.a(a, true);
      PressToSpeakPanel.b(a);
      AccessibilityUtil.a(a, a.getContext().getString(2131362087));
    }
  }
}
