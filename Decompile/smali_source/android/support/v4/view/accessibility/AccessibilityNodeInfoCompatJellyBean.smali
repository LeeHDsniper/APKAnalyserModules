.class Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompatJellyBean;
.super Ljava/lang/Object;
.source "AccessibilityNodeInfoCompatJellyBean.java"


# direct methods
.method public static isAccessibilityFocused(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .prologue
    .line 73
    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo;

    .end local p0    # "info":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isAccessibilityFocused()Z

    move-result v0

    return v0
.end method

.method public static isVisibleToUser(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .prologue
    .line 37
    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo;

    .end local p0    # "info":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isVisibleToUser()Z

    move-result v0

    return v0
.end method

.method public static setAccesibilityFocused(Ljava/lang/Object;Z)V
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;
    .param p1, "focused"    # Z

    .prologue
    .line 77
    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo;

    .end local p0    # "info":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setAccessibilityFocused(Z)V

    .line 78
    return-void
.end method

.method public static setVisibleToUser(Ljava/lang/Object;Z)V
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;
    .param p1, "visibleToUser"    # Z

    .prologue
    .line 41
    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo;

    .end local p0    # "info":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setVisibleToUser(Z)V

    .line 42
    return-void
.end method
