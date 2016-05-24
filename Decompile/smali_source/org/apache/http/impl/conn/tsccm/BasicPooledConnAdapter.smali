.class public Lorg/apache/http/impl/conn/tsccm/BasicPooledConnAdapter;
.super Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;
.source "BasicPooledConnAdapter.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method protected constructor <init>(Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;Lorg/apache/http/impl/conn/AbstractPoolEntry;)V
    .registers 3
    .param p1, "tsccm"    # Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;
    .param p2, "entry"    # Lorg/apache/http/impl/conn/AbstractPoolEntry;

    .prologue
    .line 53
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/impl/conn/AbstractPoolEntry;)V

    .line 54
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/tsccm/BasicPooledConnAdapter;->markReusable()V

    .line 55
    return-void
.end method


# virtual methods
.method protected detach()V
    .registers 1

    .prologue
    .line 72
    invoke-super {p0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->detach()V

    .line 73
    return-void
.end method

.method protected getManager()Lorg/apache/http/conn/ClientConnectionManager;
    .registers 2

    .prologue
    .line 60
    invoke-super {p0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->getManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    return-object v0
.end method

.method protected getPoolEntry()Lorg/apache/http/impl/conn/AbstractPoolEntry;
    .registers 2

    .prologue
    .line 66
    invoke-super {p0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->getPoolEntry()Lorg/apache/http/impl/conn/AbstractPoolEntry;

    move-result-object v0

    return-object v0
.end method
