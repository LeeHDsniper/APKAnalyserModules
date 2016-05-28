.class public Lorg/apache/http/entity/mime/content/FileBody;
.super Lorg/apache/http/entity/mime/content/AbstractContentBody;
.source "FileBody.java"


# instance fields
.field private final file:Ljava/io/File;

.field private final filename:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 89
    sget-object v1, Lorg/apache/http/entity/ContentType;->DEFAULT_BINARY:Lorg/apache/http/entity/ContentType;

    if-eqz p1, :cond_c

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_8
    invoke-direct {p0, p1, v1, v0}, Lorg/apache/http/entity/mime/content/FileBody;-><init>(Ljava/io/File;Lorg/apache/http/entity/ContentType;Ljava/lang/String;)V

    .line 90
    return-void

    .line 89
    :cond_c
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .param p2, "mimeType"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 85
    invoke-static {p2}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/http/entity/mime/content/FileBody;-><init>(Ljava/io/File;Lorg/apache/http/entity/ContentType;Ljava/lang/String;)V

    .line 86
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "charset"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 76
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lorg/apache/http/entity/mime/content/FileBody;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "file"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "mimeType"    # Ljava/lang/String;
    .param p4, "charset"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 63
    invoke-static {p3, p4}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/http/entity/mime/content/FileBody;-><init>(Ljava/io/File;Lorg/apache/http/entity/ContentType;Ljava/lang/String;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lorg/apache/http/entity/ContentType;)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .param p2, "contentType"    # Lorg/apache/http/entity/ContentType;

    .prologue
    .line 106
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/http/entity/mime/content/FileBody;-><init>(Ljava/io/File;Lorg/apache/http/entity/ContentType;Ljava/lang/String;)V

    .line 107
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lorg/apache/http/entity/ContentType;Ljava/lang/String;)V
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .param p2, "contentType"    # Lorg/apache/http/entity/ContentType;
    .param p3, "filename"    # Ljava/lang/String;

    .prologue
    .line 96
    invoke-direct {p0, p2}, Lorg/apache/http/entity/mime/content/AbstractContentBody;-><init>(Lorg/apache/http/entity/ContentType;)V

    .line 97
    const-string v0, "File"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 98
    iput-object p1, p0, Lorg/apache/http/entity/mime/content/FileBody;->file:Ljava/io/File;

    .line 99
    iput-object p3, p0, Lorg/apache/http/entity/mime/content/FileBody;->filename:Ljava/lang/String;

    .line 100
    return-void
.end method


# virtual methods
.method public getContentLength()J
    .registers 3

    .prologue
    .line 133
    iget-object v0, p0, Lorg/apache/http/entity/mime/content/FileBody;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public getFile()Ljava/io/File;
    .registers 2

    .prologue
    .line 141
    iget-object v0, p0, Lorg/apache/http/entity/mime/content/FileBody;->file:Ljava/io/File;

    return-object v0
.end method

.method public getFilename()Ljava/lang/String;
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Lorg/apache/http/entity/mime/content/FileBody;->filename:Ljava/lang/String;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lorg/apache/http/entity/mime/content/FileBody;->file:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public getTransferEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 129
    const-string v0, "binary"

    return-object v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 6
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    const-string v3, "Output stream"

    invoke-static {p1, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 115
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v3, p0, Lorg/apache/http/entity/mime/content/FileBody;->file:Ljava/io/File;

    invoke-direct {v0, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 117
    .local v0, "in":Ljava/io/InputStream;
    const/16 v3, 0x1000

    :try_start_e
    new-array v2, v3, [B

    .line 119
    .local v2, "tmp":[B
    :goto_10
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "l":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_21

    .line 120
    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3, v1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1b
    .catchall {:try_start_e .. :try_end_1b} :catchall_1c

    goto :goto_10

    .line 124
    .end local v1    # "l":I
    .end local v2    # "tmp":[B
    :catchall_1c
    move-exception v3

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v3

    .line 122
    .restart local v1    # "l":I
    .restart local v2    # "tmp":[B
    :cond_21
    :try_start_21
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V
    :try_end_24
    .catchall {:try_start_21 .. :try_end_24} :catchall_1c

    .line 124
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 126
    return-void
.end method
