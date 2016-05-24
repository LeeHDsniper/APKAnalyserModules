.class public Lcom/google/android/gms/ads/internal/client/zzk;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# static fields
.field private static final zzpm:Ljava/lang/Object;

.field private static zzsM:Lcom/google/android/gms/ads/internal/client/zzk;


# instance fields
.field private final zzsN:Lcom/google/android/gms/ads/internal/util/client/zza;

.field private final zzsO:Lcom/google/android/gms/ads/internal/client/zze;

.field private final zzsP:Lcom/google/android/gms/ads/internal/client/zzl;

.field private final zzsQ:Lcom/google/android/gms/ads/internal/client/zzac;

.field private final zzsR:Lcom/google/android/gms/internal/zzcx;

.field private final zzsS:Lcom/google/android/gms/ads/internal/reward/client/zzf;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/ads/internal/client/zzk;->zzpm:Ljava/lang/Object;

    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzk;

    invoke-direct {v0}, Lcom/google/android/gms/ads/internal/client/zzk;-><init>()V

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/client/zzk;->zza(Lcom/google/android/gms/ads/internal/client/zzk;)V

    return-void
.end method

.method protected constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/ads/internal/util/client/zza;

    invoke-direct {v0}, Lcom/google/android/gms/ads/internal/util/client/zza;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzk;->zzsN:Lcom/google/android/gms/ads/internal/util/client/zza;

    new-instance v0, Lcom/google/android/gms/ads/internal/client/zze;

    invoke-direct {v0}, Lcom/google/android/gms/ads/internal/client/zze;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzk;->zzsO:Lcom/google/android/gms/ads/internal/client/zze;

    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzl;

    invoke-direct {v0}, Lcom/google/android/gms/ads/internal/client/zzl;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzk;->zzsP:Lcom/google/android/gms/ads/internal/client/zzl;

    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzac;

    invoke-direct {v0}, Lcom/google/android/gms/ads/internal/client/zzac;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzk;->zzsQ:Lcom/google/android/gms/ads/internal/client/zzac;

    new-instance v0, Lcom/google/android/gms/internal/zzcx;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzcx;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzk;->zzsR:Lcom/google/android/gms/internal/zzcx;

    new-instance v0, Lcom/google/android/gms/ads/internal/reward/client/zzf;

    invoke-direct {v0}, Lcom/google/android/gms/ads/internal/reward/client/zzf;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzk;->zzsS:Lcom/google/android/gms/ads/internal/reward/client/zzf;

    return-void
.end method

.method protected static zza(Lcom/google/android/gms/ads/internal/client/zzk;)V
    .registers 3

    sget-object v1, Lcom/google/android/gms/ads/internal/client/zzk;->zzpm:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    sput-object p0, Lcom/google/android/gms/ads/internal/client/zzk;->zzsM:Lcom/google/android/gms/ads/internal/client/zzk;

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method private static zzcD()Lcom/google/android/gms/ads/internal/client/zzk;
    .registers 2

    sget-object v1, Lcom/google/android/gms/ads/internal/client/zzk;->zzpm:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/google/android/gms/ads/internal/client/zzk;->zzsM:Lcom/google/android/gms/ads/internal/client/zzk;

    monitor-exit v1

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public static zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;
    .registers 1

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcD()Lcom/google/android/gms/ads/internal/client/zzk;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/client/zzk;->zzsN:Lcom/google/android/gms/ads/internal/util/client/zza;

    return-object v0
.end method

.method public static zzcF()Lcom/google/android/gms/ads/internal/client/zze;
    .registers 1

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcD()Lcom/google/android/gms/ads/internal/client/zzk;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/client/zzk;->zzsO:Lcom/google/android/gms/ads/internal/client/zze;

    return-object v0
.end method

.method public static zzcG()Lcom/google/android/gms/ads/internal/client/zzl;
    .registers 1

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcD()Lcom/google/android/gms/ads/internal/client/zzk;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/client/zzk;->zzsP:Lcom/google/android/gms/ads/internal/client/zzl;

    return-object v0
.end method

.method public static zzcH()Lcom/google/android/gms/ads/internal/client/zzac;
    .registers 1

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcD()Lcom/google/android/gms/ads/internal/client/zzk;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/client/zzk;->zzsQ:Lcom/google/android/gms/ads/internal/client/zzac;

    return-object v0
.end method

.method public static zzcI()Lcom/google/android/gms/internal/zzcx;
    .registers 1

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcD()Lcom/google/android/gms/ads/internal/client/zzk;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/client/zzk;->zzsR:Lcom/google/android/gms/internal/zzcx;

    return-object v0
.end method

.method public static zzcJ()Lcom/google/android/gms/ads/internal/reward/client/zzf;
    .registers 1

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcD()Lcom/google/android/gms/ads/internal/client/zzk;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/client/zzk;->zzsS:Lcom/google/android/gms/ads/internal/reward/client/zzf;

    return-object v0
.end method
