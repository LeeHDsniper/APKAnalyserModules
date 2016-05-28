.class public Lorg/apache/http/impl/conn/DefaultHttpResponseParser;
.super Lorg/apache/http/impl/io/AbstractMessageParser;
.source "DefaultHttpResponseParser.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/http/impl/io/AbstractMessageParser",
        "<",
        "Lorg/apache/http/HttpResponse;",
        ">;"
    }
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final lineBuf:Lorg/apache/http/util/CharArrayBuffer;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final responseFactory:Lorg/apache/http/HttpResponseFactory;


# direct methods
.method public constructor <init>(Lorg/apache/http/io/SessionInputBuffer;)V
    .registers 4
    .param p1, "buffer"    # Lorg/apache/http/io/SessionInputBuffer;

    .prologue
    const/4 v1, 0x0

    .line 128
    sget-object v0, Lorg/apache/http/config/MessageConstraints;->DEFAULT:Lorg/apache/http/config/MessageConstraints;

    invoke-direct {p0, p1, v1, v1, v0}, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;-><init>(Lorg/apache/http/io/SessionInputBuffer;Lorg/apache/http/message/LineParser;Lorg/apache/http/HttpResponseFactory;Lorg/apache/http/config/MessageConstraints;)V

    .line 129
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/io/SessionInputBuffer;Lorg/apache/http/config/MessageConstraints;)V
    .registers 4
    .param p1, "buffer"    # Lorg/apache/http/io/SessionInputBuffer;
    .param p2, "constraints"    # Lorg/apache/http/config/MessageConstraints;

    .prologue
    const/4 v0, 0x0

    .line 117
    invoke-direct {p0, p1, v0, v0, p2}, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;-><init>(Lorg/apache/http/io/SessionInputBuffer;Lorg/apache/http/message/LineParser;Lorg/apache/http/HttpResponseFactory;Lorg/apache/http/config/MessageConstraints;)V

    .line 118
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/io/SessionInputBuffer;Lorg/apache/http/message/LineParser;Lorg/apache/http/HttpResponseFactory;Lorg/apache/http/config/MessageConstraints;)V
    .registers 7
    .param p1, "buffer"    # Lorg/apache/http/io/SessionInputBuffer;
    .param p2, "lineParser"    # Lorg/apache/http/message/LineParser;
    .param p3, "responseFactory"    # Lorg/apache/http/HttpResponseFactory;
    .param p4, "constraints"    # Lorg/apache/http/config/MessageConstraints;

    .prologue
    .line 100
    invoke-direct {p0, p1, p2, p4}, Lorg/apache/http/impl/io/AbstractMessageParser;-><init>(Lorg/apache/http/io/SessionInputBuffer;Lorg/apache/http/message/LineParser;Lorg/apache/http/config/MessageConstraints;)V

    .line 61
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->log:Lorg/apache/commons/logging/Log;

    .line 101
    if-eqz p3, :cond_1b

    .end local p3    # "responseFactory":Lorg/apache/http/HttpResponseFactory;
    :goto_f
    iput-object p3, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    .line 103
    new-instance v0, Lorg/apache/http/util/CharArrayBuffer;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->lineBuf:Lorg/apache/http/util/CharArrayBuffer;

    .line 104
    return-void

    .line 101
    .restart local p3    # "responseFactory":Lorg/apache/http/HttpResponseFactory;
    :cond_1b
    sget-object p3, Lorg/apache/http/impl/DefaultHttpResponseFactory;->INSTANCE:Lorg/apache/http/impl/DefaultHttpResponseFactory;

    goto :goto_f
.end method

.method public constructor <init>(Lorg/apache/http/io/SessionInputBuffer;Lorg/apache/http/message/LineParser;Lorg/apache/http/HttpResponseFactory;Lorg/apache/http/params/HttpParams;)V
    .registers 7
    .param p1, "buffer"    # Lorg/apache/http/io/SessionInputBuffer;
    .param p2, "parser"    # Lorg/apache/http/message/LineParser;
    .param p3, "responseFactory"    # Lorg/apache/http/HttpResponseFactory;
    .param p4, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 76
    invoke-direct {p0, p1, p2, p4}, Lorg/apache/http/impl/io/AbstractMessageParser;-><init>(Lorg/apache/http/io/SessionInputBuffer;Lorg/apache/http/message/LineParser;Lorg/apache/http/params/HttpParams;)V

    .line 61
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->log:Lorg/apache/commons/logging/Log;

    .line 77
    const-string v0, "Response factory"

    invoke-static {p3, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 78
    iput-object p3, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    .line 79
    new-instance v0, Lorg/apache/http/util/CharArrayBuffer;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->lineBuf:Lorg/apache/http/util/CharArrayBuffer;

    .line 80
    return-void
.end method


# virtual methods
.method protected bridge synthetic parseHead(Lorg/apache/http/io/SessionInputBuffer;)Lorg/apache/http/HttpMessage;
    .registers 3
    .param p1, "x0"    # Lorg/apache/http/io/SessionInputBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;,
            Lorg/apache/http/ParseException;
        }
    .end annotation

    .prologue
    .line 57
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->parseHead(Lorg/apache/http/io/SessionInputBuffer;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    return-object v0
.end method

.method protected parseHead(Lorg/apache/http/io/SessionInputBuffer;)Lorg/apache/http/HttpResponse;
    .registers 10
    .param p1, "sessionBuffer"    # Lorg/apache/http/io/SessionInputBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    .line 135
    const/4 v0, 0x0

    .line 136
    .local v0, "count":I
    const/4 v1, 0x0

    .line 139
    .local v1, "cursor":Lorg/apache/http/message/ParserCursor;
    :goto_3
    iget-object v4, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->lineBuf:Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {v4}, Lorg/apache/http/util/CharArrayBuffer;->clear()V

    .line 140
    iget-object v4, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->lineBuf:Lorg/apache/http/util/CharArrayBuffer;

    invoke-interface {p1, v4}, Lorg/apache/http/io/SessionInputBuffer;->readLine(Lorg/apache/http/util/CharArrayBuffer;)I

    move-result v2

    .line 141
    .local v2, "i":I
    if-ne v2, v7, :cond_1a

    if-nez v0, :cond_1a

    .line 143
    new-instance v4, Lorg/apache/http/NoHttpResponseException;

    const-string v5, "The target server failed to respond"

    invoke-direct {v4, v5}, Lorg/apache/http/NoHttpResponseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 145
    :cond_1a
    new-instance v1, Lorg/apache/http/message/ParserCursor;

    .end local v1    # "cursor":Lorg/apache/http/message/ParserCursor;
    const/4 v4, 0x0

    iget-object v5, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->lineBuf:Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {v5}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v5

    invoke-direct {v1, v4, v5}, Lorg/apache/http/message/ParserCursor;-><init>(II)V

    .line 146
    .restart local v1    # "cursor":Lorg/apache/http/message/ParserCursor;
    iget-object v4, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->lineParser:Lorg/apache/http/message/LineParser;

    iget-object v5, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->lineBuf:Lorg/apache/http/util/CharArrayBuffer;

    invoke-interface {v4, v5, v1}, Lorg/apache/http/message/LineParser;->hasProtocolVersion(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;)Z

    move-result v4

    if-eqz v4, :cond_40

    .line 160
    iget-object v4, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->lineParser:Lorg/apache/http/message/LineParser;

    iget-object v5, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->lineBuf:Lorg/apache/http/util/CharArrayBuffer;

    invoke-interface {v4, v5, v1}, Lorg/apache/http/message/LineParser;->parseStatusLine(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;)Lorg/apache/http/StatusLine;

    move-result-object v3

    .line 161
    .local v3, "statusline":Lorg/apache/http/StatusLine;
    iget-object v4, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    const/4 v5, 0x0

    invoke-interface {v4, v3, v5}, Lorg/apache/http/HttpResponseFactory;->newHttpResponse(Lorg/apache/http/StatusLine;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    return-object v4

    .line 149
    .end local v3    # "statusline":Lorg/apache/http/StatusLine;
    :cond_40
    if-eq v2, v7, :cond_4a

    iget-object v4, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->lineBuf:Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {p0, v4, v0}, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->reject(Lorg/apache/http/util/CharArrayBuffer;I)Z

    move-result v4

    if-eqz v4, :cond_52

    .line 151
    :cond_4a
    new-instance v4, Lorg/apache/http/ProtocolException;

    const-string v5, "The server failed to respond with a valid HTTP response"

    invoke-direct {v4, v5}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 154
    :cond_52
    iget-object v4, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_78

    .line 155
    iget-object v4, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->log:Lorg/apache/commons/logging/Log;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Garbage in response: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/http/impl/conn/DefaultHttpResponseParser;->lineBuf:Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {v6}, Lorg/apache/http/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 157
    :cond_78
    add-int/lit8 v0, v0, 0x1

    .line 158
    goto :goto_3
.end method

.method protected reject(Lorg/apache/http/util/CharArrayBuffer;I)Z
    .registers 4
    .param p1, "line"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "count"    # I

    .prologue
    .line 165
    const/4 v0, 0x0

    return v0
.end method
