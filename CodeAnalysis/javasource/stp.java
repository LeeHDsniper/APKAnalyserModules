import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.widget.ExploreByTouchHelper;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.ClearableEditText;
import com.tencent.qphone.base.util.QLog;
import java.util.List;

public class stp
  extends ExploreByTouchHelper
{
  public stp(ClearableEditText paramClearableEditText, View paramView)
  {
    super(paramView);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int getVirtualViewAt(float paramFloat1, float paramFloat2)
  {
    if ((ClearableEditText.b(a)) && (paramFloat1 > a.getWidth() - a.getPaddingRight() - a.a.getIntrinsicWidth())) {
      return 0;
    }
    return -1;
  }
  
  protected void getVisibleVirtualViews(List paramList)
  {
    if (ClearableEditText.b(a)) {
      paramList.add(Integer.valueOf(0));
    }
  }
  
  protected boolean onPerformActionForVirtualView(int paramInt1, int paramInt2, Bundle paramBundle)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ClearableEditTextHelper", 2, "onPerformActionForVirtualView virtualViewId:" + paramInt1);
    }
    return false;
  }
  
  protected void onPopulateEventForVirtualView(int paramInt, AccessibilityEvent paramAccessibilityEvent)
  {
    if (paramInt == 0) {
      paramAccessibilityEvent.setContentDescription("删除 按钮");
    }
  }
  
  protected void onPopulateNodeForVirtualView(int paramInt, AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat)
  {
    if (paramInt == 0)
    {
      paramAccessibilityNodeInfoCompat.setContentDescription("删除 按钮");
      paramAccessibilityNodeInfoCompat.addAction(16);
      paramAccessibilityNodeInfoCompat.setBoundsInParent(new Rect(a.getWidth() - a.getPaddingRight() - a.a.getIntrinsicWidth(), a.getPaddingTop(), a.getWidth() - a.getPaddingRight(), a.getHeight() - a.getPaddingBottom()));
    }
  }
}
