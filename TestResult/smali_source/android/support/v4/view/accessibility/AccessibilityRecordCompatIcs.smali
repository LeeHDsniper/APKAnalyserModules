.class Landroid/support/v4/view/accessibility/AccessibilityRecordCompatIcs;
.super Ljava/lang/Object;
.source "AccessibilityRecordCompatIcs.java"


# direct methods
.method public static obtain()Ljava/lang/Object;
    .registers 1

    .prologue
    .line 31
    invoke-static {}, Landroid/view/accessibility/AccessibilityRecord;->obtain()Landroid/view/accessibility/AccessibilityRecord;

    move-result-object v0

    return-object v0
.end method

.method public static setFromIndex(Ljava/lang/Object;I)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "fromIndex"    # I

    .prologue
    .line 151
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setFromIndex(I)V

    .line 152
    return-void
.end method

.method public static setItemCount(Ljava/lang/Object;I)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "itemCount"    # I

    .prologue
    .line 159
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setItemCount(I)V

    .line 160
    return-void
.end method

.method public static setScrollX(Ljava/lang/Object;I)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "scrollX"    # I

    .prologue
    .line 175
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setScrollX(I)V

    .line 176
    return-void
.end method

.method public static setScrollY(Ljava/lang/Object;I)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "scrollY"    # I

    .prologue
    .line 179
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setScrollY(I)V

    .line 180
    return-void
.end method

.method public static setScrollable(Ljava/lang/Object;Z)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "scrollable"    # Z

    .prologue
    .line 183
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setScrollable(Z)V

    .line 184
    return-void
.end method

.method public static setToIndex(Ljava/lang/Object;I)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "toIndex"    # I

    .prologue
    .line 191
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setToIndex(I)V

    .line 192
    return-void
.end method
