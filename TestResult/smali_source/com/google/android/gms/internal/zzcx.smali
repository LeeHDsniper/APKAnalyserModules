.class public Lcom/google/android/gms/internal/zzcx;
.super Lcom/google/android/gms/dynamic/zzg;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/dynamic/zzg",
        "<",
        "Lcom/google/android/gms/internal/zzcm;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    const-string v0, "com.google.android.gms.ads.NativeAdViewDelegateCreatorImpl"

    invoke-direct {p0, v0}, Lcom/google/android/gms/dynamic/zzg;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method private zzb(Landroid/content/Context;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;)Lcom/google/android/gms/internal/zzcl;
    .registers 9

    :try_start_0
    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzx(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v1

    invoke-static {p2}, Lcom/google/android/gms/dynamic/zze;->zzx(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v2

    invoke-static {p3}, Lcom/google/android/gms/dynamic/zze;->zzx(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v3

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzcx;->zzar(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzcm;

    const v4, 0x7877d8

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/google/android/gms/internal/zzcm;->zza(Lcom/google/android/gms/dynamic/zzd;Lcom/google/android/gms/dynamic/zzd;Lcom/google/android/gms/dynamic/zzd;I)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzcl$zza;->zzu(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzcl;
    :try_end_1c
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_1c} :catch_26
    .catch Lcom/google/android/gms/dynamic/zzg$zza; {:try_start_0 .. :try_end_1c} :catch_1e

    move-result-object v0

    :goto_1d
    return-object v0

    :catch_1e
    move-exception v0

    :goto_1f
    const-string v1, "Could not create remote NativeAdViewDelegate."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    goto :goto_1d

    :catch_26
    move-exception v0

    goto :goto_1f
.end method


# virtual methods
.method protected zzD(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzcm;
    .registers 3

    invoke-static {p1}, Lcom/google/android/gms/internal/zzcm$zza;->zzv(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzcm;

    move-result-object v0

    return-object v0
.end method

.method public zza(Landroid/content/Context;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;)Lcom/google/android/gms/internal/zzcl;
    .registers 5

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzR(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/zzcx;->zzb(Landroid/content/Context;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;)Lcom/google/android/gms/internal/zzcl;

    move-result-object v0

    if-nez v0, :cond_1a

    :cond_10
    const-string v0, "Using NativeAdViewDelegate from the client jar."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/ads/internal/formats/zzj;

    invoke-direct {v0, p2, p3}, Lcom/google/android/gms/ads/internal/formats/zzj;-><init>(Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;)V

    :cond_1a
    return-object v0
.end method

.method protected synthetic zzd(Landroid/os/IBinder;)Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzcx;->zzD(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzcm;

    move-result-object v0

    return-object v0
.end method
