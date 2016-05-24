.class Landroid/support/v4/view/ViewConfigurationCompatICS;
.super Ljava/lang/Object;
.source "ViewConfigurationCompatICS.java"


# direct methods
.method static hasPermanentMenuKey(Landroid/view/ViewConfiguration;)Z
    .registers 2
    .param p0, "config"    # Landroid/view/ViewConfiguration;

    .prologue
    .line 26
    invoke-virtual {p0}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v0

    return v0
.end method
