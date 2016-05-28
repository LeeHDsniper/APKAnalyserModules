.class public Lcom/google/android/gms/analytics/internal/zzx;
.super Ljava/lang/Object;


# direct methods
.method public static version()I
    .registers 2

    :try_start_0
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v0

    :goto_6
    return v0

    :catch_7
    move-exception v0

    const-string v0, "Invalid version number"

    sget-object v1, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/android/gms/analytics/internal/zzae;->zzf(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x0

    goto :goto_6
.end method

.method public static zzbj(Ljava/lang/String;)Z
    .registers 5

    const/4 v1, 0x1

    const/4 v0, 0x0

    const/16 v2, 0x9

    invoke-static {}, Lcom/google/android/gms/analytics/internal/zzx;->version()I

    move-result v3

    if-ge v3, v2, :cond_b

    :goto_a
    return v0

    :cond_b
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0, v0}, Ljava/io/File;->setReadable(ZZ)Z

    invoke-virtual {v2, v0, v0}, Ljava/io/File;->setWritable(ZZ)Z

    invoke-virtual {v2, v1, v1}, Ljava/io/File;->setReadable(ZZ)Z

    invoke-virtual {v2, v1, v1}, Ljava/io/File;->setWritable(ZZ)Z

    move v0, v1

    goto :goto_a
.end method
