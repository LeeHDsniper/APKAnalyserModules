.class Lorg/apache/http/impl/conn/LoggingOutputStream;
.super Ljava/io/OutputStream;
.source "LoggingOutputStream.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final out:Ljava/io/OutputStream;

.field private final wire:Lorg/apache/http/impl/conn/Wire;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Lorg/apache/http/impl/conn/Wire;)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "wire"    # Lorg/apache/http/impl/conn/Wire;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 48
    iput-object p1, p0, Lorg/apache/http/impl/conn/LoggingOutputStream;->out:Ljava/io/OutputStream;

    .line 49
    iput-object p2, p0, Lorg/apache/http/impl/conn/LoggingOutputStream;->wire:Lorg/apache/http/impl/conn/Wire;

    .line 50
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
    .line 76
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 77
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 72
    return-void
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
    .line 54
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingOutputStream;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/Wire;->output(I)V

    .line 55
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
    .line 59
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingOutputStream;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/Wire;->output([B)V

    .line 60
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 61
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
    .line 65
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingOutputStream;->wire:Lorg/apache/http/impl/conn/Wire;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/http/impl/conn/Wire;->output([BII)V

    .line 66
    iget-object v0, p0, Lorg/apache/http/impl/conn/LoggingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 67
    return-void
.end method
