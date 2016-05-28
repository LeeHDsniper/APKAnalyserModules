.class Lcom/squareup/okhttp/internal/Platform$Android;
.super Lcom/squareup/okhttp/internal/Platform;
.source "Platform.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/Platform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Android"
.end annotation


# instance fields
.field private final getNpnSelectedProtocol:Ljava/lang/reflect/Method;

.field protected final openSslSocketClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final setHostname:Ljava/lang/reflect/Method;

.field private final setNpnProtocols:Ljava/lang/reflect/Method;

.field private final setUseSessionTickets:Ljava/lang/reflect/Method;

.field private final trafficStatsTagSocket:Ljava/lang/reflect/Method;

.field private final trafficStatsUntagSocket:Ljava/lang/reflect/Method;


# direct methods
.method private constructor <init>(Ljava/lang/Class;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V
    .registers 8
    .param p2, "setUseSessionTickets"    # Ljava/lang/reflect/Method;
    .param p3, "setHostname"    # Ljava/lang/reflect/Method;
    .param p4, "trafficStatsTagSocket"    # Ljava/lang/reflect/Method;
    .param p5, "trafficStatsUntagSocket"    # Ljava/lang/reflect/Method;
    .param p6, "setNpnProtocols"    # Ljava/lang/reflect/Method;
    .param p7, "getNpnSelectedProtocol"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Method;",
            ")V"
        }
    .end annotation

    .prologue
    .line 198
    .local p1, "openSslSocketClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/Platform;-><init>()V

    .line 199
    iput-object p1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->openSslSocketClass:Ljava/lang/Class;

    .line 200
    iput-object p2, p0, Lcom/squareup/okhttp/internal/Platform$Android;->setUseSessionTickets:Ljava/lang/reflect/Method;

    .line 201
    iput-object p3, p0, Lcom/squareup/okhttp/internal/Platform$Android;->setHostname:Ljava/lang/reflect/Method;

    .line 202
    iput-object p4, p0, Lcom/squareup/okhttp/internal/Platform$Android;->trafficStatsTagSocket:Ljava/lang/reflect/Method;

    .line 203
    iput-object p5, p0, Lcom/squareup/okhttp/internal/Platform$Android;->trafficStatsUntagSocket:Ljava/lang/reflect/Method;

    .line 204
    iput-object p6, p0, Lcom/squareup/okhttp/internal/Platform$Android;->setNpnProtocols:Ljava/lang/reflect/Method;

    .line 205
    iput-object p7, p0, Lcom/squareup/okhttp/internal/Platform$Android;->getNpnSelectedProtocol:Ljava/lang/reflect/Method;

    .line 206
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/Class;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Lcom/squareup/okhttp/internal/Platform$1;)V
    .registers 9
    .param p1, "x0"    # Ljava/lang/Class;
    .param p2, "x1"    # Ljava/lang/reflect/Method;
    .param p3, "x2"    # Ljava/lang/reflect/Method;
    .param p4, "x3"    # Ljava/lang/reflect/Method;
    .param p5, "x4"    # Ljava/lang/reflect/Method;
    .param p6, "x5"    # Ljava/lang/reflect/Method;
    .param p7, "x6"    # Ljava/lang/reflect/Method;
    .param p8, "x7"    # Lcom/squareup/okhttp/internal/Platform$1;

    .prologue
    .line 182
    invoke-direct/range {p0 .. p7}, Lcom/squareup/okhttp/internal/Platform$Android;-><init>(Ljava/lang/Class;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V

    return-void
.end method


# virtual methods
.method public configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;)V
    .registers 10
    .param p1, "sslSocket"    # Ljavax/net/ssl/SSLSocket;
    .param p2, "hostname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/net/ssl/SSLSocket;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/Protocol;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 223
    .local p3, "protocols":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Protocol;>;"
    iget-object v2, p0, Lcom/squareup/okhttp/internal/Platform$Android;->openSslSocketClass:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    .line 248
    :cond_8
    :goto_8
    return-void

    .line 226
    :cond_9
    if-eqz p2, :cond_26

    .line 228
    :try_start_b
    iget-object v2, p0, Lcom/squareup/okhttp/internal/Platform$Android;->setUseSessionTickets:Ljava/lang/reflect/Method;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    iget-object v2, p0, Lcom/squareup/okhttp/internal/Platform$Android;->setHostname:Ljava/lang/reflect/Method;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_26
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_b .. :try_end_26} :catch_41
    .catch Ljava/lang/IllegalAccessException; {:try_start_b .. :try_end_26} :catch_4c

    .line 238
    :cond_26
    iget-object v2, p0, Lcom/squareup/okhttp/internal/Platform$Android;->setNpnProtocols:Ljava/lang/reflect/Method;

    if-eqz v2, :cond_8

    .line 240
    const/4 v2, 0x1

    :try_start_2b
    new-array v1, v2, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p3}, Lcom/squareup/okhttp/internal/Platform$Android;->concatLengthPrefixed(Ljava/util/List;)[B

    move-result-object v3

    aput-object v3, v1, v2

    .line 241
    .local v1, "parameters":[Ljava/lang/Object;
    iget-object v2, p0, Lcom/squareup/okhttp/internal/Platform$Android;->setNpnProtocols:Ljava/lang/reflect/Method;

    invoke-virtual {v2, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_39
    .catch Ljava/lang/IllegalAccessException; {:try_start_2b .. :try_end_39} :catch_3a
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2b .. :try_end_39} :catch_53

    goto :goto_8

    .line 242
    .end local v1    # "parameters":[Ljava/lang/Object;
    :catch_3a
    move-exception v0

    .line 243
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 230
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_41
    move-exception v0

    .line 231
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 232
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_4c
    move-exception v0

    .line 233
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 244
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_53
    move-exception v0

    .line 245
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public connectSocket(Ljava/net/Socket;Ljava/net/InetSocketAddress;I)V
    .registers 7
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "address"    # Ljava/net/InetSocketAddress;
    .param p3, "connectTimeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 211
    :try_start_0
    invoke-virtual {p1, p2, p3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_3} :catch_4

    .line 219
    return-void

    .line 212
    :catch_4
    move-exception v1

    .line 215
    .local v1, "se":Ljava/lang/SecurityException;
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Exception in connect"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 216
    .local v0, "ioException":Ljava/io/IOException;
    invoke-virtual {v0, v1}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 217
    throw v0
.end method

.method public getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;
    .registers 8
    .param p1, "socket"    # Ljavax/net/ssl/SSLSocket;

    .prologue
    const/4 v4, 0x0

    .line 251
    iget-object v3, p0, Lcom/squareup/okhttp/internal/Platform$Android;->getNpnSelectedProtocol:Ljava/lang/reflect/Method;

    if-nez v3, :cond_7

    move-object v3, v4

    .line 256
    :goto_6
    return-object v3

    .line 252
    :cond_7
    iget-object v3, p0, Lcom/squareup/okhttp/internal/Platform$Android;->openSslSocketClass:Ljava/lang/Class;

    invoke-virtual {v3, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_11

    move-object v3, v4

    goto :goto_6

    .line 254
    :cond_11
    :try_start_11
    iget-object v3, p0, Lcom/squareup/okhttp/internal/Platform$Android;->getNpnSelectedProtocol:Ljava/lang/reflect/Method;

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v3, p1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    move-object v0, v3

    check-cast v0, [B

    move-object v2, v0

    .line 255
    .local v2, "npnResult":[B
    if-nez v2, :cond_24

    move-object v3, v4

    goto :goto_6

    .line 256
    :cond_24
    new-instance v3, Ljava/lang/String;

    sget-object v4, Lcom/squareup/okhttp/internal/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v2, v4}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V
    :try_end_2b
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_11 .. :try_end_2b} :catch_2c
    .catch Ljava/lang/IllegalAccessException; {:try_start_11 .. :try_end_2b} :catch_37

    goto :goto_6

    .line 257
    .end local v2    # "npnResult":[B
    :catch_2c
    move-exception v1

    .line 258
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 259
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_37
    move-exception v1

    .line 260
    .local v1, "e":Ljava/lang/IllegalAccessException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method

.method public tagSocket(Ljava/net/Socket;)V
    .registers 7
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 265
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->trafficStatsTagSocket:Ljava/lang/reflect/Method;

    if-nez v1, :cond_5

    .line 274
    :goto_4
    return-void

    .line 268
    :cond_5
    :try_start_5
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->trafficStatsTagSocket:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_11
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_11} :catch_12
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_5 .. :try_end_11} :catch_19

    goto :goto_4

    .line 269
    :catch_12
    move-exception v0

    .line 270
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 271
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_19
    move-exception v0

    .line 272
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public untagSocket(Ljava/net/Socket;)V
    .registers 7
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 277
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->trafficStatsUntagSocket:Ljava/lang/reflect/Method;

    if-nez v1, :cond_5

    .line 286
    :goto_4
    return-void

    .line 280
    :cond_5
    :try_start_5
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->trafficStatsUntagSocket:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_11
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_11} :catch_12
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_5 .. :try_end_11} :catch_19

    goto :goto_4

    .line 281
    :catch_12
    move-exception v0

    .line 282
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 283
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_19
    move-exception v0

    .line 284
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
