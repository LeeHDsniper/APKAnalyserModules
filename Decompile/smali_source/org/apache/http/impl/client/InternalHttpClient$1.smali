.class Lorg/apache/http/impl/client/InternalHttpClient$1;
.super Ljava/lang/Object;
.source "InternalHttpClient.java"

# interfaces
.implements Lorg/apache/http/conn/ClientConnectionManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/http/impl/client/InternalHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/impl/client/InternalHttpClient;


# direct methods
.method constructor <init>(Lorg/apache/http/impl/client/InternalHttpClient;)V
    .registers 2

    .prologue
    .line 211
    iput-object p1, p0, Lorg/apache/http/impl/client/InternalHttpClient$1;->this$0:Lorg/apache/http/impl/client/InternalHttpClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public closeExpiredConnections()V
    .registers 2

    .prologue
    .line 237
    iget-object v0, p0, Lorg/apache/http/impl/client/InternalHttpClient$1;->this$0:Lorg/apache/http/impl/client/InternalHttpClient;

    # getter for: Lorg/apache/http/impl/client/InternalHttpClient;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;
    invoke-static {v0}, Lorg/apache/http/impl/client/InternalHttpClient;->access$000(Lorg/apache/http/impl/client/InternalHttpClient;)Lorg/apache/http/conn/HttpClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/HttpClientConnectionManager;->closeExpiredConnections()V

    .line 238
    return-void
.end method

.method public closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V
    .registers 5
    .param p1, "idletime"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 233
    iget-object v0, p0, Lorg/apache/http/impl/client/InternalHttpClient$1;->this$0:Lorg/apache/http/impl/client/InternalHttpClient;

    # getter for: Lorg/apache/http/impl/client/InternalHttpClient;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;
    invoke-static {v0}, Lorg/apache/http/impl/client/InternalHttpClient;->access$000(Lorg/apache/http/impl/client/InternalHttpClient;)Lorg/apache/http/conn/HttpClientConnectionManager;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lorg/apache/http/conn/HttpClientConnectionManager;->closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V

    .line 234
    return-void
.end method

.method public getSchemeRegistry()Lorg/apache/http/conn/scheme/SchemeRegistry;
    .registers 2

    .prologue
    .line 229
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public releaseConnection(Lorg/apache/http/conn/ManagedClientConnection;JLjava/util/concurrent/TimeUnit;)V
    .registers 6
    .param p1, "conn"    # Lorg/apache/http/conn/ManagedClientConnection;
    .param p2, "validDuration"    # J
    .param p4, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 225
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public requestConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ClientConnectionRequest;
    .registers 4
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    .line 219
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public shutdown()V
    .registers 2

    .prologue
    .line 214
    iget-object v0, p0, Lorg/apache/http/impl/client/InternalHttpClient$1;->this$0:Lorg/apache/http/impl/client/InternalHttpClient;

    # getter for: Lorg/apache/http/impl/client/InternalHttpClient;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;
    invoke-static {v0}, Lorg/apache/http/impl/client/InternalHttpClient;->access$000(Lorg/apache/http/impl/client/InternalHttpClient;)Lorg/apache/http/conn/HttpClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/HttpClientConnectionManager;->shutdown()V

    .line 215
    return-void
.end method
