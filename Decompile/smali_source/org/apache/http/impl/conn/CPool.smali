.class Lorg/apache/http/impl/conn/CPool;
.super Lorg/apache/http/pool/AbstractConnPool;
.source "CPool.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/http/pool/AbstractConnPool",
        "<",
        "Lorg/apache/http/conn/routing/HttpRoute;",
        "Lorg/apache/http/conn/ManagedHttpClientConnection;",
        "Lorg/apache/http/impl/conn/CPoolEntry;",
        ">;"
    }
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
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
    .line 46
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    sput-object v0, Lorg/apache/http/impl/conn/CPool;->COUNTER:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/pool/ConnFactory;IIJLjava/util/concurrent/TimeUnit;)V
    .registers 9
    .param p2, "defaultMaxPerRoute"    # I
    .param p3, "maxTotal"    # I
    .param p4, "timeToLive"    # J
    .param p6, "tunit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/pool/ConnFactory",
            "<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Lorg/apache/http/conn/ManagedHttpClientConnection;",
            ">;IIJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")V"
        }
    .end annotation

    .prologue
    .line 56
    .local p1, "connFactory":Lorg/apache/http/pool/ConnFactory;, "Lorg/apache/http/pool/ConnFactory<Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;>;"
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/http/pool/AbstractConnPool;-><init>(Lorg/apache/http/pool/ConnFactory;II)V

    .line 48
    const-class v0, Lorg/apache/http/impl/conn/CPool;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/CPool;->log:Lorg/apache/commons/logging/Log;

    .line 57
    iput-wide p4, p0, Lorg/apache/http/impl/conn/CPool;->timeToLive:J

    .line 58
    iput-object p6, p0, Lorg/apache/http/impl/conn/CPool;->tunit:Ljava/util/concurrent/TimeUnit;

    .line 59
    return-void
.end method


# virtual methods
.method protected createEntry(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;)Lorg/apache/http/impl/conn/CPoolEntry;
    .registers 12
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "conn"    # Lorg/apache/http/conn/ManagedHttpClientConnection;

    .prologue
    .line 63
    sget-object v0, Lorg/apache/http/impl/conn/CPool;->COUNTER:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    .line 64
    .local v3, "id":Ljava/lang/String;
    new-instance v1, Lorg/apache/http/impl/conn/CPoolEntry;

    iget-object v2, p0, Lorg/apache/http/impl/conn/CPool;->log:Lorg/apache/commons/logging/Log;

    iget-wide v6, p0, Lorg/apache/http/impl/conn/CPool;->timeToLive:J

    iget-object v8, p0, Lorg/apache/http/impl/conn/CPool;->tunit:Ljava/util/concurrent/TimeUnit;

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v1 .. v8}, Lorg/apache/http/impl/conn/CPoolEntry;-><init>(Lorg/apache/commons/logging/Log;Ljava/lang/String;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;JLjava/util/concurrent/TimeUnit;)V

    return-object v1
.end method

.method protected bridge synthetic createEntry(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/http/pool/PoolEntry;
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 43
    check-cast p1, Lorg/apache/http/conn/routing/HttpRoute;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lorg/apache/http/conn/ManagedHttpClientConnection;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/impl/conn/CPool;->createEntry(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;)Lorg/apache/http/impl/conn/CPoolEntry;

    move-result-object v0

    return-object v0
.end method
