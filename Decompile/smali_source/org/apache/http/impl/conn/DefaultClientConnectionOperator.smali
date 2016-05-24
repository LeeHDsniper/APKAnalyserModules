.class public Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;
.super Ljava/lang/Object;
.source "DefaultClientConnectionOperator.java"

# interfaces
.implements Lorg/apache/http/conn/ClientConnectionOperator;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field protected final dnsResolver:Lorg/apache/http/conn/DnsResolver;

.field private final log:Lorg/apache/commons/logging/Log;

.field protected final schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;


# direct methods
.method public constructor <init>(Lorg/apache/http/conn/scheme/SchemeRegistry;)V
    .registers 3
    .param p1, "schemes"    # Lorg/apache/http/conn/scheme/SchemeRegistry;

    .prologue
    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    .line 109
    const-string v0, "Scheme registry"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 110
    iput-object p1, p0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    .line 111
    new-instance v0, Lorg/apache/http/impl/conn/SystemDefaultDnsResolver;

    invoke-direct {v0}, Lorg/apache/http/impl/conn/SystemDefaultDnsResolver;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->dnsResolver:Lorg/apache/http/conn/DnsResolver;

    .line 112
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/scheme/SchemeRegistry;Lorg/apache/http/conn/DnsResolver;)V
    .registers 4
    .param p1, "schemes"    # Lorg/apache/http/conn/scheme/SchemeRegistry;
    .param p2, "dnsResolver"    # Lorg/apache/http/conn/DnsResolver;

    .prologue
    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    .line 124
    const-string v0, "Scheme registry"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 126
    const-string v0, "DNS resolver"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 128
    iput-object p1, p0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    .line 129
    iput-object p2, p0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->dnsResolver:Lorg/apache/http/conn/DnsResolver;

    .line 130
    return-void
.end method

.method private getSchemeRegistry(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/scheme/SchemeRegistry;
    .registers 4
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 137
    const-string v1, "http.scheme-registry"

    invoke-interface {p1, v1}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/scheme/SchemeRegistry;

    .line 139
    .local v0, "reg":Lorg/apache/http/conn/scheme/SchemeRegistry;
    if-nez v0, :cond_c

    .line 140
    iget-object v0, p0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    .line 142
    :cond_c
    return-object v0
.end method


# virtual methods
.method public createConnection()Lorg/apache/http/conn/OperatedClientConnection;
    .registers 2

    .prologue
    .line 133
    new-instance v0, Lorg/apache/http/impl/conn/DefaultClientConnection;

    invoke-direct {v0}, Lorg/apache/http/impl/conn/DefaultClientConnection;-><init>()V

    return-object v0
.end method

.method public openConnection(Lorg/apache/http/conn/OperatedClientConnection;Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V
    .registers 25
    .param p1, "conn"    # Lorg/apache/http/conn/OperatedClientConnection;
    .param p2, "target"    # Lorg/apache/http/HttpHost;
    .param p3, "local"    # Ljava/net/InetAddress;
    .param p4, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p5, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 151
    const-string v16, "Connection"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 152
    const-string v16, "Target host"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 153
    const-string v16, "HTTP parameters"

    move-object/from16 v0, p5

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 154
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/conn/OperatedClientConnection;->isOpen()Z

    move-result v16

    if-nez v16, :cond_db

    const/16 v16, 0x1

    :goto_23
    const-string v17, "Connection must not be open"

    invoke-static/range {v16 .. v17}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 156
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->getSchemeRegistry(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v11

    .line 157
    .local v11, "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    invoke-virtual/range {p2 .. p2}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Lorg/apache/http/conn/scheme/SchemeRegistry;->getScheme(Ljava/lang/String;)Lorg/apache/http/conn/scheme/Scheme;

    move-result-object v13

    .line 158
    .local v13, "schm":Lorg/apache/http/conn/scheme/Scheme;
    invoke-virtual {v13}, Lorg/apache/http/conn/scheme/Scheme;->getSchemeSocketFactory()Lorg/apache/http/conn/scheme/SchemeSocketFactory;

    move-result-object v14

    .line 160
    .local v14, "sf":Lorg/apache/http/conn/scheme/SchemeSocketFactory;
    invoke-virtual/range {p2 .. p2}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->resolveHostname(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object v4

    .line 161
    .local v4, "addresses":[Ljava/net/InetAddress;
    invoke-virtual/range {p2 .. p2}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v16

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Lorg/apache/http/conn/scheme/Scheme;->resolvePort(I)I

    move-result v10

    .line 162
    .local v10, "port":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_55
    array-length v0, v4

    move/from16 v16, v0

    move/from16 v0, v16

    if-ge v7, v0, :cond_da

    .line 163
    aget-object v3, v4, v7

    .line 164
    .local v3, "address":Ljava/net/InetAddress;
    array-length v0, v4

    move/from16 v16, v0

    add-int/lit8 v16, v16, -0x1

    move/from16 v0, v16

    if-ne v7, v0, :cond_df

    const/4 v8, 0x1

    .line 166
    .local v8, "last":Z
    :goto_68
    move-object/from16 v0, p5

    invoke-interface {v14, v0}, Lorg/apache/http/conn/scheme/SchemeSocketFactory;->createSocket(Lorg/apache/http/params/HttpParams;)Ljava/net/Socket;

    move-result-object v15

    .line 167
    .local v15, "sock":Ljava/net/Socket;
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-interface {v0, v15, v1}, Lorg/apache/http/conn/OperatedClientConnection;->opening(Ljava/net/Socket;Lorg/apache/http/HttpHost;)V

    .line 169
    new-instance v12, Lorg/apache/http/conn/HttpInetSocketAddress;

    move-object/from16 v0, p2

    invoke-direct {v12, v0, v3, v10}, Lorg/apache/http/conn/HttpInetSocketAddress;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;I)V

    .line 170
    .local v12, "remoteAddress":Ljava/net/InetSocketAddress;
    const/4 v9, 0x0

    .line 171
    .local v9, "localAddress":Ljava/net/InetSocketAddress;
    if-eqz p3, :cond_8a

    .line 172
    new-instance v9, Ljava/net/InetSocketAddress;

    .end local v9    # "localAddress":Ljava/net/InetSocketAddress;
    const/16 v16, 0x0

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-direct {v9, v0, v1}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 174
    .restart local v9    # "localAddress":Ljava/net/InetSocketAddress;
    :cond_8a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v16

    if-eqz v16, :cond_b4

    .line 175
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v16, v0

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Connecting to "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-interface/range {v16 .. v17}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 178
    :cond_b4
    :try_start_b4
    move-object/from16 v0, p5

    invoke-interface {v14, v15, v12, v9, v0}, Lorg/apache/http/conn/scheme/SchemeSocketFactory;->connectSocket(Ljava/net/Socket;Ljava/net/InetSocketAddress;Ljava/net/InetSocketAddress;Lorg/apache/http/params/HttpParams;)Ljava/net/Socket;

    move-result-object v5

    .line 179
    .local v5, "connsock":Ljava/net/Socket;
    if-eq v15, v5, :cond_c4

    .line 180
    move-object v15, v5

    .line 181
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-interface {v0, v15, v1}, Lorg/apache/http/conn/OperatedClientConnection;->opening(Ljava/net/Socket;Lorg/apache/http/HttpHost;)V

    .line 183
    :cond_c4
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p5

    invoke-virtual {v0, v15, v1, v2}, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->prepareSocket(Ljava/net/Socket;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 184
    invoke-interface {v14, v15}, Lorg/apache/http/conn/scheme/SchemeSocketFactory;->isSecure(Ljava/net/Socket;)Z

    move-result v16

    move-object/from16 v0, p1

    move/from16 v1, v16

    move-object/from16 v2, p5

    invoke-interface {v0, v1, v2}, Lorg/apache/http/conn/OperatedClientConnection;->openCompleted(ZLorg/apache/http/params/HttpParams;)V
    :try_end_da
    .catch Ljava/net/ConnectException; {:try_start_b4 .. :try_end_da} :catch_e1
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_b4 .. :try_end_da} :catch_e5

    .line 200
    .end local v3    # "address":Ljava/net/InetAddress;
    .end local v5    # "connsock":Ljava/net/Socket;
    .end local v8    # "last":Z
    .end local v9    # "localAddress":Ljava/net/InetSocketAddress;
    .end local v12    # "remoteAddress":Ljava/net/InetSocketAddress;
    .end local v15    # "sock":Ljava/net/Socket;
    :cond_da
    return-void

    .line 154
    .end local v4    # "addresses":[Ljava/net/InetAddress;
    .end local v7    # "i":I
    .end local v10    # "port":I
    .end local v11    # "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    .end local v13    # "schm":Lorg/apache/http/conn/scheme/Scheme;
    .end local v14    # "sf":Lorg/apache/http/conn/scheme/SchemeSocketFactory;
    :cond_db
    const/16 v16, 0x0

    goto/16 :goto_23

    .line 164
    .restart local v3    # "address":Ljava/net/InetAddress;
    .restart local v4    # "addresses":[Ljava/net/InetAddress;
    .restart local v7    # "i":I
    .restart local v10    # "port":I
    .restart local v11    # "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    .restart local v13    # "schm":Lorg/apache/http/conn/scheme/Scheme;
    .restart local v14    # "sf":Lorg/apache/http/conn/scheme/SchemeSocketFactory;
    :cond_df
    const/4 v8, 0x0

    goto :goto_68

    .line 186
    .restart local v8    # "last":Z
    .restart local v9    # "localAddress":Ljava/net/InetSocketAddress;
    .restart local v12    # "remoteAddress":Ljava/net/InetSocketAddress;
    .restart local v15    # "sock":Ljava/net/Socket;
    :catch_e1
    move-exception v6

    .line 187
    .local v6, "ex":Ljava/net/ConnectException;
    if-eqz v8, :cond_e9

    .line 188
    throw v6

    .line 190
    .end local v6    # "ex":Ljava/net/ConnectException;
    :catch_e5
    move-exception v6

    .line 191
    .local v6, "ex":Lorg/apache/http/conn/ConnectTimeoutException;
    if-eqz v8, :cond_e9

    .line 192
    throw v6

    .line 195
    .end local v6    # "ex":Lorg/apache/http/conn/ConnectTimeoutException;
    :cond_e9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v16

    if-eqz v16, :cond_11f

    .line 196
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v16, v0

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Connect to "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " timed out. "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "Connection will be retried using another IP address"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-interface/range {v16 .. v17}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 162
    :cond_11f
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_55
.end method

.method protected prepareSocket(Ljava/net/Socket;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V
    .registers 6
    .param p1, "sock"    # Ljava/net/Socket;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 236
    invoke-static {p3}, Lorg/apache/http/params/HttpConnectionParams;->getTcpNoDelay(Lorg/apache/http/params/HttpParams;)Z

    move-result v1

    invoke-virtual {p1, v1}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 237
    invoke-static {p3}, Lorg/apache/http/params/HttpConnectionParams;->getSoTimeout(Lorg/apache/http/params/HttpParams;)I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 239
    invoke-static {p3}, Lorg/apache/http/params/HttpConnectionParams;->getLinger(Lorg/apache/http/params/HttpParams;)I

    move-result v0

    .line 240
    .local v0, "linger":I
    if-ltz v0, :cond_1a

    .line 241
    if-lez v0, :cond_1b

    const/4 v1, 0x1

    :goto_17
    invoke-virtual {p1, v1, v0}, Ljava/net/Socket;->setSoLinger(ZI)V

    .line 243
    :cond_1a
    return-void

    .line 241
    :cond_1b
    const/4 v1, 0x0

    goto :goto_17
.end method

.method protected resolveHostname(Ljava/lang/String;)[Ljava/net/InetAddress;
    .registers 3
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 260
    iget-object v0, p0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->dnsResolver:Lorg/apache/http/conn/DnsResolver;

    invoke-interface {v0, p1}, Lorg/apache/http/conn/DnsResolver;->resolve(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public updateSecureConnection(Lorg/apache/http/conn/OperatedClientConnection;Lorg/apache/http/HttpHost;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V
    .registers 12
    .param p1, "conn"    # Lorg/apache/http/conn/OperatedClientConnection;
    .param p2, "target"    # Lorg/apache/http/HttpHost;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p4, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 207
    const-string v4, "Connection"

    invoke-static {p1, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 208
    const-string v4, "Target host"

    invoke-static {p2, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 209
    const-string v4, "Parameters"

    invoke-static {p4, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 210
    invoke-interface {p1}, Lorg/apache/http/conn/OperatedClientConnection;->isOpen()Z

    move-result v4

    const-string v5, "Connection must be open"

    invoke-static {v4, v5}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 212
    invoke-direct {p0, p3}, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->getSchemeRegistry(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v1

    .line 213
    .local v1, "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    invoke-virtual {p2}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/apache/http/conn/scheme/SchemeRegistry;->getScheme(Ljava/lang/String;)Lorg/apache/http/conn/scheme/Scheme;

    move-result-object v2

    .line 214
    .local v2, "schm":Lorg/apache/http/conn/scheme/Scheme;
    invoke-virtual {v2}, Lorg/apache/http/conn/scheme/Scheme;->getSchemeSocketFactory()Lorg/apache/http/conn/scheme/SchemeSocketFactory;

    move-result-object v4

    instance-of v4, v4, Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;

    const-string v5, "Socket factory must implement SchemeLayeredSocketFactory"

    invoke-static {v4, v5}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 216
    invoke-virtual {v2}, Lorg/apache/http/conn/scheme/Scheme;->getSchemeSocketFactory()Lorg/apache/http/conn/scheme/SchemeSocketFactory;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactory;

    .line 217
    .local v0, "lsf":Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactory;
    invoke-interface {p1}, Lorg/apache/http/conn/OperatedClientConnection;->getSocket()Ljava/net/Socket;

    move-result-object v4

    invoke-virtual {p2}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v6

    invoke-virtual {v2, v6}, Lorg/apache/http/conn/scheme/Scheme;->resolvePort(I)I

    move-result v6

    invoke-interface {v0, v4, v5, v6, p4}, Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactory;->createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;ILorg/apache/http/params/HttpParams;)Ljava/net/Socket;

    move-result-object v3

    .line 219
    .local v3, "sock":Ljava/net/Socket;
    invoke-virtual {p0, v3, p3, p4}, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->prepareSocket(Ljava/net/Socket;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 220
    invoke-interface {v0, v3}, Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactory;->isSecure(Ljava/net/Socket;)Z

    move-result v4

    invoke-interface {p1, v3, p2, v4, p4}, Lorg/apache/http/conn/OperatedClientConnection;->update(Ljava/net/Socket;Lorg/apache/http/HttpHost;ZLorg/apache/http/params/HttpParams;)V

    .line 221
    return-void
.end method
