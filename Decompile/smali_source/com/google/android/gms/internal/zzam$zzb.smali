.class final Lcom/google/android/gms/internal/zzam$zzb;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzam;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "zzb"
.end annotation


# instance fields
.field private zznx:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzam$zzb;->zznx:Landroid/content/Context;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzam$zzb;->zznx:Landroid/content/Context;

    if-nez v0, :cond_f

    iput-object p1, p0, Lcom/google/android/gms/internal/zzam$zzb;->zznx:Landroid/content/Context;

    :cond_f
    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    :try_start_0
    new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzam$zzb;->zznx:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->start()V

    const-class v1, Lcom/google/android/gms/internal/zzam;

    monitor-enter v1
    :try_end_d
    .catch Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException; {:try_start_0 .. :try_end_d} :catch_26
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_d} :catch_2e
    .catch Lcom/google/android/gms/common/GooglePlayServicesRepairableException; {:try_start_0 .. :try_end_d} :catch_2c

    :try_start_d
    invoke-static {}, Lcom/google/android/gms/internal/zzam;->zzZ()Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;

    move-result-object v2

    if-nez v2, :cond_1f

    invoke-static {v0}, Lcom/google/android/gms/internal/zzam;->zza(Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;

    :goto_16
    monitor-exit v1
    :try_end_17
    .catchall {:try_start_d .. :try_end_17} :catchall_23

    :goto_17
    invoke-static {}, Lcom/google/android/gms/internal/zzam;->zzaa()Ljava/util/concurrent/CountDownLatch;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void

    :cond_1f
    :try_start_1f
    invoke-virtual {v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->finish()V

    goto :goto_16

    :catchall_23
    move-exception v0

    monitor-exit v1
    :try_end_25
    .catchall {:try_start_1f .. :try_end_25} :catchall_23

    :try_start_25
    throw v0
    :try_end_26
    .catch Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException; {:try_start_25 .. :try_end_26} :catch_26
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_26} :catch_2e
    .catch Lcom/google/android/gms/common/GooglePlayServicesRepairableException; {:try_start_25 .. :try_end_26} :catch_2c

    :catch_26
    move-exception v0

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/google/android/gms/internal/zzam;->zza(Z)Z

    goto :goto_17

    :catch_2c
    move-exception v0

    goto :goto_17

    :catch_2e
    move-exception v0

    goto :goto_17
.end method
