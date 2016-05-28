.class public final Lcom/google/android/gms/internal/zzec;
.super Lcom/google/android/gms/internal/zzej$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzpc:Ljava/lang/Object;

.field private zzyF:Lcom/google/android/gms/internal/zzee$zza;

.field private zzyG:Lcom/google/android/gms/internal/zzeb;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzej$zza;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzec;->zzpc:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public onAdClicked()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzec;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzec;->zzyG:Lcom/google/android/gms/internal/zzeb;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/google/android/gms/internal/zzec;->zzyG:Lcom/google/android/gms/internal/zzeb;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzeb;->zzaX()V

    :cond_c
    monitor-exit v1

    return-void

    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v0
.end method

.method public onAdClosed()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzec;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzec;->zzyG:Lcom/google/android/gms/internal/zzeb;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/google/android/gms/internal/zzec;->zzyG:Lcom/google/android/gms/internal/zzeb;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzeb;->zzaY()V

    :cond_c
    monitor-exit v1

    return-void

    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v0
.end method

.method public onAdFailedToLoad(I)V
    .registers 5
    .param p1, "error"    # I

    .prologue
    iget-object v1, p0, Lcom/google/android/gms/internal/zzec;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzec;->zzyF:Lcom/google/android/gms/internal/zzee$zza;

    if-eqz v0, :cond_13

    const/4 v0, 0x3

    if-ne p1, v0, :cond_15

    const/4 v0, 0x1

    :goto_b
    iget-object v2, p0, Lcom/google/android/gms/internal/zzec;->zzyF:Lcom/google/android/gms/internal/zzee$zza;

    invoke-interface {v2, v0}, Lcom/google/android/gms/internal/zzee$zza;->zzq(I)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzec;->zzyF:Lcom/google/android/gms/internal/zzee$zza;

    :cond_13
    monitor-exit v1

    return-void

    :cond_15
    const/4 v0, 0x2

    goto :goto_b

    :catchall_17
    move-exception v0

    monitor-exit v1
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_17

    throw v0
.end method

.method public onAdLeftApplication()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzec;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzec;->zzyG:Lcom/google/android/gms/internal/zzeb;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/google/android/gms/internal/zzec;->zzyG:Lcom/google/android/gms/internal/zzeb;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzeb;->zzaZ()V

    :cond_c
    monitor-exit v1

    return-void

    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v0
.end method

.method public onAdLoaded()V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzec;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzec;->zzyF:Lcom/google/android/gms/internal/zzee$zza;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/google/android/gms/internal/zzec;->zzyF:Lcom/google/android/gms/internal/zzee$zza;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/zzee$zza;->zzq(I)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzec;->zzyF:Lcom/google/android/gms/internal/zzee$zza;

    monitor-exit v1

    :goto_11
    return-void

    :cond_12
    iget-object v0, p0, Lcom/google/android/gms/internal/zzec;->zzyG:Lcom/google/android/gms/internal/zzeb;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lcom/google/android/gms/internal/zzec;->zzyG:Lcom/google/android/gms/internal/zzeb;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzeb;->zzbb()V

    :cond_1b
    monitor-exit v1

    goto :goto_11

    :catchall_1d
    move-exception v0

    monitor-exit v1
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_1d

    throw v0
.end method

.method public onAdOpened()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzec;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzec;->zzyG:Lcom/google/android/gms/internal/zzeb;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/google/android/gms/internal/zzec;->zzyG:Lcom/google/android/gms/internal/zzeb;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzeb;->zzba()V

    :cond_c
    monitor-exit v1

    return-void

    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzeb;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzec;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-object p1, p0, Lcom/google/android/gms/internal/zzec;->zzyG:Lcom/google/android/gms/internal/zzeb;

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzee$zza;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzec;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-object p1, p0, Lcom/google/android/gms/internal/zzec;->zzyF:Lcom/google/android/gms/internal/zzee$zza;

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method
