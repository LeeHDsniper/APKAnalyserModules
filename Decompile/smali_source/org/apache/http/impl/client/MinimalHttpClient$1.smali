.class Lorg/apache/http/impl/client/MinimalHttpClient$1;
.super Ljava/lang/Object;
.source "MinimalHttpClient.java"

# interfaces
.implements Lorg/apache/http/conn/ClientConnectionManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/http/impl/client/MinimalHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/impl/client/MinimalHttpClient;


# direct methods
.method constructor <init>(Lorg/apache/http/impl/client/MinimalHttpClient;)V
    .registers 2

    .prologue
    .line 123
    iput-object p1, p0, Lorg/apache/http/impl/client/MinimalHttpClient$1;->this$0:Lorg/apache/http/impl/client/MinimalHttpClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public closeExpiredConnections()V
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lorg/apache/http/impl/client/MinimalHttpClient$1;->this$0:Lorg/apache/http/impl/client/MinimalHttpClient;

    # getter for: Lorg/apache/http/impl/client/MinimalHttpClient;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;
    invoke-static {v0}, Lorg/apache/http/impl/client/MinimalHttpClient;->access$000(Lorg/apache/http/impl/client/MinimalHttpClient;)Lorg/apache/http/conn/HttpClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/HttpClientConnectionManager;->closeExpiredConnections()V

    .line 150
    return-void
.end method

.method public closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V
    .registers 5
    .param p1, "idletime"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 145
    iget-object v0, p0, Lorg/apache/http/impl/client/MinimalHttpClient$1;->this$0:Lorg/apache/http/impl/client/MinimalHttpClient;

    # getter for: Lorg/apache/http/impl/client/MinimalHttpClient;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;
    invoke-static {v0}, Lorg/apache/http/impl/client/MinimalHttpClient;->access$000(Lorg/apache/http/impl/client/MinimalHttpClient;)Lorg/apache/http/conn/HttpClientConnectionManager;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lorg/apache/http/conn/HttpClientConnectionManager;->closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V

    .line 146
    return-void
.end method

.method public getSchemeRegistry()Lorg/apache/http/conn/scheme/SchemeRegistry;
    .registers 2

    .prologue
    .line 141
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
    .line 137
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public requestConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ClientConnectionRequest;
    .registers 4
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    .line 131
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public shutdown()V
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lorg/apache/http/impl/client/MinimalHttpClient$1;->this$0:Lorg/apache/http/impl/client/MinimalHttpClient;

    # getter for: Lorg/apache/http/impl/client/MinimalHttpClient;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;
    invoke-static {v0}, Lorg/apache/http/impl/client/MinimalHttpClient;->access$000(Lorg/apache/http/impl/client/MinimalHttpClient;)Lorg/apache/http/conn/HttpClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/HttpClientConnectionManager;->shutdown()V

    .line 127
    return-void
.end method
