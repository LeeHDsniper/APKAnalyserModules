.class final Lit/sephiroth/android/library/picasso/MarkableInputStream;
.super Ljava/io/InputStream;
.source "MarkableInputStream.java"


# instance fields
.field private allowExpire:Z

.field private defaultMark:J

.field private final in:Ljava/io/InputStream;

.field private limit:J

.field private limitIncrement:I

.field private offset:J

.field private reset:J


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 44
    const/16 v0, 0x1000

    invoke-direct {p0, p1, v0}, Lit/sephiroth/android/library/picasso/MarkableInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 45
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "size"    # I

    .prologue
    .line 48
    const/16 v0, 0x400

    invoke-direct {p0, p1, p2, v0}, Lit/sephiroth/android/library/picasso/MarkableInputStream;-><init>(Ljava/io/InputStream;II)V

    .line 49
    return-void
.end method

.method private constructor <init>(Ljava/io/InputStream;II)V
    .registers 8
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "size"    # I
    .param p3, "limitIncrement"    # I

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 39
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->defaultMark:J

    .line 40
    const/4 v1, 0x1

    iput-boolean v1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->allowExpire:Z

    .line 41
    const/4 v1, -0x1

    iput v1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->limitIncrement:I

    .line 52
    invoke-virtual {p1}, Ljava/io/InputStream;->markSupported()Z

    move-result v1

    if-nez v1, :cond_19

    .line 53
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, p1, p2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .end local p1    # "in":Ljava/io/InputStream;
    .local v0, "in":Ljava/io/InputStream;
    move-object p1, v0

    .line 55
    .end local v0    # "in":Ljava/io/InputStream;
    .restart local p1    # "in":Ljava/io/InputStream;
    :cond_19
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    .line 56
    iput p3, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->limitIncrement:I

    .line 57
    return-void
.end method

.method private setLimit(J)V
    .registers 10
    .param p1, "limit"    # J

    .prologue
    .line 92
    :try_start_0
    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->reset:J

    iget-wide v4, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    cmp-long v1, v2, v4

    if-gez v1, :cond_29

    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    iget-wide v4, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->limit:J

    cmp-long v1, v2, v4

    if-gtz v1, :cond_29

    .line 93
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->reset()V

    .line 94
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->reset:J

    sub-long v2, p1, v2

    long-to-int v2, v2

    invoke-virtual {v1, v2}, Ljava/io/InputStream;->mark(I)V

    .line 95
    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->reset:J

    iget-wide v4, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    invoke-direct {p0, v2, v3, v4, v5}, Lit/sephiroth/android/library/picasso/MarkableInputStream;->skip(JJ)V

    .line 100
    :goto_26
    iput-wide p1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->limit:J

    .line 104
    return-void

    .line 97
    :cond_29
    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    iput-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->reset:J

    .line 98
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    sub-long v2, p1, v2

    long-to-int v2, v2

    invoke-virtual {v1, v2}, Ljava/io/InputStream;->mark(I)V
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_37} :catch_38

    goto :goto_26

    .line 101
    :catch_38
    move-exception v0

    .line 102
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to mark: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private skip(JJ)V
    .registers 12
    .param p1, "current"    # J
    .param p3, "target"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    :goto_0
    cmp-long v2, p1, p3

    if-gez v2, :cond_19

    .line 125
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    sub-long v4, p3, p1

    invoke-virtual {v2, v4, v5}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 126
    .local v0, "skipped":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1c

    .line 127
    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/MarkableInputStream;->read()I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1a

    .line 135
    .end local v0    # "skipped":J
    :cond_19
    return-void

    .line 130
    .restart local v0    # "skipped":J
    :cond_1a
    const-wide/16 v0, 0x1

    .line 133
    :cond_1c
    add-long/2addr p1, v0

    .line 134
    goto :goto_0
.end method


# virtual methods
.method public allowMarksToExpire(Z)V
    .registers 2
    .param p1, "allowExpire"    # Z

    .prologue
    .line 79
    iput-boolean p1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->allowExpire:Z

    .line 80
    return-void
.end method

.method public available()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 180
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    return v0
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 184
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 185
    return-void
.end method

.method public mark(I)V
    .registers 4
    .param p1, "readLimit"    # I

    .prologue
    .line 61
    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/picasso/MarkableInputStream;->savePosition(I)J

    move-result-wide v0

    iput-wide v0, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->defaultMark:J

    .line 62
    return-void
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 188
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    return v0
.end method

.method public read()I
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x1

    .line 138
    iget-boolean v1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->allowExpire:Z

    if-nez v1, :cond_18

    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    add-long/2addr v2, v6

    iget-wide v4, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->limit:J

    cmp-long v1, v2, v4

    if-lez v1, :cond_18

    .line 139
    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->limit:J

    iget v1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->limitIncrement:I

    int-to-long v4, v1

    add-long/2addr v2, v4

    invoke-direct {p0, v2, v3}, Lit/sephiroth/android/library/picasso/MarkableInputStream;->setLimit(J)V

    .line 141
    :cond_18
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 142
    .local v0, "result":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_26

    .line 143
    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    add-long/2addr v2, v6

    iput-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    .line 145
    :cond_26
    return v0
.end method

.method public read([B)I
    .registers 8
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    iget-boolean v1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->allowExpire:Z

    if-nez v1, :cond_1b

    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    array-length v1, p1

    int-to-long v4, v1

    add-long/2addr v2, v4

    iget-wide v4, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->limit:J

    cmp-long v1, v2, v4

    if-lez v1, :cond_1b

    .line 150
    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    array-length v1, p1

    int-to-long v4, v1

    add-long/2addr v2, v4

    iget v1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->limitIncrement:I

    int-to-long v4, v1

    add-long/2addr v2, v4

    invoke-direct {p0, v2, v3}, Lit/sephiroth/android/library/picasso/MarkableInputStream;->setLimit(J)V

    .line 152
    :cond_1b
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    .line 153
    .local v0, "count":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_2a

    .line 154
    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    int-to-long v4, v0

    add-long/2addr v2, v4

    iput-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    .line 156
    :cond_2a
    return v0
.end method

.method public read([BII)I
    .registers 10
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 160
    iget-boolean v1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->allowExpire:Z

    if-nez v1, :cond_19

    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    int-to-long v4, p3

    add-long/2addr v2, v4

    iget-wide v4, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->limit:J

    cmp-long v1, v2, v4

    if-lez v1, :cond_19

    .line 161
    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    int-to-long v4, p3

    add-long/2addr v2, v4

    iget v1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->limitIncrement:I

    int-to-long v4, v1

    add-long/2addr v2, v4

    invoke-direct {p0, v2, v3}, Lit/sephiroth/android/library/picasso/MarkableInputStream;->setLimit(J)V

    .line 163
    :cond_19
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 164
    .local v0, "count":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_28

    .line 165
    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    int-to-long v4, v0

    add-long/2addr v2, v4

    iput-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    .line 167
    :cond_28
    return v0
.end method

.method public reset()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    iget-wide v0, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->defaultMark:J

    invoke-virtual {p0, v0, v1}, Lit/sephiroth/android/library/picasso/MarkableInputStream;->reset(J)V

    .line 109
    return-void
.end method

.method public reset(J)V
    .registers 8
    .param p1, "token"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    iget-wide v0, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->limit:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_e

    iget-wide v0, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->reset:J

    cmp-long v0, p1, v0

    if-gez v0, :cond_16

    .line 115
    :cond_e
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot reset"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 117
    :cond_16
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V

    .line 118
    iget-wide v0, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->reset:J

    invoke-direct {p0, v0, v1, p1, p2}, Lit/sephiroth/android/library/picasso/MarkableInputStream;->skip(JJ)V

    .line 119
    iput-wide p1, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    .line 120
    return-void
.end method

.method public savePosition(I)J
    .registers 8
    .param p1, "readLimit"    # I

    .prologue
    .line 71
    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    int-to-long v4, p1

    add-long v0, v2, v4

    .line 72
    .local v0, "offsetLimit":J
    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->limit:J

    cmp-long v2, v2, v0

    if-gez v2, :cond_e

    .line 73
    invoke-direct {p0, v0, v1}, Lit/sephiroth/android/library/picasso/MarkableInputStream;->setLimit(J)V

    .line 75
    :cond_e
    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    return-wide v2
.end method

.method public skip(J)J
    .registers 10
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    iget-boolean v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->allowExpire:Z

    if-nez v2, :cond_17

    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    add-long/2addr v2, p1

    iget-wide v4, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->limit:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_17

    .line 172
    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    add-long/2addr v2, p1

    iget v4, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->limitIncrement:I

    int-to-long v4, v4

    add-long/2addr v2, v4

    invoke-direct {p0, v2, v3}, Lit/sephiroth/android/library/picasso/MarkableInputStream;->setLimit(J)V

    .line 174
    :cond_17
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 175
    .local v0, "skipped":J
    iget-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    add-long/2addr v2, v0

    iput-wide v2, p0, Lit/sephiroth/android/library/picasso/MarkableInputStream;->offset:J

    .line 176
    return-wide v0
.end method
