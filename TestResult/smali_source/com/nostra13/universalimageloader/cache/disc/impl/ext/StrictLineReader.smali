.class Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;
.super Ljava/lang/Object;
.source "StrictLineReader.java"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field private buf:[B

.field private final charset:Ljava/nio/charset/Charset;

.field private end:I

.field private final in:Ljava/io/InputStream;

.field private pos:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;ILjava/nio/charset/Charset;)V
    .registers 6
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "capacity"    # I
    .param p3, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    if-eqz p1, :cond_7

    if-nez p3, :cond_d

    .line 87
    :cond_7
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 89
    :cond_d
    if-gez p2, :cond_17

    .line 90
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "capacity <= 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 92
    :cond_17
    sget-object v0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/Util;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p3, v0}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_27

    .line 93
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unsupported encoding"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :cond_27
    iput-object p1, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->in:Ljava/io/InputStream;

    .line 97
    iput-object p3, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->charset:Ljava/nio/charset/Charset;

    .line 98
    new-array v0, p2, [B

    iput-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->buf:[B

    .line 99
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 71
    const/16 v0, 0x2000

    invoke-direct {p0, p1, v0, p2}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;-><init>(Ljava/io/InputStream;ILjava/nio/charset/Charset;)V

    .line 72
    return-void
.end method

.method static synthetic access$000(Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;)Ljava/nio/charset/Charset;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method private fillBuf()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 183
    iget-object v1, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->in:Ljava/io/InputStream;

    iget-object v2, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->buf:[B

    iget-object v3, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->buf:[B

    array-length v3, v3

    invoke-virtual {v1, v2, v4, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 184
    .local v0, "result":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_15

    .line 185
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 187
    :cond_15
    iput v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->pos:I

    .line 188
    iput v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->end:I

    .line 189
    return-void
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    iget-object v1, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->in:Ljava/io/InputStream;

    monitor-enter v1

    .line 109
    :try_start_3
    iget-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->buf:[B

    if-eqz v0, :cond_f

    .line 110
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->buf:[B

    .line 111
    iget-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 113
    :cond_f
    monitor-exit v1

    .line 114
    return-void

    .line 113
    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw v0
.end method

.method public readLine()Ljava/lang/String;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0xa

    .line 125
    iget-object v5, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->in:Ljava/io/InputStream;

    monitor-enter v5

    .line 126
    :try_start_5
    iget-object v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->buf:[B

    if-nez v4, :cond_14

    .line 127
    new-instance v4, Ljava/io/IOException;

    const-string v6, "LineReader is closed"

    invoke-direct {v4, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 175
    :catchall_11
    move-exception v4

    monitor-exit v5
    :try_end_13
    .catchall {:try_start_5 .. :try_end_13} :catchall_11

    throw v4

    .line 133
    :cond_14
    :try_start_14
    iget v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->pos:I

    iget v6, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->end:I

    if-lt v4, v6, :cond_1d

    .line 134
    invoke-direct {p0}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->fillBuf()V

    .line 137
    :cond_1d
    iget v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->pos:I

    .local v0, "i":I
    :goto_1f
    iget v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->end:I

    if-eq v0, v4, :cond_57

    .line 138
    iget-object v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->buf:[B

    aget-byte v4, v4, v0

    if-ne v4, v9, :cond_54

    .line 139
    iget v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->pos:I

    if-eq v0, v4, :cond_52

    iget-object v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->buf:[B

    add-int/lit8 v6, v0, -0x1

    aget-byte v4, v4, v6

    const/16 v6, 0xd

    if-ne v4, v6, :cond_52

    add-int/lit8 v1, v0, -0x1

    .line 140
    .local v1, "lineEnd":I
    :goto_39
    new-instance v3, Ljava/lang/String;

    iget-object v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->buf:[B

    iget v6, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->pos:I

    iget v7, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->pos:I

    sub-int v7, v1, v7

    iget-object v8, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v8}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v3, v4, v6, v7, v8}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 141
    .local v3, "res":Ljava/lang/String;
    add-int/lit8 v4, v0, 0x1

    iput v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->pos:I

    .line 142
    monitor-exit v5

    .line 171
    .end local v1    # "lineEnd":I
    .end local v3    # "res":Ljava/lang/String;
    :goto_51
    return-object v3

    :cond_52
    move v1, v0

    .line 139
    goto :goto_39

    .line 137
    :cond_54
    add-int/lit8 v0, v0, 0x1

    goto :goto_1f

    .line 147
    :cond_57
    new-instance v2, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader$1;

    iget v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->end:I

    iget v6, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->pos:I

    sub-int/2addr v4, v6

    add-int/lit8 v4, v4, 0x50

    invoke-direct {v2, p0, v4}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader$1;-><init>(Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;I)V

    .line 160
    .local v2, "out":Ljava/io/ByteArrayOutputStream;
    :cond_63
    iget-object v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->buf:[B

    iget v6, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->pos:I

    iget v7, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->end:I

    iget v8, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->pos:I

    sub-int/2addr v7, v8

    invoke-virtual {v2, v4, v6, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 162
    const/4 v4, -0x1

    iput v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->end:I

    .line 163
    invoke-direct {p0}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->fillBuf()V

    .line 165
    iget v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->pos:I

    :goto_77
    iget v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->end:I

    if-eq v0, v4, :cond_63

    .line 166
    iget-object v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->buf:[B

    aget-byte v4, v4, v0

    if-ne v4, v9, :cond_9a

    .line 167
    iget v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->pos:I

    if-eq v0, v4, :cond_90

    .line 168
    iget-object v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->buf:[B

    iget v6, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->pos:I

    iget v7, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->pos:I

    sub-int v7, v0, v7

    invoke-virtual {v2, v4, v6, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 170
    :cond_90
    add-int/lit8 v4, v0, 0x1

    iput v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/StrictLineReader;->pos:I

    .line 171
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v3

    monitor-exit v5
    :try_end_99
    .catchall {:try_start_14 .. :try_end_99} :catchall_11

    goto :goto_51

    .line 165
    :cond_9a
    add-int/lit8 v0, v0, 0x1

    goto :goto_77
.end method
