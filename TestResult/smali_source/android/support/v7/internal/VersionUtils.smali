.class public Landroid/support/v7/internal/VersionUtils;
.super Ljava/lang/Object;
.source "VersionUtils.java"


# direct methods
.method public static isAtLeastL()Z
    .registers 2

    .prologue
    .line 13
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method
