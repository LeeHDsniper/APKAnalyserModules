.class public final Lcom/nostra13/universalimageloader/utils/StorageUtils;
.super Ljava/lang/Object;
.source "StorageUtils.java"


# direct methods
.method public static getCacheDirectory(Landroid/content/Context;)Ljava/io/File;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 52
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/nostra13/universalimageloader/utils/StorageUtils;->getCacheDirectory(Landroid/content/Context;Z)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static getCacheDirectory(Landroid/content/Context;Z)Ljava/io/File;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "preferExternal"    # Z

    .prologue
    .line 67
    const/4 v0, 0x0

    .line 68
    .local v0, "appCacheDir":Ljava/io/File;
    if-eqz p1, :cond_19

    const-string v2, "mounted"

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-static {p0}, Lcom/nostra13/universalimageloader/utils/StorageUtils;->hasExternalStoragePermission(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_19

    .line 70
    invoke-static {p0}, Lcom/nostra13/universalimageloader/utils/StorageUtils;->getExternalCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 72
    :cond_19
    if-nez v0, :cond_1f

    .line 73
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    .line 75
    :cond_1f
    if-nez v0, :cond_4e

    .line 76
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/data/data/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/cache/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 77
    .local v1, "cacheDirPath":Ljava/lang/String;
    const-string v2, "Can\'t define system cache directory! \'%s\' will be used."

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    invoke-static {v2, v3}, Lcom/nostra13/universalimageloader/utils/L;->w(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 78
    new-instance v0, Ljava/io/File;

    .end local v0    # "appCacheDir":Ljava/io/File;
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 80
    .end local v1    # "cacheDirPath":Ljava/lang/String;
    .restart local v0    # "appCacheDir":Ljava/io/File;
    :cond_4e
    return-object v0
.end method

.method private static getExternalCacheDir(Landroid/content/Context;)Ljava/io/File;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x0

    .line 122
    new-instance v1, Ljava/io/File;

    new-instance v3, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    const-string v5, "Android"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string v4, "data"

    invoke-direct {v1, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 123
    .local v1, "dataDir":Ljava/io/File;
    new-instance v0, Ljava/io/File;

    new-instance v3, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string v4, "cache"

    invoke-direct {v0, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 124
    .local v0, "appCacheDir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_37

    .line 125
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v3

    if-nez v3, :cond_38

    .line 126
    const-string v3, "Unable to create external cache directory"

    new-array v4, v6, [Ljava/lang/Object;

    invoke-static {v3, v4}, Lcom/nostra13/universalimageloader/utils/L;->w(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 127
    const/4 v0, 0x0

    .line 135
    .end local v0    # "appCacheDir":Ljava/io/File;
    :cond_37
    :goto_37
    return-object v0

    .line 130
    .restart local v0    # "appCacheDir":Ljava/io/File;
    :cond_38
    :try_start_38
    new-instance v3, Ljava/io/File;

    const-string v4, ".nomedia"

    invoke-direct {v3, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z
    :try_end_42
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_42} :catch_43

    goto :goto_37

    .line 131
    :catch_43
    move-exception v2

    .line 132
    .local v2, "e":Ljava/io/IOException;
    const-string v3, "Can\'t create \".nomedia\" file in application external cache directory"

    new-array v4, v6, [Ljava/lang/Object;

    invoke-static {v3, v4}, Lcom/nostra13/universalimageloader/utils/L;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_37
.end method

.method public static getIndividualCacheDirectory(Landroid/content/Context;)Ljava/io/File;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 92
    invoke-static {p0}, Lcom/nostra13/universalimageloader/utils/StorageUtils;->getCacheDirectory(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 93
    .local v0, "cacheDir":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    const-string v2, "uil-images"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 94
    .local v1, "individualCacheDir":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_18

    .line 95
    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    move-result v2

    if-nez v2, :cond_18

    .line 96
    move-object v1, v0

    .line 99
    :cond_18
    return-object v1
.end method

.method private static hasExternalStoragePermission(Landroid/content/Context;)Z
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 139
    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {p0, v1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    .line 140
    .local v0, "perm":I
    if-nez v0, :cond_a

    const/4 v1, 0x1

    :goto_9
    return v1

    :cond_a
    const/4 v1, 0x0

    goto :goto_9
.end method
