.class Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute$1;
.super Ljava/lang/Object;
.source "ConnPoolByRoute.java"

# interfaces
.implements Lorg/apache/http/impl/conn/tsccm/PoolEntryRequest;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->requestPoolEntry(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/impl/conn/tsccm/PoolEntryRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

.field final synthetic val$aborter:Lorg/apache/http/impl/conn/tsccm/WaitingThreadAborter;

.field final synthetic val$route:Lorg/apache/http/conn/routing/HttpRoute;

.field final synthetic val$state:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;Lorg/apache/http/impl/conn/tsccm/WaitingThreadAborter;Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)V
    .registers 5

    .prologue
    .line 283
    iput-object p1, p0, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute$1;->this$0:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    iput-object p2, p0, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute$1;->val$aborter:Lorg/apache/http/impl/conn/tsccm/WaitingThreadAborter;

    iput-object p3, p0, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute$1;->val$route:Lorg/apache/http/conn/routing/HttpRoute;

    iput-object p4, p0, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute$1;->val$state:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abortRequest()V
    .registers 3

    .prologue
    .line 286
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute$1;->this$0:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    # getter for: Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v0}, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->access$000(Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 288
    :try_start_9
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute$1;->val$aborter:Lorg/apache/http/impl/conn/tsccm/WaitingThreadAborter;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/WaitingThreadAborter;->abort()V
    :try_end_e
    .catchall {:try_start_9 .. :try_end_e} :catchall_18

    .line 290
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute$1;->this$0:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    # getter for: Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v0}, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->access$000(Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 292
    return-void

    .line 290
    :catchall_18
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute$1;->this$0:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    # getter for: Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v1}, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->access$000(Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getPoolEntry(JLjava/util/concurrent/TimeUnit;)Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;
    .registers 13
    .param p1, "timeout"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lorg/apache/http/conn/ConnectionPoolTimeoutException;
        }
    .end annotation

    .prologue
    .line 298
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute$1;->this$0:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    iget-object v2, p0, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute$1;->val$route:Lorg/apache/http/conn/routing/HttpRoute;

    iget-object v3, p0, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute$1;->val$state:Ljava/lang/Object;

    iget-object v7, p0, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute$1;->val$aborter:Lorg/apache/http/impl/conn/tsccm/WaitingThreadAborter;

    move-wide v4, p1

    move-object v6, p3

    invoke-virtual/range {v1 .. v7}, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->getEntryBlocking(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Lorg/apache/http/impl/conn/tsccm/WaitingThreadAborter;)Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;

    move-result-object v0

    return-object v0
.end method
