.class Landroid/support/v4/app/ActivityCompatHoneycomb;
.super Ljava/lang/Object;
.source "ActivityCompatHoneycomb.java"


# direct methods
.method static invalidateOptionsMenu(Landroid/app/Activity;)V
    .registers 1
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 29
    invoke-virtual {p0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 30
    return-void
.end method
