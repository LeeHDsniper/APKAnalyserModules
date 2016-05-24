.class Lit/sephiroth/android/library/ab/ABSettingsFactory;
.super Ljava/lang/Object;
.source "ABSettingsFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/ab/ABSettingsFactory$ABSettingsManager;
    }
.end annotation


# direct methods
.method private static canUseFileSystem(Landroid/content/Context;)Z
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    .line 37
    .local v0, "filesdir":Ljava/io/File;
    if-eqz v0, :cond_14

    .line 38
    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-virtual {v0}, Ljava/io/File;->canWrite()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 39
    const/4 v1, 0x1

    .line 43
    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method public static create(Landroid/content/Context;)Lit/sephiroth/android/library/ab/ABSettingsFactory$ABSettingsManager;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    invoke-static {p0}, Lit/sephiroth/android/library/ab/ABSettingsFactory;->canUseFileSystem(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 26
    :try_start_6
    new-instance v1, Lit/sephiroth/android/library/ab/ABFilePreference;

    invoke-direct {v1, p0}, Lit/sephiroth/android/library/ab/ABFilePreference;-><init>(Landroid/content/Context;)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_b} :catch_c

    .line 31
    :goto_b
    return-object v1

    .line 27
    :catch_c
    move-exception v0

    .line 28
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 31
    .end local v0    # "e":Ljava/io/IOException;
    :cond_10
    new-instance v1, Lit/sephiroth/android/library/ab/ABSharedPreference;

    invoke-direct {v1, p0}, Lit/sephiroth/android/library/ab/ABSharedPreference;-><init>(Landroid/content/Context;)V

    goto :goto_b
.end method
