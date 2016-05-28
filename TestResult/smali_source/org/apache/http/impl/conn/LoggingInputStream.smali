.class Lorg/apache/http/impl/conn/LoggingInputStream;
.super Ljava/io/InputStream;
.source "LoggingInputStream.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final in:Ljava/io/InputStream;

.field private final wire:Lorg/apache/http/impl/conn/Wire;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lorg/apache/http/impl/conn/Wire;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "wire"    # Lorg/apache/http/impl/conn/Wire;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 48
    iput-object p1, p0, Lorg/apache/http/impl/conn/LoggingInputStream;->in:Ljava/io/InputStream;

    .line 49
    iput-object p2, p0, Lorg/apache/http/impl/conn/LoggingInputStream;->wire:Lorg/apache/http/impl/conn/Wire;

    .line 50
    return-void
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
    .line 86
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingInputStream;->in:Ljava/io/InputStream;

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
    .line 106
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 107
    return-void
.end method

.method public declared-synchronized mark(I)V
    .registers 3
    .param p1, "readlimit"    # I

    .prologue
    .line 91
    monitor-enter p0

    :try_start_1
    invoke-super {p0, p1}, Ljava/io/InputStream;->mark(I)V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_6

    .line 92
    monitor-exit p0

    return-void

    .line 91
    :catchall_6
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 101
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 55
    .local v0, "b":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_e

    .line 56
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingInputStream;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v1, v0}, Lorg/apache/http/impl/conn/Wire;->input(I)V

    .line 58
    :cond_e
    return v0
.end method

.method public read([B)I
    .registers 5
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    .line 64
    .local v0, "bytesRead":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_f

    .line 65
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingInputStream;->wire:Lorg/apache/http/impl/conn/Wire;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2, v0}, Lorg/apache/http/impl/conn/Wire;->input([BII)V

    .line 67
    :cond_f
    return v0
.end method

.method public read([BII)I
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 73
    .local v0, "bytesRead":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_e

    .line 74
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingInputStream;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v1, p1, p2, v0}, Lorg/apache/http/impl/conn/Wire;->input([BII)V

    .line 76
    :cond_e
    return v0
.end method

.method public declared-synchronized reset()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    monitor-enter p0

    :try_start_1
    invoke-super {p0}, Ljava/io/InputStream;->reset()V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_6

    .line 97
    monitor-exit p0

    return-void

    .line 96
    :catchall_6
    move-exception v0

    monitor-exit p0

    throw v0
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
    .line 81
    invoke-super {p0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    return-wide v0
.end method
