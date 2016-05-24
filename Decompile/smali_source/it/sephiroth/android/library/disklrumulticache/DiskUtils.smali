.class public Lit/sephiroth/android/library/disklrumulticache/DiskUtils;
.super Ljava/lang/Object;
.source "DiskUtils.java"


# direct methods
.method public static getExternalCacheDir(Landroid/content/Context;)Ljava/io/File;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    invoke-static {}, Lit/sephiroth/android/library/disklrumulticache/DiskUtils;->hasExternalCacheDir()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 25
    invoke-virtual {p0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    .line 26
    .local v0, "file":Ljava/io/File;
    if-eqz v0, :cond_d

    .line 30
    .end local v0    # "file":Ljava/io/File;
    :goto_c
    return-object v0

    :cond_d
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    goto :goto_c
.end method

.method public static hasExternalCacheDir()Z
    .registers 2

    .prologue
    .line 20
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isExternalStorageRemovable()Z
    .registers 2

    .prologue
    .line 13
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x9

    if-lt v0, v1, :cond_b

    .line 14
    invoke-static {}, Landroid/os/Environment;->isExternalStorageRemovable()Z

    move-result v0

    .line 16
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x1

    goto :goto_a
.end method
