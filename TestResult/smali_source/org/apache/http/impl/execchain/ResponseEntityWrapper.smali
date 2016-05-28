.class Lorg/apache/http/impl/execchain/ResponseEntityWrapper;
.super Lorg/apache/http/entity/HttpEntityWrapper;
.source "ResponseEntityWrapper.java"

# interfaces
.implements Lorg/apache/http/conn/EofSensorWatcher;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final connReleaseTrigger:Lorg/apache/http/impl/execchain/ConnectionHolder;


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpEntity;Lorg/apache/http/impl/execchain/ConnectionHolder;)V
    .registers 3
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;
    .param p2, "connReleaseTrigger"    # Lorg/apache/http/impl/execchain/ConnectionHolder;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/apache/http/entity/HttpEntityWrapper;-><init>(Lorg/apache/http/HttpEntity;)V

    .line 55
    iput-object p2, p0, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->connReleaseTrigger:Lorg/apache/http/impl/execchain/ConnectionHolder;

    .line 56
    return-void
.end method

.method private cleanup()V
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->connReleaseTrigger:Lorg/apache/http/impl/execchain/ConnectionHolder;

    if-eqz v0, :cond_9

    .line 60
    iget-object v0, p0, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->connReleaseTrigger:Lorg/apache/http/impl/execchain/ConnectionHolder;

    invoke-virtual {v0}, Lorg/apache/http/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 62
    :cond_9
    return-void
.end method


# virtual methods
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
    .line 89
    invoke-virtual {p0}, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->releaseConnection()V

    .line 90
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
    .line 106
    :try_start_0
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 107
    invoke-virtual {p0}, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->releaseConnection()V
    :try_end_6
    .catchall {:try_start_0 .. :try_end_6} :catchall_b

    .line 109
    invoke-direct {p0}, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->cleanup()V

    .line 111
    const/4 v0, 0x0

    return v0

    .line 109
    :catchall_b
    move-exception v0

    invoke-direct {p0}, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->cleanup()V

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
    .line 83
    new-instance v0, Lorg/apache/http/conn/EofSensorInputStream;

    iget-object v1, p0, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lorg/apache/http/conn/EofSensorInputStream;-><init>(Ljava/io/InputStream;Lorg/apache/http/conn/EofSensorWatcher;)V

    return-object v0
.end method

.method public isRepeatable()Z
    .registers 2

    .prologue
    .line 78
    const/4 v0, 0x0

    return v0
.end method

.method public releaseConnection()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    iget-object v0, p0, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->connReleaseTrigger:Lorg/apache/http/impl/execchain/ConnectionHolder;

    if-eqz v0, :cond_14

    .line 67
    :try_start_4
    iget-object v0, p0, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->connReleaseTrigger:Lorg/apache/http/impl/execchain/ConnectionHolder;

    invoke-virtual {v0}, Lorg/apache/http/impl/execchain/ConnectionHolder;->isReusable()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 68
    iget-object v0, p0, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->connReleaseTrigger:Lorg/apache/http/impl/execchain/ConnectionHolder;

    invoke-virtual {v0}, Lorg/apache/http/impl/execchain/ConnectionHolder;->releaseConnection()V
    :try_end_11
    .catchall {:try_start_4 .. :try_end_11} :catchall_15

    .line 71
    :cond_11
    invoke-direct {p0}, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->cleanup()V

    .line 74
    :cond_14
    return-void

    .line 71
    :catchall_15
    move-exception v0

    invoke-direct {p0}, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->cleanup()V

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
    .line 134
    invoke-direct {p0}, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->cleanup()V

    .line 135
    const/4 v0, 0x0

    return v0
.end method

.method public streamClosed(Ljava/io/InputStream;)Z
    .registers 6
    .param p1, "wrapped"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 116
    :try_start_1
    iget-object v3, p0, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->connReleaseTrigger:Lorg/apache/http/impl/execchain/ConnectionHolder;

    if-eqz v3, :cond_18

    iget-object v3, p0, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->connReleaseTrigger:Lorg/apache/http/impl/execchain/ConnectionHolder;

    invoke-virtual {v3}, Lorg/apache/http/impl/execchain/ConnectionHolder;->isReleased()Z
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_1e

    move-result v3

    if-nez v3, :cond_18

    const/4 v1, 0x1

    .line 120
    .local v1, "open":Z
    :goto_e
    :try_start_e
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 121
    invoke-virtual {p0}, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->releaseConnection()V
    :try_end_14
    .catch Ljava/net/SocketException; {:try_start_e .. :try_end_14} :catch_1a
    .catchall {:try_start_e .. :try_end_14} :catchall_1e

    .line 128
    :cond_14
    invoke-direct {p0}, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->cleanup()V

    .line 130
    return v2

    .end local v1    # "open":Z
    :cond_18
    move v1, v2

    .line 116
    goto :goto_e

    .line 122
    .restart local v1    # "open":Z
    :catch_1a
    move-exception v0

    .line 123
    .local v0, "ex":Ljava/net/SocketException;
    if-eqz v1, :cond_14

    .line 124
    :try_start_1d
    throw v0
    :try_end_1e
    .catchall {:try_start_1d .. :try_end_1e} :catchall_1e

    .line 128
    .end local v0    # "ex":Ljava/net/SocketException;
    .end local v1    # "open":Z
    :catchall_1e
    move-exception v2

    invoke-direct {p0}, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->cleanup()V

    throw v2
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "outstream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v0, p1}, Lorg/apache/http/HttpEntity;->writeTo(Ljava/io/OutputStream;)V

    .line 96
    invoke-virtual {p0}, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->releaseConnection()V
    :try_end_8
    .catchall {:try_start_0 .. :try_end_8} :catchall_c

    .line 98
    invoke-direct {p0}, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->cleanup()V

    .line 100
    return-void

    .line 98
    :catchall_c
    move-exception v0

    invoke-direct {p0}, Lorg/apache/http/impl/execchain/ResponseEntityWrapper;->cleanup()V

    throw v0
.end method
