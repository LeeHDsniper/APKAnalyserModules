.class public Lokio/AsyncTimeout;
.super Lokio/Timeout;
.source "AsyncTimeout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokio/AsyncTimeout$Watchdog;
    }
.end annotation


# static fields
.field private static head:Lokio/AsyncTimeout;


# instance fields
.field private inQueue:Z

.field private next:Lokio/AsyncTimeout;

.field private timeoutAt:J


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 40
    invoke-direct {p0}, Lokio/Timeout;-><init>()V

    .line 263
    return-void
.end method

.method static synthetic access$000()Lokio/AsyncTimeout;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 40
    invoke-static {}, Lokio/AsyncTimeout;->awaitTimeout()Lokio/AsyncTimeout;

    move-result-object v0

    return-object v0
.end method

.method private static declared-synchronized awaitTimeout()Lokio/AsyncTimeout;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const-wide/32 v10, 0xf4240

    const/4 v1, 0x0

    .line 293
    const-class v6, Lokio/AsyncTimeout;

    monitor-enter v6

    :try_start_7
    sget-object v7, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    iget-object v0, v7, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    .line 296
    .local v0, "node":Lokio/AsyncTimeout;
    if-nez v0, :cond_15

    .line 297
    const-class v7, Lokio/AsyncTimeout;

    invoke-virtual {v7}, Ljava/lang/Object;->wait()V
    :try_end_12
    .catchall {:try_start_7 .. :try_end_12} :catchall_3d

    move-object v0, v1

    .line 316
    .end local v0    # "node":Lokio/AsyncTimeout;
    .local v4, "waitNanos":J
    :goto_13
    monitor-exit v6

    return-object v0

    .line 301
    .end local v4    # "waitNanos":J
    .restart local v0    # "node":Lokio/AsyncTimeout;
    :cond_15
    :try_start_15
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    invoke-direct {v0, v8, v9}, Lokio/AsyncTimeout;->remainingNanos(J)J

    move-result-wide v4

    .line 304
    .restart local v4    # "waitNanos":J
    const-wide/16 v8, 0x0

    cmp-long v7, v4, v8

    if-lez v7, :cond_33

    .line 307
    const-wide/32 v8, 0xf4240

    div-long v2, v4, v8

    .line 308
    .local v2, "waitMillis":J
    mul-long v8, v2, v10

    sub-long/2addr v4, v8

    .line 309
    const-class v7, Lokio/AsyncTimeout;

    long-to-int v8, v4

    invoke-virtual {v7, v2, v3, v8}, Ljava/lang/Object;->wait(JI)V

    move-object v0, v1

    .line 310
    goto :goto_13

    .line 314
    .end local v2    # "waitMillis":J
    :cond_33
    sget-object v1, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    iget-object v7, v0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    iput-object v7, v1, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    .line 315
    const/4 v1, 0x0

    iput-object v1, v0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;
    :try_end_3c
    .catchall {:try_start_15 .. :try_end_3c} :catchall_3d

    goto :goto_13

    .line 293
    .end local v4    # "waitNanos":J
    :catchall_3d
    move-exception v1

    monitor-exit v6

    throw v1
.end method

.method private static declared-synchronized cancelScheduledTimeout(Lokio/AsyncTimeout;)Z
    .registers 4
    .param p0, "node"    # Lokio/AsyncTimeout;

    .prologue
    .line 117
    const-class v2, Lokio/AsyncTimeout;

    monitor-enter v2

    :try_start_3
    sget-object v0, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    .local v0, "prev":Lokio/AsyncTimeout;
    :goto_5
    if-eqz v0, :cond_18

    .line 118
    iget-object v1, v0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    if-ne v1, p0, :cond_15

    .line 119
    iget-object v1, p0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    iput-object v1, v0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    .line 120
    const/4 v1, 0x0

    iput-object v1, p0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_1a

    .line 121
    const/4 v1, 0x0

    .line 126
    :goto_13
    monitor-exit v2

    return v1

    .line 117
    :cond_15
    :try_start_15
    iget-object v0, v0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;
    :try_end_17
    .catchall {:try_start_15 .. :try_end_17} :catchall_1a

    goto :goto_5

    .line 126
    :cond_18
    const/4 v1, 0x1

    goto :goto_13

    .line 117
    .end local v0    # "prev":Lokio/AsyncTimeout;
    :catchall_1a
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method private remainingNanos(J)J
    .registers 6
    .param p1, "now"    # J

    .prologue
    .line 134
    iget-wide v0, p0, Lokio/AsyncTimeout;->timeoutAt:J

    sub-long/2addr v0, p1

    return-wide v0
.end method

.method private static declared-synchronized scheduleTimeout(Lokio/AsyncTimeout;JZ)V
    .registers 15
    .param p0, "node"    # Lokio/AsyncTimeout;
    .param p1, "timeoutNanos"    # J
    .param p3, "hasDeadline"    # Z

    .prologue
    const-wide/16 v8, 0x0

    .line 75
    const-class v6, Lokio/AsyncTimeout;

    monitor-enter v6

    :try_start_5
    sget-object v3, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    if-nez v3, :cond_18

    .line 76
    new-instance v3, Lokio/AsyncTimeout;

    invoke-direct {v3}, Lokio/AsyncTimeout;-><init>()V

    sput-object v3, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    .line 77
    new-instance v3, Lokio/AsyncTimeout$Watchdog;

    invoke-direct {v3}, Lokio/AsyncTimeout$Watchdog;-><init>()V

    invoke-virtual {v3}, Lokio/AsyncTimeout$Watchdog;->start()V

    .line 80
    :cond_18
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 81
    .local v0, "now":J
    cmp-long v3, p1, v8

    if-eqz v3, :cond_53

    if-eqz p3, :cond_53

    .line 84
    invoke-virtual {p0}, Lokio/AsyncTimeout;->deadlineNanoTime()J

    move-result-wide v8

    sub-long/2addr v8, v0

    invoke-static {p1, p2, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    add-long/2addr v8, v0

    iput-wide v8, p0, Lokio/AsyncTimeout;->timeoutAt:J

    .line 94
    :goto_2e
    invoke-direct {p0, v0, v1}, Lokio/AsyncTimeout;->remainingNanos(J)J

    move-result-wide v4

    .line 95
    .local v4, "remainingNanos":J
    sget-object v2, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    .line 96
    .local v2, "prev":Lokio/AsyncTimeout;
    :goto_34
    iget-object v3, v2, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    if-eqz v3, :cond_42

    iget-object v3, v2, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    invoke-direct {v3, v0, v1}, Lokio/AsyncTimeout;->remainingNanos(J)J

    move-result-wide v8

    cmp-long v3, v4, v8

    if-gez v3, :cond_6e

    .line 97
    :cond_42
    iget-object v3, v2, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    iput-object v3, p0, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    .line 98
    iput-object p0, v2, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;

    .line 99
    sget-object v3, Lokio/AsyncTimeout;->head:Lokio/AsyncTimeout;

    if-ne v2, v3, :cond_51

    .line 100
    const-class v3, Lokio/AsyncTimeout;

    invoke-virtual {v3}, Ljava/lang/Object;->notify()V
    :try_end_51
    .catchall {:try_start_5 .. :try_end_51} :catchall_5c

    .line 105
    :cond_51
    monitor-exit v6

    return-void

    .line 85
    .end local v2    # "prev":Lokio/AsyncTimeout;
    .end local v4    # "remainingNanos":J
    :cond_53
    cmp-long v3, p1, v8

    if-eqz v3, :cond_5f

    .line 86
    add-long v8, v0, p1

    :try_start_59
    iput-wide v8, p0, Lokio/AsyncTimeout;->timeoutAt:J
    :try_end_5b
    .catchall {:try_start_59 .. :try_end_5b} :catchall_5c

    goto :goto_2e

    .line 75
    .end local v0    # "now":J
    :catchall_5c
    move-exception v3

    monitor-exit v6

    throw v3

    .line 87
    .restart local v0    # "now":J
    :cond_5f
    if-eqz p3, :cond_68

    .line 88
    :try_start_61
    invoke-virtual {p0}, Lokio/AsyncTimeout;->deadlineNanoTime()J

    move-result-wide v8

    iput-wide v8, p0, Lokio/AsyncTimeout;->timeoutAt:J

    goto :goto_2e

    .line 90
    :cond_68
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 95
    .restart local v2    # "prev":Lokio/AsyncTimeout;
    .restart local v4    # "remainingNanos":J
    :cond_6e
    iget-object v2, v2, Lokio/AsyncTimeout;->next:Lokio/AsyncTimeout;
    :try_end_70
    .catchall {:try_start_61 .. :try_end_70} :catchall_5c

    goto :goto_34
.end method


# virtual methods
.method public final enter()V
    .registers 7

    .prologue
    .line 62
    iget-boolean v1, p0, Lokio/AsyncTimeout;->inQueue:Z

    if-eqz v1, :cond_c

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v4, "Unbalanced enter/exit"

    invoke-direct {v1, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 63
    :cond_c
    invoke-virtual {p0}, Lokio/AsyncTimeout;->timeoutNanos()J

    move-result-wide v2

    .line 64
    .local v2, "timeoutNanos":J
    invoke-virtual {p0}, Lokio/AsyncTimeout;->hasDeadline()Z

    move-result v0

    .line 65
    .local v0, "hasDeadline":Z
    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-nez v1, :cond_1d

    if-nez v0, :cond_1d

    .line 70
    :goto_1c
    return-void

    .line 68
    :cond_1d
    const/4 v1, 0x1

    iput-boolean v1, p0, Lokio/AsyncTimeout;->inQueue:Z

    .line 69
    invoke-static {p0, v2, v3, v0}, Lokio/AsyncTimeout;->scheduleTimeout(Lokio/AsyncTimeout;JZ)V

    goto :goto_1c
.end method

.method final exit(Ljava/io/IOException;)Ljava/io/IOException;
    .registers 4
    .param p1, "cause"    # Ljava/io/IOException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 257
    invoke-virtual {p0}, Lokio/AsyncTimeout;->exit()Z

    move-result v1

    if-nez v1, :cond_7

    .line 260
    .end local p1    # "cause":Ljava/io/IOException;
    :goto_6
    return-object p1

    .line 258
    .restart local p1    # "cause":Ljava/io/IOException;
    :cond_7
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "timeout"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 259
    .local v0, "e":Ljava/io/InterruptedIOException;
    invoke-virtual {v0, p1}, Ljava/io/InterruptedIOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-object p1, v0

    .line 260
    goto :goto_6
.end method

.method final exit(Z)V
    .registers 5
    .param p1, "throwOnTimeout"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 248
    invoke-virtual {p0}, Lokio/AsyncTimeout;->exit()Z

    move-result v0

    .line 249
    .local v0, "timedOut":Z
    if-eqz v0, :cond_10

    if-eqz p1, :cond_10

    new-instance v1, Ljava/io/InterruptedIOException;

    const-string v2, "timeout"

    invoke-direct {v1, v2}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 250
    :cond_10
    return-void
.end method

.method public final exit()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 109
    iget-boolean v1, p0, Lokio/AsyncTimeout;->inQueue:Z

    if-nez v1, :cond_6

    .line 111
    :goto_5
    return v0

    .line 110
    :cond_6
    iput-boolean v0, p0, Lokio/AsyncTimeout;->inQueue:Z

    .line 111
    invoke-static {p0}, Lokio/AsyncTimeout;->cancelScheduledTimeout(Lokio/AsyncTimeout;)Z

    move-result v0

    goto :goto_5
.end method

.method public final sink(Lokio/Sink;)Lokio/Sink;
    .registers 3
    .param p1, "sink"    # Lokio/Sink;

    .prologue
    .line 150
    new-instance v0, Lokio/AsyncTimeout$1;

    invoke-direct {v0, p0, p1}, Lokio/AsyncTimeout$1;-><init>(Lokio/AsyncTimeout;Lokio/Sink;)V

    return-object v0
.end method

.method public final source(Lokio/Source;)Lokio/Source;
    .registers 3
    .param p1, "source"    # Lokio/Source;

    .prologue
    .line 206
    new-instance v0, Lokio/AsyncTimeout$2;

    invoke-direct {v0, p0, p1}, Lokio/AsyncTimeout$2;-><init>(Lokio/AsyncTimeout;Lokio/Source;)V

    return-object v0
.end method

.method protected timedOut()V
    .registers 1

    .prologue
    .line 142
    return-void
.end method
