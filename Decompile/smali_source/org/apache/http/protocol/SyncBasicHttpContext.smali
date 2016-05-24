.class public Lorg/apache/http/protocol/SyncBasicHttpContext;
.super Lorg/apache/http/protocol/BasicHttpContext;
.source "SyncBasicHttpContext.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    .line 49
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/protocol/HttpContext;)V
    .registers 2
    .param p1, "parentContext"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lorg/apache/http/protocol/BasicHttpContext;-><init>(Lorg/apache/http/protocol/HttpContext;)V

    .line 42
    return-void
.end method


# virtual methods
.method public declared-synchronized clear()V
    .registers 2

    .prologue
    .line 71
    monitor-enter p0

    :try_start_1
    invoke-super {p0}, Lorg/apache/http/protocol/BasicHttpContext;->clear()V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_6

    .line 72
    monitor-exit p0

    return-void

    .line 71
    :catchall_6
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 53
    monitor-enter p0

    :try_start_1
    invoke-super {p0, p1}, Lorg/apache/http/protocol/BasicHttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_7

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 63
    monitor-enter p0

    :try_start_1
    invoke-super {p0, p1}, Lorg/apache/http/protocol/BasicHttpContext;->removeAttribute(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_7

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "obj"    # Ljava/lang/Object;

    .prologue
    .line 58
    monitor-enter p0

    :try_start_1
    invoke-super {p0, p1, p2}, Lorg/apache/http/protocol/BasicHttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_6

    .line 59
    monitor-exit p0

    return-void

    .line 58
    :catchall_6
    move-exception v0

    monitor-exit p0

    throw v0
.end method
