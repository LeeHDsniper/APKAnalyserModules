.class public final Lorg/apache/http/conn/MultihomePlainSocketFactory;
.super Ljava/lang/Object;
.source "MultihomePlainSocketFactory.java"

# interfaces
.implements Lorg/apache/http/conn/scheme/SocketFactory;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final DEFAULT_FACTORY:Lorg/apache/http/conn/MultihomePlainSocketFactory;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 67
    new-instance v0, Lorg/apache/http/conn/MultihomePlainSocketFactory;

    invoke-direct {v0}, Lorg/apache/http/conn/MultihomePlainSocketFactory;-><init>()V

    sput-object v0, Lorg/apache/http/conn/MultihomePlainSocketFactory;->DEFAULT_FACTORY:Lorg/apache/http/conn/MultihomePlainSocketFactory;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    return-void
.end method

.method public static getSocketFactory()Lorg/apache/http/conn/MultihomePlainSocketFactory;
    .registers 1

    .prologue
    .line 74
    sget-object v0, Lorg/apache/http/conn/MultihomePlainSocketFactory;->DEFAULT_FACTORY:Lorg/apache/http/conn/MultihomePlainSocketFactory;

    return-object v0
.end method


# virtual methods
.method public connectSocket(Ljava/net/Socket;Ljava/lang/String;ILjava/net/InetAddress;ILorg/apache/http/params/HttpParams;)Ljava/net/Socket;
    .registers 21
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "localAddress"    # Ljava/net/InetAddress;
    .param p5, "localPort"    # I
    .param p6, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 109
    const-string v11, "Target host"

    move-object/from16 v0, p2

    invoke-static {v0, v11}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 110
    const-string v11, "HTTP parameters"

    move-object/from16 v0, p6

    invoke-static {v0, v11}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 112
    move-object v9, p1

    .line 113
    .local v9, "sock":Ljava/net/Socket;
    if-nez v9, :cond_15

    .line 114
    invoke-virtual {p0}, Lorg/apache/http/conn/MultihomePlainSocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v9

    .line 117
    :cond_15
    if-nez p4, :cond_19

    if-lez p5, :cond_27

    .line 118
    :cond_19
    new-instance v6, Ljava/net/InetSocketAddress;

    if-lez p5, :cond_5d

    .end local p5    # "localPort":I
    :goto_1d
    move-object/from16 v0, p4

    move/from16 v1, p5

    invoke-direct {v6, v0, v1}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 120
    .local v6, "isa":Ljava/net/InetSocketAddress;
    invoke-virtual {v9, v6}, Ljava/net/Socket;->bind(Ljava/net/SocketAddress;)V

    .line 123
    .end local v6    # "isa":Ljava/net/InetSocketAddress;
    :cond_27
    invoke-static/range {p6 .. p6}, Lorg/apache/http/params/HttpConnectionParams;->getConnectionTimeout(Lorg/apache/http/params/HttpParams;)I

    move-result v10

    .line 125
    .local v10, "timeout":I
    invoke-static/range {p2 .. p2}, Ljava/net/InetAddress;->getAllByName(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object v5

    .line 126
    .local v5, "inetadrs":[Ljava/net/InetAddress;
    new-instance v2, Ljava/util/ArrayList;

    array-length v11, v5

    invoke-direct {v2, v11}, Ljava/util/ArrayList;-><init>(I)V

    .line 127
    .local v2, "addresses":Ljava/util/List;, "Ljava/util/List<Ljava/net/InetAddress;>;"
    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v2, v11}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 128
    invoke-static {v2}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 130
    const/4 v7, 0x0

    .line 131
    .local v7, "lastEx":Ljava/io/IOException;
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_44
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_5a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/net/InetAddress;

    .line 133
    .local v8, "remoteAddress":Ljava/net/InetAddress;
    :try_start_50
    new-instance v11, Ljava/net/InetSocketAddress;

    move/from16 v0, p3

    invoke-direct {v11, v8, v0}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v9, v11, v10}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_5a
    .catch Ljava/net/SocketTimeoutException; {:try_start_50 .. :try_end_5a} :catch_60
    .catch Ljava/io/IOException; {:try_start_50 .. :try_end_5a} :catch_80

    .line 144
    .end local v8    # "remoteAddress":Ljava/net/InetAddress;
    :cond_5a
    if-eqz v7, :cond_88

    .line 145
    throw v7

    .line 118
    .end local v2    # "addresses":Ljava/util/List;, "Ljava/util/List<Ljava/net/InetAddress;>;"
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "inetadrs":[Ljava/net/InetAddress;
    .end local v7    # "lastEx":Ljava/io/IOException;
    .end local v10    # "timeout":I
    .restart local p5    # "localPort":I
    :cond_5d
    const/16 p5, 0x0

    goto :goto_1d

    .line 135
    .end local p5    # "localPort":I
    .restart local v2    # "addresses":Ljava/util/List;, "Ljava/util/List<Ljava/net/InetAddress;>;"
    .restart local v4    # "i$":Ljava/util/Iterator;
    .restart local v5    # "inetadrs":[Ljava/net/InetAddress;
    .restart local v7    # "lastEx":Ljava/io/IOException;
    .restart local v8    # "remoteAddress":Ljava/net/InetAddress;
    .restart local v10    # "timeout":I
    :catch_60
    move-exception v3

    .line 136
    .local v3, "ex":Ljava/net/SocketTimeoutException;
    new-instance v11, Lorg/apache/http/conn/ConnectTimeoutException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Connect to "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " timed out"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lorg/apache/http/conn/ConnectTimeoutException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 137
    .end local v3    # "ex":Ljava/net/SocketTimeoutException;
    :catch_80
    move-exception v3

    .line 139
    .local v3, "ex":Ljava/io/IOException;
    new-instance v9, Ljava/net/Socket;

    .end local v9    # "sock":Ljava/net/Socket;
    invoke-direct {v9}, Ljava/net/Socket;-><init>()V

    .line 141
    .restart local v9    # "sock":Ljava/net/Socket;
    move-object v7, v3

    .line 143
    goto :goto_44

    .line 147
    .end local v3    # "ex":Ljava/io/IOException;
    .end local v8    # "remoteAddress":Ljava/net/InetAddress;
    :cond_88
    return-object v9
.end method

.method public createSocket()Ljava/net/Socket;
    .registers 2

    .prologue
    .line 87
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0}, Ljava/net/Socket;-><init>()V

    return-object v0
.end method

.method public final isSecure(Ljava/net/Socket;)Z
    .registers 5
    .param p1, "sock"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 165
    const-string v0, "Socket"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 168
    invoke-virtual {p1}, Ljava/net/Socket;->isClosed()Z

    move-result v0

    if-nez v0, :cond_13

    const/4 v0, 0x1

    :goto_d
    const-string v2, "Socket is closed"

    invoke-static {v0, v2}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 169
    return v1

    :cond_13
    move v0, v1

    .line 168
    goto :goto_d
.end method
