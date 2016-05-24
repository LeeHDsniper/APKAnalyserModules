.class public Lcom/adobe/creativesdk/aviary/internal/services/ThreadPoolService;
.super Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;
.source "ThreadPoolService.java"


# instance fields
.field private final mExecutor:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V
    .registers 5
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V

    .line 15
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    const/4 v1, 0x5

    const/16 v2, 0x13

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;-><init>(II)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/ThreadPoolService;->mExecutor:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .line 16
    return-void
.end method


# virtual methods
.method public dispose()V
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/ThreadPoolService;->mExecutor:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->dispose()V

    .line 55
    return-void
.end method

.method public varargs submit(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;[Ljava/lang/Object;)Lcom/adobe/creativesdk/aviary/internal/threading/Future;
    .registers 5
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
    .line 19
    .local p1, "job":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job<TI;TO;>;"
    .local p2, "listener":Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;, "Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener<TO;>;"
    .local p3, "params":[Ljava/lang/Object;, "[TI;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/ThreadPoolService;->mExecutor:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    invoke-virtual {v0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->submit(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;[Ljava/lang/Object;)Lcom/adobe/creativesdk/aviary/internal/threading/Future;

    move-result-object v0

    return-object v0
.end method
