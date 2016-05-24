.class Landroid/support/v4/view/accessibility/AccessibilityRecordCompatIcsMr1;
.super Ljava/lang/Object;
.source "AccessibilityRecordCompatIcsMr1.java"


# direct methods
.method public static setMaxScrollX(Ljava/lang/Object;I)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "maxScrollX"    # I

    .prologue
    .line 34
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setMaxScrollX(I)V

    .line 35
    return-void
.end method

.method public static setMaxScrollY(Ljava/lang/Object;I)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "maxScrollY"    # I

    .prologue
    .line 38
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setMaxScrollY(I)V

    .line 39
    return-void
.end method
