package android.support.v4.view.accessibility;

import android.view.accessibility.AccessibilityEvent;

class AccessibilityEventCompatKitKat
{
  public static int getContentChangeTypes(AccessibilityEvent paramAccessibilityEvent)
  {
    return paramAccessibilityEvent.getContentChangeTypes();
  }
  
  public static void setContentChangeTypes(AccessibilityEvent paramAccessibilityEvent, int paramInt)
  {
    paramAccessibilityEvent.setContentChangeTypes(paramInt);
  }
}
