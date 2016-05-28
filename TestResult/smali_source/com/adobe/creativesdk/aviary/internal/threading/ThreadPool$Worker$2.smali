.class Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$2;
.super Ljava/lang/Object;
.source "ThreadPool.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->fireOnDoneEvent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;

.field final synthetic val$sender:Lcom/adobe/creativesdk/aviary/internal/threading/Future;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;Lcom/adobe/creativesdk/aviary/internal/threading/Future;)V
    .registers 3
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;

    .prologue
    .line 165
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$2;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$2;"
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$2;->this$1:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$2;->val$sender:Lcom/adobe/creativesdk/aviary/internal/threading/Future;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 168
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$2;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$2;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$2;->this$1:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->mListener:Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$2;->val$sender:Lcom/adobe/creativesdk/aviary/internal/threading/Future;

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;->onFutureDone(Lcom/adobe/creativesdk/aviary/internal/threading/Future;)V

    .line 169
    return-void
.end method
