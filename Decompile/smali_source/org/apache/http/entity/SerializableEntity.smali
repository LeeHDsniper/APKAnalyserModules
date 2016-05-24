.class public Lorg/apache/http/entity/SerializableEntity;
.super Lorg/apache/http/entity/AbstractHttpEntity;
.source "SerializableEntity.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private objRef:Ljava/io/Serializable;

.field private objSer:[B


# direct methods
.method public constructor <init>(Ljava/io/Serializable;)V
    .registers 3
    .param p1, "ser"    # Ljava/io/Serializable;

    .prologue
    .line 78
    invoke-direct {p0}, Lorg/apache/http/entity/AbstractHttpEntity;-><init>()V

    .line 79
    const-string v0, "Source object"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 80
    iput-object p1, p0, Lorg/apache/http/entity/SerializableEntity;->objRef:Ljava/io/Serializable;

    .line 81
    return-void
.end method

.method public constructor <init>(Ljava/io/Serializable;Z)V
    .registers 4
    .param p1, "ser"    # Ljava/io/Serializable;
    .param p2, "bufferize"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    invoke-direct {p0}, Lorg/apache/http/entity/AbstractHttpEntity;-><init>()V

    .line 66
    const-string v0, "Source object"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 67
    if-eqz p2, :cond_e

    .line 68
    invoke-direct {p0, p1}, Lorg/apache/http/entity/SerializableEntity;->createBytes(Ljava/io/Serializable;)V

    .line 72
    :goto_d
    return-void

    .line 70
    :cond_e
    iput-object p1, p0, Lorg/apache/http/entity/SerializableEntity;->objRef:Ljava/io/Serializable;

    goto :goto_d
.end method

.method private createBytes(Ljava/io/Serializable;)V
    .registers 5
    .param p1, "ser"    # Ljava/io/Serializable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 85
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Ljava/io/ObjectOutputStream;

    invoke-direct {v1, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 86
    .local v1, "out":Ljava/io/ObjectOutputStream;
    invoke-virtual {v1, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 87
    invoke-virtual {v1}, Ljava/io/ObjectOutputStream;->flush()V

    .line 88
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    iput-object v2, p0, Lorg/apache/http/entity/SerializableEntity;->objSer:[B

    .line 89
    return-void
.end method


# virtual methods
.method public getContent()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 92
    iget-object v0, p0, Lorg/apache/http/entity/SerializableEntity;->objSer:[B

    if-nez v0, :cond_9

    .line 93
    iget-object v0, p0, Lorg/apache/http/entity/SerializableEntity;->objRef:Ljava/io/Serializable;

    invoke-direct {p0, v0}, Lorg/apache/http/entity/SerializableEntity;->createBytes(Ljava/io/Serializable;)V

    .line 95
    :cond_9
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lorg/apache/http/entity/SerializableEntity;->objSer:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method public getContentLength()J
    .registers 3

    .prologue
    .line 99
    iget-object v0, p0, Lorg/apache/http/entity/SerializableEntity;->objSer:[B

    if-nez v0, :cond_7

    .line 100
    const-wide/16 v0, -0x1

    .line 102
    :goto_6
    return-wide v0

    :cond_7
    iget-object v0, p0, Lorg/apache/http/entity/SerializableEntity;->objSer:[B

    array-length v0, v0

    int-to-long v0, v0

    goto :goto_6
.end method

.method public isRepeatable()Z
    .registers 2

    .prologue
    .line 107
    const/4 v0, 0x1

    return v0
.end method

.method public isStreaming()Z
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lorg/apache/http/entity/SerializableEntity;->objSer:[B

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "outstream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    const-string v1, "Output stream"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 116
    iget-object v1, p0, Lorg/apache/http/entity/SerializableEntity;->objSer:[B

    if-nez v1, :cond_17

    .line 117
    new-instance v0, Ljava/io/ObjectOutputStream;

    invoke-direct {v0, p1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 118
    .local v0, "out":Ljava/io/ObjectOutputStream;
    iget-object v1, p0, Lorg/apache/http/entity/SerializableEntity;->objRef:Ljava/io/Serializable;

    invoke-virtual {v0, v1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 119
    invoke-virtual {v0}, Ljava/io/ObjectOutputStream;->flush()V

    .line 124
    .end local v0    # "out":Ljava/io/ObjectOutputStream;
    :goto_16
    return-void

    .line 121
    :cond_17
    iget-object v1, p0, Lorg/apache/http/entity/SerializableEntity;->objSer:[B

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write([B)V

    .line 122
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    goto :goto_16
.end method
