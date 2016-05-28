.class public Lorg/apache/http/client/entity/DeflateInputStream;
.super Ljava/io/InputStream;
.source "DeflateInputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/client/entity/DeflateInputStream$DeflateStream;
    }
.end annotation


# instance fields
.field private sourceStream:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 12
    .param p1, "wrapped"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v8, -0x1

    .line 45
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 72
    const/4 v7, 0x6

    new-array v5, v7, [B

    .line 74
    .local v5, "peeked":[B
    new-instance v6, Ljava/io/PushbackInputStream;

    array-length v7, v5

    invoke-direct {v6, p1, v7}, Ljava/io/PushbackInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 76
    .local v6, "pushback":Ljava/io/PushbackInputStream;
    invoke-virtual {v6, v5}, Ljava/io/PushbackInputStream;->read([B)I

    move-result v2

    .line 78
    .local v2, "headerLength":I
    if-ne v2, v8, :cond_1c

    .line 79
    new-instance v7, Ljava/io/IOException;

    const-string v8, "Unable to read the response"

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 83
    :cond_1c
    new-array v0, v9, [B

    .line 85
    .local v0, "dummy":[B
    new-instance v3, Ljava/util/zip/Inflater;

    invoke-direct {v3}, Ljava/util/zip/Inflater;-><init>()V

    .line 89
    .local v3, "inf":Ljava/util/zip/Inflater;
    :cond_23
    :goto_23
    :try_start_23
    invoke-virtual {v3, v0}, Ljava/util/zip/Inflater;->inflate([B)I

    move-result v4

    .local v4, "n":I
    if-nez v4, :cond_53

    .line 90
    invoke-virtual {v3}, Ljava/util/zip/Inflater;->finished()Z

    move-result v7

    if-eqz v7, :cond_4d

    .line 93
    new-instance v7, Ljava/io/IOException;

    const-string v8, "Unable to read the response"

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_37
    .catch Ljava/util/zip/DataFormatException; {:try_start_23 .. :try_end_37} :catch_37
    .catchall {:try_start_23 .. :try_end_37} :catchall_5d

    .line 117
    .end local v4    # "n":I
    :catch_37
    move-exception v1

    .line 121
    .local v1, "e":Ljava/util/zip/DataFormatException;
    const/4 v7, 0x0

    :try_start_39
    invoke-virtual {v6, v5, v7, v2}, Ljava/io/PushbackInputStream;->unread([BII)V

    .line 122
    new-instance v7, Lorg/apache/http/client/entity/DeflateInputStream$DeflateStream;

    new-instance v8, Ljava/util/zip/Inflater;

    const/4 v9, 0x1

    invoke-direct {v8, v9}, Ljava/util/zip/Inflater;-><init>(Z)V

    invoke-direct {v7, v6, v8}, Lorg/apache/http/client/entity/DeflateInputStream$DeflateStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;)V

    iput-object v7, p0, Lorg/apache/http/client/entity/DeflateInputStream;->sourceStream:Ljava/io/InputStream;
    :try_end_49
    .catchall {:try_start_39 .. :try_end_49} :catchall_5d

    .line 124
    invoke-virtual {v3}, Ljava/util/zip/Inflater;->end()V

    .line 127
    .end local v1    # "e":Ljava/util/zip/DataFormatException;
    :goto_4c
    return-void

    .line 96
    .restart local v4    # "n":I
    :cond_4d
    :try_start_4d
    invoke-virtual {v3}, Ljava/util/zip/Inflater;->needsDictionary()Z

    move-result v7

    if-eqz v7, :cond_62

    .line 107
    :cond_53
    if-ne v4, v8, :cond_6c

    .line 108
    new-instance v7, Ljava/io/IOException;

    const-string v8, "Unable to read the response"

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_5d
    .catch Ljava/util/zip/DataFormatException; {:try_start_4d .. :try_end_5d} :catch_37
    .catchall {:try_start_4d .. :try_end_5d} :catchall_5d

    .line 124
    .end local v4    # "n":I
    :catchall_5d
    move-exception v7

    invoke-virtual {v3}, Ljava/util/zip/Inflater;->end()V

    throw v7

    .line 102
    .restart local v4    # "n":I
    :cond_62
    :try_start_62
    invoke-virtual {v3}, Ljava/util/zip/Inflater;->needsInput()Z

    move-result v7

    if-eqz v7, :cond_23

    .line 103
    invoke-virtual {v3, v5}, Ljava/util/zip/Inflater;->setInput([B)V

    goto :goto_23

    .line 115
    :cond_6c
    const/4 v7, 0x0

    invoke-virtual {v6, v5, v7, v2}, Ljava/io/PushbackInputStream;->unread([BII)V

    .line 116
    new-instance v7, Lorg/apache/http/client/entity/DeflateInputStream$DeflateStream;

    new-instance v8, Ljava/util/zip/Inflater;

    invoke-direct {v8}, Ljava/util/zip/Inflater;-><init>()V

    invoke-direct {v7, v6, v8}, Lorg/apache/http/client/entity/DeflateInputStream$DeflateStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;)V

    iput-object v7, p0, Lorg/apache/http/client/entity/DeflateInputStream;->sourceStream:Ljava/io/InputStream;
    :try_end_7c
    .catch Ljava/util/zip/DataFormatException; {:try_start_62 .. :try_end_7c} :catch_37
    .catchall {:try_start_62 .. :try_end_7c} :catchall_5d

    .line 124
    invoke-virtual {v3}, Ljava/util/zip/Inflater;->end()V

    goto :goto_4c
.end method


# virtual methods
.method public available()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    iget-object v0, p0, Lorg/apache/http/client/entity/DeflateInputStream;->sourceStream:Ljava/io/InputStream;

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
    .line 205
    iget-object v0, p0, Lorg/apache/http/client/entity/DeflateInputStream;->sourceStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 206
    return-void
.end method

.method public mark(I)V
    .registers 3
    .param p1, "readLimit"    # I

    .prologue
    .line 179
    iget-object v0, p0, Lorg/apache/http/client/entity/DeflateInputStream;->sourceStream:Ljava/io/InputStream;

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->mark(I)V

    .line 180
    return-void
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 196
    iget-object v0, p0, Lorg/apache/http/client/entity/DeflateInputStream;->sourceStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    return v0
.end method

.method public read()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lorg/apache/http/client/entity/DeflateInputStream;->sourceStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    return v0
.end method

.method public read([B)I
    .registers 3
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 144
    iget-object v0, p0, Lorg/apache/http/client/entity/DeflateInputStream;->sourceStream:Ljava/io/InputStream;

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .registers 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    iget-object v0, p0, Lorg/apache/http/client/entity/DeflateInputStream;->sourceStream:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public reset()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    iget-object v0, p0, Lorg/apache/http/client/entity/DeflateInputStream;->sourceStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V

    .line 189
    return-void
.end method

.method public skip(J)J
    .registers 6
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 162
    iget-object v0, p0, Lorg/apache/http/client/entity/DeflateInputStream;->sourceStream:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    return-wide v0
.end method
