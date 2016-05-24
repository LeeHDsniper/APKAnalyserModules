.class Lorg/apache/http/impl/execchain/ConnectionHolder;
.super Ljava/lang/Object;
.source "ConnectionHolder.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Lorg/apache/http/concurrent/Cancellable;
.implements Lorg/apache/http/conn/ConnectionReleaseTrigger;


# annotations
.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;

.field private final managedConn:Lorg/apache/http/HttpClientConnection;

.field private final manager:Lorg/apache/http/conn/HttpClientConnectionManager;

.field private volatile released:Z

.field private volatile reusable:Z

.field private volatile state:Ljava/lang/Object;

.field private volatile tunit:Ljava/util/concurrent/TimeUnit;

.field private volatile validDuration:J


# direct methods
.method public constructor <init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/conn/HttpClientConnectionManager;Lorg/apache/http/HttpClientConnection;)V
    .registers 4
    .param p1, "log"    # Lorg/apache/commons/logging/Log;
    .param p2, "manager"    # Lorg/apache/http/conn/HttpClientConnectionManager;
    .param p3, "managedConn"    # Lorg/apache/http/HttpClientConnection;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-object p1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    .line 66
    iput-object p2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    .line 67
    iput-object p3, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    .line 68
    return-void
.end method


# virtual methods
.method public abortConnection()V
    .registers 10

    .prologue
    .line 119
    iget-object v8, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    monitor-enter v8

    .line 120
    :try_start_3
    iget-boolean v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->released:Z

    if-eqz v1, :cond_9

    .line 121
    monitor-exit v8

    .line 136
    :goto_8
    return-void

    .line 123
    :cond_9
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->released:Z
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_26

    .line 125
    :try_start_c
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    invoke-interface {v1}, Lorg/apache/http/HttpClientConnection;->shutdown()V

    .line 126
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Connection discarded"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_18} :catch_29
    .catchall {:try_start_c .. :try_end_18} :catchall_48

    .line 132
    :try_start_18
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v1 .. v6}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    .line 135
    :goto_24
    monitor-exit v8

    goto :goto_8

    :catchall_26
    move-exception v1

    monitor-exit v8
    :try_end_28
    .catchall {:try_start_18 .. :try_end_28} :catchall_26

    throw v1

    .line 127
    :catch_29
    move-exception v0

    .line 128
    .local v0, "ex":Ljava/io/IOException;
    :try_start_2a
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 129
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_3b
    .catchall {:try_start_2a .. :try_end_3b} :catchall_48

    .line 132
    :cond_3b
    :try_start_3b
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v1 .. v6}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    goto :goto_24

    .end local v0    # "ex":Ljava/io/IOException;
    :catchall_48
    move-exception v1

    move-object v7, v1

    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v1 .. v6}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    throw v7
    :try_end_57
    .catchall {:try_start_3b .. :try_end_57} :catchall_26
.end method

.method public cancel()Z
    .registers 4

    .prologue
    .line 139
    iget-boolean v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->released:Z

    .line 140
    .local v0, "alreadyReleased":Z
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Cancelling request execution"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 141
    invoke-virtual {p0}, Lorg/apache/http/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 142
    if-nez v0, :cond_10

    const/4 v1, 0x1

    :goto_f
    return v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

.method public close()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    invoke-virtual {p0}, Lorg/apache/http/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 151
    return-void
.end method

.method public isReleased()Z
    .registers 2

    .prologue
    .line 146
    iget-boolean v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->released:Z

    return v0
.end method

.method public isReusable()Z
    .registers 2

    .prologue
    .line 71
    iget-boolean v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->reusable:Z

    return v0
.end method

.method public markNonReusable()V
    .registers 2

    .prologue
    .line 79
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->reusable:Z

    .line 80
    return-void
.end method

.method public markReusable()V
    .registers 2

    .prologue
    .line 75
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->reusable:Z

    .line 76
    return-void
.end method

.method public releaseConnection()V
    .registers 10

    .prologue
    .line 94
    iget-object v8, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    monitor-enter v8

    .line 95
    :try_start_3
    iget-boolean v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->released:Z

    if-eqz v1, :cond_9

    .line 96
    monitor-exit v8

    .line 116
    :goto_8
    return-void

    .line 98
    :cond_9
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->released:Z

    .line 99
    iget-boolean v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->reusable:Z

    if-eqz v1, :cond_22

    .line 100
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    iget-object v3, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->state:Ljava/lang/Object;

    iget-wide v4, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->validDuration:J

    iget-object v6, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->tunit:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v1 .. v6}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    .line 115
    :goto_1d
    monitor-exit v8

    goto :goto_8

    :catchall_1f
    move-exception v1

    monitor-exit v8
    :try_end_21
    .catchall {:try_start_3 .. :try_end_21} :catchall_1f

    throw v1

    .line 104
    :cond_22
    :try_start_22
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    invoke-interface {v1}, Lorg/apache/http/HttpClientConnection;->close()V

    .line 105
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Connection discarded"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_2e} :catch_3b
    .catchall {:try_start_22 .. :try_end_2e} :catchall_5a

    .line 111
    :try_start_2e
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v1 .. v6}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V
    :try_end_3a
    .catchall {:try_start_2e .. :try_end_3a} :catchall_1f

    goto :goto_1d

    .line 106
    :catch_3b
    move-exception v0

    .line 107
    .local v0, "ex":Ljava/io/IOException;
    :try_start_3c
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_4d

    .line 108
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_4d
    .catchall {:try_start_3c .. :try_end_4d} :catchall_5a

    .line 111
    :cond_4d
    :try_start_4d
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v1 .. v6}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    goto :goto_1d

    .end local v0    # "ex":Ljava/io/IOException;
    :catchall_5a
    move-exception v1

    move-object v7, v1

    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->manager:Lorg/apache/http/conn/HttpClientConnectionManager;

    iget-object v2, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v1 .. v6}, Lorg/apache/http/conn/HttpClientConnectionManager;->releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    throw v7
    :try_end_69
    .catchall {:try_start_4d .. :try_end_69} :catchall_1f
.end method

.method public setState(Ljava/lang/Object;)V
    .registers 2
    .param p1, "state"    # Ljava/lang/Object;

    .prologue
    .line 83
    iput-object p1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->state:Ljava/lang/Object;

    .line 84
    return-void
.end method

.method public setValidFor(JLjava/util/concurrent/TimeUnit;)V
    .registers 7
    .param p1, "duration"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 87
    iget-object v1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->managedConn:Lorg/apache/http/HttpClientConnection;

    monitor-enter v1

    .line 88
    :try_start_3
    iput-wide p1, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->validDuration:J

    .line 89
    iput-object p3, p0, Lorg/apache/http/impl/execchain/ConnectionHolder;->tunit:Ljava/util/concurrent/TimeUnit;

    .line 90
    monitor-exit v1

    .line 91
    return-void

    .line 90
    :catchall_9
    move-exception v0

    monitor-exit v1
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_9

    throw v0
.end method
