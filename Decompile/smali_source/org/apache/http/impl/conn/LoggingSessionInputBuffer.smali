.class public Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;
.super Ljava/lang/Object;
.source "LoggingSessionInputBuffer.java"

# interfaces
.implements Lorg/apache/http/io/EofSensor;
.implements Lorg/apache/http/io/SessionInputBuffer;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final charset:Ljava/lang/String;

.field private final eofSensor:Lorg/apache/http/io/EofSensor;

.field private final in:Lorg/apache/http/io/SessionInputBuffer;

.field private final wire:Lorg/apache/http/impl/conn/Wire;


# direct methods
.method public constructor <init>(Lorg/apache/http/io/SessionInputBuffer;Lorg/apache/http/impl/conn/Wire;)V
    .registers 4
    .param p1, "in"    # Lorg/apache/http/io/SessionInputBuffer;
    .param p2, "wire"    # Lorg/apache/http/impl/conn/Wire;

    .prologue
    .line 75
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;-><init>(Lorg/apache/http/io/SessionInputBuffer;Lorg/apache/http/impl/conn/Wire;Ljava/lang/String;)V

    .line 76
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/io/SessionInputBuffer;Lorg/apache/http/impl/conn/Wire;Ljava/lang/String;)V
    .registers 5
    .param p1, "in"    # Lorg/apache/http/io/SessionInputBuffer;
    .param p2, "wire"    # Lorg/apache/http/impl/conn/Wire;
    .param p3, "charset"    # Ljava/lang/String;

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->in:Lorg/apache/http/io/SessionInputBuffer;

    .line 69
    instance-of v0, p1, Lorg/apache/http/io/EofSensor;

    if-eqz v0, :cond_14

    check-cast p1, Lorg/apache/http/io/EofSensor;

    .end local p1    # "in":Lorg/apache/http/io/SessionInputBuffer;
    :goto_b
    iput-object p1, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->eofSensor:Lorg/apache/http/io/EofSensor;

    .line 70
    iput-object p2, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    .line 71
    if-eqz p3, :cond_16

    .end local p3    # "charset":Ljava/lang/String;
    :goto_11
    iput-object p3, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->charset:Ljava/lang/String;

    .line 72
    return-void

    .line 69
    .restart local p1    # "in":Lorg/apache/http/io/SessionInputBuffer;
    .restart local p3    # "charset":Ljava/lang/String;
    :cond_14
    const/4 p1, 0x0

    goto :goto_b

    .line 71
    .end local p1    # "in":Lorg/apache/http/io/SessionInputBuffer;
    :cond_16
    sget-object v0, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object p3

    goto :goto_11
.end method


# virtual methods
.method public getMetrics()Lorg/apache/http/io/HttpTransportMetrics;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->in:Lorg/apache/http/io/SessionInputBuffer;

    invoke-interface {v0}, Lorg/apache/http/io/SessionInputBuffer;->getMetrics()Lorg/apache/http/io/HttpTransportMetrics;

    move-result-object v0

    return-object v0
.end method

.method public isDataAvailable(I)Z
    .registers 3
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->in:Lorg/apache/http/io/SessionInputBuffer;

    invoke-interface {v0, p1}, Lorg/apache/http/io/SessionInputBuffer;->isDataAvailable(I)Z

    move-result v0

    return v0
.end method

.method public isEof()Z
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->eofSensor:Lorg/apache/http/io/EofSensor;

    if-eqz v0, :cond_b

    .line 132
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->eofSensor:Lorg/apache/http/io/EofSensor;

    invoke-interface {v0}, Lorg/apache/http/io/EofSensor;->isEof()Z

    move-result v0

    .line 134
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public read()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->in:Lorg/apache/http/io/SessionInputBuffer;

    invoke-interface {v1}, Lorg/apache/http/io/SessionInputBuffer;->read()I

    move-result v0

    .line 92
    .local v0, "l":I
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v1}, Lorg/apache/http/impl/conn/Wire;->enabled()Z

    move-result v1

    if-eqz v1, :cond_16

    const/4 v1, -0x1

    if-eq v0, v1, :cond_16

    .line 93
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v1, v0}, Lorg/apache/http/impl/conn/Wire;->input(I)V

    .line 95
    :cond_16
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
    .line 99
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->in:Lorg/apache/http/io/SessionInputBuffer;

    invoke-interface {v1, p1}, Lorg/apache/http/io/SessionInputBuffer;->read([B)I

    move-result v0

    .line 100
    .local v0, "l":I
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v1}, Lorg/apache/http/impl/conn/Wire;->enabled()Z

    move-result v1

    if-eqz v1, :cond_16

    if-lez v0, :cond_16

    .line 101
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2, v0}, Lorg/apache/http/impl/conn/Wire;->input([BII)V

    .line 103
    :cond_16
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
    .line 83
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->in:Lorg/apache/http/io/SessionInputBuffer;

    invoke-interface {v1, p1, p2, p3}, Lorg/apache/http/io/SessionInputBuffer;->read([BII)I

    move-result v0

    .line 84
    .local v0, "l":I
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v1}, Lorg/apache/http/impl/conn/Wire;->enabled()Z

    move-result v1

    if-eqz v1, :cond_15

    if-lez v0, :cond_15

    .line 85
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v1, p1, p2, v0}, Lorg/apache/http/impl/conn/Wire;->input([BII)V

    .line 87
    :cond_15
    return v0
.end method

.method public readLine(Lorg/apache/http/util/CharArrayBuffer;)I
    .registers 8
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    iget-object v4, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->in:Lorg/apache/http/io/SessionInputBuffer;

    invoke-interface {v4, p1}, Lorg/apache/http/io/SessionInputBuffer;->readLine(Lorg/apache/http/util/CharArrayBuffer;)I

    move-result v0

    .line 117
    .local v0, "l":I
    iget-object v4, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v4}, Lorg/apache/http/impl/conn/Wire;->enabled()Z

    move-result v4

    if-eqz v4, :cond_3d

    if-ltz v0, :cond_3d

    .line 118
    invoke-virtual {p1}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v4

    sub-int v1, v4, v0

    .line 119
    .local v1, "pos":I
    new-instance v2, Ljava/lang/String;

    invoke-virtual {p1}, Lorg/apache/http/util/CharArrayBuffer;->buffer()[C

    move-result-object v4

    invoke-direct {v2, v4, v1, v0}, Ljava/lang/String;-><init>([CII)V

    .line 120
    .local v2, "s":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\r\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 121
    .local v3, "tmp":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    iget-object v5, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->charset:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/http/impl/conn/Wire;->input([B)V

    .line 123
    .end local v1    # "pos":I
    .end local v2    # "s":Ljava/lang/String;
    .end local v3    # "tmp":Ljava/lang/String;
    :cond_3d
    return v0
.end method

.method public readLine()Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    iget-object v2, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->in:Lorg/apache/http/io/SessionInputBuffer;

    invoke-interface {v2}, Lorg/apache/http/io/SessionInputBuffer;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 108
    .local v0, "s":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v2}, Lorg/apache/http/impl/conn/Wire;->enabled()Z

    move-result v2

    if-eqz v2, :cond_2e

    if-eqz v0, :cond_2e

    .line 109
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\r\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 110
    .local v1, "tmp":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    iget-object v3, p0, Lorg/apache/http/impl/conn/LoggingSessionInputBuffer;->charset:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/http/impl/conn/Wire;->input([B)V

    .line 112
    .end local v1    # "tmp":Ljava/lang/String;
    :cond_2e
    return-object v0
.end method
