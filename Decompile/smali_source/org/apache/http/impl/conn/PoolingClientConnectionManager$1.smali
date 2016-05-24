.class Lorg/apache/http/impl/conn/PoolingClientConnectionManager$1;
.super Ljava/lang/Object;
.source "PoolingClientConnectionManager.java"

# interfaces
.implements Lorg/apache/http/conn/ClientConnectionRequest;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->requestConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ClientConnectionRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/impl/conn/PoolingClientConnectionManager;

.field final synthetic val$future:Ljava/util/concurrent/Future;


# direct methods
.method constructor <init>(Lorg/apache/http/impl/conn/PoolingClientConnectionManager;Ljava/util/concurrent/Future;)V
    .registers 3

    .prologue
    .line 186
    iput-object p1, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager$1;->this$0:Lorg/apache/http/impl/conn/PoolingClientConnectionManager;

    iput-object p2, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager$1;->val$future:Ljava/util/concurrent/Future;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abortRequest()V
    .registers 3

    .prologue
    .line 189
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager$1;->val$future:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 190
    return-void
.end method

.method public getConnection(JLjava/util/concurrent/TimeUnit;)Lorg/apache/http/conn/ManagedClientConnection;
    .registers 7
    .param p1, "timeout"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lorg/apache/http/conn/ConnectionPoolTimeoutException;
        }
    .end annotation

    .prologue
    .line 195
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager$1;->this$0:Lorg/apache/http/impl/conn/PoolingClientConnectionManager;

    iget-object v1, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager$1;->val$future:Ljava/util/concurrent/Future;

    invoke-virtual {v0, v1, p1, p2, p3}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->leaseConnection(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)Lorg/apache/http/conn/ManagedClientConnection;

    move-result-object v0

    return-object v0
.end method
