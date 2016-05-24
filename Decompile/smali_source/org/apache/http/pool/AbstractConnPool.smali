.class public abstract Lorg/apache/http/pool/AbstractConnPool;
.super Ljava/lang/Object;
.source "AbstractConnPool.java"

# interfaces
.implements Lorg/apache/http/pool/ConnPool;
.implements Lorg/apache/http/pool/ConnPoolControl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "C:",
        "Ljava/lang/Object;",
        "E:",
        "Lorg/apache/http/pool/PoolEntry",
        "<TT;TC;>;>",
        "Ljava/lang/Object;",
        "Lorg/apache/http/pool/ConnPool",
        "<TT;TE;>;",
        "Lorg/apache/http/pool/ConnPoolControl",
        "<TT;>;"
    }
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final available:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<TE;>;"
        }
    .end annotation
.end field

.field private final connFactory:Lorg/apache/http/pool/ConnFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/pool/ConnFactory",
            "<TT;TC;>;"
        }
    .end annotation
.end field

.field private volatile defaultMaxPerRoute:I

.field private volatile isShutDown:Z

.field private final leased:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<TE;>;"
        }
    .end annotation
.end field

.field private final lock:Ljava/util/concurrent/locks/Lock;

.field private final maxPerRoute:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TT;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private volatile maxTotal:I

.field private final pending:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/apache/http/pool/PoolEntryFuture",
            "<TE;>;>;"
        }
    .end annotation
.end field

.field private final routeToPool:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TT;",
            "Lorg/apache/http/pool/RouteSpecificPool",
            "<TT;TC;TE;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/apache/http/pool/ConnFactory;II)V
    .registers 5
    .param p2, "defaultMaxPerRoute"    # I
    .param p3, "maxTotal"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/pool/ConnFactory",
            "<TT;TC;>;II)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "connFactory":Lorg/apache/http/pool/ConnFactory;, "Lorg/apache/http/pool/ConnFactory<TT;TC;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    const-string v0, "Connection factory"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/pool/ConnFactory;

    iput-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->connFactory:Lorg/apache/http/pool/ConnFactory;

    .line 85
    const-string v0, "Max per route value"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNegative(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/http/pool/AbstractConnPool;->defaultMaxPerRoute:I

    .line 86
    const-string v0, "Max total value"

    invoke-static {p3, v0}, Lorg/apache/http/util/Args;->notNegative(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/http/pool/AbstractConnPool;->maxTotal:I

    .line 87
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    .line 88
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    .line 89
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    .line 90
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    .line 91
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    .line 92
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->maxPerRoute:Ljava/util/Map;

    .line 93
    return-void
.end method

.method static synthetic access$000(Lorg/apache/http/pool/AbstractConnPool;Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Lorg/apache/http/pool/PoolEntryFuture;)Lorg/apache/http/pool/PoolEntry;
    .registers 8
    .param p0, "x0"    # Lorg/apache/http/pool/AbstractConnPool;
    .param p1, "x1"    # Ljava/lang/Object;
    .param p2, "x2"    # Ljava/lang/Object;
    .param p3, "x3"    # J
    .param p5, "x4"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "x5"    # Lorg/apache/http/pool/PoolEntryFuture;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 64
    invoke-direct/range {p0 .. p6}, Lorg/apache/http/pool/AbstractConnPool;->getPoolEntryBlocking(Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Lorg/apache/http/pool/PoolEntryFuture;)Lorg/apache/http/pool/PoolEntry;

    move-result-object v0

    return-object v0
.end method

.method private enumEntries(Ljava/util/Iterator;Lorg/apache/http/pool/PoolEntryCallback;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<TE;>;",
            "Lorg/apache/http/pool/PoolEntryCallback",
            "<TT;TC;>;)V"
        }
    .end annotation

    .prologue
    .line 459
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    .local p2, "callback":Lorg/apache/http/pool/PoolEntryCallback;, "Lorg/apache/http/pool/PoolEntryCallback<TT;TC;>;"
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_24

    .line 460
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/pool/PoolEntry;

    .line 461
    .local v0, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    invoke-interface {p2, v0}, Lorg/apache/http/pool/PoolEntryCallback;->process(Lorg/apache/http/pool/PoolEntry;)V

    .line 462
    invoke-virtual {v0}, Lorg/apache/http/pool/PoolEntry;->isClosed()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 463
    invoke-virtual {v0}, Lorg/apache/http/pool/PoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/http/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lorg/apache/http/pool/RouteSpecificPool;

    move-result-object v1

    .line 464
    .local v1, "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v1, v0}, Lorg/apache/http/pool/RouteSpecificPool;->remove(Lorg/apache/http/pool/PoolEntry;)Z

    .line 465
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 468
    .end local v0    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .end local v1    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_24
    return-void
.end method

.method private getMax(Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .line 335
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->maxPerRoute:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 336
    .local v0, "v":Ljava/lang/Integer;
    if-eqz v0, :cond_f

    .line 337
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 339
    :goto_e
    return v1

    :cond_f
    iget v1, p0, Lorg/apache/http/pool/AbstractConnPool;->defaultMaxPerRoute:I

    goto :goto_e
.end method

.method private getPool(Ljava/lang/Object;)Lorg/apache/http/pool/RouteSpecificPool;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lorg/apache/http/pool/RouteSpecificPool",
            "<TT;TC;TE;>;"
        }
    .end annotation

    .prologue
    .line 144
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/pool/RouteSpecificPool;

    .line 145
    .local v0, "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    if-nez v0, :cond_14

    .line 146
    new-instance v0, Lorg/apache/http/pool/AbstractConnPool$1;

    .end local v0    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-direct {v0, p0, p1, p1}, Lorg/apache/http/pool/AbstractConnPool$1;-><init>(Lorg/apache/http/pool/AbstractConnPool;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 154
    .restart local v0    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    :cond_14
    return-object v0
.end method

.method private getPoolEntryBlocking(Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Lorg/apache/http/pool/PoolEntryFuture;)Lorg/apache/http/pool/PoolEntry;
    .registers 30
    .param p2, "state"    # Ljava/lang/Object;
    .param p3, "timeout"    # J
    .param p5, "tunit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Object;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lorg/apache/http/pool/PoolEntryFuture",
            "<TE;>;)TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 211
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    .local p6, "future":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TE;>;"
    const/4 v5, 0x0

    .line 212
    .local v5, "deadline":Ljava/util/Date;
    const-wide/16 v18, 0x0

    cmp-long v18, p3, v18

    if-lez v18, :cond_1c

    .line 213
    new-instance v5, Ljava/util/Date;

    .end local v5    # "deadline":Ljava/util/Date;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    move-object/from16 v0, p5

    move-wide/from16 v1, p3

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v20

    add-long v18, v18, v20

    move-wide/from16 v0, v18

    invoke-direct {v5, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 217
    .restart local v5    # "deadline":Ljava/util/Date;
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 219
    :try_start_25
    invoke-direct/range {p0 .. p1}, Lorg/apache/http/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lorg/apache/http/pool/RouteSpecificPool;

    move-result-object v14

    .line 220
    .local v14, "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    const/4 v6, 0x0

    .line 221
    .local v6, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    :cond_2a
    if-nez v6, :cond_190

    .line 222
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/http/pool/AbstractConnPool;->isShutDown:Z

    move/from16 v18, v0

    if-nez v18, :cond_66

    const/16 v18, 0x1

    :goto_36
    const-string v19, "Connection pool shut down"

    invoke-static/range {v18 .. v19}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 224
    :goto_3b
    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Lorg/apache/http/pool/RouteSpecificPool;->getFree(Ljava/lang/Object;)Lorg/apache/http/pool/PoolEntry;

    move-result-object v6

    .line 225
    if-nez v6, :cond_69

    .line 236
    :cond_43
    if-eqz v6, :cond_9c

    .line 237
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 238
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_5b
    .catchall {:try_start_25 .. :try_end_5b} :catchall_91

    .line 299
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/concurrent/locks/Lock;->unlock()V

    move-object v7, v6

    .end local v6    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .local v7, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    :goto_65
    return-object v7

    .line 222
    .end local v7    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .restart local v6    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    :cond_66
    const/16 v18, 0x0

    goto :goto_36

    .line 228
    :cond_69
    :try_start_69
    invoke-virtual {v6}, Lorg/apache/http/pool/PoolEntry;->isClosed()Z

    move-result v18

    if-nez v18, :cond_7b

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    move-wide/from16 v0, v18

    invoke-virtual {v6, v0, v1}, Lorg/apache/http/pool/PoolEntry;->isExpired(J)Z

    move-result v18

    if-eqz v18, :cond_43

    .line 229
    :cond_7b
    invoke-virtual {v6}, Lorg/apache/http/pool/PoolEntry;->close()V

    .line 230
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 231
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v14, v6, v0}, Lorg/apache/http/pool/RouteSpecificPool;->free(Lorg/apache/http/pool/PoolEntry;Z)V
    :try_end_90
    .catchall {:try_start_69 .. :try_end_90} :catchall_91

    goto :goto_3b

    .line 299
    .end local v6    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .end local v14    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :catchall_91
    move-exception v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v18

    .line 243
    .restart local v6    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .restart local v14    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_9c
    :try_start_9c
    invoke-direct/range {p0 .. p1}, Lorg/apache/http/pool/AbstractConnPool;->getMax(Ljava/lang/Object;)I

    move-result v12

    .line 245
    .local v12, "maxPerRoute":I
    const/16 v18, 0x0

    invoke-virtual {v14}, Lorg/apache/http/pool/RouteSpecificPool;->getAllocatedCount()I

    move-result v19

    add-int/lit8 v19, v19, 0x1

    sub-int v19, v19, v12

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 246
    .local v8, "excess":I
    if-lez v8, :cond_b9

    .line 247
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_b1
    if-ge v10, v8, :cond_b9

    .line 248
    invoke-virtual {v14}, Lorg/apache/http/pool/RouteSpecificPool;->getLastUsed()Lorg/apache/http/pool/PoolEntry;

    move-result-object v11

    .line 249
    .local v11, "lastUsed":Lorg/apache/http/pool/PoolEntry;, "TE;"
    if-nez v11, :cond_140

    .line 258
    .end local v10    # "i":I
    .end local v11    # "lastUsed":Lorg/apache/http/pool/PoolEntry;, "TE;"
    :cond_b9
    invoke-virtual {v14}, Lorg/apache/http/pool/RouteSpecificPool;->getAllocatedCount()I

    move-result v18

    move/from16 v0, v18

    if-ge v0, v12, :cond_155

    .line 259
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/Set;->size()I

    move-result v17

    .line 260
    .local v17, "totalUsed":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/http/pool/AbstractConnPool;->maxTotal:I

    move/from16 v18, v0

    sub-int v18, v18, v17

    const/16 v19, 0x0

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 261
    .local v9, "freeCapacity":I
    if-lez v9, :cond_155

    .line 262
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/LinkedList;->size()I

    move-result v16

    .line 263
    .local v16, "totalAvailable":I
    add-int/lit8 v18, v9, -0x1

    move/from16 v0, v16

    move/from16 v1, v18

    if-le v0, v1, :cond_117

    .line 264
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_117

    .line 265
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/apache/http/pool/PoolEntry;

    .line 266
    .restart local v11    # "lastUsed":Lorg/apache/http/pool/PoolEntry;, "TE;"
    invoke-virtual {v11}, Lorg/apache/http/pool/PoolEntry;->close()V

    .line 267
    invoke-virtual {v11}, Lorg/apache/http/pool/PoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/apache/http/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lorg/apache/http/pool/RouteSpecificPool;

    move-result-object v13

    .line 268
    .local v13, "otherpool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v13, v11}, Lorg/apache/http/pool/RouteSpecificPool;->remove(Lorg/apache/http/pool/PoolEntry;)Z

    .line 271
    .end local v11    # "lastUsed":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .end local v13    # "otherpool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_117
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->connFactory:Lorg/apache/http/pool/ConnFactory;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Lorg/apache/http/pool/ConnFactory;->create(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 272
    .local v4, "conn":Ljava/lang/Object;, "TC;"
    invoke-virtual {v14, v4}, Lorg/apache/http/pool/RouteSpecificPool;->add(Ljava/lang/Object;)Lorg/apache/http/pool/PoolEntry;

    move-result-object v6

    .line 273
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_134
    .catchall {:try_start_9c .. :try_end_134} :catchall_91

    .line 299
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/concurrent/locks/Lock;->unlock()V

    move-object v7, v6

    .end local v6    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .restart local v7    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    goto/16 :goto_65

    .line 252
    .end local v4    # "conn":Ljava/lang/Object;, "TC;"
    .end local v7    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .end local v9    # "freeCapacity":I
    .end local v16    # "totalAvailable":I
    .end local v17    # "totalUsed":I
    .restart local v6    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .restart local v10    # "i":I
    .restart local v11    # "lastUsed":Lorg/apache/http/pool/PoolEntry;, "TE;"
    :cond_140
    :try_start_140
    invoke-virtual {v11}, Lorg/apache/http/pool/PoolEntry;->close()V

    .line 253
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 254
    invoke-virtual {v14, v11}, Lorg/apache/http/pool/RouteSpecificPool;->remove(Lorg/apache/http/pool/PoolEntry;)Z
    :try_end_151
    .catchall {:try_start_140 .. :try_end_151} :catchall_91

    .line 247
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_b1

    .line 278
    .end local v10    # "i":I
    .end local v11    # "lastUsed":Lorg/apache/http/pool/PoolEntry;, "TE;"
    :cond_155
    const/4 v15, 0x0

    .line 280
    .local v15, "success":Z
    :try_start_156
    move-object/from16 v0, p6

    invoke-virtual {v14, v0}, Lorg/apache/http/pool/RouteSpecificPool;->queue(Lorg/apache/http/pool/PoolEntryFuture;)V

    .line 281
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 282
    move-object/from16 v0, p6

    invoke-virtual {v0, v5}, Lorg/apache/http/pool/PoolEntryFuture;->await(Ljava/util/Date;)Z
    :try_end_16d
    .catchall {:try_start_156 .. :try_end_16d} :catchall_198

    move-result v15

    .line 288
    :try_start_16e
    move-object/from16 v0, p6

    invoke-virtual {v14, v0}, Lorg/apache/http/pool/RouteSpecificPool;->unqueue(Lorg/apache/http/pool/PoolEntryFuture;)V

    .line 289
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 292
    if-nez v15, :cond_2a

    if-eqz v5, :cond_2a

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v18

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    cmp-long v18, v18, v20

    if-gtz v18, :cond_2a

    .line 297
    .end local v8    # "excess":I
    .end local v12    # "maxPerRoute":I
    .end local v15    # "success":Z
    :cond_190
    new-instance v18, Ljava/util/concurrent/TimeoutException;

    const-string v19, "Timeout waiting for connection"

    invoke-direct/range {v18 .. v19}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 288
    .restart local v8    # "excess":I
    .restart local v12    # "maxPerRoute":I
    .restart local v15    # "success":Z
    :catchall_198
    move-exception v18

    move-object/from16 v0, p6

    invoke-virtual {v14, v0}, Lorg/apache/http/pool/RouteSpecificPool;->unqueue(Lorg/apache/http/pool/PoolEntryFuture;)V

    .line 289
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    throw v18
    :try_end_1ac
    .catchall {:try_start_16e .. :try_end_1ac} :catchall_91
.end method

.method private notifyPending(Lorg/apache/http/pool/RouteSpecificPool;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/pool/RouteSpecificPool",
            "<TT;TC;TE;>;)V"
        }
    .end annotation

    .prologue
    .line 304
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {p1}, Lorg/apache/http/pool/RouteSpecificPool;->nextPending()Lorg/apache/http/pool/PoolEntryFuture;

    move-result-object v0

    .line 305
    .local v0, "future":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TE;>;"
    if-eqz v0, :cond_11

    .line 306
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 310
    :goto_b
    if-eqz v0, :cond_10

    .line 311
    invoke-virtual {v0}, Lorg/apache/http/pool/PoolEntryFuture;->wakeup()V

    .line 313
    :cond_10
    return-void

    .line 308
    :cond_11
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "future":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TE;>;"
    check-cast v0, Lorg/apache/http/pool/PoolEntryFuture;

    .restart local v0    # "future":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TE;>;"
    goto :goto_b
.end method


# virtual methods
.method public closeExpired()V
    .registers 4

    .prologue
    .line 499
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 500
    .local v0, "now":J
    new-instance v2, Lorg/apache/http/pool/AbstractConnPool$4;

    invoke-direct {v2, p0, v0, v1}, Lorg/apache/http/pool/AbstractConnPool$4;-><init>(Lorg/apache/http/pool/AbstractConnPool;J)V

    invoke-virtual {p0, v2}, Lorg/apache/http/pool/AbstractConnPool;->enumAvailable(Lorg/apache/http/pool/PoolEntryCallback;)V

    .line 509
    return-void
.end method

.method public closeIdle(JLjava/util/concurrent/TimeUnit;)V
    .registers 11
    .param p1, "idletime"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 478
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    const-string v4, "Time unit"

    invoke-static {p3, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 479
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    .line 480
    .local v2, "time":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gez v4, :cond_11

    .line 481
    const-wide/16 v2, 0x0

    .line 483
    :cond_11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v0, v4, v2

    .line 484
    .local v0, "deadline":J
    new-instance v4, Lorg/apache/http/pool/AbstractConnPool$3;

    invoke-direct {v4, p0, v0, v1}, Lorg/apache/http/pool/AbstractConnPool$3;-><init>(Lorg/apache/http/pool/AbstractConnPool;J)V

    invoke-virtual {p0, v4}, Lorg/apache/http/pool/AbstractConnPool;->enumAvailable(Lorg/apache/http/pool/PoolEntryCallback;)V

    .line 493
    return-void
.end method

.method protected abstract createEntry(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/http/pool/PoolEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TC;)TE;"
        }
    .end annotation
.end method

.method protected enumAvailable(Lorg/apache/http/pool/PoolEntryCallback;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/pool/PoolEntryCallback",
            "<TT;TC;>;)V"
        }
    .end annotation

    .prologue
    .line 436
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "callback":Lorg/apache/http/pool/PoolEntryCallback;, "Lorg/apache/http/pool/PoolEntryCallback<TT;TC;>;"
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 438
    :try_start_5
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lorg/apache/http/pool/AbstractConnPool;->enumEntries(Ljava/util/Iterator;Lorg/apache/http/pool/PoolEntryCallback;)V
    :try_end_e
    .catchall {:try_start_5 .. :try_end_e} :catchall_14

    .line 440
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 442
    return-void

    .line 440
    :catchall_14
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method protected enumLeased(Lorg/apache/http/pool/PoolEntryCallback;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/pool/PoolEntryCallback",
            "<TT;TC;>;)V"
        }
    .end annotation

    .prologue
    .line 450
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "callback":Lorg/apache/http/pool/PoolEntryCallback;, "Lorg/apache/http/pool/PoolEntryCallback<TT;TC;>;"
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 452
    :try_start_5
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lorg/apache/http/pool/AbstractConnPool;->enumEntries(Ljava/util/Iterator;Lorg/apache/http/pool/PoolEntryCallback;)V
    :try_end_e
    .catchall {:try_start_5 .. :try_end_e} :catchall_14

    .line 454
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 456
    return-void

    .line 454
    :catchall_14
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getDefaultMaxPerRoute()I
    .registers 3

    .prologue
    .line 373
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 375
    :try_start_5
    iget v0, p0, Lorg/apache/http/pool/AbstractConnPool;->defaultMaxPerRoute:I
    :try_end_7
    .catchall {:try_start_5 .. :try_end_7} :catchall_d

    .line 377
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v0

    :catchall_d
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getMaxPerRoute(Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .line 393
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    const-string v0, "Route"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 394
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 396
    :try_start_a
    invoke-direct {p0, p1}, Lorg/apache/http/pool/AbstractConnPool;->getMax(Ljava/lang/Object;)I
    :try_end_d
    .catchall {:try_start_a .. :try_end_d} :catchall_14

    move-result v0

    .line 398
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v0

    :catchall_14
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getMaxTotal()I
    .registers 3

    .prologue
    .line 354
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 356
    :try_start_5
    iget v0, p0, Lorg/apache/http/pool/AbstractConnPool;->maxTotal:I
    :try_end_7
    .catchall {:try_start_5 .. :try_end_7} :catchall_d

    .line 358
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v0

    :catchall_d
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getStats(Ljava/lang/Object;)Lorg/apache/http/pool/PoolStats;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lorg/apache/http/pool/PoolStats;"
        }
    .end annotation

    .prologue
    .line 416
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    const-string v1, "Route"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 417
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 419
    :try_start_a
    invoke-direct {p0, p1}, Lorg/apache/http/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lorg/apache/http/pool/RouteSpecificPool;

    move-result-object v0

    .line 420
    .local v0, "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    new-instance v1, Lorg/apache/http/pool/PoolStats;

    invoke-virtual {v0}, Lorg/apache/http/pool/RouteSpecificPool;->getLeasedCount()I

    move-result v2

    invoke-virtual {v0}, Lorg/apache/http/pool/RouteSpecificPool;->getPendingCount()I

    move-result v3

    invoke-virtual {v0}, Lorg/apache/http/pool/RouteSpecificPool;->getAvailableCount()I

    move-result v4

    invoke-direct {p0, p1}, Lorg/apache/http/pool/AbstractConnPool;->getMax(Ljava/lang/Object;)I

    move-result v5

    invoke-direct {v1, v2, v3, v4, v5}, Lorg/apache/http/pool/PoolStats;-><init>(IIII)V
    :try_end_23
    .catchall {:try_start_a .. :try_end_23} :catchall_29

    .line 426
    iget-object v2, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v1

    .end local v0    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :catchall_29
    move-exception v1

    iget-object v2, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public getTotalStats()Lorg/apache/http/pool/PoolStats;
    .registers 6

    .prologue
    .line 403
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 405
    :try_start_5
    new-instance v0, Lorg/apache/http/pool/PoolStats;

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    iget-object v2, p0, Lorg/apache/http/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    iget v4, p0, Lorg/apache/http/pool/AbstractConnPool;->maxTotal:I

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/apache/http/pool/PoolStats;-><init>(IIII)V
    :try_end_1e
    .catchall {:try_start_5 .. :try_end_1e} :catchall_24

    .line 411
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v0

    :catchall_24
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public isShutdown()Z
    .registers 2

    .prologue
    .line 113
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-boolean v0, p0, Lorg/apache/http/pool/AbstractConnPool;->isShutDown:Z

    return v0
.end method

.method public lease(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/concurrent/Future;
    .registers 4
    .param p2, "state"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/concurrent/Future",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 202
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/http/pool/AbstractConnPool;->lease(Ljava/lang/Object;Ljava/lang/Object;Lorg/apache/http/concurrent/FutureCallback;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method public lease(Ljava/lang/Object;Ljava/lang/Object;Lorg/apache/http/concurrent/FutureCallback;)Ljava/util/concurrent/Future;
    .registers 10
    .param p2, "state"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Object;",
            "Lorg/apache/http/concurrent/FutureCallback",
            "<TE;>;)",
            "Ljava/util/concurrent/Future",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 168
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    .local p3, "callback":Lorg/apache/http/concurrent/FutureCallback;, "Lorg/apache/http/concurrent/FutureCallback<TE;>;"
    const-string v0, "Route"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 169
    iget-boolean v0, p0, Lorg/apache/http/pool/AbstractConnPool;->isShutDown:Z

    if-nez v0, :cond_1b

    const/4 v0, 0x1

    :goto_a
    const-string v1, "Connection pool shut down"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 170
    new-instance v0, Lorg/apache/http/pool/AbstractConnPool$2;

    iget-object v2, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object v1, p0

    move-object v3, p3

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/pool/AbstractConnPool$2;-><init>(Lorg/apache/http/pool/AbstractConnPool;Ljava/util/concurrent/locks/Lock;Lorg/apache/http/concurrent/FutureCallback;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0

    .line 169
    :cond_1b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method protected onLease(Lorg/apache/http/pool/PoolEntry;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 104
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    return-void
.end method

.method protected onRelease(Lorg/apache/http/pool/PoolEntry;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 110
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    return-void
.end method

.method public bridge synthetic release(Ljava/lang/Object;Z)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Z

    .prologue
    .line 63
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    check-cast p1, Lorg/apache/http/pool/PoolEntry;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/pool/AbstractConnPool;->release(Lorg/apache/http/pool/PoolEntry;Z)V

    return-void
.end method

.method public release(Lorg/apache/http/pool/PoolEntry;Z)V
    .registers 6
    .param p2, "reusable"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;Z)V"
        }
    .end annotation

    .prologue
    .line 316
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 318
    :try_start_5
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_29

    .line 319
    invoke-virtual {p1}, Lorg/apache/http/pool/PoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/http/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lorg/apache/http/pool/RouteSpecificPool;

    move-result-object v0

    .line 320
    .local v0, "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v0, p1, p2}, Lorg/apache/http/pool/RouteSpecificPool;->free(Lorg/apache/http/pool/PoolEntry;Z)V

    .line 321
    if-eqz p2, :cond_2f

    iget-boolean v1, p0, Lorg/apache/http/pool/AbstractConnPool;->isShutDown:Z

    if-nez v1, :cond_2f

    .line 322
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 323
    invoke-virtual {p0, p1}, Lorg/apache/http/pool/AbstractConnPool;->onRelease(Lorg/apache/http/pool/PoolEntry;)V

    .line 327
    :goto_26
    invoke-direct {p0, v0}, Lorg/apache/http/pool/AbstractConnPool;->notifyPending(Lorg/apache/http/pool/RouteSpecificPool;)V
    :try_end_29
    .catchall {:try_start_5 .. :try_end_29} :catchall_33

    .line 330
    .end local v0    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_29
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 332
    return-void

    .line 325
    .restart local v0    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_2f
    :try_start_2f
    invoke-virtual {p1}, Lorg/apache/http/pool/PoolEntry;->close()V
    :try_end_32
    .catchall {:try_start_2f .. :try_end_32} :catchall_33

    goto :goto_26

    .line 330
    .end local v0    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :catchall_33
    move-exception v1

    iget-object v2, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public setDefaultMaxPerRoute(I)V
    .registers 4
    .param p1, "max"    # I

    .prologue
    .line 363
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    const-string v0, "Max per route value"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNegative(ILjava/lang/String;)I

    .line 364
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 366
    :try_start_a
    iput p1, p0, Lorg/apache/http/pool/AbstractConnPool;->defaultMaxPerRoute:I
    :try_end_c
    .catchall {:try_start_a .. :try_end_c} :catchall_12

    .line 368
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 370
    return-void

    .line 368
    :catchall_12
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public setMaxPerRoute(Ljava/lang/Object;I)V
    .registers 5
    .param p2, "max"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    .prologue
    .line 382
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    const-string v0, "Route"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 383
    const-string v0, "Max per route value"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNegative(ILjava/lang/String;)I

    .line 384
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 386
    :try_start_f
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->maxPerRoute:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_18
    .catchall {:try_start_f .. :try_end_18} :catchall_1e

    .line 388
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 390
    return-void

    .line 388
    :catchall_1e
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public setMaxTotal(I)V
    .registers 4
    .param p1, "max"    # I

    .prologue
    .line 344
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    const-string v0, "Max value"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNegative(ILjava/lang/String;)I

    .line 345
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 347
    :try_start_a
    iput p1, p0, Lorg/apache/http/pool/AbstractConnPool;->maxTotal:I
    :try_end_c
    .catchall {:try_start_a .. :try_end_c} :catchall_12

    .line 349
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 351
    return-void

    .line 349
    :catchall_12
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public shutdown()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-boolean v3, p0, Lorg/apache/http/pool/AbstractConnPool;->isShutDown:Z

    if-eqz v3, :cond_5

    .line 141
    :goto_4
    return-void

    .line 123
    :cond_5
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/apache/http/pool/AbstractConnPool;->isShutDown:Z

    .line 124
    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 126
    :try_start_d
    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/pool/PoolEntry;

    .line 127
    .local v0, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    invoke-virtual {v0}, Lorg/apache/http/pool/PoolEntry;->close()V
    :try_end_22
    .catchall {:try_start_d .. :try_end_22} :catchall_23

    goto :goto_13

    .line 139
    .end local v0    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_23
    move-exception v3

    iget-object v4, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v3

    .line 129
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_2a
    :try_start_2a
    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_30
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_40

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/pool/PoolEntry;

    .line 130
    .restart local v0    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    invoke-virtual {v0}, Lorg/apache/http/pool/PoolEntry;->close()V

    goto :goto_30

    .line 132
    .end local v0    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    :cond_40
    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/http/pool/RouteSpecificPool;

    .line 133
    .local v2, "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v2}, Lorg/apache/http/pool/RouteSpecificPool;->shutdown()V

    goto :goto_4a

    .line 135
    .end local v2    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_5a
    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 136
    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->clear()V

    .line 137
    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->clear()V
    :try_end_69
    .catchall {:try_start_2a .. :try_end_69} :catchall_23

    .line 139
    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_4
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 513
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 514
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string v1, "[leased: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 515
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 516
    const-string v1, "][available: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 517
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 518
    const-string v1, "][pending: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 519
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 520
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 521
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
