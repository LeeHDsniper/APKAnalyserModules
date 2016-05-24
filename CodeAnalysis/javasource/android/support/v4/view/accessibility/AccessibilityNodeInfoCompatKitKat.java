package android.support.v4.view.accessibility;

import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeInfo.CollectionInfo;
import android.view.accessibility.AccessibilityNodeInfo.CollectionItemInfo;

class AccessibilityNodeInfoCompatKitKat
{
  public static Object obtainCollectionInfo(int paramInt1, int paramInt2, boolean paramBoolean, int paramInt3)
  {
    return AccessibilityNodeInfo.CollectionInfo.obtain(paramInt1, paramInt2, paramBoolean);
  }
  
  public static Object obtainCollectionItemInfo(int paramInt1, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean)
  {
    return AccessibilityNodeInfo.CollectionItemInfo.obtain(paramInt1, paramInt2, paramInt3, paramInt4, paramBoolean);
  }
  
  public static void setCollectionInfo(Object paramObject1, Object paramObject2)
  {
    ((AccessibilityNodeInfo)paramObject1).setCollectionInfo((AccessibilityNodeInfo.CollectionInfo)paramObject2);
  }
  
  public static void setCollectionItemInfo(Object paramObject1, Object paramObject2)
  {
    ((AccessibilityNodeInfo)paramObject1).setCollectionItemInfo((AccessibilityNodeInfo.CollectionItemInfo)paramObject2);
  }
}
