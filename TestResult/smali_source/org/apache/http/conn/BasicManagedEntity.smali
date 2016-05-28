.class public Lorg/apache/http/conn/BasicManagedEntity;
.super Lorg/apache/http/entity/HttpEntityWrapper;
.source "BasicManagedEntity.java"

# interfaces
.implements Lorg/apache/http/conn/ConnectionReleaseTrigger;
.implements Lorg/apache/http/conn/EofSensorWatcher;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field protected final attemptReuse:Z

.field protected managedConn:Lorg/apache/http/conn/ManagedClientConnection;


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpEntity;Lorg/apache/http/conn/ManagedClientConnection;Z)V
    .registers 5
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;
    .param p2, "conn"    # Lorg/apache/http/conn/ManagedClientConnection;
    .param p3, "reuse"    # Z

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lorg/apache/http/entity/HttpEntityWrapper;-><init>(Lorg/apache/http/HttpEntity;)V

    .line 75
    const-string v0, "Connection"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 76
    iput-object p2, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    .line 77
    iput-boolean p3, p0, Lorg/apache/http/conn/BasicManagedEntity;->attemptReuse:Z

    .line 78
    return-void
.end method

.method private ensureConsumed()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    iget-object v0, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    if-nez v0, :cond_5

    .line 106
    :goto_4
    return-void

    .line 96
    :cond_5
    :try_start_5
    iget-boolean v0, p0, Lorg/apache/http/conn/BasicManagedEntity;->attemptReuse:Z

    if-eqz v0, :cond_17

    .line 98
    iget-object v0, p0, Lorg/apache/http/conn/BasicManagedEntity;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-static {v0}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 99
    iget-object v0, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/ManagedClientConnection;->markReusable()V
    :try_end_13
    .catchall {:try_start_5 .. :try_end_13} :catchall_1d

    .line 104
    :goto_13
    invoke-virtual {p0}, Lorg/apache/http/conn/BasicManagedEntity;->releaseManagedConnection()V

    goto :goto_4

    .line 101
    :cond_17
    :try_start_17
    iget-object v0, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/ManagedClientConnection;->unmarkReusable()V
    :try_end_1c
    .catchall {:try_start_17 .. :try_end_1c} :catchall_1d

    goto :goto_13

    .line 104
    :catchall_1d
    move-exception v0

    invoke-virtual {p0}, Lorg/apache/http/conn/BasicManagedEntity;->releaseManagedConnection()V

    throw v0
.end method


# virtual methods
.method public abortConnection()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 129
    iget-object v0, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    if-eqz v0, :cond_c

    .line 131
    :try_start_5
    iget-object v0, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/ManagedClientConnection;->abortConnection()V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_d

    .line 133
    iput-object v1, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    .line 136
    :cond_c
    return-void

    .line 133
    :catchall_d
    move-exception v0

    iput-object v1, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    throw v0
.end method

.method public consumeContent()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 114
    invoke-direct {p0}, Lorg/apache/http/conn/BasicManagedEntity;->ensureConsumed()V

    .line 115
    return-void
.end method

.method public eofDetected(Ljava/io/InputStream;)Z
    .registers 3
    .param p1, "wrapped"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 140
    :try_start_0
    iget-object v0, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    if-eqz v0, :cond_10

    .line 141
    iget-boolean v0, p0, Lorg/apache/http/conn/BasicManagedEntity;->attemptReuse:Z

    if-eqz v0, :cond_15

    .line 144
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 145
    iget-object v0, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/ManagedClientConnection;->markReusable()V
    :try_end_10
    .catchall {:try_start_0 .. :try_end_10} :catchall_1b

    .line 151
    :cond_10
    :goto_10
    invoke-virtual {p0}, Lorg/apache/http/conn/BasicManagedEntity;->releaseManagedConnection()V

    .line 153
    const/4 v0, 0x0

    return v0

    .line 147
    :cond_15
    :try_start_15
    iget-object v0, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/ManagedClientConnection;->unmarkReusable()V
    :try_end_1a
    .catchall {:try_start_15 .. :try_end_1a} :catchall_1b

    goto :goto_10

    .line 151
    :catchall_1b
    move-exception v0

    invoke-virtual {p0}, Lorg/apache/http/conn/BasicManagedEntity;->releaseManagedConnection()V

    throw v0
.end method

.method public getContent()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    new-instance v0, Lorg/apache/http/conn/EofSensorInputStream;

    iget-object v1, p0, Lorg/apache/http/conn/BasicManagedEntity;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lorg/apache/http/conn/EofSensorInputStream;-><init>(Ljava/io/InputStream;Lorg/apache/http/conn/EofSensorWatcher;)V

    return-object v0
.end method

.method public isRepeatable()Z
    .registers 2

    .prologue
    .line 82
    const/4 v0, 0x0

    return v0
.end method

.method public releaseConnection()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    invoke-direct {p0}, Lorg/apache/http/conn/BasicManagedEntity;->ensureConsumed()V

    .line 125
    return-void
.end method

.method protected releaseManagedConnection()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 199
    iget-object v0, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    if-eqz v0, :cond_c

    .line 201
    :try_start_5
    iget-object v0, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/ManagedClientConnection;->releaseConnection()V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_d

    .line 203
    iput-object v1, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    .line 206
    :cond_c
    return-void

    .line 203
    :catchall_d
    move-exception v0

    iput-object v1, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    throw v0
.end method

.method public streamAbort(Ljava/io/InputStream;)Z
    .registers 3
    .param p1, "wrapped"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 182
    iget-object v0, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    if-eqz v0, :cond_9

    .line 183
    iget-object v0, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/ManagedClientConnection;->abortConnection()V

    .line 185
    :cond_9
    const/4 v0, 0x0

    return v0
.end method

.method public streamClosed(Ljava/io/InputStream;)Z
    .registers 5
    .param p1, "wrapped"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    :try_start_0
    iget-object v2, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    if-eqz v2, :cond_16

    .line 159
    iget-boolean v2, p0, Lorg/apache/http/conn/BasicManagedEntity;->attemptReuse:Z

    if-eqz v2, :cond_24

    .line 160
    iget-object v2, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v2}, Lorg/apache/http/conn/ManagedClientConnection;->isOpen()Z
    :try_end_d
    .catchall {:try_start_0 .. :try_end_d} :catchall_1f

    move-result v1

    .line 164
    .local v1, "valid":Z
    :try_start_e
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 165
    iget-object v2, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v2}, Lorg/apache/http/conn/ManagedClientConnection;->markReusable()V
    :try_end_16
    .catch Ljava/net/SocketException; {:try_start_e .. :try_end_16} :catch_1b
    .catchall {:try_start_e .. :try_end_16} :catchall_1f

    .line 176
    .end local v1    # "valid":Z
    :cond_16
    :goto_16
    invoke-virtual {p0}, Lorg/apache/http/conn/BasicManagedEntity;->releaseManagedConnection()V

    .line 178
    const/4 v2, 0x0

    return v2

    .line 166
    .restart local v1    # "valid":Z
    :catch_1b
    move-exception v0

    .line 167
    .local v0, "ex":Ljava/net/SocketException;
    if-eqz v1, :cond_16

    .line 168
    :try_start_1e
    throw v0
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_1f

    .line 176
    .end local v0    # "ex":Ljava/net/SocketException;
    .end local v1    # "valid":Z
    :catchall_1f
    move-exception v2

    invoke-virtual {p0}, Lorg/apache/http/conn/BasicManagedEntity;->releaseManagedConnection()V

    throw v2

    .line 172
    :cond_24
    :try_start_24
    iget-object v2, p0, Lorg/apache/http/conn/BasicManagedEntity;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v2}, Lorg/apache/http/conn/ManagedClientConnection;->unmarkReusable()V
    :try_end_29
    .catchall {:try_start_24 .. :try_end_29} :catchall_1f

    goto :goto_16
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 2
    .param p1, "outstream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    invoke-super {p0, p1}, Lorg/apache/http/entity/HttpEntityWrapper;->writeTo(Ljava/io/OutputStream;)V

    .line 120
    invoke-direct {p0}, Lorg/apache/http/conn/BasicManagedEntity;->ensureConsumed()V

    .line 121
    return-void
.end method
