.class public abstract Lcom/google/android/gms/internal/zzdr;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/Releasable;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field protected zzoL:Lcom/google/android/gms/internal/zzip;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzip;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdr;->zzoL:Lcom/google/android/gms/internal/zzip;

    return-void
.end method


# virtual methods
.method public abstract abort()V
.end method

.method public release()V
    .registers 1

    return-void
.end method

.method public abstract zzZ(Ljava/lang/String;)Z
.end method

.method protected zza(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 6

    sget-object v0, Lcom/google/android/gms/ads/internal/util/client/zza;->zzIy:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzdr$2;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/google/android/gms/internal/zzdr$2;-><init>(Lcom/google/android/gms/internal/zzdr;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method protected zza(Ljava/lang/String;Ljava/lang/String;IIZ)V
    .registers 14

    sget-object v7, Lcom/google/android/gms/ads/internal/util/client/zza;->zzIy:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/gms/internal/zzdr$1;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/zzdr$1;-><init>(Lcom/google/android/gms/internal/zzdr;Ljava/lang/String;Ljava/lang/String;IIZ)V

    invoke-virtual {v7, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method protected zzaa(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzaB(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected zzf(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    sget-object v0, Lcom/google/android/gms/ads/internal/util/client/zza;->zzIy:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzdr$3;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/android/gms/internal/zzdr$3;-><init>(Lcom/google/android/gms/internal/zzdr;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
