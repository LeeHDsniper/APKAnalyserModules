.class public Lorg/apache/http/impl/SocketHttpServerConnection;
.super Lorg/apache/http/impl/AbstractHttpServerConnection;
.source "SocketHttpServerConnection.java"

# interfaces
.implements Lorg/apache/http/HttpInetConnection;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private volatile open:Z

.field private volatile socket:Ljava/net/Socket;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/apache/http/impl/AbstractHttpServerConnection;-><init>()V

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    .line 56
    return-void
.end method

.method private static formatAddress(Ljava/lang/StringBuilder;Ljava/net/SocketAddress;)V
    .registers 5
    .param p0, "buffer"    # Ljava/lang/StringBuilder;
    .param p1, "socketAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 243
    instance-of v1, p1, Ljava/net/InetSocketAddress;

    if-eqz v1, :cond_2c

    move-object v0, p1

    .line 244
    check-cast v0, Ljava/net/InetSocketAddress;

    .line 245
    .local v0, "addr":Ljava/net/InetSocketAddress;
    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v1

    if-eqz v1, :cond_27

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    :goto_15
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 252
    .end local v0    # "addr":Ljava/net/InetSocketAddress;
    :goto_26
    return-void

    .line 245
    .restart local v0    # "addr":Ljava/net/InetSocketAddress;
    :cond_27
    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v1

    goto :goto_15

    .line 250
    .end local v0    # "addr":Ljava/net/InetSocketAddress;
    :cond_2c
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_26
.end method


# virtual methods
.method protected assertNotOpen()V
    .registers 3

    .prologue
    .line 59
    iget-boolean v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->open:Z

    if-nez v0, :cond_b

    const/4 v0, 0x1

    :goto_5
    const-string v1, "Connection is already open"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 60
    return-void

    .line 59
    :cond_b
    const/4 v0, 0x0

    goto :goto_5
.end method

.method protected assertOpen()V
    .registers 3

    .prologue
    .line 64
    iget-boolean v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->open:Z

    const-string v1, "Connection is not open"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 65
    return-void
.end method

.method protected bind(Ljava/net/Socket;Lorg/apache/http/params/HttpParams;)V
    .registers 6
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    const-string v1, "Socket"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 131
    const-string v1, "HTTP parameters"

    invoke-static {p2, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 132
    iput-object p1, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    .line 134
    const-string v1, "http.socket.buffer-size"

    const/4 v2, -0x1

    invoke-interface {p2, v1, v2}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v0

    .line 135
    .local v0, "buffersize":I
    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/http/impl/SocketHttpServerConnection;->createSessionInputBuffer(Ljava/net/Socket;ILorg/apache/http/params/HttpParams;)Lorg/apache/http/io/SessionInputBuffer;

    move-result-object v1

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/http/impl/SocketHttpServerConnection;->createSessionOutputBuffer(Ljava/net/Socket;ILorg/apache/http/params/HttpParams;)Lorg/apache/http/io/SessionOutputBuffer;

    move-result-object v2

    invoke-virtual {p0, v1, v2, p2}, Lorg/apache/http/impl/SocketHttpServerConnection;->init(Lorg/apache/http/io/SessionInputBuffer;Lorg/apache/http/io/SessionOutputBuffer;Lorg/apache/http/params/HttpParams;)V

    .line 140
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->open:Z

    .line 141
    return-void
.end method

.method public close()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 217
    iget-boolean v1, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->open:Z

    if-nez v1, :cond_6

    .line 240
    :goto_5
    return-void

    .line 220
    :cond_6
    iput-boolean v2, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->open:Z

    .line 221
    iput-boolean v2, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->open:Z

    .line 222
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    .line 224
    .local v0, "sock":Ljava/net/Socket;
    :try_start_c
    invoke-virtual {p0}, Lorg/apache/http/impl/SocketHttpServerConnection;->doFlush()V
    :try_end_f
    .catchall {:try_start_c .. :try_end_f} :catchall_19

    .line 227
    :try_start_f
    invoke-virtual {v0}, Ljava/net/Socket;->shutdownOutput()V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_12} :catch_1e
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_f .. :try_end_12} :catch_22
    .catchall {:try_start_f .. :try_end_12} :catchall_19

    .line 231
    :goto_12
    :try_start_12
    invoke-virtual {v0}, Ljava/net/Socket;->shutdownInput()V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_15} :catch_20
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_12 .. :try_end_15} :catch_22
    .catchall {:try_start_12 .. :try_end_15} :catchall_19

    .line 238
    :goto_15
    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    goto :goto_5

    :catchall_19
    move-exception v1

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    throw v1

    .line 228
    :catch_1e
    move-exception v1

    goto :goto_12

    .line 232
    :catch_20
    move-exception v1

    goto :goto_15

    .line 234
    :catch_22
    move-exception v1

    goto :goto_15
.end method

.method protected createSessionInputBuffer(Ljava/net/Socket;ILorg/apache/http/params/HttpParams;)Lorg/apache/http/io/SessionInputBuffer;
    .registers 5
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "buffersize"    # I
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    new-instance v0, Lorg/apache/http/impl/io/SocketInputBuffer;

    invoke-direct {v0, p1, p2, p3}, Lorg/apache/http/impl/io/SocketInputBuffer;-><init>(Ljava/net/Socket;ILorg/apache/http/params/HttpParams;)V

    return-object v0
.end method

.method protected createSessionOutputBuffer(Ljava/net/Socket;ILorg/apache/http/params/HttpParams;)Lorg/apache/http/io/SessionOutputBuffer;
    .registers 5
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "buffersize"    # I
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    new-instance v0, Lorg/apache/http/impl/io/SocketOutputBuffer;

    invoke-direct {v0, p1, p2, p3}, Lorg/apache/http/impl/io/SocketOutputBuffer;-><init>(Ljava/net/Socket;ILorg/apache/http/params/HttpParams;)V

    return-object v0
.end method

.method public getLocalAddress()Ljava/net/InetAddress;
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_b

    .line 153
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 155
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getLocalPort()I
    .registers 2

    .prologue
    .line 160
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_b

    .line 161
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getLocalPort()I

    move-result v0

    .line 163
    :goto_a
    return v0

    :cond_b
    const/4 v0, -0x1

    goto :goto_a
.end method

.method public getRemoteAddress()Ljava/net/InetAddress;
    .registers 2

    .prologue
    .line 168
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_b

    .line 169
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 171
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getRemotePort()I
    .registers 2

    .prologue
    .line 176
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_b

    .line 177
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getPort()I

    move-result v0

    .line 179
    :goto_a
    return v0

    :cond_b
    const/4 v0, -0x1

    goto :goto_a
.end method

.method protected getSocket()Ljava/net/Socket;
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    return-object v0
.end method

.method public getSocketTimeout()I
    .registers 4

    .prologue
    const/4 v1, -0x1

    .line 197
    iget-object v2, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    if-eqz v2, :cond_b

    .line 199
    :try_start_5
    iget-object v2, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->getSoTimeout()I
    :try_end_a
    .catch Ljava/net/SocketException; {:try_start_5 .. :try_end_a} :catch_c

    move-result v1

    .line 204
    :cond_b
    :goto_b
    return v1

    .line 200
    :catch_c
    move-exception v0

    .line 201
    .local v0, "ignore":Ljava/net/SocketException;
    goto :goto_b
.end method

.method public isOpen()Z
    .registers 2

    .prologue
    .line 148
    iget-boolean v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->open:Z

    return v0
.end method

.method public setSocketTimeout(I)V
    .registers 3
    .param p1, "timeout"    # I

    .prologue
    .line 184
    invoke-virtual {p0}, Lorg/apache/http/impl/SocketHttpServerConnection;->assertOpen()V

    .line 185
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_c

    .line 187
    :try_start_7
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v0, p1}, Ljava/net/Socket;->setSoTimeout(I)V
    :try_end_c
    .catch Ljava/net/SocketException; {:try_start_7 .. :try_end_c} :catch_d

    .line 194
    :cond_c
    :goto_c
    return-void

    .line 188
    :catch_d
    move-exception v0

    goto :goto_c
.end method

.method public shutdown()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 209
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->open:Z

    .line 210
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    .line 211
    .local v0, "tmpsocket":Ljava/net/Socket;
    if-eqz v0, :cond_a

    .line 212
    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    .line 214
    :cond_a
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 256
    iget-object v3, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    if-eqz v3, :cond_29

    .line 257
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 258
    .local v0, "buffer":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v2

    .line 259
    .local v2, "remoteAddress":Ljava/net/SocketAddress;
    iget-object v3, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v1

    .line 260
    .local v1, "localAddress":Ljava/net/SocketAddress;
    if-eqz v2, :cond_24

    if-eqz v1, :cond_24

    .line 261
    invoke-static {v0, v1}, Lorg/apache/http/impl/SocketHttpServerConnection;->formatAddress(Ljava/lang/StringBuilder;Ljava/net/SocketAddress;)V

    .line 262
    const-string v3, "<->"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    invoke-static {v0, v2}, Lorg/apache/http/impl/SocketHttpServerConnection;->formatAddress(Ljava/lang/StringBuilder;Ljava/net/SocketAddress;)V

    .line 265
    :cond_24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 267
    .end local v0    # "buffer":Ljava/lang/StringBuilder;
    .end local v1    # "localAddress":Ljava/net/SocketAddress;
    .end local v2    # "remoteAddress":Ljava/net/SocketAddress;
    :goto_28
    return-object v3

    :cond_29
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_28
.end method
