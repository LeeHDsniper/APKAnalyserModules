.class public Lcom/google/android/gms/internal/zzhz;
.super Ljava/lang/Object;


# instance fields
.field private zzIn:Landroid/os/HandlerThread;

.field private zzIo:I

.field private final zzpc:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhz;->zzIn:Landroid/os/HandlerThread;

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/zzhz;->zzIo:I

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhz;->zzpc:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public zzgB()Landroid/os/Looper;
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhz;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhz;->zzIn:Landroid/os/HandlerThread;

    if-nez v0, :cond_24

    iget v0, p0, Lcom/google/android/gms/internal/zzhz;->zzIo:I

    if-nez v0, :cond_32

    const/4 v0, 0x1

    :goto_c
    const-string v2, "Invalid state: mHandlerThread should already been initialized."

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/zzx;->zzb(ZLjava/lang/Object;)V

    const-string v0, "Starting the looper provider thread."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    new-instance v0, Landroid/os/HandlerThread;

    const-string v2, "LooperProvider"

    invoke-direct {v0, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhz;->zzIn:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhz;->zzIn:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    :cond_24
    iget v0, p0, Lcom/google/android/gms/internal/zzhz;->zzIo:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzhz;->zzIo:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhz;->zzIn:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    monitor-exit v1

    return-object v0

    :cond_32
    const/4 v0, 0x0

    goto :goto_c

    :catchall_34
    move-exception v0

    monitor-exit v1
    :try_end_36
    .catchall {:try_start_3 .. :try_end_36} :catchall_34

    throw v0
.end method

.method public zzgC()V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhz;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget v0, p0, Lcom/google/android/gms/internal/zzhz;->zzIo:I

    if-lez v0, :cond_24

    const/4 v0, 0x1

    :goto_8
    const-string v2, "Invalid state: release() called more times than expected."

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/zzx;->zzb(ZLjava/lang/Object;)V

    iget v0, p0, Lcom/google/android/gms/internal/zzhz;->zzIo:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzhz;->zzIo:I

    if-nez v0, :cond_22

    const-string v0, "Terminate the looper provider thread."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhz;->zzIn:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhz;->zzIn:Landroid/os/HandlerThread;

    :cond_22
    monitor-exit v1

    return-void

    :cond_24
    const/4 v0, 0x0

    goto :goto_8

    :catchall_26
    move-exception v0

    monitor-exit v1
    :try_end_28
    .catchall {:try_start_3 .. :try_end_28} :catchall_26

    throw v0
.end method
