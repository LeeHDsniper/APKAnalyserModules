.class Lit/sephiroth/android/library/picasso/Utils$ActivityManagerHoneycomb;
.super Ljava/lang/Object;
.source "Utils.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ActivityManagerHoneycomb"
.end annotation


# direct methods
.method static getLargeMemoryClass(Landroid/app/ActivityManager;)I
    .registers 2
    .param p0, "activityManager"    # Landroid/app/ActivityManager;

    .prologue
    .line 394
    invoke-virtual {p0}, Landroid/app/ActivityManager;->getLargeMemoryClass()I

    move-result v0

    return v0
.end method
