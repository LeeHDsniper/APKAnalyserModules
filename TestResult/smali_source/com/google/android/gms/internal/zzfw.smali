.class public abstract Lcom/google/android/gms/internal/zzfw;
.super Lcom/google/android/gms/internal/zzfz;

# interfaces
.implements Lcom/google/android/gms/internal/zziq$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzCq:Lcom/google/android/gms/internal/zziq;

.field protected zzCr:Z

.field private zzyg:Z


# direct methods
.method protected constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/internal/zzga$zza;)V
    .registers 6

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzfz;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/internal/zzga$zza;)V

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzfw;->zzCr:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzfw;->zzyg:Z

    invoke-interface {p3}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfw;->zzCq:Lcom/google/android/gms/internal/zziq;

    return-void
.end method

.method private zze(J)Z
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzfz$zza;
        }
    .end annotation

    const-wide/32 v0, 0xea60

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sub-long/2addr v2, p1

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1

    cmp-long v2, v0, v2

    if-gtz v2, :cond_11

    const/4 v0, 0x0

    :goto_10
    return v0

    :cond_11
    :try_start_11
    iget-object v2, p0, Lcom/google/android/gms/internal/zzfw;->zzpc:Ljava/lang/Object;

    invoke-virtual {v2, v0, v1}, Ljava/lang/Object;->wait(J)V
    :try_end_16
    .catch Ljava/lang/InterruptedException; {:try_start_11 .. :try_end_16} :catch_18

    const/4 v0, 0x1

    goto :goto_10

    :catch_18
    move-exception v0

    new-instance v0, Lcom/google/android/gms/internal/zzfz$zza;

    const-string v1, "Ad request cancelled."

    const/4 v2, -0x1

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzfz$zza;-><init>(Ljava/lang/String;I)V

    throw v0
.end method


# virtual methods
.method public onStop()V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfw;->zzCE:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfw;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->stopLoading()V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfw;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzhv;->zza(Landroid/webkit/WebView;)Z

    monitor-exit v1

    return-void

    :catchall_17
    move-exception v0

    monitor-exit v1
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_17

    throw v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzip;Z)V
    .registers 6

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfw;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_4
    const-string v2, "WebView finished loading."

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzfw;->zzCr:Z

    if-nez p2, :cond_17

    :goto_e
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzfw;->zzyg:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfw;->zzpc:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    monitor-exit v1

    return-void

    :cond_17
    const/4 v0, 0x0

    goto :goto_e

    :catchall_19
    move-exception v0

    monitor-exit v1
    :try_end_1b
    .catchall {:try_start_4 .. :try_end_1b} :catchall_19

    throw v0
.end method

.method protected zzg(J)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzfz$zza;
        }
    .end annotation

    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzfw;->zze(J)Z

    move-result v0

    if-nez v0, :cond_f

    new-instance v0, Lcom/google/android/gms/internal/zzfz$zza;

    const-string v1, "Timed out waiting for WebView to finish loading."

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzfz$zza;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_f
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzfw;->zzyg:Z

    if-eqz v0, :cond_1c

    new-instance v0, Lcom/google/android/gms/internal/zzfz$zza;

    const-string v1, "Received cancellation request from creative."

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzfz$zza;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_1c
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzfw;->zzCr:Z

    if-eqz v0, :cond_0

    return-void
.end method
