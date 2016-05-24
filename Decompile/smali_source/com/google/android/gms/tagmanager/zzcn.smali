.class Lcom/google/android/gms/tagmanager/zzcn;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/zzp$zzf;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzaOS:Ljava/lang/String;

.field private final zzaRv:Ljava/util/concurrent/ExecutorService;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzcn;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzcn;->zzaOS:Ljava/lang/String;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzcn;->zzaRv:Ljava/util/concurrent/ExecutorService;

    return-void
.end method


# virtual methods
.method public declared-synchronized release()V
    .registers 2

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcn;->zzaRv:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    monitor-exit p0

    return-void

    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method
