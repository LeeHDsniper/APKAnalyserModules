.class Lit/sephiroth/android/library/picasso/PicassoExecutorService;
.super Ljava/util/concurrent/ThreadPoolExecutor;
.source "PicassoExecutorService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/picasso/PicassoExecutorService$PicassoFutureTask;
    }
.end annotation


# static fields
.field private static final DEFAULT_THREAD_COUNT:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 36
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    const/16 v1, 0x8

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x4

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    sput v0, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->DEFAULT_THREAD_COUNT:I

    return-void
.end method

.method constructor <init>()V
    .registers 10

    .prologue
    .line 39
    sget v2, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->DEFAULT_THREAD_COUNT:I

    sget v3, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->DEFAULT_THREAD_COUNT:I

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/PriorityBlockingQueue;-><init>()V

    new-instance v8, Lit/sephiroth/android/library/picasso/Utils$PicassoThreadFactory;

    invoke-direct {v8}, Lit/sephiroth/android/library/picasso/Utils$PicassoThreadFactory;-><init>()V

    move-object v1, p0

    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 41
    const-string v0, "Picasso"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "default thread count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->DEFAULT_THREAD_COUNT:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    return-void
.end method

.method private setThreadCount(I)V
    .registers 5
    .param p1, "threadCount"    # I

    .prologue
    .line 83
    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->setCorePoolSize(I)V

    .line 84
    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->setMaximumPoolSize(I)V

    .line 85
    const-string v0, "Picasso"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setThreadCount: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    return-void
.end method


# virtual methods
.method adjustThreadCount(Landroid/net/NetworkInfo;)V
    .registers 3
    .param p1, "info"    # Landroid/net/NetworkInfo;

    .prologue
    .line 45
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v0

    if-nez v0, :cond_e

    .line 46
    :cond_8
    sget v0, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->DEFAULT_THREAD_COUNT:I

    invoke-direct {p0, v0}, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->setThreadCount(I)V

    .line 80
    :goto_d
    return-void

    .line 49
    :cond_e
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getType()I

    move-result v0

    sparse-switch v0, :sswitch_data_3e

    .line 78
    sget v0, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->DEFAULT_THREAD_COUNT:I

    invoke-direct {p0, v0}, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->setThreadCount(I)V

    goto :goto_d

    .line 53
    :sswitch_1b
    sget v0, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->DEFAULT_THREAD_COUNT:I

    invoke-direct {p0, v0}, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->setThreadCount(I)V

    goto :goto_d

    .line 56
    :sswitch_21
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v0

    packed-switch v0, :pswitch_data_50

    .line 74
    :pswitch_28
    sget v0, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->DEFAULT_THREAD_COUNT:I

    invoke-direct {p0, v0}, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->setThreadCount(I)V

    goto :goto_d

    .line 60
    :pswitch_2e
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->setThreadCount(I)V

    goto :goto_d

    .line 67
    :pswitch_33
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->setThreadCount(I)V

    goto :goto_d

    .line 71
    :pswitch_38
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->setThreadCount(I)V

    goto :goto_d

    .line 49
    nop

    :sswitch_data_3e
    .sparse-switch
        0x0 -> :sswitch_21
        0x1 -> :sswitch_1b
        0x6 -> :sswitch_1b
        0x9 -> :sswitch_1b
    .end sparse-switch

    .line 56
    :pswitch_data_50
    .packed-switch 0x1
        :pswitch_38
        :pswitch_38
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_33
        :pswitch_2e
        :pswitch_2e
        :pswitch_2e
    .end packed-switch
.end method

.method public submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    .registers 3
    .param p1, "task"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            ")",
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 90
    new-instance v0, Lit/sephiroth/android/library/picasso/PicassoExecutorService$PicassoFutureTask;

    check-cast p1, Lit/sephiroth/android/library/picasso/BitmapHunter;

    .end local p1    # "task":Ljava/lang/Runnable;
    invoke-direct {v0, p1}, Lit/sephiroth/android/library/picasso/PicassoExecutorService$PicassoFutureTask;-><init>(Lit/sephiroth/android/library/picasso/BitmapHunter;)V

    .line 91
    .local v0, "ftask":Lit/sephiroth/android/library/picasso/PicassoExecutorService$PicassoFutureTask;
    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 92
    return-object v0
.end method
