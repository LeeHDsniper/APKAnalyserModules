.class public Lorg/apache/http/impl/conn/DefaultManagedHttpClientConnection;
.super Lorg/apache/http/impl/DefaultBHttpClientConnection;
.source "DefaultManagedHttpClientConnection.java"

# interfaces
.implements Lorg/apache/http/conn/ManagedHttpClientConnection;
.implements Lorg/apache/http/protocol/HttpContext;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final attributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final id:Ljava/lang/String;

.field private volatile shutdown:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .registers 14
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "buffersize"    # I

    .prologue
    const/4 v4, 0x0

    .line 86
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p2

    move-object v5, v4

    move-object v6, v4

    move-object v7, v4

    move-object v8, v4

    move-object v9, v4

    move-object v10, v4

    invoke-direct/range {v0 .. v10}, Lorg/apache/http/impl/conn/DefaultManagedHttpClientConnection;-><init>(Ljava/lang/String;IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lorg/apache/http/config/MessageConstraints;Lorg/apache/http/entity/ContentLengthStrategy;Lorg/apache/http/entity/ContentLengthStrategy;Lorg/apache/http/io/HttpMessageWriterFactory;Lorg/apache/http/io/HttpMessageParserFactory;)V

    .line 87
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lorg/apache/http/config/MessageConstraints;Lorg/apache/http/entity/ContentLengthStrategy;Lorg/apache/http/entity/ContentLengthStrategy;Lorg/apache/http/io/HttpMessageWriterFactory;Lorg/apache/http/io/HttpMessageParserFactory;)V
    .registers 21
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "buffersize"    # I
    .param p3, "fragmentSizeHint"    # I
    .param p4, "chardecoder"    # Ljava/nio/charset/CharsetDecoder;
    .param p5, "charencoder"    # Ljava/nio/charset/CharsetEncoder;
    .param p6, "constraints"    # Lorg/apache/http/config/MessageConstraints;
    .param p7, "incomingContentStrategy"    # Lorg/apache/http/entity/ContentLengthStrategy;
    .param p8, "outgoingContentStrategy"    # Lorg/apache/http/entity/ContentLengthStrategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Ljava/nio/charset/CharsetDecoder;",
            "Ljava/nio/charset/CharsetEncoder;",
            "Lorg/apache/http/config/MessageConstraints;",
            "Lorg/apache/http/entity/ContentLengthStrategy;",
            "Lorg/apache/http/entity/ContentLengthStrategy;",
            "Lorg/apache/http/io/HttpMessageWriterFactory",
            "<",
            "Lorg/apache/http/HttpRequest;",
            ">;",
            "Lorg/apache/http/io/HttpMessageParserFactory",
            "<",
            "Lorg/apache/http/HttpResponse;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p9, "requestWriterFactory":Lorg/apache/http/io/HttpMessageWriterFactory;, "Lorg/apache/http/io/HttpMessageWriterFactory<Lorg/apache/http/HttpRequest;>;"
    .local p10, "responseParserFactory":Lorg/apache/http/io/HttpMessageParserFactory;, "Lorg/apache/http/io/HttpMessageParserFactory<Lorg/apache/http/HttpResponse;>;"
    move-object v0, p0

    move v1, p2

    move v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object/from16 v5, p6

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    move-object/from16 v9, p10

    invoke-direct/range {v0 .. v9}, Lorg/apache/http/impl/DefaultBHttpClientConnection;-><init>(IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lorg/apache/http/config/MessageConstraints;Lorg/apache/http/entity/ContentLengthStrategy;Lorg/apache/http/entity/ContentLengthStrategy;Lorg/apache/http/io/HttpMessageWriterFactory;Lorg/apache/http/io/HttpMessageParserFactory;)V

    .line 79
    iput-object p1, p0, Lorg/apache/http/impl/conn/DefaultManagedHttpClientConnection;->id:Ljava/lang/String;

    .line 80
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/conn/DefaultManagedHttpClientConnection;->attributes:Ljava/util/Map;

    .line 81
    return-void
.end method


# virtual methods
.method public bind(Ljava/net/Socket;)V
    .registers 4
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    iget-boolean v0, p0, Lorg/apache/http/impl/conn/DefaultManagedHttpClientConnection;->shutdown:Z

    if-eqz v0, :cond_f

    .line 114
    invoke-virtual {p1}, Ljava/net/Socket;->close()V

    .line 116
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "Connection already shutdown"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 118
    :cond_f
    invoke-super {p0, p1}, Lorg/apache/http/impl/DefaultBHttpClientConnection;->bind(Ljava/net/Socket;)V

    .line 119
    return-void
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 100
    iget-object v0, p0, Lorg/apache/http/impl/conn/DefaultManagedHttpClientConnection;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lorg/apache/http/impl/conn/DefaultManagedHttpClientConnection;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getSSLSession()Ljavax/net/ssl/SSLSession;
    .registers 3

    .prologue
    .line 127
    invoke-super {p0}, Lorg/apache/http/impl/DefaultBHttpClientConnection;->getSocket()Ljava/net/Socket;

    move-result-object v0

    .line 128
    .local v0, "socket":Ljava/net/Socket;
    instance-of v1, v0, Ljavax/net/ssl/SSLSocket;

    if-eqz v1, :cond_f

    .line 129
    check-cast v0, Ljavax/net/ssl/SSLSocket;

    .end local v0    # "socket":Ljava/net/Socket;
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v1

    .line 131
    :goto_e
    return-object v1

    .restart local v0    # "socket":Ljava/net/Socket;
    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public getSocket()Ljava/net/Socket;
    .registers 2

    .prologue
    .line 123
    invoke-super {p0}, Lorg/apache/http/impl/DefaultBHttpClientConnection;->getSocket()Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public removeAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 104
    iget-object v0, p0, Lorg/apache/http/impl/conn/DefaultManagedHttpClientConnection;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "obj"    # Ljava/lang/Object;

    .prologue
    .line 108
    iget-object v0, p0, Lorg/apache/http/impl/conn/DefaultManagedHttpClientConnection;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    return-void
.end method

.method public shutdown()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/conn/DefaultManagedHttpClientConnection;->shutdown:Z

    .line 96
    invoke-super {p0}, Lorg/apache/http/impl/DefaultBHttpClientConnection;->shutdown()V

    .line 97
    return-void
.end method
