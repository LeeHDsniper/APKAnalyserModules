.class public Lorg/apache/http/impl/conn/DefaultProxyRoutePlanner;
.super Lorg/apache/http/impl/conn/DefaultRoutePlanner;
.source "DefaultProxyRoutePlanner.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final proxy:Lorg/apache/http/HttpHost;


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpHost;)V
    .registers 3
    .param p1, "proxy"    # Lorg/apache/http/HttpHost;

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/conn/DefaultProxyRoutePlanner;-><init>(Lorg/apache/http/HttpHost;Lorg/apache/http/conn/SchemePortResolver;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/HttpHost;Lorg/apache/http/conn/SchemePortResolver;)V
    .registers 4
    .param p1, "proxy"    # Lorg/apache/http/HttpHost;
    .param p2, "schemePortResolver"    # Lorg/apache/http/conn/SchemePortResolver;

    .prologue
    .line 50
    invoke-direct {p0, p2}, Lorg/apache/http/impl/conn/DefaultRoutePlanner;-><init>(Lorg/apache/http/conn/SchemePortResolver;)V

    .line 51
    const-string v0, "Proxy host"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/HttpHost;

    iput-object v0, p0, Lorg/apache/http/impl/conn/DefaultProxyRoutePlanner;->proxy:Lorg/apache/http/HttpHost;

    .line 52
    return-void
.end method


# virtual methods
.method protected determineProxy(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpHost;
    .registers 5
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 63
    iget-object v0, p0, Lorg/apache/http/impl/conn/DefaultProxyRoutePlanner;->proxy:Lorg/apache/http/HttpHost;

    return-object v0
.end method
