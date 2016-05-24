.class public Lcom/google/android/gms/internal/zzgw;
.super Lcom/google/android/gms/ads/internal/reward/client/zzb$zza;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzGf:Lcom/google/android/gms/internal/zzgx;

.field private final zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

.field private final zzpc:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V
    .registers 6

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/reward/client/zzb$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgw;->mContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzgw;->zzpa:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    new-instance v0, Lcom/google/android/gms/internal/zzgx;

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzcB()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v1

    invoke-direct {v0, p1, v1, p2, p3}, Lcom/google/android/gms/internal/zzgx;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgw;->zzGf:Lcom/google/android/gms/internal/zzgx;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgw;->zzpc:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public destroy()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgw;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgw;->zzGf:Lcom/google/android/gms/internal/zzgx;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgx;->destroy()V

    monitor-exit v1

    return-void

    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public isLoaded()Z
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgw;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgw;->zzGf:Lcom/google/android/gms/internal/zzgx;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgx;->isLoaded()Z

    move-result v0

    monitor-exit v1

    return v0

    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public pause()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgw;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgw;->zzGf:Lcom/google/android/gms/internal/zzgx;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgx;->pause()V

    monitor-exit v1

    return-void

    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public resume()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgw;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgw;->zzGf:Lcom/google/android/gms/internal/zzgx;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgx;->resume()V

    monitor-exit v1

    return-void

    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public setUserId(Ljava/lang/String;)V
    .registers 4
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgw;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgw;->zzGf:Lcom/google/android/gms/internal/zzgx;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzgx;->setUserId(Ljava/lang/String;)V

    monitor-exit v1

    return-void

    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public show()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgw;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgw;->zzGf:Lcom/google/android/gms/internal/zzgx;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgx;->zzfO()V

    monitor-exit v1

    return-void

    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public zza(Lcom/google/android/gms/ads/internal/reward/client/RewardedVideoAdRequestParcel;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgw;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgw;->zzGf:Lcom/google/android/gms/internal/zzgx;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzgx;->zza(Lcom/google/android/gms/ads/internal/reward/client/RewardedVideoAdRequestParcel;)V

    monitor-exit v1

    return-void

    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public zza(Lcom/google/android/gms/ads/internal/reward/client/zzd;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgw;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgw;->zzGf:Lcom/google/android/gms/internal/zzgx;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzgx;->zza(Lcom/google/android/gms/ads/internal/reward/client/zzd;)V

    monitor-exit v1

    return-void

    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method
