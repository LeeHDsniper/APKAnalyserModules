.class public final Lcom/google/android/gms/internal/zzlv;
.super Ljava/lang/Object;


# direct methods
.method public static isAtLeastL()Z
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-static {}, Lcom/google/android/gms/internal/zzlv;->zzpX()Z

    move-result v0

    return v0
.end method

.method private static zzbZ(I)Z
    .registers 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, p0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static zzpO()Z
    .registers 1

    const/16 v0, 0xb

    invoke-static {v0}, Lcom/google/android/gms/internal/zzlv;->zzbZ(I)Z

    move-result v0

    return v0
.end method

.method public static zzpQ()Z
    .registers 1

    const/16 v0, 0xd

    invoke-static {v0}, Lcom/google/android/gms/internal/zzlv;->zzbZ(I)Z

    move-result v0

    return v0
.end method

.method public static zzpR()Z
    .registers 1

    const/16 v0, 0xe

    invoke-static {v0}, Lcom/google/android/gms/internal/zzlv;->zzbZ(I)Z

    move-result v0

    return v0
.end method

.method public static zzpT()Z
    .registers 1

    const/16 v0, 0x11

    invoke-static {v0}, Lcom/google/android/gms/internal/zzlv;->zzbZ(I)Z

    move-result v0

    return v0
.end method

.method public static zzpU()Z
    .registers 1

    const/16 v0, 0x12

    invoke-static {v0}, Lcom/google/android/gms/internal/zzlv;->zzbZ(I)Z

    move-result v0

    return v0
.end method

.method public static zzpV()Z
    .registers 1

    const/16 v0, 0x13

    invoke-static {v0}, Lcom/google/android/gms/internal/zzlv;->zzbZ(I)Z

    move-result v0

    return v0
.end method

.method public static zzpW()Z
    .registers 1

    const/16 v0, 0x14

    invoke-static {v0}, Lcom/google/android/gms/internal/zzlv;->zzbZ(I)Z

    move-result v0

    return v0
.end method

.method public static zzpX()Z
    .registers 1

    const/16 v0, 0x15

    invoke-static {v0}, Lcom/google/android/gms/internal/zzlv;->zzbZ(I)Z

    move-result v0

    return v0
.end method
