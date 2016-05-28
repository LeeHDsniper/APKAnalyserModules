.class public Lcom/google/android/gms/ads/internal/client/zzaa;
.super Ljava/lang/Object;


# static fields
.field private static final zzpm:Ljava/lang/Object;

.field private static zztt:Lcom/google/android/gms/ads/internal/client/zzaa;


# instance fields
.field private zztu:Lcom/google/android/gms/ads/internal/client/zzv;

.field private zztv:Lcom/google/android/gms/ads/reward/RewardedVideoAd;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/ads/internal/client/zzaa;->zzpm:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static zzcU()Lcom/google/android/gms/ads/internal/client/zzaa;
    .registers 2

    sget-object v1, Lcom/google/android/gms/ads/internal/client/zzaa;->zzpm:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/google/android/gms/ads/internal/client/zzaa;->zztt:Lcom/google/android/gms/ads/internal/client/zzaa;

    if-nez v0, :cond_e

    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzaa;

    invoke-direct {v0}, Lcom/google/android/gms/ads/internal/client/zzaa;-><init>()V

    sput-object v0, Lcom/google/android/gms/ads/internal/client/zzaa;->zztt:Lcom/google/android/gms/ads/internal/client/zzaa;

    :cond_e
    sget-object v0, Lcom/google/android/gms/ads/internal/client/zzaa;->zztt:Lcom/google/android/gms/ads/internal/client/zzaa;

    monitor-exit v1

    return-object v0

    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    throw v0
.end method


# virtual methods
.method public getRewardedVideoAdInstance(Landroid/content/Context;)Lcom/google/android/gms/ads/reward/RewardedVideoAd;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    sget-object v1, Lcom/google/android/gms/ads/internal/client/zzaa;->zzpm:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzaa;->zztv:Lcom/google/android/gms/ads/reward/RewardedVideoAd;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzaa;->zztv:Lcom/google/android/gms/ads/reward/RewardedVideoAd;

    monitor-exit v1

    :goto_a
    return-object v0

    :cond_b
    new-instance v0, Lcom/google/android/gms/internal/zzeg;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzeg;-><init>()V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcJ()Lcom/google/android/gms/ads/internal/reward/client/zzf;

    move-result-object v2

    invoke-virtual {v2, p1, v0}, Lcom/google/android/gms/ads/internal/reward/client/zzf;->zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzeg;)Lcom/google/android/gms/ads/internal/reward/client/zzb;

    move-result-object v0

    new-instance v2, Lcom/google/android/gms/ads/internal/reward/client/zzi;

    invoke-direct {v2, p1, v0}, Lcom/google/android/gms/ads/internal/reward/client/zzi;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/reward/client/zzb;)V

    iput-object v2, p0, Lcom/google/android/gms/ads/internal/client/zzaa;->zztv:Lcom/google/android/gms/ads/reward/RewardedVideoAd;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzaa;->zztv:Lcom/google/android/gms/ads/reward/RewardedVideoAd;

    monitor-exit v1

    goto :goto_a

    :catchall_23
    move-exception v0

    monitor-exit v1
    :try_end_25
    .catchall {:try_start_3 .. :try_end_25} :catchall_23

    throw v0
.end method

.method public zza(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/zzab;)V
    .registers 7

    sget-object v1, Lcom/google/android/gms/ads/internal/client/zzaa;->zzpm:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzaa;->zztu:Lcom/google/android/gms/ads/internal/client/zzv;

    if-eqz v0, :cond_9

    monitor-exit v1

    :goto_8
    return-void

    :cond_9
    if-nez p1, :cond_16

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "Context cannot be null."

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_13

    throw v0

    :cond_16
    :try_start_16
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_24

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "applicationCode cannot be empty."

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_24
    .catchall {:try_start_16 .. :try_end_24} :catchall_13

    :cond_24
    :try_start_24
    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcH()Lcom/google/android/gms/ads/internal/client/zzac;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/client/zzac;->zzt(Landroid/content/Context;)Lcom/google/android/gms/ads/internal/client/zzv;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzaa;->zztu:Lcom/google/android/gms/ads/internal/client/zzv;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/client/zzaa;->zztu:Lcom/google/android/gms/ads/internal/client/zzv;

    if-nez p3, :cond_38

    const/4 v0, 0x0

    :goto_33
    invoke-interface {v2, p2, v0}, Lcom/google/android/gms/ads/internal/client/zzv;->zza(Ljava/lang/String;Lcom/google/android/gms/ads/internal/client/MobileAdsSettingsParcel;)V
    :try_end_36
    .catch Landroid/os/RemoteException; {:try_start_24 .. :try_end_36} :catch_3e
    .catchall {:try_start_24 .. :try_end_36} :catchall_13

    :goto_36
    :try_start_36
    monitor-exit v1
    :try_end_37
    .catchall {:try_start_36 .. :try_end_37} :catchall_13

    goto :goto_8

    :cond_38
    :try_start_38
    new-instance v0, Lcom/google/android/gms/ads/internal/client/MobileAdsSettingsParcel;

    invoke-direct {v0, p3}, Lcom/google/android/gms/ads/internal/client/MobileAdsSettingsParcel;-><init>(Lcom/google/android/gms/ads/internal/client/zzab;)V
    :try_end_3d
    .catch Landroid/os/RemoteException; {:try_start_38 .. :try_end_3d} :catch_3e
    .catchall {:try_start_38 .. :try_end_3d} :catchall_13

    goto :goto_33

    :catch_3e
    move-exception v0

    :try_start_3f
    const-string v0, "Fail to initialize mobile ads setting manager"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V
    :try_end_44
    .catchall {:try_start_3f .. :try_end_44} :catchall_13

    goto :goto_36
.end method
