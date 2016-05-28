package android.support.v4.view.accessibility;

import android.os.Build.VERSION;
import android.view.accessibility.AccessibilityEvent;

public class AccessibilityEventCompat
{
  private static final AccessibilityEventVersionImpl IMPL = new AccessibilityEventStubImpl();
  
  static
  {
    if (Build.VERSION.SDK_INT >= 19)
    {
      IMPL = new AccessibilityEventKitKatImpl();
      return;
    }
    if (Build.VERSION.SDK_INT >= 14)
    {
      IMPL = new AccessibilityEventIcsImpl();
      return;
    }
  }
  
  public static AccessibilityRecordCompat asRecord(AccessibilityEvent paramAccessibilityEvent)
  {
    return new AccessibilityRecordCompat(paramAccessibilityEvent);
  }
  
  public static int getContentChangeTypes(AccessibilityEvent paramAccessibilityEvent)
  {
    return IMPL.getContentChangeTypes(paramAccessibilityEvent);
  }
  
  public static void setContentChangeTypes(AccessibilityEvent paramAccessibilityEvent, int paramInt)
  {
    IMPL.setContentChangeTypes(paramAccessibilityEvent, paramInt);
  }
  
  static class AccessibilityEventIcsImpl
    extends AccessibilityEventCompat.AccessibilityEventStubImpl
  {
    AccessibilityEventIcsImpl() {}
  }
  
  static class AccessibilityEventKitKatImpl
    extends AccessibilityEventCompat.AccessibilityEventIcsImpl
  {
    AccessibilityEventKitKatImpl() {}
    
    public int getContentChangeTypes(AccessibilityEvent paramAccessibilityEvent)
    {
      return AccessibilityEventCompatKitKat.getContentChangeTypes(paramAccessibilityEvent);
    }
    
    public void setContentChangeTypes(AccessibilityEvent paramAccessibilityEvent, int paramInt)
    {
      AccessibilityEventCompatKitKat.setContentChangeTypes(paramAccessibilityEvent, paramInt);
    }
  }
  
  static class AccessibilityEventStubImpl
    implements AccessibilityEventCompat.AccessibilityEventVersionImpl
  {
    AccessibilityEventStubImpl() {}
    
    public int getContentChangeTypes(AccessibilityEvent paramAccessibilityEvent)
    {
      return 0;
    }
    
    public void setContentChangeTypes(AccessibilityEvent paramAccessibilityEvent, int paramInt) {}
  }
  
  static abstract interface AccessibilityEventVersionImpl
  {
    public abstract int getContentChangeTypes(AccessibilityEvent paramAccessibilityEvent);
    
    public abstract void setContentChangeTypes(AccessibilityEvent paramAccessibilityEvent, int paramInt);
  }
}
