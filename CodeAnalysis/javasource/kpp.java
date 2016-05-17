import android.view.View;
import android.view.View.AccessibilityDelegate;
import android.view.accessibility.AccessibilityNodeInfo;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kpp
  extends View.AccessibilityDelegate
{
  public kpp(BaseBubbleBuilder paramBaseBubbleBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onInitializeAccessibilityNodeInfo(View paramView, AccessibilityNodeInfo paramAccessibilityNodeInfo)
  {
    paramAccessibilityNodeInfo.setVisibleToUser(false);
  }
}
