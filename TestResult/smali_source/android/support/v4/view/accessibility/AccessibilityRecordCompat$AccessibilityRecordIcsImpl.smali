.class Landroid/support/v4/view/accessibility/AccessibilityRecordCompat$AccessibilityRecordIcsImpl;
.super Landroid/support/v4/view/accessibility/AccessibilityRecordCompat$AccessibilityRecordStubImpl;
.source "AccessibilityRecordCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AccessibilityRecordIcsImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 268
    invoke-direct {p0}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat$AccessibilityRecordStubImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public obtain()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 271
    invoke-static {}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompatIcs;->obtain()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setFromIndex(Ljava/lang/Object;I)V
    .registers 3
    .param p1, "record"    # Ljava/lang/Object;
    .param p2, "fromIndex"    # I

    .prologue
    .line 422
    invoke-static {p1, p2}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompatIcs;->setFromIndex(Ljava/lang/Object;I)V

    .line 423
    return-void
.end method

.method public setItemCount(Ljava/lang/Object;I)V
    .registers 3
    .param p1, "record"    # Ljava/lang/Object;
    .param p2, "itemCount"    # I

    .prologue
    .line 432
    invoke-static {p1, p2}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompatIcs;->setItemCount(Ljava/lang/Object;I)V

    .line 433
    return-void
.end method

.method public setScrollX(Ljava/lang/Object;I)V
    .registers 3
    .param p1, "record"    # Ljava/lang/Object;
    .param p2, "scrollX"    # I

    .prologue
    .line 452
    invoke-static {p1, p2}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompatIcs;->setScrollX(Ljava/lang/Object;I)V

    .line 453
    return-void
.end method

.method public setScrollY(Ljava/lang/Object;I)V
    .registers 3
    .param p1, "record"    # Ljava/lang/Object;
    .param p2, "scrollY"    # I

    .prologue
    .line 457
    invoke-static {p1, p2}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompatIcs;->setScrollY(Ljava/lang/Object;I)V

    .line 458
    return-void
.end method

.method public setScrollable(Ljava/lang/Object;Z)V
    .registers 3
    .param p1, "record"    # Ljava/lang/Object;
    .param p2, "scrollable"    # Z

    .prologue
    .line 462
    invoke-static {p1, p2}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompatIcs;->setScrollable(Ljava/lang/Object;Z)V

    .line 463
    return-void
.end method

.method public setToIndex(Ljava/lang/Object;I)V
    .registers 3
    .param p1, "record"    # Ljava/lang/Object;
    .param p2, "toIndex"    # I

    .prologue
    .line 472
    invoke-static {p1, p2}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompatIcs;->setToIndex(Ljava/lang/Object;I)V

    .line 473
    return-void
.end method
