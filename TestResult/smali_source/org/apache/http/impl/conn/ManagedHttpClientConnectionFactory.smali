.class public Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;
.super Ljava/lang/Object;
.source "ManagedHttpClientConnectionFactory.java"

# interfaces
.implements Lorg/apache/http/conn/HttpConnectionFactory;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/http/conn/HttpConnectionFactory",
        "<",
        "Lorg/apache/http/conn/routing/HttpRoute;",
        "Lorg/apache/http/conn/ManagedHttpClientConnection;",
        ">;"
    }
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final COUNTER:Ljava/util/concurrent/atomic/AtomicLong;

.field public static final INSTANCE:Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;


# instance fields
.field private final headerlog:Lorg/apache/commons/logging/Log;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final requestWriterFactory:Lorg/apache/http/io/HttpMessageWriterFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/io/HttpMessageWriterFactory",
            "<",
            "Lorg/apache/http/HttpRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final responseParserFactory:Lorg/apache/http/io/HttpMessageParserFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/io/HttpMessageParserFactory",
            "<",
            "Lorg/apache/http/HttpResponse;",
            ">;"
        }
    .end annotation
.end field

.field private final wirelog:Lorg/apache/commons/logging/Log;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 57
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    sput-object v0, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;->COUNTER:Ljava/util/concurrent/atomic/AtomicLong;

    .line 59
    new-instance v0, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;

    invoke-direct {v0}, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;-><init>()V

    sput-object v0, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;->INSTANCE:Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 84
    invoke-direct {p0, v0, v0}, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;-><init>(Lorg/apache/http/io/HttpMessageWriterFactory;Lorg/apache/http/io/HttpMessageParserFactory;)V

    .line 85
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/io/HttpMessageParserFactory;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/io/HttpMessageParserFactory",
            "<",
            "Lorg/apache/http/HttpResponse;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p1, "responseParserFactory":Lorg/apache/http/io/HttpMessageParserFactory;, "Lorg/apache/http/io/HttpMessageParserFactory<Lorg/apache/http/HttpResponse;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;-><init>(Lorg/apache/http/io/HttpMessageWriterFactory;Lorg/apache/http/io/HttpMessageParserFactory;)V

    .line 81
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/io/HttpMessageWriterFactory;Lorg/apache/http/io/HttpMessageParserFactory;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    .line 71
    .local p1, "requestWriterFactory":Lorg/apache/http/io/HttpMessageWriterFactory;, "Lorg/apache/http/io/HttpMessageWriterFactory<Lorg/apache/http/HttpRequest;>;"
    .local p2, "responseParserFactory":Lorg/apache/http/io/HttpMessageParserFactory;, "Lorg/apache/http/io/HttpMessageParserFactory<Lorg/apache/http/HttpResponse;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const-class v0, Lorg/apache/http/impl/conn/DefaultManagedHttpClientConnection;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;->log:Lorg/apache/commons/logging/Log;

    .line 62
    const-string v0, "org.apache.http.headers"

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/String;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;->headerlog:Lorg/apache/commons/logging/Log;

    .line 63
    const-string v0, "org.apache.http.wire"

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/String;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;->wirelog:Lorg/apache/commons/logging/Log;

    .line 72
    if-eqz p1, :cond_24

    .end local p1    # "requestWriterFactory":Lorg/apache/http/io/HttpMessageWriterFactory;, "Lorg/apache/http/io/HttpMessageWriterFactory<Lorg/apache/http/HttpRequest;>;"
    :goto_1d
    iput-object p1, p0, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;->requestWriterFactory:Lorg/apache/http/io/HttpMessageWriterFactory;

    .line 74
    if-eqz p2, :cond_27

    .end local p2    # "responseParserFactory":Lorg/apache/http/io/HttpMessageParserFactory;, "Lorg/apache/http/io/HttpMessageParserFactory<Lorg/apache/http/HttpResponse;>;"
    :goto_21
    iput-object p2, p0, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;->responseParserFactory:Lorg/apache/http/io/HttpMessageParserFactory;

    .line 76
    return-void

    .line 72
    .restart local p1    # "requestWriterFactory":Lorg/apache/http/io/HttpMessageWriterFactory;, "Lorg/apache/http/io/HttpMessageWriterFactory<Lorg/apache/http/HttpRequest;>;"
    .restart local p2    # "responseParserFactory":Lorg/apache/http/io/HttpMessageParserFactory;, "Lorg/apache/http/io/HttpMessageParserFactory<Lorg/apache/http/HttpResponse;>;"
    :cond_24
    sget-object p1, Lorg/apache/http/impl/io/DefaultHttpRequestWriterFactory;->INSTANCE:Lorg/apache/http/impl/io/DefaultHttpRequestWriterFactory;

    goto :goto_1d

    .line 74
    .end local p1    # "requestWriterFactory":Lorg/apache/http/io/HttpMessageWriterFactory;, "Lorg/apache/http/io/HttpMessageWriterFactory<Lorg/apache/http/HttpRequest;>;"
    :cond_27
    sget-object p2, Lorg/apache/http/impl/conn/DefaultHttpResponseParserFactory;->INSTANCE:Lorg/apache/http/impl/conn/DefaultHttpResponseParserFactory;

    goto :goto_21
.end method


# virtual methods
.method public bridge synthetic create(Ljava/lang/Object;Lorg/apache/http/config/ConnectionConfig;)Lorg/apache/http/HttpConnection;
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lorg/apache/http/config/ConnectionConfig;

    .prologue
    .line 53
    check-cast p1, Lorg/apache/http/conn/routing/HttpRoute;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;->create(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/config/ConnectionConfig;)Lorg/apache/http/conn/ManagedHttpClientConnection;

    move-result-object v0

    return-object v0
.end method

.method public create(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/config/ConnectionConfig;)Lorg/apache/http/conn/ManagedHttpClientConnection;
    .registers 23
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "config"    # Lorg/apache/http/config/ConnectionConfig;

    .prologue
    .line 88
    if-eqz p2, :cond_81

    move-object/from16 v16, p2

    .line 89
    .local v16, "cconfig":Lorg/apache/http/config/ConnectionConfig;
    :goto_4
    const/4 v9, 0x0

    .line 90
    .local v9, "chardecoder":Ljava/nio/charset/CharsetDecoder;
    const/4 v10, 0x0

    .line 91
    .local v10, "charencoder":Ljava/nio/charset/CharsetEncoder;
    invoke-virtual/range {v16 .. v16}, Lorg/apache/http/config/ConnectionConfig;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v17

    .line 92
    .local v17, "charset":Ljava/nio/charset/Charset;
    invoke-virtual/range {v16 .. v16}, Lorg/apache/http/config/ConnectionConfig;->getMalformedInputAction()Ljava/nio/charset/CodingErrorAction;

    move-result-object v2

    if-eqz v2, :cond_84

    invoke-virtual/range {v16 .. v16}, Lorg/apache/http/config/ConnectionConfig;->getMalformedInputAction()Ljava/nio/charset/CodingErrorAction;

    move-result-object v18

    .line 94
    .local v18, "malformedInputAction":Ljava/nio/charset/CodingErrorAction;
    :goto_14
    invoke-virtual/range {v16 .. v16}, Lorg/apache/http/config/ConnectionConfig;->getUnmappableInputAction()Ljava/nio/charset/CodingErrorAction;

    move-result-object v2

    if-eqz v2, :cond_87

    invoke-virtual/range {v16 .. v16}, Lorg/apache/http/config/ConnectionConfig;->getUnmappableInputAction()Ljava/nio/charset/CodingErrorAction;

    move-result-object v19

    .line 96
    .local v19, "unmappableInputAction":Ljava/nio/charset/CodingErrorAction;
    :goto_1e
    if-eqz v17, :cond_3c

    .line 97
    invoke-virtual/range {v17 .. v17}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v9

    .line 98
    move-object/from16 v0, v18

    invoke-virtual {v9, v0}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    .line 99
    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    .line 100
    invoke-virtual/range {v17 .. v17}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v10

    .line 101
    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Ljava/nio/charset/CharsetEncoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetEncoder;

    .line 102
    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/nio/charset/CharsetEncoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetEncoder;

    .line 104
    :cond_3c
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "http-outgoing-"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v4, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;->COUNTER:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 105
    .local v3, "id":Ljava/lang/String;
    new-instance v2, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;->headerlog:Lorg/apache/commons/logging/Log;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;->wirelog:Lorg/apache/commons/logging/Log;

    invoke-virtual/range {v16 .. v16}, Lorg/apache/http/config/ConnectionConfig;->getBufferSize()I

    move-result v7

    invoke-virtual/range {v16 .. v16}, Lorg/apache/http/config/ConnectionConfig;->getFragmentSizeHint()I

    move-result v8

    invoke-virtual/range {v16 .. v16}, Lorg/apache/http/config/ConnectionConfig;->getMessageConstraints()Lorg/apache/http/config/MessageConstraints;

    move-result-object v11

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;->requestWriterFactory:Lorg/apache/http/io/HttpMessageWriterFactory;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;->responseParserFactory:Lorg/apache/http/io/HttpMessageParserFactory;

    invoke-direct/range {v2 .. v15}, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;-><init>(Ljava/lang/String;Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lorg/apache/http/config/MessageConstraints;Lorg/apache/http/entity/ContentLengthStrategy;Lorg/apache/http/entity/ContentLengthStrategy;Lorg/apache/http/io/HttpMessageWriterFactory;Lorg/apache/http/io/HttpMessageParserFactory;)V

    return-object v2

    .line 88
    .end local v3    # "id":Ljava/lang/String;
    .end local v9    # "chardecoder":Ljava/nio/charset/CharsetDecoder;
    .end local v10    # "charencoder":Ljava/nio/charset/CharsetEncoder;
    .end local v16    # "cconfig":Lorg/apache/http/config/ConnectionConfig;
    .end local v17    # "charset":Ljava/nio/charset/Charset;
    .end local v18    # "malformedInputAction":Ljava/nio/charset/CodingErrorAction;
    .end local v19    # "unmappableInputAction":Ljava/nio/charset/CodingErrorAction;
    :cond_81
    sget-object v16, Lorg/apache/http/config/ConnectionConfig;->DEFAULT:Lorg/apache/http/config/ConnectionConfig;

    goto :goto_4

    .line 92
    .restart local v9    # "chardecoder":Ljava/nio/charset/CharsetDecoder;
    .restart local v10    # "charencoder":Ljava/nio/charset/CharsetEncoder;
    .restart local v16    # "cconfig":Lorg/apache/http/config/ConnectionConfig;
    .restart local v17    # "charset":Ljava/nio/charset/Charset;
    :cond_84
    sget-object v18, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    goto :goto_14

    .line 94
    .restart local v18    # "malformedInputAction":Ljava/nio/charset/CodingErrorAction;
    :cond_87
    sget-object v19, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    goto :goto_1e
.end method
