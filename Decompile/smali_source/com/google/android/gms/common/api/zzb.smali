.class public abstract Lcom/google/android/gms/common/api/zzb;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/PendingResult;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/api/zzb$zza;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R::",
        "Lcom/google/android/gms/common/api/Result;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/common/api/PendingResult",
        "<TR;>;"
    }
.end annotation


# instance fields
.field private zzL:Z

.field private final zzYD:Ljava/lang/Object;

.field protected final zzYE:Lcom/google/android/gms/common/api/zzb$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/zzb$zza",
            "<TR;>;"
        }
    .end annotation
.end field

.field private final zzYF:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/common/api/PendingResult$BatchCallback;",
            ">;"
        }
    .end annotation
.end field

.field private zzYG:Lcom/google/android/gms/common/api/ResultCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/ResultCallback",
            "<TR;>;"
        }
    .end annotation
.end field

.field private volatile zzYH:Lcom/google/android/gms/common/api/Result;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TR;"
        }
    .end annotation
.end field

.field private volatile zzYI:Z

.field private zzYJ:Z

.field private zzYK:Lcom/google/android/gms/common/internal/zzq;

.field private final zzoR:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method protected constructor <init>(Landroid/os/Looper;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYD:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzoR:Ljava/util/concurrent/CountDownLatch;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYF:Ljava/util/ArrayList;

    new-instance v0, Lcom/google/android/gms/common/api/zzb$zza;

    invoke-direct {v0, p1}, Lcom/google/android/gms/common/api/zzb$zza;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYE:Lcom/google/android/gms/common/api/zzb$zza;

    return-void
.end method

.method private get()Lcom/google/android/gms/common/api/Result;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TR;"
        }
    .end annotation

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzb;->zzYD:Ljava/lang/Object;

    monitor-enter v1

    :try_start_4
    iget-boolean v2, p0, Lcom/google/android/gms/common/api/zzb;->zzYI:Z

    if-nez v2, :cond_26

    :goto_8
    const-string v2, "Result has already been consumed."

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/zzx;->zza(ZLjava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzb;->isReady()Z

    move-result v0

    const-string v2, "Result is not ready."

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/zzx;->zza(ZLjava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYH:Lcom/google/android/gms/common/api/Result;

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzb;->zzYH:Lcom/google/android/gms/common/api/Result;

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/android/gms/common/api/zzb;->zzYG:Lcom/google/android/gms/common/api/ResultCallback;

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/google/android/gms/common/api/zzb;->zzYI:Z

    monitor-exit v1
    :try_end_22
    .catchall {:try_start_4 .. :try_end_22} :catchall_28

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzb;->zzmZ()V

    return-object v0

    :cond_26
    const/4 v0, 0x0

    goto :goto_8

    :catchall_28
    move-exception v0

    :try_start_29
    monitor-exit v1
    :try_end_2a
    .catchall {:try_start_29 .. :try_end_2a} :catchall_28

    throw v0
.end method

.method private zzb(Lcom/google/android/gms/common/api/Result;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzb;->zzYH:Lcom/google/android/gms/common/api/Result;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYK:Lcom/google/android/gms/common/internal/zzq;

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzoR:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYH:Lcom/google/android/gms/common/api/Result;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Result;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYG:Lcom/google/android/gms/common/api/ResultCallback;

    if-eqz v0, :cond_28

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYE:Lcom/google/android/gms/common/api/zzb$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/zzb$zza;->zzna()V

    iget-boolean v0, p0, Lcom/google/android/gms/common/api/zzb;->zzL:Z

    if-nez v0, :cond_28

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYE:Lcom/google/android/gms/common/api/zzb$zza;

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzb;->zzYG:Lcom/google/android/gms/common/api/ResultCallback;

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzb;->get()Lcom/google/android/gms/common/api/Result;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/common/api/zzb$zza;->zza(Lcom/google/android/gms/common/api/ResultCallback;Lcom/google/android/gms/common/api/Result;)V

    :cond_28
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYF:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/PendingResult$BatchCallback;

    invoke-interface {v0, v1}, Lcom/google/android/gms/common/api/PendingResult$BatchCallback;->onComplete(Lcom/google/android/gms/common/api/Status;)V

    goto :goto_2e

    :cond_3e
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYF:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method static zzc(Lcom/google/android/gms/common/api/Result;)V
    .registers 6

    instance-of v1, p0, Lcom/google/android/gms/common/api/Releasable;

    if-eqz v1, :cond_b

    :try_start_4
    move-object v0, p0

    check-cast v0, Lcom/google/android/gms/common/api/Releasable;

    move-object v1, v0

    invoke-interface {v1}, Lcom/google/android/gms/common/api/Releasable;->release()V
    :try_end_b
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_b} :catch_c

    :cond_b
    :goto_b
    return-void

    :catch_c
    move-exception v1

    const-string v2, "AbstractPendingResult"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to release "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_b
.end method


# virtual methods
.method public final await(JLjava/util/concurrent/TimeUnit;)Lcom/google/android/gms/common/api/Result;
    .registers 11
    .param p1, "time"    # J
    .param p3, "units"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TR;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/common/api/zzb;, "Lcom/google/android/gms/common/api/zzb<TR;>;"
    const/4 v2, 0x1

    const/4 v1, 0x0

    const-wide/16 v4, 0x0

    cmp-long v0, p1, v4

    if-lez v0, :cond_12

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    if-eq v0, v3, :cond_3c

    :cond_12
    move v0, v2

    :goto_13
    const-string v3, "await must not be called on the UI thread when time is greater than zero."

    invoke-static {v0, v3}, Lcom/google/android/gms/common/internal/zzx;->zza(ZLjava/lang/Object;)V

    iget-boolean v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYI:Z

    if-nez v0, :cond_3e

    :goto_1c
    const-string v0, "Result has already been consumed."

    invoke-static {v2, v0}, Lcom/google/android/gms/common/internal/zzx;->zza(ZLjava/lang/Object;)V

    :try_start_21
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzoR:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_2e

    sget-object v0, Lcom/google/android/gms/common/api/Status;->zzaaG:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/zzb;->zzw(Lcom/google/android/gms/common/api/Status;)V
    :try_end_2e
    .catch Ljava/lang/InterruptedException; {:try_start_21 .. :try_end_2e} :catch_40

    :cond_2e
    :goto_2e
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzb;->isReady()Z

    move-result v0

    const-string v1, "Result is not ready."

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzx;->zza(ZLjava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzb;->get()Lcom/google/android/gms/common/api/Result;

    move-result-object v0

    return-object v0

    :cond_3c
    move v0, v1

    goto :goto_13

    :cond_3e
    move v2, v1

    goto :goto_1c

    :catch_40
    move-exception v0

    sget-object v0, Lcom/google/android/gms/common/api/Status;->zzaaE:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/zzb;->zzw(Lcom/google/android/gms/common/api/Status;)V

    goto :goto_2e
.end method

.method public cancel()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzb;->zzYD:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/common/api/zzb;->zzL:Z

    if-nez v0, :cond_b

    iget-boolean v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYI:Z

    if-eqz v0, :cond_d

    :cond_b
    monitor-exit v1

    :goto_c
    return-void

    :cond_d
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYK:Lcom/google/android/gms/common/internal/zzq;
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_2c

    if-eqz v0, :cond_16

    :try_start_11
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYK:Lcom/google/android/gms/common/internal/zzq;

    invoke-interface {v0}, Lcom/google/android/gms/common/internal/zzq;->cancel()V
    :try_end_16
    .catch Landroid/os/RemoteException; {:try_start_11 .. :try_end_16} :catch_2f
    .catchall {:try_start_11 .. :try_end_16} :catchall_2c

    :cond_16
    :goto_16
    :try_start_16
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYH:Lcom/google/android/gms/common/api/Result;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzb;->zzc(Lcom/google/android/gms/common/api/Result;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYG:Lcom/google/android/gms/common/api/ResultCallback;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/common/api/zzb;->zzL:Z

    sget-object v0, Lcom/google/android/gms/common/api/Status;->zzaaH:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/zzb;->zzb(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/zzb;->zzb(Lcom/google/android/gms/common/api/Result;)V

    monitor-exit v1

    goto :goto_c

    :catchall_2c
    move-exception v0

    monitor-exit v1
    :try_end_2e
    .catchall {:try_start_16 .. :try_end_2e} :catchall_2c

    throw v0

    :catch_2f
    move-exception v0

    goto :goto_16
.end method

.method public isCanceled()Z
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzb;->zzYD:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/common/api/zzb;->zzL:Z

    monitor-exit v1

    return v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public final isReady()Z
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzoR:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public final setResultCallback(Lcom/google/android/gms/common/api/ResultCallback;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/ResultCallback",
            "<TR;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/common/api/zzb;, "Lcom/google/android/gms/common/api/zzb<TR;>;"
    .local p1, "callback":Lcom/google/android/gms/common/api/ResultCallback;, "Lcom/google/android/gms/common/api/ResultCallback<TR;>;"
    iget-boolean v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYI:Z

    if-nez v0, :cond_15

    const/4 v0, 0x1

    :goto_5
    const-string v1, "Result has already been consumed."

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzx;->zza(ZLjava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzb;->zzYD:Ljava/lang/Object;

    monitor-enter v1

    :try_start_d
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzb;->isCanceled()Z

    move-result v0

    if-eqz v0, :cond_17

    monitor-exit v1

    :goto_14
    return-void

    :cond_15
    const/4 v0, 0x0

    goto :goto_5

    :cond_17
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzb;->isReady()Z

    move-result v0

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYE:Lcom/google/android/gms/common/api/zzb$zza;

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzb;->get()Lcom/google/android/gms/common/api/Result;

    move-result-object v2

    invoke-virtual {v0, p1, v2}, Lcom/google/android/gms/common/api/zzb$zza;->zza(Lcom/google/android/gms/common/api/ResultCallback;Lcom/google/android/gms/common/api/Result;)V

    :goto_26
    monitor-exit v1

    goto :goto_14

    :catchall_28
    move-exception v0

    monitor-exit v1
    :try_end_2a
    .catchall {:try_start_d .. :try_end_2a} :catchall_28

    throw v0

    :cond_2b
    :try_start_2b
    iput-object p1, p0, Lcom/google/android/gms/common/api/zzb;->zzYG:Lcom/google/android/gms/common/api/ResultCallback;
    :try_end_2d
    .catchall {:try_start_2b .. :try_end_2d} :catchall_28

    goto :goto_26
.end method

.method public final zza(Lcom/google/android/gms/common/api/Result;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget-object v3, p0, Lcom/google/android/gms/common/api/zzb;->zzYD:Ljava/lang/Object;

    monitor-enter v3

    :try_start_5
    iget-boolean v2, p0, Lcom/google/android/gms/common/api/zzb;->zzYJ:Z

    if-nez v2, :cond_d

    iget-boolean v2, p0, Lcom/google/android/gms/common/api/zzb;->zzL:Z

    if-eqz v2, :cond_12

    :cond_d
    invoke-static {p1}, Lcom/google/android/gms/common/api/zzb;->zzc(Lcom/google/android/gms/common/api/Result;)V

    monitor-exit v3

    :goto_11
    return-void

    :cond_12
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzb;->isReady()Z

    move-result v2

    if-nez v2, :cond_2f

    move v2, v0

    :goto_19
    const-string v4, "Results have already been set"

    invoke-static {v2, v4}, Lcom/google/android/gms/common/internal/zzx;->zza(ZLjava/lang/Object;)V

    iget-boolean v2, p0, Lcom/google/android/gms/common/api/zzb;->zzYI:Z

    if-nez v2, :cond_31

    :goto_22
    const-string v1, "Result has already been consumed"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzx;->zza(ZLjava/lang/Object;)V

    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/zzb;->zzb(Lcom/google/android/gms/common/api/Result;)V

    monitor-exit v3

    goto :goto_11

    :catchall_2c
    move-exception v0

    monitor-exit v3
    :try_end_2e
    .catchall {:try_start_5 .. :try_end_2e} :catchall_2c

    throw v0

    :cond_2f
    move v2, v1

    goto :goto_19

    :cond_31
    move v0, v1

    goto :goto_22
.end method

.method protected abstract zzb(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/Status;",
            ")TR;"
        }
    .end annotation
.end method

.method protected zzmZ()V
    .registers 1

    return-void
.end method

.method public final zzw(Lcom/google/android/gms/common/api/Status;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzb;->zzYD:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzb;->isReady()Z

    move-result v0

    if-nez v0, :cond_13

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/zzb;->zzb(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/zzb;->zza(Lcom/google/android/gms/common/api/Result;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/common/api/zzb;->zzYJ:Z

    :cond_13
    monitor-exit v1

    return-void

    :catchall_15
    move-exception v0

    monitor-exit v1
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_15

    throw v0
.end method
