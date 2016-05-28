.class Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;
.super Ljava/lang/Object;
.source "ThreadPool.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LowPriorityThreadFactory"
.end annotation


# instance fields
.field private final mName:Ljava/lang/String;

.field private final mNumber:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final mPriority:I

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Ljava/lang/String;I)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "priority"    # I

    .prologue
    .line 264
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;->this$0:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 261
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;->mNumber:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 265
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;->mName:Ljava/lang/String;

    .line 266
    iput p3, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;->mPriority:I

    .line 267
    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;

    .prologue
    .line 259
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;->mPriority:I

    return v0
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 5
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 271
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory$1;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;->mName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x2d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;->mNumber:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, p1, v1}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;Ljava/lang/Runnable;Ljava/lang/String;)V

    return-object v0
.end method
