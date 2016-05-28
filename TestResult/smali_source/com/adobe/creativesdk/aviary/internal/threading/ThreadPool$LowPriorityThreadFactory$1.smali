.class Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory$1;
.super Ljava/lang/Thread;
.source "ThreadPool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;->newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;Ljava/lang/Runnable;Ljava/lang/String;)V
    .registers 4
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;
    .param p2, "x0"    # Ljava/lang/Runnable;
    .param p3, "x1"    # Ljava/lang/String;

    .prologue
    .line 271
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;

    invoke-direct {p0, p2, p3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 274
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;->mPriority:I
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;->access$200(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$LowPriorityThreadFactory;)I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 275
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 276
    return-void
.end method
