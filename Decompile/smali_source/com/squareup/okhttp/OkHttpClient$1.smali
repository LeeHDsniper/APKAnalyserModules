.class final Lcom/squareup/okhttp/OkHttpClient$1;
.super Lcom/squareup/okhttp/internal/Internal;
.source "OkHttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/OkHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/Internal;-><init>()V

    return-void
.end method


# virtual methods
.method public addLine(Lcom/squareup/okhttp/Headers$Builder;Ljava/lang/String;)V
    .registers 3
    .param p1, "builder"    # Lcom/squareup/okhttp/Headers$Builder;
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 90
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Headers$Builder;->addLine(Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    .line 91
    return-void
.end method

.method public clearOwner(Lcom/squareup/okhttp/Connection;)Z
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 66
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->clearOwner()Z

    move-result v0

    return v0
.end method

.method public closeIfOwnedBy(Lcom/squareup/okhttp/Connection;Ljava/lang/Object;)V
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "owner"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->closeIfOwnedBy(Ljava/lang/Object;)V

    .line 71
    return-void
.end method

.method public connectAndSetOwner(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/HttpEngine;Lcom/squareup/okhttp/Request;)V
    .registers 5
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p2, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p3, "owner"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .param p4, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    invoke-virtual {p2, p1, p3, p4}, Lcom/squareup/okhttp/Connection;->connectAndSetOwner(Lcom/squareup/okhttp/OkHttpClient;Ljava/lang/Object;Lcom/squareup/okhttp/Request;)V

    .line 120
    return-void
.end method

.method public internalCache(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/InternalCache;
    .registers 3
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;

    .prologue
    .line 98
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->internalCache()Lcom/squareup/okhttp/internal/InternalCache;

    move-result-object v0

    return-object v0
.end method

.method public isReadable(Lcom/squareup/okhttp/Connection;)Z
    .registers 3
    .param p1, "pooled"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 86
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->isReadable()Z

    move-result v0

    return v0
.end method

.method public network(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/Network;
    .registers 3
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;

    .prologue
    .line 110
    # getter for: Lcom/squareup/okhttp/OkHttpClient;->network:Lcom/squareup/okhttp/internal/Network;
    invoke-static {p1}, Lcom/squareup/okhttp/OkHttpClient;->access$000(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/Network;

    move-result-object v0

    return-object v0
.end method

.method public newTransport(Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/internal/http/Transport;
    .registers 4
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "httpEngine"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->newTransport(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/internal/http/Transport;

    move-result-object v0

    return-object v0
.end method

.method public recycle(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Connection;)V
    .registers 3
    .param p1, "pool"    # Lcom/squareup/okhttp/ConnectionPool;
    .param p2, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 102
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/ConnectionPool;->recycle(Lcom/squareup/okhttp/Connection;)V

    .line 103
    return-void
.end method

.method public recycleCount(Lcom/squareup/okhttp/Connection;)I
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 74
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->recycleCount()I

    move-result v0

    return v0
.end method

.method public routeDatabase(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/RouteDatabase;
    .registers 3
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;

    .prologue
    .line 106
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->routeDatabase()Lcom/squareup/okhttp/internal/RouteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public setOwner(Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/HttpEngine;)V
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "httpEngine"    # Lcom/squareup/okhttp/internal/http/HttpEngine;

    .prologue
    .line 82
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->setOwner(Ljava/lang/Object;)V

    .line 83
    return-void
.end method

.method public setProtocol(Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/Protocol;)V
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "protocol"    # Lcom/squareup/okhttp/Protocol;

    .prologue
    .line 78
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->setProtocol(Lcom/squareup/okhttp/Protocol;)V

    .line 79
    return-void
.end method
