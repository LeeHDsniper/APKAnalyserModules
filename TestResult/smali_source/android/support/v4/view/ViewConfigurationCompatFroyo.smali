.class Landroid/support/v4/view/ViewConfigurationCompatFroyo;
.super Ljava/lang/Object;
.source "ViewConfigurationCompatFroyo.java"


# direct methods
.method public static getScaledPagingTouchSlop(Landroid/view/ViewConfiguration;)I
    .registers 2
    .param p0, "config"    # Landroid/view/ViewConfiguration;

    .prologue
    .line 26
    invoke-virtual {p0}, Landroid/view/ViewConfiguration;->getScaledPagingTouchSlop()I

    move-result v0

    return v0
.end method
