package android.support.v4.view.accessibility;

import android.view.accessibility.AccessibilityRecord;

class AccessibilityRecordCompatIcs
{
  public static Object obtain()
  {
    return AccessibilityRecord.obtain();
  }
  
  public static void setFromIndex(Object paramObject, int paramInt)
  {
    ((AccessibilityRecord)paramObject).setFromIndex(paramInt);
  }
  
  public static void setItemCount(Object paramObject, int paramInt)
  {
    ((AccessibilityRecord)paramObject).setItemCount(paramInt);
  }
  
  public static void setScrollX(Object paramObject, int paramInt)
  {
    ((AccessibilityRecord)paramObject).setScrollX(paramInt);
  }
  
  public static void setScrollY(Object paramObject, int paramInt)
  {
    ((AccessibilityRecord)paramObject).setScrollY(paramInt);
  }
  
  public static void setScrollable(Object paramObject, boolean paramBoolean)
  {
    ((AccessibilityRecord)paramObject).setScrollable(paramBoolean);
  }
  
  public static void setToIndex(Object paramObject, int paramInt)
  {
    ((AccessibilityRecord)paramObject).setToIndex(paramInt);
  }
}
