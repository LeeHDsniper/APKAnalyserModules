.class public Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;
.super Ljava/lang/Object;
.source "LoggingSessionOutputBuffer.java"

# interfaces
.implements Lorg/apache/http/io/SessionOutputBuffer;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final charset:Ljava/lang/String;

.field private final out:Lorg/apache/http/io/SessionOutputBuffer;

.field private final wire:Lorg/apache/http/impl/conn/Wire;


# direct methods
.method public constructor <init>(Lorg/apache/http/io/SessionOutputBuffer;Lorg/apache/http/impl/conn/Wire;)V
    .registers 4
    .param p1, "out"    # Lorg/apache/http/io/SessionOutputBuffer;
    .param p2, "wire"    # Lorg/apache/http/impl/conn/Wire;

    .prologue
    .line 69
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;-><init>(Lorg/apache/http/io/SessionOutputBuffer;Lorg/apache/http/impl/conn/Wire;Ljava/lang/String;)V

    .line 70
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/io/SessionOutputBuffer;Lorg/apache/http/impl/conn/Wire;Ljava/lang/String;)V
    .registers 5
    .param p1, "out"    # Lorg/apache/http/io/SessionOutputBuffer;
    .param p2, "wire"    # Lorg/apache/http/impl/conn/Wire;
    .param p3, "charset"    # Ljava/lang/String;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->out:Lorg/apache/http/io/SessionOutputBuffer;

    .line 64
    iput-object p2, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    .line 65
    if-eqz p3, :cond_c

    .end local p3    # "charset":Ljava/lang/String;
    :goto_9
    iput-object p3, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->charset:Ljava/lang/String;

    .line 66
    return-void

    .line 65
    .restart local p3    # "charset":Ljava/lang/String;
    :cond_c
    sget-object v0, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object p3

    goto :goto_9
.end method


# virtual methods
.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v0}, Lorg/apache/http/io/SessionOutputBuffer;->flush()V

    .line 95
    return-void
.end method

.method public getMetrics()Lorg/apache/http/io/HttpTransportMetrics;
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v0}, Lorg/apache/http/io/SessionOutputBuffer;->getMetrics()Lorg/apache/http/io/HttpTransportMetrics;

    move-result-object v0

    return-object v0
.end method

.method public write(I)V
    .registers 3
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 80
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v0, p1}, Lorg/apache/http/io/SessionOutputBuffer;->write(I)V

    .line 81
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/Wire;->enabled()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 82
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/Wire;->output(I)V

    .line 84
    :cond_12
    return-void
.end method

.method public write([B)V
    .registers 3
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v0, p1}, Lorg/apache/http/io/SessionOutputBuffer;->write([B)V

    .line 88
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/Wire;->enabled()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 89
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/Wire;->output([B)V

    .line 91
    :cond_12
    return-void
.end method

.method public write([BII)V
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
    .line 73
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v0, p1, p2, p3}, Lorg/apache/http/io/SessionOutputBuffer;->write([BII)V

    .line 74
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/Wire;->enabled()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 75
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/http/impl/conn/Wire;->output([BII)V

    .line 77
    :cond_12
    return-void
.end method

.method public writeLine(Ljava/lang/String;)V
    .registers 5
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v1, p1}, Lorg/apache/http/io/SessionOutputBuffer;->writeLine(Ljava/lang/String;)V

    .line 108
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v1}, Lorg/apache/http/impl/conn/Wire;->enabled()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 109
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 110
    .local v0, "tmp":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    iget-object v2, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->charset:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/http/impl/conn/Wire;->output([B)V

    .line 112
    .end local v0    # "tmp":Ljava/lang/String;
    :cond_2b
    return-void
.end method

.method public writeLine(Lorg/apache/http/util/CharArrayBuffer;)V
    .registers 7
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    iget-object v2, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v2, p1}, Lorg/apache/http/io/SessionOutputBuffer;->writeLine(Lorg/apache/http/util/CharArrayBuffer;)V

    .line 99
    iget-object v2, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v2}, Lorg/apache/http/impl/conn/Wire;->enabled()Z

    move-result v2

    if-eqz v2, :cond_39

    .line 100
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p1}, Lorg/apache/http/util/CharArrayBuffer;->buffer()[C

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v4

    invoke-direct {v0, v2, v3, v4}, Ljava/lang/String;-><init>([CII)V

    .line 101
    .local v0, "s":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\r\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 102
    .local v1, "tmp":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->wire:Lorg/apache/http/impl/conn/Wire;

    iget-object v3, p0, Lorg/apache/http/impl/conn/LoggingSessionOutputBuffer;->charset:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/http/impl/conn/Wire;->output([B)V

    .line 104
    .end local v0    # "s":Ljava/lang/String;
    .end local v1    # "tmp":Ljava/lang/String;
    :cond_39
    return-void
.end method
