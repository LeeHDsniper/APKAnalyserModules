.class public Lcom/squareup/okhttp/internal/Platform;
.super Ljava/lang/Object;
.source "Platform.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/internal/Platform$1;,
        Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;,
        Lcom/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform;,
        Lcom/squareup/okhttp/internal/Platform$Android;
    }
.end annotation


# static fields
.field private static final PLATFORM:Lcom/squareup/okhttp/internal/Platform;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 63
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->findPlatform()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/Platform;->PLATFORM:Lcom/squareup/okhttp/internal/Platform;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 348
    return-void
.end method

.method static concatLengthPrefixed(Ljava/util/List;)[B
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/Protocol;",
            ">;)[B"
        }
    .end annotation

    .prologue
    .line 398
    .local p0, "protocols":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Protocol;>;"
    new-instance v2, Lokio/Buffer;

    invoke-direct {v2}, Lokio/Buffer;-><init>()V

    .line 399
    .local v2, "result":Lokio/Buffer;
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    .local v3, "size":I
    :goto_a
    if-ge v0, v3, :cond_2c

    .line 400
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/squareup/okhttp/Protocol;

    .line 401
    .local v1, "protocol":Lcom/squareup/okhttp/Protocol;
    sget-object v4, Lcom/squareup/okhttp/Protocol;->HTTP_1_0:Lcom/squareup/okhttp/Protocol;

    if-ne v1, v4, :cond_19

    .line 399
    :goto_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 402
    :cond_19
    invoke-virtual {v1}, Lcom/squareup/okhttp/Protocol;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v4}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 403
    invoke-virtual {v1}, Lcom/squareup/okhttp/Protocol;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;)Lokio/Buffer;

    goto :goto_16

    .line 405
    .end local v1    # "protocol":Lcom/squareup/okhttp/Protocol;
    :cond_2c
    invoke-virtual {v2}, Lokio/Buffer;->readByteArray()[B

    move-result-object v4

    return-object v4
.end method

.method private static findPlatform()Lcom/squareup/okhttp/internal/Platform;
    .registers 22

    .prologue
    .line 116
    :try_start_0
    const-string v2, "com.android.org.conscrypt.OpenSSLSocketImpl"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_5} :catch_6f
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_5} :catch_77

    move-result-object v3

    .line 123
    .local v3, "openSslSocketClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_6
    :try_start_6
    const-string v2, "setUseSessionTickets"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Class;

    const/16 v20, 0x0

    sget-object v21, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v21, v10, v20

    invoke-virtual {v3, v2, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 124
    .local v4, "setUseSessionTickets":Ljava/lang/reflect/Method;
    const-string v2, "setHostname"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Class;

    const/16 v20, 0x0

    const-class v21, Ljava/lang/String;

    aput-object v21, v10, v20

    invoke-virtual {v3, v2, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_23
    .catch Ljava/lang/ClassNotFoundException; {:try_start_6 .. :try_end_23} :catch_101
    .catch Ljava/lang/NoSuchMethodException; {:try_start_6 .. :try_end_23} :catch_77

    move-result-object v5

    .line 127
    .local v5, "setHostname":Ljava/lang/reflect/Method;
    const/4 v6, 0x0

    .line 128
    .local v6, "trafficStatsTagSocket":Ljava/lang/reflect/Method;
    const/4 v7, 0x0

    .line 130
    .local v7, "trafficStatsUntagSocket":Ljava/lang/reflect/Method;
    :try_start_26
    const-string v2, "android.net.TrafficStats"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    .line 131
    .local v19, "trafficStats":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "tagSocket"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Class;

    const/16 v20, 0x0

    const-class v21, Ljava/net/Socket;

    aput-object v21, v10, v20

    move-object/from16 v0, v19

    invoke-virtual {v0, v2, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 132
    const-string v2, "untagSocket"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Class;

    const/16 v20, 0x0

    const-class v21, Ljava/net/Socket;

    aput-object v21, v10, v20

    move-object/from16 v0, v19

    invoke-virtual {v0, v2, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_4d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_26 .. :try_end_4d} :catch_10a
    .catch Ljava/lang/NoSuchMethodException; {:try_start_26 .. :try_end_4d} :catch_107

    move-result-object v7

    .line 138
    .end local v19    # "trafficStats":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_4e
    const/4 v8, 0x0

    .line 139
    .local v8, "setNpnProtocols":Ljava/lang/reflect/Method;
    const/4 v9, 0x0

    .line 141
    .local v9, "getNpnSelectedProtocol":Ljava/lang/reflect/Method;
    :try_start_50
    const-string v2, "setNpnProtocols"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Class;

    const/16 v20, 0x0

    const-class v21, [B

    aput-object v21, v10, v20

    invoke-virtual {v3, v2, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    .line 142
    const-string v2, "getNpnSelectedProtocol"

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Class;

    invoke-virtual {v3, v2, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_67
    .catch Ljava/lang/NoSuchMethodException; {:try_start_50 .. :try_end_67} :catch_104
    .catch Ljava/lang/ClassNotFoundException; {:try_start_50 .. :try_end_67} :catch_101

    move-result-object v9

    .line 146
    :goto_68
    :try_start_68
    new-instance v2, Lcom/squareup/okhttp/internal/Platform$Android;

    const/4 v10, 0x0

    invoke-direct/range {v2 .. v10}, Lcom/squareup/okhttp/internal/Platform$Android;-><init>(Ljava/lang/Class;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Lcom/squareup/okhttp/internal/Platform$1;)V

    .line 175
    .end local v3    # "openSslSocketClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "setUseSessionTickets":Ljava/lang/reflect/Method;
    .end local v5    # "setHostname":Ljava/lang/reflect/Method;
    .end local v6    # "trafficStatsTagSocket":Ljava/lang/reflect/Method;
    .end local v7    # "trafficStatsUntagSocket":Ljava/lang/reflect/Method;
    .end local v8    # "setNpnProtocols":Ljava/lang/reflect/Method;
    .end local v9    # "getNpnSelectedProtocol":Ljava/lang/reflect/Method;
    :goto_6e
    return-object v2

    .line 117
    :catch_6f
    move-exception v13

    .line 119
    .local v13, "ignored":Ljava/lang/ClassNotFoundException;
    const-string v2, "org.apache.harmony.xnet.provider.jsse.OpenSSLSocketImpl"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_75
    .catch Ljava/lang/ClassNotFoundException; {:try_start_68 .. :try_end_75} :catch_101
    .catch Ljava/lang/NoSuchMethodException; {:try_start_68 .. :try_end_75} :catch_77

    move-result-object v3

    .restart local v3    # "openSslSocketClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_6

    .line 151
    .end local v3    # "openSslSocketClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_77
    move-exception v2

    .line 156
    :goto_78
    :try_start_78
    const-string v15, "org.eclipse.jetty.alpn.ALPN"
    :try_end_7a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_78 .. :try_end_7a} :catch_ef
    .catch Ljava/lang/NoSuchMethodException; {:try_start_78 .. :try_end_7a} :catch_ff

    .line 159
    .end local v13    # "ignored":Ljava/lang/ClassNotFoundException;
    .local v15, "negoClassName":Ljava/lang/String;
    :try_start_7a
    invoke-static {v15}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_7d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7a .. :try_end_7d} :catch_f7
    .catch Ljava/lang/NoSuchMethodException; {:try_start_7a .. :try_end_7d} :catch_ff

    move-result-object v14

    .line 164
    .local v14, "negoClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_7e
    :try_start_7e
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v10, "$Provider"

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v16

    .line 165
    .local v16, "providerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v10, "$ClientProvider"

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    .line 166
    .local v11, "clientProviderClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v10, "$ServerProvider"

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v18

    .line 167
    .local v18, "serverProviderClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "put"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Class;

    const/16 v20, 0x0

    const-class v21, Ljavax/net/ssl/SSLSocket;

    aput-object v21, v10, v20

    const/16 v20, 0x1

    aput-object v16, v10, v20

    invoke-virtual {v14, v2, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v17

    .line 168
    .local v17, "putMethod":Ljava/lang/reflect/Method;
    const-string v2, "get"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Class;

    const/16 v20, 0x0

    const-class v21, Ljavax/net/ssl/SSLSocket;

    aput-object v21, v10, v20

    invoke-virtual {v14, v2, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v12

    .line 169
    .local v12, "getMethod":Ljava/lang/reflect/Method;
    new-instance v2, Lcom/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v2, v0, v12, v11, v1}, Lcom/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform;-><init>(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/Class;Ljava/lang/Class;)V
    :try_end_ee
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7e .. :try_end_ee} :catch_ef
    .catch Ljava/lang/NoSuchMethodException; {:try_start_7e .. :try_end_ee} :catch_ff

    goto :goto_6e

    .line 171
    .end local v11    # "clientProviderClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v12    # "getMethod":Ljava/lang/reflect/Method;
    .end local v14    # "negoClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v15    # "negoClassName":Ljava/lang/String;
    .end local v16    # "providerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v17    # "putMethod":Ljava/lang/reflect/Method;
    .end local v18    # "serverProviderClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_ef
    move-exception v2

    .line 175
    :goto_f0
    new-instance v2, Lcom/squareup/okhttp/internal/Platform;

    invoke-direct {v2}, Lcom/squareup/okhttp/internal/Platform;-><init>()V

    goto/16 :goto_6e

    .line 160
    .restart local v15    # "negoClassName":Ljava/lang/String;
    :catch_f7
    move-exception v13

    .line 161
    .restart local v13    # "ignored":Ljava/lang/ClassNotFoundException;
    :try_start_f8
    const-string v15, "org.eclipse.jetty.npn.NextProtoNego"

    .line 162
    invoke-static {v15}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_fd
    .catch Ljava/lang/ClassNotFoundException; {:try_start_f8 .. :try_end_fd} :catch_ef
    .catch Ljava/lang/NoSuchMethodException; {:try_start_f8 .. :try_end_fd} :catch_ff

    move-result-object v14

    .restart local v14    # "negoClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_7e

    .line 172
    .end local v13    # "ignored":Ljava/lang/ClassNotFoundException;
    .end local v14    # "negoClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v15    # "negoClassName":Ljava/lang/String;
    :catch_ff
    move-exception v2

    goto :goto_f0

    .line 149
    .restart local v13    # "ignored":Ljava/lang/ClassNotFoundException;
    :catch_101
    move-exception v2

    goto/16 :goto_78

    .line 143
    .end local v13    # "ignored":Ljava/lang/ClassNotFoundException;
    .restart local v3    # "openSslSocketClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v4    # "setUseSessionTickets":Ljava/lang/reflect/Method;
    .restart local v5    # "setHostname":Ljava/lang/reflect/Method;
    .restart local v6    # "trafficStatsTagSocket":Ljava/lang/reflect/Method;
    .restart local v7    # "trafficStatsUntagSocket":Ljava/lang/reflect/Method;
    .restart local v8    # "setNpnProtocols":Ljava/lang/reflect/Method;
    .restart local v9    # "getNpnSelectedProtocol":Ljava/lang/reflect/Method;
    :catch_104
    move-exception v2

    goto/16 :goto_68

    .line 134
    .end local v8    # "setNpnProtocols":Ljava/lang/reflect/Method;
    .end local v9    # "getNpnSelectedProtocol":Ljava/lang/reflect/Method;
    :catch_107
    move-exception v2

    goto/16 :goto_4e

    .line 133
    :catch_10a
    move-exception v2

    goto/16 :goto_4e
.end method

.method public static get()Lcom/squareup/okhttp/internal/Platform;
    .registers 1

    .prologue
    .line 66
    sget-object v0, Lcom/squareup/okhttp/internal/Platform;->PLATFORM:Lcom/squareup/okhttp/internal/Platform;

    return-object v0
.end method


# virtual methods
.method public configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;)V
    .registers 4
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
    .line 96
    .local p3, "protocols":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Protocol;>;"
    return-void
.end method

.method public connectSocket(Ljava/net/Socket;Ljava/net/InetSocketAddress;I)V
    .registers 4
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "address"    # Ljava/net/InetSocketAddress;
    .param p3, "connectTimeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    invoke-virtual {p1, p2, p3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 106
    return-void
.end method

.method public getPrefix()Ljava/lang/String;
    .registers 2

    .prologue
    .line 71
    const-string v0, "OkHttp"

    return-object v0
.end method

.method public getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;
    .registers 3
    .param p1, "socket"    # Ljavax/net/ssl/SSLSocket;

    .prologue
    .line 100
    const/4 v0, 0x0

    return-object v0
.end method

.method public logW(Ljava/lang/String;)V
    .registers 3
    .param p1, "warning"    # Ljava/lang/String;

    .prologue
    .line 75
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 76
    return-void
.end method

.method public tagSocket(Ljava/net/Socket;)V
    .registers 2
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 79
    return-void
.end method

.method public toUriLenient(Ljava/net/URL;)Ljava/net/URI;
    .registers 3
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 85
    invoke-virtual {p1}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v0

    return-object v0
.end method

.method public untagSocket(Ljava/net/Socket;)V
    .registers 2
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 82
    return-void
.end method
