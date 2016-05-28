.class final Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;
.super Ljava/lang/Object;
.source "Http20Draft14.java"

# interfaces
.implements Lcom/squareup/okhttp/internal/spdy/FrameReader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/spdy/Http20Draft14;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Reader"
.end annotation


# instance fields
.field private final client:Z

.field private final continuation:Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;

.field final hpackReader:Lcom/squareup/okhttp/internal/spdy/HpackDraft09$Reader;

.field private final source:Lokio/BufferedSource;


# direct methods
.method constructor <init>(Lokio/BufferedSource;IZ)V
    .registers 6
    .param p1, "source"    # Lokio/BufferedSource;
    .param p2, "headerTableSize"    # I
    .param p3, "client"    # Z

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput-object p1, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    .line 95
    iput-boolean p3, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->client:Z

    .line 96
    new-instance v0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-direct {v0, v1}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;-><init>(Lokio/BufferedSource;)V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->continuation:Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;

    .line 97
    new-instance v0, Lcom/squareup/okhttp/internal/spdy/HpackDraft09$Reader;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->continuation:Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;

    invoke-direct {v0, p2, v1}, Lcom/squareup/okhttp/internal/spdy/HpackDraft09$Reader;-><init>(ILokio/Source;)V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->hpackReader:Lcom/squareup/okhttp/internal/spdy/HpackDraft09$Reader;

    .line 98
    return-void
.end method

.method private readData(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V
    .registers 11
    .param p1, "handler"    # Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    const/4 v2, 0x0

    .line 217
    and-int/lit8 v3, p3, 0x1

    if-eqz v3, :cond_16

    move v1, v0

    .line 218
    .local v1, "inFinished":Z
    :goto_7
    and-int/lit8 v3, p3, 0x20

    if-eqz v3, :cond_18

    .line 219
    .local v0, "gzipped":Z
    :goto_b
    if-eqz v0, :cond_1a

    .line 220
    const-string v3, "PROTOCOL_ERROR: FLAG_COMPRESSED without SETTINGS_COMPRESS_DATA"

    new-array v4, v2, [Ljava/lang/Object;

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v3, v4}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .end local v0    # "gzipped":Z
    .end local v1    # "inFinished":Z
    :cond_16
    move v1, v2

    .line 217
    goto :goto_7

    .restart local v1    # "inFinished":Z
    :cond_18
    move v0, v2

    .line 218
    goto :goto_b

    .line 223
    .restart local v0    # "gzipped":Z
    :cond_1a
    and-int/lit8 v3, p3, 0x8

    if-eqz v3, :cond_27

    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v3}, Lokio/BufferedSource;->readByte()B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    int-to-short v2, v3

    .line 224
    .local v2, "padding":S
    :cond_27
    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->lengthWithoutPadding(IBS)I
    invoke-static {p2, p3, v2}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$300(IBS)I

    move-result p2

    .line 226
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {p1, v1, p4, v3, p2}, Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;->data(ZILokio/BufferedSource;I)V

    .line 227
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    int-to-long v4, v2

    invoke-interface {v3, v4, v5}, Lokio/BufferedSource;->skip(J)V

    .line 228
    return-void
.end method

.method private readGoAway(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V
    .registers 14
    .param p1, "handler"    # Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v8, 0x0

    .line 332
    const/16 v5, 0x8

    if-ge p2, v5, :cond_15

    const-string v5, "TYPE_GOAWAY length < 8: %s"

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v5, v6}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v5

    throw v5

    .line 333
    :cond_15
    if-eqz p4, :cond_20

    const-string v5, "TYPE_GOAWAY streamId != 0"

    new-array v6, v8, [Ljava/lang/Object;

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v5, v6}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v5

    throw v5

    .line 334
    :cond_20
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v5}, Lokio/BufferedSource;->readInt()I

    move-result v3

    .line 335
    .local v3, "lastStreamId":I
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v5}, Lokio/BufferedSource;->readInt()I

    move-result v2

    .line 336
    .local v2, "errorCodeInt":I
    add-int/lit8 v4, p2, -0x8

    .line 337
    .local v4, "opaqueDataLength":I
    invoke-static {v2}, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->fromHttp2(I)Lcom/squareup/okhttp/internal/spdy/ErrorCode;

    move-result-object v1

    .line 338
    .local v1, "errorCode":Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    if-nez v1, :cond_43

    .line 339
    const-string v5, "TYPE_GOAWAY unexpected error code: %d"

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v5, v6}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v5

    throw v5

    .line 341
    :cond_43
    sget-object v0, Lokio/ByteString;->EMPTY:Lokio/ByteString;

    .line 342
    .local v0, "debugData":Lokio/ByteString;
    if-lez v4, :cond_4e

    .line 343
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    int-to-long v6, v4

    invoke-interface {v5, v6, v7}, Lokio/BufferedSource;->readByteString(J)Lokio/ByteString;

    move-result-object v0

    .line 345
    :cond_4e
    invoke-interface {p1, v3, v1, v0}, Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;->goAway(ILcom/squareup/okhttp/internal/spdy/ErrorCode;Lokio/ByteString;)V

    .line 346
    return-void
.end method

.method private readHeaderBlock(ISBI)Ljava/util/List;
    .registers 7
    .param p1, "length"    # I
    .param p2, "padding"    # S
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ISBI)",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/internal/spdy/Header;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 203
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->continuation:Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->continuation:Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;

    iput p1, v1, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->left:I

    iput p1, v0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->length:I

    .line 204
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->continuation:Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;

    iput-short p2, v0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->padding:S

    .line 205
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->continuation:Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;

    iput-byte p3, v0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->flags:B

    .line 206
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->continuation:Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;

    iput p4, v0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->streamId:I

    .line 210
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->hpackReader:Lcom/squareup/okhttp/internal/spdy/HpackDraft09$Reader;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/spdy/HpackDraft09$Reader;->readHeaders()V

    .line 211
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->hpackReader:Lcom/squareup/okhttp/internal/spdy/HpackDraft09$Reader;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/spdy/HpackDraft09$Reader;->getAndResetHeaderList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private readHeaders(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V
    .registers 13
    .param p1, "handler"    # Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 183
    if-nez p4, :cond_c

    const-string v0, "PROTOCOL_ERROR: TYPE_HEADERS streamId == 0"

    new-array v1, v1, [Ljava/lang/Object;

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v0, v1}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 185
    :cond_c
    and-int/lit8 v0, p3, 0x1

    if-eqz v0, :cond_38

    const/4 v2, 0x1

    .line 187
    .local v2, "endStream":Z
    :goto_11
    and-int/lit8 v0, p3, 0x8

    if-eqz v0, :cond_3a

    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v0}, Lokio/BufferedSource;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-short v7, v0

    .line 189
    .local v7, "padding":S
    :goto_1e
    and-int/lit8 v0, p3, 0x20

    if-eqz v0, :cond_27

    .line 190
    invoke-direct {p0, p1, p4}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->readPriority(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;I)V

    .line 191
    add-int/lit8 p2, p2, -0x5

    .line 194
    :cond_27
    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->lengthWithoutPadding(IBS)I
    invoke-static {p2, p3, v7}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$300(IBS)I

    move-result p2

    .line 196
    invoke-direct {p0, p2, v7, p3, p4}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->readHeaderBlock(ISBI)Ljava/util/List;

    move-result-object v5

    .line 198
    .local v5, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/internal/spdy/Header;>;"
    const/4 v4, -0x1

    sget-object v6, Lcom/squareup/okhttp/internal/spdy/HeadersMode;->HTTP_20_HEADERS:Lcom/squareup/okhttp/internal/spdy/HeadersMode;

    move-object v0, p1

    move v3, p4

    invoke-interface/range {v0 .. v6}, Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;->headers(ZZIILjava/util/List;Lcom/squareup/okhttp/internal/spdy/HeadersMode;)V

    .line 199
    return-void

    .end local v2    # "endStream":Z
    .end local v5    # "headerBlock":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/internal/spdy/Header;>;"
    .end local v7    # "padding":S
    :cond_38
    move v2, v1

    .line 185
    goto :goto_11

    .restart local v2    # "endStream":Z
    :cond_3a
    move v7, v1

    .line 187
    goto :goto_1e
.end method

.method private readPing(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V
    .registers 12
    .param p1, "handler"    # Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    const/4 v3, 0x0

    .line 322
    const/16 v4, 0x8

    if-eq p2, v4, :cond_15

    const-string v4, "TYPE_PING length != 8: %s"

    new-array v5, v0, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v4, v5}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 323
    :cond_15
    if-eqz p4, :cond_20

    const-string v4, "TYPE_PING streamId != 0"

    new-array v3, v3, [Ljava/lang/Object;

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v4, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 324
    :cond_20
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v4}, Lokio/BufferedSource;->readInt()I

    move-result v1

    .line 325
    .local v1, "payload1":I
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v4}, Lokio/BufferedSource;->readInt()I

    move-result v2

    .line 326
    .local v2, "payload2":I
    and-int/lit8 v4, p3, 0x1

    if-eqz v4, :cond_34

    .line 327
    .local v0, "ack":Z
    :goto_30
    invoke-interface {p1, v0, v1, v2}, Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;->ping(ZII)V

    .line 328
    return-void

    .end local v0    # "ack":Z
    :cond_34
    move v0, v3

    .line 326
    goto :goto_30
.end method

.method private readPriority(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;I)V
    .registers 8
    .param p1, "handler"    # Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;
    .param p2, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 238
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v4}, Lokio/BufferedSource;->readInt()I

    move-result v2

    .line 239
    .local v2, "w1":I
    const/high16 v4, -0x80000000

    and-int/2addr v4, v2

    if-eqz v4, :cond_1f

    const/4 v0, 0x1

    .line 240
    .local v0, "exclusive":Z
    :goto_c
    const v4, 0x7fffffff

    and-int v1, v2, v4

    .line 241
    .local v1, "streamDependency":I
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v4}, Lokio/BufferedSource;->readByte()B

    move-result v4

    and-int/lit16 v4, v4, 0xff

    add-int/lit8 v3, v4, 0x1

    .line 242
    .local v3, "weight":I
    invoke-interface {p1, p2, v1, v3, v0}, Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;->priority(IIIZ)V

    .line 243
    return-void

    .line 239
    .end local v0    # "exclusive":Z
    .end local v1    # "streamDependency":I
    .end local v3    # "weight":I
    :cond_1f
    const/4 v0, 0x0

    goto :goto_c
.end method

.method private readPriority(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V
    .registers 9
    .param p1, "handler"    # Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 232
    const/4 v0, 0x5

    if-eq p2, v0, :cond_14

    const-string v0, "TYPE_PRIORITY length: %d != 5"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v0, v1}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 233
    :cond_14
    if-nez p4, :cond_1f

    const-string v0, "TYPE_PRIORITY streamId == 0"

    new-array v1, v3, [Ljava/lang/Object;

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v0, v1}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 234
    :cond_1f
    invoke-direct {p0, p1, p4}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->readPriority(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;I)V

    .line 235
    return-void
.end method

.method private readPushPromise(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V
    .registers 10
    .param p1, "handler"    # Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 309
    if-nez p4, :cond_c

    .line 310
    const-string v3, "PROTOCOL_ERROR: TYPE_PUSH_PROMISE streamId == 0"

    new-array v4, v1, [Ljava/lang/Object;

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v3, v4}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 312
    :cond_c
    and-int/lit8 v3, p3, 0x8

    if-eqz v3, :cond_19

    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v3}, Lokio/BufferedSource;->readByte()B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    int-to-short v1, v3

    .line 313
    .local v1, "padding":S
    :cond_19
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v3}, Lokio/BufferedSource;->readInt()I

    move-result v3

    const v4, 0x7fffffff

    and-int v2, v3, v4

    .line 314
    .local v2, "promisedStreamId":I
    add-int/lit8 p2, p2, -0x4

    .line 315
    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->lengthWithoutPadding(IBS)I
    invoke-static {p2, p3, v1}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$300(IBS)I

    move-result p2

    .line 316
    invoke-direct {p0, p2, v1, p3, p4}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->readHeaderBlock(ISBI)Ljava/util/List;

    move-result-object v0

    .line 317
    .local v0, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/internal/spdy/Header;>;"
    invoke-interface {p1, p4, v2, v0}, Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;->pushPromise(IILjava/util/List;)V

    .line 318
    return-void
.end method

.method private readRstStream(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V
    .registers 11
    .param p1, "handler"    # Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 247
    const/4 v2, 0x4

    if-eq p2, v2, :cond_14

    const-string v2, "TYPE_RST_STREAM length: %d != 4"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 248
    :cond_14
    if-nez p4, :cond_1f

    const-string v2, "TYPE_RST_STREAM streamId == 0"

    new-array v3, v5, [Ljava/lang/Object;

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 249
    :cond_1f
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v2}, Lokio/BufferedSource;->readInt()I

    move-result v1

    .line 250
    .local v1, "errorCodeInt":I
    invoke-static {v1}, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->fromHttp2(I)Lcom/squareup/okhttp/internal/spdy/ErrorCode;

    move-result-object v0

    .line 251
    .local v0, "errorCode":Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    if-nez v0, :cond_3a

    .line 252
    const-string v2, "TYPE_RST_STREAM unexpected error code: %d"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 254
    :cond_3a
    invoke-interface {p1, p4, v0}, Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;->rstStream(ILcom/squareup/okhttp/internal/spdy/ErrorCode;)V

    .line 255
    return-void
.end method

.method private readSettings(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V
    .registers 13
    .param p1, "handler"    # Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 259
    if-eqz p4, :cond_d

    const-string v4, "TYPE_SETTINGS streamId != 0"

    new-array v5, v7, [Ljava/lang/Object;

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v4, v5}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v4

    throw v4

    .line 260
    :cond_d
    and-int/lit8 v4, p3, 0x1

    if-eqz v4, :cond_20

    .line 261
    if-eqz p2, :cond_1c

    const-string v4, "FRAME_SIZE_ERROR ack frame should be empty!"

    new-array v5, v7, [Ljava/lang/Object;

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v4, v5}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v4

    throw v4

    .line 262
    :cond_1c
    invoke-interface {p1}, Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;->ackSettings()V

    .line 305
    :cond_1f
    :goto_1f
    return-void

    .line 266
    :cond_20
    rem-int/lit8 v4, p2, 0x6

    if-eqz v4, :cond_33

    const-string v4, "TYPE_SETTINGS length %% 6 != 0: %s"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v4, v5}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v4

    throw v4

    .line 267
    :cond_33
    new-instance v2, Lcom/squareup/okhttp/internal/spdy/Settings;

    invoke-direct {v2}, Lcom/squareup/okhttp/internal/spdy/Settings;-><init>()V

    .line 268
    .local v2, "settings":Lcom/squareup/okhttp/internal/spdy/Settings;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_39
    if-ge v0, p2, :cond_91

    .line 269
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v4}, Lokio/BufferedSource;->readShort()S

    move-result v1

    .line 270
    .local v1, "id":S
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v4}, Lokio/BufferedSource;->readInt()I

    move-result v3

    .line 272
    .local v3, "value":I
    packed-switch v1, :pswitch_data_a6

    .line 297
    const-string v4, "PROTOCOL_ERROR invalid settings id: %s"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v6

    aput-object v6, v5, v7

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v4, v5}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v4

    throw v4

    .line 276
    :pswitch_59
    if-eqz v3, :cond_67

    if-eq v3, v5, :cond_67

    .line 277
    const-string v4, "PROTOCOL_ERROR SETTINGS_ENABLE_PUSH != 0 or 1"

    new-array v5, v7, [Ljava/lang/Object;

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v4, v5}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v4

    throw v4

    .line 281
    :pswitch_66
    const/4 v1, 0x4

    .line 299
    :cond_67
    :pswitch_67
    invoke-virtual {v2, v1, v7, v3}, Lcom/squareup/okhttp/internal/spdy/Settings;->set(III)Lcom/squareup/okhttp/internal/spdy/Settings;

    .line 268
    add-int/lit8 v0, v0, 0x6

    goto :goto_39

    .line 284
    :pswitch_6d
    const/4 v1, 0x7

    .line 285
    if-gez v3, :cond_67

    .line 286
    const-string v4, "PROTOCOL_ERROR SETTINGS_INITIAL_WINDOW_SIZE > 2^31 - 1"

    new-array v5, v7, [Ljava/lang/Object;

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v4, v5}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v4

    throw v4

    .line 290
    :pswitch_79
    const/16 v4, 0x4000

    if-lt v3, v4, :cond_82

    const v4, 0xffffff

    if-le v3, v4, :cond_67

    .line 291
    :cond_82
    const-string v4, "PROTOCOL_ERROR SETTINGS_MAX_FRAME_SIZE: %s"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v4, v5}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v4

    throw v4

    .line 301
    .end local v1    # "id":S
    .end local v3    # "value":I
    :cond_91
    invoke-interface {p1, v7, v2}, Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;->settings(ZLcom/squareup/okhttp/internal/spdy/Settings;)V

    .line 302
    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/spdy/Settings;->getHeaderTableSize()I

    move-result v4

    if-ltz v4, :cond_1f

    .line 303
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->hpackReader:Lcom/squareup/okhttp/internal/spdy/HpackDraft09$Reader;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/spdy/Settings;->getHeaderTableSize()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/internal/spdy/HpackDraft09$Reader;->maxHeaderTableByteCountSetting(I)V

    goto/16 :goto_1f

    .line 272
    nop

    :pswitch_data_a6
    .packed-switch 0x1
        :pswitch_67
        :pswitch_59
        :pswitch_66
        :pswitch_6d
        :pswitch_79
        :pswitch_67
    .end packed-switch
.end method

.method private readWindowUpdate(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V
    .registers 13
    .param p1, "handler"    # Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;
    .param p2, "length"    # I
    .param p3, "flags"    # B
    .param p4, "streamId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 350
    const/4 v2, 0x4

    if-eq p2, v2, :cond_14

    const-string v2, "TYPE_WINDOW_UPDATE length !=4: %s"

    new-array v3, v7, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 351
    :cond_14
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v2}, Lokio/BufferedSource;->readInt()I

    move-result v2

    int-to-long v2, v2

    const-wide/32 v4, 0x7fffffff

    and-long v0, v2, v4

    .line 352
    .local v0, "increment":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_35

    const-string v2, "windowSizeIncrement was 0"

    new-array v3, v7, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v6

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 353
    :cond_35
    invoke-interface {p1, p4, v0, v1}, Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;->windowUpdate(IJ)V

    .line 354
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 357
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v0}, Lokio/BufferedSource;->close()V

    .line 358
    return-void
.end method

.method public nextFrame(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;)Z
    .registers 12
    .param p1, "handler"    # Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 111
    :try_start_2
    iget-object v7, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    const-wide/16 v8, 0x9

    invoke-interface {v7, v8, v9}, Lokio/BufferedSource;->require(J)V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_9} :catch_24

    .line 128
    iget-object v7, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->readMedium(Lokio/BufferedSource;)I
    invoke-static {v7}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$200(Lokio/BufferedSource;)I

    move-result v2

    .line 129
    .local v2, "length":I
    if-ltz v2, :cond_15

    const/16 v7, 0x4000

    if-le v2, v7, :cond_27

    .line 130
    :cond_15
    const-string v7, "FRAME_SIZE_ERROR: %s"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v6

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v7, v5}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v5

    throw v5

    .line 112
    .end local v2    # "length":I
    :catch_24
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    move v5, v6

    .line 178
    .end local v0    # "e":Ljava/io/IOException;
    :goto_26
    return v5

    .line 132
    .restart local v2    # "length":I
    :cond_27
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v6}, Lokio/BufferedSource;->readByte()B

    move-result v6

    and-int/lit16 v6, v6, 0xff

    int-to-byte v4, v6

    .line 133
    .local v4, "type":B
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v6}, Lokio/BufferedSource;->readByte()B

    move-result v6

    and-int/lit16 v6, v6, 0xff

    int-to-byte v1, v6

    .line 134
    .local v1, "flags":B
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    invoke-interface {v6}, Lokio/BufferedSource;->readInt()I

    move-result v6

    const v7, 0x7fffffff

    and-int v3, v6, v7

    .line 135
    .local v3, "streamId":I
    sget-object v6, Lcom/squareup/okhttp/internal/Internal;->logger:Ljava/util/logging/Logger;

    sget-object v7, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v6, v7}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v6

    if-eqz v6, :cond_57

    sget-object v6, Lcom/squareup/okhttp/internal/Internal;->logger:Ljava/util/logging/Logger;

    invoke-static {v5, v3, v2, v4, v1}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->formatHeader(ZIIBB)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 137
    :cond_57
    packed-switch v4, :pswitch_data_86

    .line 176
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    int-to-long v8, v2

    invoke-interface {v6, v8, v9}, Lokio/BufferedSource;->skip(J)V

    goto :goto_26

    .line 139
    :pswitch_61
    invoke-direct {p0, p1, v2, v1, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->readData(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V

    goto :goto_26

    .line 143
    :pswitch_65
    invoke-direct {p0, p1, v2, v1, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->readHeaders(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V

    goto :goto_26

    .line 147
    :pswitch_69
    invoke-direct {p0, p1, v2, v1, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->readPriority(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V

    goto :goto_26

    .line 151
    :pswitch_6d
    invoke-direct {p0, p1, v2, v1, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->readRstStream(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V

    goto :goto_26

    .line 155
    :pswitch_71
    invoke-direct {p0, p1, v2, v1, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->readSettings(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V

    goto :goto_26

    .line 159
    :pswitch_75
    invoke-direct {p0, p1, v2, v1, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->readPushPromise(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V

    goto :goto_26

    .line 163
    :pswitch_79
    invoke-direct {p0, p1, v2, v1, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->readPing(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V

    goto :goto_26

    .line 167
    :pswitch_7d
    invoke-direct {p0, p1, v2, v1, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->readGoAway(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V

    goto :goto_26

    .line 171
    :pswitch_81
    invoke-direct {p0, p1, v2, v1, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->readWindowUpdate(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;IBI)V

    goto :goto_26

    .line 137
    nop

    :pswitch_data_86
    .packed-switch 0x0
        :pswitch_61
        :pswitch_65
        :pswitch_69
        :pswitch_6d
        :pswitch_71
        :pswitch_75
        :pswitch_79
        :pswitch_7d
        :pswitch_81
    .end packed-switch
.end method

.method public readConnectionPreface()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 101
    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->client:Z

    if-eqz v1, :cond_7

    .line 107
    :cond_6
    return-void

    .line 102
    :cond_7
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;->source:Lokio/BufferedSource;

    # getter for: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->CONNECTION_PREFACE:Lokio/ByteString;
    invoke-static {}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$000()Lokio/ByteString;

    move-result-object v2

    invoke-virtual {v2}, Lokio/ByteString;->size()I

    move-result v2

    int-to-long v2, v2

    invoke-interface {v1, v2, v3}, Lokio/BufferedSource;->readByteString(J)Lokio/ByteString;

    move-result-object v0

    .line 103
    .local v0, "connectionPreface":Lokio/ByteString;
    sget-object v1, Lcom/squareup/okhttp/internal/Internal;->logger:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_33

    sget-object v1, Lcom/squareup/okhttp/internal/Internal;->logger:Ljava/util/logging/Logger;

    const-string v2, "<< CONNECTION %s"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-virtual {v0}, Lokio/ByteString;->hex()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 104
    :cond_33
    # getter for: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->CONNECTION_PREFACE:Lokio/ByteString;
    invoke-static {}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$000()Lokio/ByteString;

    move-result-object v1

    invoke-virtual {v1, v0}, Lokio/ByteString;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 105
    const-string v1, "Expected a connection header but was %s"

    new-array v2, v6, [Ljava/lang/Object;

    invoke-virtual {v0}, Lokio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v1, v2}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v1

    throw v1
.end method
