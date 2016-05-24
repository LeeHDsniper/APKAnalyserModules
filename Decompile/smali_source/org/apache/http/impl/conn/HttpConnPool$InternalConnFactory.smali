.class Lorg/apache/http/impl/conn/HttpConnPool$InternalConnFactory;
.super Ljava/lang/Object;
.source "HttpConnPool.java"

# interfaces
.implements Lorg/apache/http/pool/ConnFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/impl/conn/HttpConnPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "InternalConnFactory"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/http/pool/ConnFactory",
        "<",
        "Lorg/apache/http/conn/routing/HttpRoute;",
        "Lorg/apache/http/conn/OperatedClientConnection;",
        ">;"
    }
.end annotation


# instance fields
.field private final connOperator:Lorg/apache/http/conn/ClientConnectionOperator;


# direct methods
.method constructor <init>(Lorg/apache/http/conn/ClientConnectionOperator;)V
    .registers 2
    .param p1, "connOperator"    # Lorg/apache/http/conn/ClientConnectionOperator;

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object p1, p0, Lorg/apache/http/impl/conn/HttpConnPool$InternalConnFactory;->connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

    .line 76
    return-void
.end method


# virtual methods
.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    check-cast p1, Lorg/apache/http/conn/routing/HttpRoute;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/conn/HttpConnPool$InternalConnFactory;->create(Lorg/apache/http/conn/routing/HttpRoute;)Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    return-object v0
.end method

.method public create(Lorg/apache/http/conn/routing/HttpRoute;)Lorg/apache/http/conn/OperatedClientConnection;
    .registers 3
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/http/impl/conn/HttpConnPool$InternalConnFactory;->connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionOperator;->createConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    return-object v0
.end method
