.class public final Lcom/squareup/okhttp/internal/spdy/Http20Draft14;
.super Ljava/lang/Object;
.source "Http20Draft14.java"

# interfaces
.implements Lcom/squareup/okhttp/internal/spdy/Variant;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;,
        Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;,
        Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Writer;,
        Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;
    }
.end annotation


# static fields
.field private static final CONNECTION_PREFACE:Lokio/ByteString;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 47
    const-string v0, "PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n"

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->CONNECTION_PREFACE:Lokio/ByteString;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 668
    return-void
.end method

.method static synthetic access$000()Lokio/ByteString;
    .registers 1

    .prologue
    .line 42
    sget-object v0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->CONNECTION_PREFACE:Lokio/ByteString;

    return-object v0
.end method

.method static synthetic access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    .registers 3
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    invoke-static {p0, p1}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lokio/BufferedSource;)I
    .registers 2
    .param p0, "x0"    # Lokio/BufferedSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    invoke-static {p0}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->readMedium(Lokio/BufferedSource;)I

    move-result v0

    return v0
.end method

.method static synthetic access$300(IBS)I
    .registers 4
    .param p0, "x0"    # I
    .param p1, "x1"    # B
    .param p2, "x2"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    invoke-static {p0, p1, p2}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->lengthWithoutPadding(IBS)I

    move-result v0

    return v0
.end method

.method static synthetic access$400(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;
    .registers 3
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # [Ljava/lang/Object;

    .prologue
    .line 42
    invoke-static {p0, p1}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->illegalArgument(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lokio/BufferedSink;I)V
    .registers 2
    .param p0, "x0"    # Lokio/BufferedSink;
    .param p1, "x1"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    invoke-static {p0, p1}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->writeMedium(Lokio/BufferedSink;I)V

    return-void
.end method

.method private static varargs illegalArgument(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;
    .registers 4
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 580
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static varargs ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    .registers 4
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 584
    new-instance v0, Ljava/io/IOException;

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static lengthWithoutPadding(IBS)I
    .registers 7
    .param p0, "length"    # I
    .param p1, "flags"    # B
    .param p2, "padding"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 643
    and-int/lit8 v0, p1, 0x8

    if-eqz v0, :cond_6

    add-int/lit8 p0, p0, -0x1

    .line 644
    :cond_6
    if-le p2, p0, :cond_20

    .line 645
    const-string v0, "PROTOCOL_ERROR padding %s > remaining length %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 647
    :cond_20
    sub-int v0, p0, p2

    int-to-short v0, v0

    return v0
.end method

.method private static readMedium(Lokio/BufferedSource;)I
    .registers 3
    .param p0, "source"    # Lokio/BufferedSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 761
    invoke-interface {p0}, Lokio/BufferedSource;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x10

    invoke-interface {p0}, Lokio/BufferedSource;->readByte()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    invoke-interface {p0}, Lokio/BufferedSource;->readByte()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method private static writeMedium(Lokio/BufferedSink;I)V
    .registers 3
    .param p0, "sink"    # Lokio/BufferedSink;
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 767
    ushr-int/lit8 v0, p1, 0x10

    and-int/lit16 v0, v0, 0xff

    invoke-interface {p0, v0}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 768
    ushr-int/lit8 v0, p1, 0x8

    and-int/lit16 v0, v0, 0xff

    invoke-interface {p0, v0}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 769
    and-int/lit16 v0, p1, 0xff

    invoke-interface {p0, v0}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 770
    return-void
.end method


# virtual methods
.method public newReader(Lokio/BufferedSource;Z)Lcom/squareup/okhttp/internal/spdy/FrameReader;
    .registers 5
    .param p1, "source"    # Lokio/BufferedSource;
    .param p2, "client"    # Z

    .prologue
    .line 78
    new-instance v0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;

    const/16 v1, 0x1000

    invoke-direct {v0, p1, v1, p2}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Reader;-><init>(Lokio/BufferedSource;IZ)V

    return-object v0
.end method

.method public newWriter(Lokio/BufferedSink;Z)Lcom/squareup/okhttp/internal/spdy/FrameWriter;
    .registers 4
    .param p1, "sink"    # Lokio/BufferedSink;
    .param p2, "client"    # Z

    .prologue
    .line 82
    new-instance v0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Writer;

    invoke-direct {v0, p1, p2}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$Writer;-><init>(Lokio/BufferedSink;Z)V

    return-object v0
.end method
