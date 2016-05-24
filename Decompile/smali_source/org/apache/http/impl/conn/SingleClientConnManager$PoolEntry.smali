.class public Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;
.super Lorg/apache/http/impl/conn/AbstractPoolEntry;
.source "SingleClientConnManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/impl/conn/SingleClientConnManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "PoolEntry"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/impl/conn/SingleClientConnManager;


# direct methods
.method protected constructor <init>(Lorg/apache/http/impl/conn/SingleClientConnManager;)V
    .registers 4

    .prologue
    .line 382
    iput-object p1, p0, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;->this$0:Lorg/apache/http/impl/conn/SingleClientConnManager;

    .line 383
    iget-object v0, p1, Lorg/apache/http/impl/conn/SingleClientConnManager;->connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/http/impl/conn/AbstractPoolEntry;-><init>(Lorg/apache/http/conn/ClientConnectionOperator;Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 384
    return-void
.end method


# virtual methods
.method protected close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 390
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;->shutdownEntry()V

    .line 391
    iget-object v0, p0, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;->connection:Lorg/apache/http/conn/OperatedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 392
    iget-object v0, p0, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;->connection:Lorg/apache/http/conn/OperatedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->close()V

    .line 394
    :cond_10
    return-void
.end method

.method protected shutdown()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 400
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;->shutdownEntry()V

    .line 401
    iget-object v0, p0, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;->connection:Lorg/apache/http/conn/OperatedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 402
    iget-object v0, p0, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;->connection:Lorg/apache/http/conn/OperatedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->shutdown()V

    .line 404
    :cond_10
    return-void
.end method
