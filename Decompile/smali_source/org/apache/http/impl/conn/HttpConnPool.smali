.class Lorg/apache/http/impl/conn/HttpConnPool;
.super Lorg/apache/http/pool/AbstractConnPool;
.source "HttpConnPool.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/conn/HttpConnPool$InternalConnFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/http/pool/AbstractConnPool",
        "<",
        "Lorg/apache/http/conn/routing/HttpRoute;",
        "Lorg/apache/http/conn/OperatedClientConnection;",
        "Lorg/apache/http/impl/conn/HttpPoolEntry;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final COUNTER:Ljava/util/concurrent/atomic/AtomicLong;


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;

.field private final timeToLive:J

.field private final tunit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 48
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    sput-object v0, Lorg/apache/http/impl/conn/HttpConnPool;->COUNTER:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/conn/ClientConnectionOperator;IIJLjava/util/concurrent/TimeUnit;)V
    .registers 9
    .param p1, "log"    # Lorg/apache/commons/logging/Log;
    .param p2, "connOperator"    # Lorg/apache/http/conn/ClientConnectionOperator;
    .param p3, "defaultMaxPerRoute"    # I
    .param p4, "maxTotal"    # I
    .param p5, "timeToLive"    # J
    .param p7, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 58
    new-instance v0, Lorg/apache/http/impl/conn/HttpConnPool$InternalConnFactory;

    invoke-direct {v0, p2}, Lorg/apache/http/impl/conn/HttpConnPool$InternalConnFactory;-><init>(Lorg/apache/http/conn/ClientConnectionOperator;)V

    invoke-direct {p0, v0, p3, p4}, Lorg/apache/http/pool/AbstractConnPool;-><init>(Lorg/apache/http/pool/ConnFactory;II)V

    .line 59
    iput-object p1, p0, Lorg/apache/http/impl/conn/HttpConnPool;->log:Lorg/apache/commons/logging/Log;

    .line 60
    iput-wide p5, p0, Lorg/apache/http/impl/conn/HttpConnPool;->timeToLive:J

    .line 61
    iput-object p7, p0, Lorg/apache/http/impl/conn/HttpConnPool;->tunit:Ljava/util/concurrent/TimeUnit;

    .line 62
    return-void
.end method


# virtual methods
.method protected createEntry(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/OperatedClientConnection;)Lorg/apache/http/impl/conn/HttpPoolEntry;
    .registers 12
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "conn"    # Lorg/apache/http/conn/OperatedClientConnection;

    .prologue
    .line 66
    sget-object v0, Lorg/apache/http/impl/conn/HttpConnPool;->COUNTER:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    .line 67
    .local v3, "id":Ljava/lang/String;
    new-instance v1, Lorg/apache/http/impl/conn/HttpPoolEntry;

    iget-object v2, p0, Lorg/apache/http/impl/conn/HttpConnPool;->log:Lorg/apache/commons/logging/Log;

    iget-wide v6, p0, Lorg/apache/http/impl/conn/HttpConnPool;->timeToLive:J

    iget-object v8, p0, Lorg/apache/http/impl/conn/HttpConnPool;->tunit:Ljava/util/concurrent/TimeUnit;

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v1 .. v8}, Lorg/apache/http/impl/conn/HttpPoolEntry;-><init>(Lorg/apache/commons/logging/Log;Ljava/lang/String;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/OperatedClientConnection;JLjava/util/concurrent/TimeUnit;)V

    return-object v1
.end method

.method protected bridge synthetic createEntry(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/http/pool/PoolEntry;
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 45
    check-cast p1, Lorg/apache/http/conn/routing/HttpRoute;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lorg/apache/http/conn/OperatedClientConnection;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/impl/conn/HttpConnPool;->createEntry(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/OperatedClientConnection;)Lorg/apache/http/impl/conn/HttpPoolEntry;

    move-result-object v0

    return-object v0
.end method
