.class public Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;
.super Ljava/lang/Object;
.source "ThreadPool.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$CancelListener;,
        Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;,
        Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;,
        Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;
    }
.end annotation


# static fields
.field private static final LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private final mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private final mListenerHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 25
    const-class v0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .line 26
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    .line 25
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>(II)V
    .registers 12
    .param p1, "numThreads"    # I
    .param p2, "priority"    # I

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    mul-int/lit8 v3, p1, 0x2

    const-wide/16 v4, 0x5

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    new-instance v8, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;

    const-string v0, "thread-pool-service"

    invoke-direct {v8, p0, v0, p2}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;-><init>(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Ljava/lang/String;I)V

    move v2, p1

    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 43
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->mListenerHandler:Landroid/os/Handler;

    .line 44
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;)Landroid/os/Handler;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->mListenerHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$100()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    .registers 1

    .prologue
    .line 21
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-object v0
.end method


# virtual methods
.method public dispose()V
    .registers 2

    .prologue
    .line 132
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdown()V

    .line 133
    return-void
.end method

.method public varargs submit(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;[Ljava/lang/Object;)Lcom/adobe/creativesdk/aviary/internal/threading/Future;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<I:",
            "Ljava/lang/Object;",
            "O:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job",
            "<TI;TO;>;",
            "Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener",
            "<TO;>;[TI;)",
            "Lcom/adobe/creativesdk/aviary/internal/threading/Future",
            "<TO;>;"
        }
    .end annotation

    .prologue
    .line 68
    .local p1, "job":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job<TI;TO;>;"
    .local p2, "listener":Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;, "Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener<TO;>;"
    .local p3, "params":[Ljava/lang/Object;, "[TI;"
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$1;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p1

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;[Ljava/lang/Object;Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;[Ljava/lang/Object;)V

    .line 101
    .local v0, "w":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker<TI;TO;>;"
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 102
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    .line 117
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "ThreadPool(pool: %d, corePool: %d, largestPool: %d, maxPool: %d, tasks: %d, active: %d, completed: %d)"

    const/4 v2, 0x7

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 120
    invoke-virtual {v4}, Ljava/util/concurrent/ThreadPoolExecutor;->getPoolSize()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 121
    invoke-virtual {v4}, Ljava/util/concurrent/ThreadPoolExecutor;->getCorePoolSize()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 122
    invoke-virtual {v4}, Ljava/util/concurrent/ThreadPoolExecutor;->getLargestPoolSize()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 123
    invoke-virtual {v4}, Ljava/util/concurrent/ThreadPoolExecutor;->getMaximumPoolSize()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 124
    invoke-virtual {v4}, Ljava/util/concurrent/ThreadPoolExecutor;->getTaskCount()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x5

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 125
    invoke-virtual {v4}, Ljava/util/concurrent/ThreadPoolExecutor;->getActiveCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x6

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 126
    invoke-virtual {v4}, Ljava/util/concurrent/ThreadPoolExecutor;->getCompletedTaskCount()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    .line 117
    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
