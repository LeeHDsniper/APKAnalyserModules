.class public Lcom/google/android/gms/internal/zzqz;
.super Ljava/lang/Object;


# instance fields
.field private mClosed:Z

.field private zzaPw:Ljava/lang/String;

.field private final zzaRr:Ljava/util/concurrent/ScheduledExecutorService;

.field private zzaRt:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzqz;-><init>(Ljava/util/concurrent/ScheduledExecutorService;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzqz;-><init>(Ljava/util/concurrent/ScheduledExecutorService;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqz;->zzaPw:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/ScheduledExecutorService;)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzqz;->zzaRt:Ljava/util/concurrent/ScheduledFuture;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzqz;->zzaPw:Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqz;->zzaRr:Ljava/util/concurrent/ScheduledExecutorService;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzqz;->mClosed:Z

    return-void
.end method


# virtual methods
.method public zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzqn;JLcom/google/android/gms/internal/zzqx;)V
    .registers 9

    monitor-enter p0

    :try_start_1
    const-string v0, "ResourceLoaderScheduler: Loading new resource."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqz;->zzaRt:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_c

    monitor-exit p0

    :goto_b
    return-void

    :cond_c
    iget-object v0, p0, Lcom/google/android/gms/internal/zzqz;->zzaPw:Ljava/lang/String;

    if-eqz v0, :cond_26

    new-instance v0, Lcom/google/android/gms/internal/zzqy;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzqz;->zzaPw:Ljava/lang/String;

    invoke-direct {v0, p1, p2, p5, v1}, Lcom/google/android/gms/internal/zzqy;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzqn;Lcom/google/android/gms/internal/zzqx;Ljava/lang/String;)V

    :goto_17
    iget-object v1, p0, Lcom/google/android/gms/internal/zzqz;->zzaRr:Ljava/util/concurrent/ScheduledExecutorService;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v0, p3, p4, v2}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzqz;->zzaRt:Ljava/util/concurrent/ScheduledFuture;

    monitor-exit p0

    goto :goto_b

    :catchall_23
    move-exception v0

    monitor-exit p0
    :try_end_25
    .catchall {:try_start_1 .. :try_end_25} :catchall_23

    throw v0

    :cond_26
    :try_start_26
    new-instance v0, Lcom/google/android/gms/internal/zzqy;

    invoke-direct {v0, p1, p2, p5}, Lcom/google/android/gms/internal/zzqy;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzqn;Lcom/google/android/gms/internal/zzqx;)V
    :try_end_2b
    .catchall {:try_start_26 .. :try_end_2b} :catchall_23

    goto :goto_17
.end method
