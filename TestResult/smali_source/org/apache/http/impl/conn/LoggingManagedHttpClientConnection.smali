.class Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;
.super Lorg/apache/http/impl/conn/DefaultManagedHttpClientConnection;
.source "LoggingManagedHttpClientConnection.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final headerlog:Lorg/apache/commons/logging/Log;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final wire:Lorg/apache/http/impl/conn/Wire;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lorg/apache/http/config/MessageConstraints;Lorg/apache/http/entity/ContentLengthStrategy;Lorg/apache/http/entity/ContentLengthStrategy;Lorg/apache/http/io/HttpMessageWriterFactory;Lorg/apache/http/io/HttpMessageParserFactory;)V
    .registers 25
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "log"    # Lorg/apache/commons/logging/Log;
    .param p3, "headerlog"    # Lorg/apache/commons/logging/Log;
    .param p4, "wirelog"    # Lorg/apache/commons/logging/Log;
    .param p5, "buffersize"    # I
    .param p6, "fragmentSizeHint"    # I
    .param p7, "chardecoder"    # Ljava/nio/charset/CharsetDecoder;
    .param p8, "charencoder"    # Ljava/nio/charset/CharsetEncoder;
    .param p9, "constraints"    # Lorg/apache/http/config/MessageConstraints;
    .param p10, "incomingContentStrategy"    # Lorg/apache/http/entity/ContentLengthStrategy;
    .param p11, "outgoingContentStrategy"    # Lorg/apache/http/entity/ContentLengthStrategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/apache/commons/logging/Log;",
            "Lorg/apache/commons/logging/Log;",
            "Lorg/apache/commons/logging/Log;",
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
    .line 68
    .local p12, "requestWriterFactory":Lorg/apache/http/io/HttpMessageWriterFactory;, "Lorg/apache/http/io/HttpMessageWriterFactory<Lorg/apache/http/HttpRequest;>;"
    .local p13, "responseParserFactory":Lorg/apache/http/io/HttpMessageParserFactory;, "Lorg/apache/http/io/HttpMessageParserFactory<Lorg/apache/http/HttpResponse;>;"
    move-object v0, p0

    move-object v1, p1

    move/from16 v2, p5

    move/from16 v3, p6

    move-object/from16 v4, p7

    move-object/from16 v5, p8

    move-object/from16 v6, p9

    move-object/from16 v7, p10

    move-object/from16 v8, p11

    move-object/from16 v9, p12

    move-object/from16 v10, p13

    invoke-direct/range {v0 .. v10}, Lorg/apache/http/impl/conn/DefaultManagedHttpClientConnection;-><init>(Ljava/lang/String;IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lorg/apache/http/config/MessageConstraints;Lorg/apache/http/entity/ContentLengthStrategy;Lorg/apache/http/entity/ContentLengthStrategy;Lorg/apache/http/io/HttpMessageWriterFactory;Lorg/apache/http/io/HttpMessageParserFactory;)V

    .line 71
    iput-object p2, p0, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->log:Lorg/apache/commons/logging/Log;

    .line 72
    iput-object p3, p0, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->headerlog:Lorg/apache/commons/logging/Log;

    .line 73
    new-instance v0, Lorg/apache/http/impl/conn/Wire;

    invoke-direct {v0, p4, p1}, Lorg/apache/http/impl/conn/Wire;-><init>(Lorg/apache/commons/logging/Log;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->wire:Lorg/apache/http/impl/conn/Wire;

    .line 74
    return-void
.end method


# virtual methods
.method public close()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_24

    .line 79
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": Close connection"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 81
    :cond_24
    invoke-super {p0}, Lorg/apache/http/impl/conn/DefaultManagedHttpClientConnection;->close()V

    .line 82
    return-void
.end method

.method protected getSocketInputStream(Ljava/net/Socket;)Ljava/io/InputStream;
    .registers 5
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    invoke-super {p0, p1}, Lorg/apache/http/impl/conn/DefaultManagedHttpClientConnection;->getSocketInputStream(Ljava/net/Socket;)Ljava/io/InputStream;

    move-result-object v0

    .line 95
    .local v0, "in":Ljava/io/InputStream;
    iget-object v2, p0, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v2}, Lorg/apache/http/impl/conn/Wire;->enabled()Z

    move-result v2

    if-eqz v2, :cond_14

    .line 96
    new-instance v1, Lorg/apache/http/impl/conn/LoggingInputStream;

    iget-object v2, p0, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-direct {v1, v0, v2}, Lorg/apache/http/impl/conn/LoggingInputStream;-><init>(Ljava/io/InputStream;Lorg/apache/http/impl/conn/Wire;)V

    .end local v0    # "in":Ljava/io/InputStream;
    .local v1, "in":Ljava/io/InputStream;
    move-object v0, v1

    .line 98
    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v0    # "in":Ljava/io/InputStream;
    :cond_14
    return-object v0
.end method

.method protected getSocketOutputStream(Ljava/net/Socket;)Ljava/io/OutputStream;
    .registers 5
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-super {p0, p1}, Lorg/apache/http/impl/conn/DefaultManagedHttpClientConnection;->getSocketOutputStream(Ljava/net/Socket;)Ljava/io/OutputStream;

    move-result-object v0

    .line 104
    .local v0, "out":Ljava/io/OutputStream;
    iget-object v2, p0, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v2}, Lorg/apache/http/impl/conn/Wire;->enabled()Z

    move-result v2

    if-eqz v2, :cond_14

    .line 105
    new-instance v1, Lorg/apache/http/impl/conn/LoggingOutputStream;

    iget-object v2, p0, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-direct {v1, v0, v2}, Lorg/apache/http/impl/conn/LoggingOutputStream;-><init>(Ljava/io/OutputStream;Lorg/apache/http/impl/conn/Wire;)V

    .end local v0    # "out":Ljava/io/OutputStream;
    .local v1, "out":Ljava/io/OutputStream;
    move-object v0, v1

    .line 107
    .end local v1    # "out":Ljava/io/OutputStream;
    .restart local v0    # "out":Ljava/io/OutputStream;
    :cond_14
    return-object v0
.end method

.method protected onRequestSubmitted(Lorg/apache/http/HttpRequest;)V
    .registers 10
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 123
    if-eqz p1, :cond_64

    iget-object v5, p0, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->headerlog:Lorg/apache/commons/logging/Log;

    invoke-interface {v5}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v5

    if-eqz v5, :cond_64

    .line 124
    iget-object v5, p0, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->headerlog:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " >> "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 125
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v2

    .line 126
    .local v2, "headers":[Lorg/apache/http/Header;
    move-object v0, v2

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_39
    if-ge v3, v4, :cond_64

    aget-object v1, v0, v3

    .line 127
    .local v1, "header":Lorg/apache/http/Header;
    iget-object v5, p0, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->headerlog:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " >> "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 126
    add-int/lit8 v3, v3, 0x1

    goto :goto_39

    .line 130
    .end local v0    # "arr$":[Lorg/apache/http/Header;
    .end local v1    # "header":Lorg/apache/http/Header;
    .end local v2    # "headers":[Lorg/apache/http/Header;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_64
    return-void
.end method

.method protected onResponseReceived(Lorg/apache/http/HttpResponse;)V
    .registers 10
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 112
    if-eqz p1, :cond_64

    iget-object v5, p0, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->headerlog:Lorg/apache/commons/logging/Log;

    invoke-interface {v5}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v5

    if-eqz v5, :cond_64

    .line 113
    iget-object v5, p0, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->headerlog:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " << "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 114
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v2

    .line 115
    .local v2, "headers":[Lorg/apache/http/Header;
    move-object v0, v2

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_39
    if-ge v3, v4, :cond_64

    aget-object v1, v0, v3

    .line 116
    .local v1, "header":Lorg/apache/http/Header;
    iget-object v5, p0, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->headerlog:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " << "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 115
    add-int/lit8 v3, v3, 0x1

    goto :goto_39

    .line 119
    .end local v0    # "arr$":[Lorg/apache/http/Header;
    .end local v1    # "header":Lorg/apache/http/Header;
    .end local v2    # "headers":[Lorg/apache/http/Header;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_64
    return-void
.end method

.method public shutdown()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_24

    .line 87
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/apache/http/impl/conn/LoggingManagedHttpClientConnection;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": Shutdown connection"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 89
    :cond_24
    invoke-super {p0}, Lorg/apache/http/impl/conn/DefaultManagedHttpClientConnection;->shutdown()V

    .line 90
    return-void
.end method
