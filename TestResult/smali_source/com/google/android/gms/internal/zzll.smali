.class public Lcom/google/android/gms/internal/zzll;
.super Ljava/lang/Object;


# direct methods
.method public static zzi(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 5

    const/4 v0, 0x0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v2, 0x0

    :try_start_6
    invoke-virtual {v1, p1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_c
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_6 .. :try_end_c} :catch_13

    const/high16 v2, 0x200000

    and-int/2addr v1, v2

    if-eqz v1, :cond_12

    const/4 v0, 0x1

    :cond_12
    :goto_12
    return v0

    :catch_13
    move-exception v1

    goto :goto_12
.end method

.method public static zzjk()Z
    .registers 2

    sget-boolean v0, Lcom/google/android/gms/common/internal/zzd;->zzacF:Z

    if-eqz v0, :cond_16

    invoke-static {}, Lcom/google/android/gms/internal/zzkq;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-static {}, Lcom/google/android/gms/internal/zzkq;->zznM()I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v1

    if-ne v0, v1, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method
