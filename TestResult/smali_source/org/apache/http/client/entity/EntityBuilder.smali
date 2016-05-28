.class public Lorg/apache/http/client/entity/EntityBuilder;
.super Ljava/lang/Object;
.source "EntityBuilder.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private binary:[B

.field private chunked:Z

.field private contentEncoding:Ljava/lang/String;

.field private contentType:Lorg/apache/http/entity/ContentType;

.field private file:Ljava/io/File;

.field private gzipCompress:Z

.field private parameters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation
.end field

.field private serializable:Ljava/io/Serializable;

.field private stream:Ljava/io/InputStream;

.field private text:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    return-void
.end method

.method private clearContent()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 88
    iput-object v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->text:Ljava/lang/String;

    .line 89
    iput-object v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->binary:[B

    .line 90
    iput-object v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->stream:Ljava/io/InputStream;

    .line 91
    iput-object v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->parameters:Ljava/util/List;

    .line 92
    iput-object v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->serializable:Ljava/io/Serializable;

    .line 93
    iput-object v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->file:Ljava/io/File;

    .line 94
    return-void
.end method

.method public static create()Lorg/apache/http/client/entity/EntityBuilder;
    .registers 1

    .prologue
    .line 84
    new-instance v0, Lorg/apache/http/client/entity/EntityBuilder;

    invoke-direct {v0}, Lorg/apache/http/client/entity/EntityBuilder;-><init>()V

    return-object v0
.end method

.method private getContentOrDefault(Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/ContentType;
    .registers 3
    .param p1, "def"    # Lorg/apache/http/entity/ContentType;

    .prologue
    .line 306
    iget-object v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->contentType:Lorg/apache/http/entity/ContentType;

    if-eqz v0, :cond_6

    iget-object p1, p0, Lorg/apache/http/client/entity/EntityBuilder;->contentType:Lorg/apache/http/entity/ContentType;

    .end local p1    # "def":Lorg/apache/http/entity/ContentType;
    :cond_6
    return-object p1
.end method


# virtual methods
.method public build()Lorg/apache/http/HttpEntity;
    .registers 6

    .prologue
    .line 314
    iget-object v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->text:Ljava/lang/String;

    if-eqz v1, :cond_39

    .line 315
    new-instance v0, Lorg/apache/http/entity/StringEntity;

    iget-object v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->text:Ljava/lang/String;

    sget-object v2, Lorg/apache/http/entity/ContentType;->DEFAULT_TEXT:Lorg/apache/http/entity/ContentType;

    invoke-direct {p0, v2}, Lorg/apache/http/client/entity/EntityBuilder;->getContentOrDefault(Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/ContentType;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Lorg/apache/http/entity/ContentType;)V

    .line 331
    .local v0, "e":Lorg/apache/http/entity/AbstractHttpEntity;
    :goto_11
    invoke-virtual {v0}, Lorg/apache/http/entity/AbstractHttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v1

    if-eqz v1, :cond_24

    iget-object v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->contentType:Lorg/apache/http/entity/ContentType;

    if-eqz v1, :cond_24

    .line 332
    iget-object v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->contentType:Lorg/apache/http/entity/ContentType;

    invoke-virtual {v1}, Lorg/apache/http/entity/ContentType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/entity/AbstractHttpEntity;->setContentType(Ljava/lang/String;)V

    .line 334
    :cond_24
    iget-object v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->contentEncoding:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/http/entity/AbstractHttpEntity;->setContentEncoding(Ljava/lang/String;)V

    .line 335
    iget-boolean v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->chunked:Z

    invoke-virtual {v0, v1}, Lorg/apache/http/entity/AbstractHttpEntity;->setChunked(Z)V

    .line 336
    iget-boolean v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->gzipCompress:Z

    if-eqz v1, :cond_38

    .line 337
    new-instance v1, Lorg/apache/http/client/entity/GzipCompressingEntity;

    invoke-direct {v1, v0}, Lorg/apache/http/client/entity/GzipCompressingEntity;-><init>(Lorg/apache/http/HttpEntity;)V

    move-object v0, v1

    .line 339
    .end local v0    # "e":Lorg/apache/http/entity/AbstractHttpEntity;
    :cond_38
    return-object v0

    .line 316
    :cond_39
    iget-object v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->binary:[B

    if-eqz v1, :cond_4b

    .line 317
    new-instance v0, Lorg/apache/http/entity/ByteArrayEntity;

    iget-object v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->binary:[B

    sget-object v2, Lorg/apache/http/entity/ContentType;->DEFAULT_BINARY:Lorg/apache/http/entity/ContentType;

    invoke-direct {p0, v2}, Lorg/apache/http/client/entity/EntityBuilder;->getContentOrDefault(Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/ContentType;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([BLorg/apache/http/entity/ContentType;)V

    .restart local v0    # "e":Lorg/apache/http/entity/AbstractHttpEntity;
    goto :goto_11

    .line 318
    .end local v0    # "e":Lorg/apache/http/entity/AbstractHttpEntity;
    :cond_4b
    iget-object v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->stream:Ljava/io/InputStream;

    if-eqz v1, :cond_5f

    .line 319
    new-instance v0, Lorg/apache/http/entity/InputStreamEntity;

    iget-object v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->stream:Ljava/io/InputStream;

    const-wide/16 v2, 0x1

    sget-object v4, Lorg/apache/http/entity/ContentType;->DEFAULT_BINARY:Lorg/apache/http/entity/ContentType;

    invoke-direct {p0, v4}, Lorg/apache/http/client/entity/EntityBuilder;->getContentOrDefault(Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/ContentType;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/apache/http/entity/InputStreamEntity;-><init>(Ljava/io/InputStream;JLorg/apache/http/entity/ContentType;)V

    .restart local v0    # "e":Lorg/apache/http/entity/AbstractHttpEntity;
    goto :goto_11

    .line 320
    .end local v0    # "e":Lorg/apache/http/entity/AbstractHttpEntity;
    :cond_5f
    iget-object v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->parameters:Ljava/util/List;

    if-eqz v1, :cond_77

    .line 321
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    iget-object v2, p0, Lorg/apache/http/client/entity/EntityBuilder;->parameters:Ljava/util/List;

    iget-object v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->contentType:Lorg/apache/http/entity/ContentType;

    if-eqz v1, :cond_75

    iget-object v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->contentType:Lorg/apache/http/entity/ContentType;

    invoke-virtual {v1}, Lorg/apache/http/entity/ContentType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    :goto_71
    invoke-direct {v0, v2, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/lang/Iterable;Ljava/nio/charset/Charset;)V

    .restart local v0    # "e":Lorg/apache/http/entity/AbstractHttpEntity;
    goto :goto_11

    .end local v0    # "e":Lorg/apache/http/entity/AbstractHttpEntity;
    :cond_75
    const/4 v1, 0x0

    goto :goto_71

    .line 323
    :cond_77
    iget-object v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->serializable:Ljava/io/Serializable;

    if-eqz v1, :cond_8c

    .line 324
    new-instance v0, Lorg/apache/http/entity/SerializableEntity;

    iget-object v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->serializable:Ljava/io/Serializable;

    invoke-direct {v0, v1}, Lorg/apache/http/entity/SerializableEntity;-><init>(Ljava/io/Serializable;)V

    .line 325
    .restart local v0    # "e":Lorg/apache/http/entity/AbstractHttpEntity;
    sget-object v1, Lorg/apache/http/entity/ContentType;->DEFAULT_BINARY:Lorg/apache/http/entity/ContentType;

    invoke-virtual {v1}, Lorg/apache/http/entity/ContentType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/entity/AbstractHttpEntity;->setContentType(Ljava/lang/String;)V

    goto :goto_11

    .line 326
    .end local v0    # "e":Lorg/apache/http/entity/AbstractHttpEntity;
    :cond_8c
    iget-object v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->file:Ljava/io/File;

    if-eqz v1, :cond_9f

    .line 327
    new-instance v0, Lorg/apache/http/entity/FileEntity;

    iget-object v1, p0, Lorg/apache/http/client/entity/EntityBuilder;->file:Ljava/io/File;

    sget-object v2, Lorg/apache/http/entity/ContentType;->DEFAULT_BINARY:Lorg/apache/http/entity/ContentType;

    invoke-direct {p0, v2}, Lorg/apache/http/client/entity/EntityBuilder;->getContentOrDefault(Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/ContentType;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/entity/FileEntity;-><init>(Ljava/io/File;Lorg/apache/http/entity/ContentType;)V

    .restart local v0    # "e":Lorg/apache/http/entity/AbstractHttpEntity;
    goto/16 :goto_11

    .line 329
    .end local v0    # "e":Lorg/apache/http/entity/AbstractHttpEntity;
    :cond_9f
    new-instance v0, Lorg/apache/http/entity/BasicHttpEntity;

    invoke-direct {v0}, Lorg/apache/http/entity/BasicHttpEntity;-><init>()V

    .restart local v0    # "e":Lorg/apache/http/entity/AbstractHttpEntity;
    goto/16 :goto_11
.end method

.method public chunked()Lorg/apache/http/client/entity/EntityBuilder;
    .registers 2

    .prologue
    .line 286
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->chunked:Z

    .line 287
    return-object p0
.end method

.method public getBinary()[B
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->binary:[B

    return-object v0
.end method

.method public getContentEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 264
    iget-object v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->contentEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public getContentType()Lorg/apache/http/entity/ContentType;
    .registers 2

    .prologue
    .line 249
    iget-object v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->contentType:Lorg/apache/http/entity/ContentType;

    return-object v0
.end method

.method public getFile()Ljava/io/File;
    .registers 2

    .prologue
    .line 227
    iget-object v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->file:Ljava/io/File;

    return-object v0
.end method

.method public getParameters()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 170
    iget-object v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->parameters:Ljava/util/List;

    return-object v0
.end method

.method public getSerializable()Ljava/io/Serializable;
    .registers 2

    .prologue
    .line 204
    iget-object v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->serializable:Ljava/io/Serializable;

    return-object v0
.end method

.method public getStream()Ljava/io/InputStream;
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->stream:Ljava/io/InputStream;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->text:Ljava/lang/String;

    return-object v0
.end method

.method public gzipCompress()Lorg/apache/http/client/entity/EntityBuilder;
    .registers 2

    .prologue
    .line 301
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->gzipCompress:Z

    .line 302
    return-object p0
.end method

.method public isChunked()Z
    .registers 2

    .prologue
    .line 279
    iget-boolean v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->chunked:Z

    return v0
.end method

.method public isGzipCompress()Z
    .registers 2

    .prologue
    .line 294
    iget-boolean v0, p0, Lorg/apache/http/client/entity/EntityBuilder;->gzipCompress:Z

    return v0
.end method

.method public setBinary([B)Lorg/apache/http/client/entity/EntityBuilder;
    .registers 2
    .param p1, "binary"    # [B

    .prologue
    .line 136
    invoke-direct {p0}, Lorg/apache/http/client/entity/EntityBuilder;->clearContent()V

    .line 137
    iput-object p1, p0, Lorg/apache/http/client/entity/EntityBuilder;->binary:[B

    .line 138
    return-object p0
.end method

.method public setContentEncoding(Ljava/lang/String;)Lorg/apache/http/client/entity/EntityBuilder;
    .registers 2
    .param p1, "contentEncoding"    # Ljava/lang/String;

    .prologue
    .line 271
    iput-object p1, p0, Lorg/apache/http/client/entity/EntityBuilder;->contentEncoding:Ljava/lang/String;

    .line 272
    return-object p0
.end method

.method public setContentType(Lorg/apache/http/entity/ContentType;)Lorg/apache/http/client/entity/EntityBuilder;
    .registers 2
    .param p1, "contentType"    # Lorg/apache/http/entity/ContentType;

    .prologue
    .line 256
    iput-object p1, p0, Lorg/apache/http/client/entity/EntityBuilder;->contentType:Lorg/apache/http/entity/ContentType;

    .line 257
    return-object p0
.end method

.method public setFile(Ljava/io/File;)Lorg/apache/http/client/entity/EntityBuilder;
    .registers 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 240
    invoke-direct {p0}, Lorg/apache/http/client/entity/EntityBuilder;->clearContent()V

    .line 241
    iput-object p1, p0, Lorg/apache/http/client/entity/EntityBuilder;->file:Ljava/io/File;

    .line 242
    return-object p0
.end method

.method public setParameters(Ljava/util/List;)Lorg/apache/http/client/entity/EntityBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;)",
            "Lorg/apache/http/client/entity/EntityBuilder;"
        }
    .end annotation

    .prologue
    .line 182
    .local p1, "parameters":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    invoke-direct {p0}, Lorg/apache/http/client/entity/EntityBuilder;->clearContent()V

    .line 183
    iput-object p1, p0, Lorg/apache/http/client/entity/EntityBuilder;->parameters:Ljava/util/List;

    .line 184
    return-object p0
.end method

.method public varargs setParameters([Lorg/apache/http/NameValuePair;)Lorg/apache/http/client/entity/EntityBuilder;
    .registers 3
    .param p1, "parameters"    # [Lorg/apache/http/NameValuePair;

    .prologue
    .line 196
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/http/client/entity/EntityBuilder;->setParameters(Ljava/util/List;)Lorg/apache/http/client/entity/EntityBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setSerializable(Ljava/io/Serializable;)Lorg/apache/http/client/entity/EntityBuilder;
    .registers 2
    .param p1, "serializable"    # Ljava/io/Serializable;

    .prologue
    .line 217
    invoke-direct {p0}, Lorg/apache/http/client/entity/EntityBuilder;->clearContent()V

    .line 218
    iput-object p1, p0, Lorg/apache/http/client/entity/EntityBuilder;->serializable:Ljava/io/Serializable;

    .line 219
    return-object p0
.end method

.method public setStream(Ljava/io/InputStream;)Lorg/apache/http/client/entity/EntityBuilder;
    .registers 2
    .param p1, "stream"    # Ljava/io/InputStream;

    .prologue
    .line 159
    invoke-direct {p0}, Lorg/apache/http/client/entity/EntityBuilder;->clearContent()V

    .line 160
    iput-object p1, p0, Lorg/apache/http/client/entity/EntityBuilder;->stream:Ljava/io/InputStream;

    .line 161
    return-object p0
.end method

.method public setText(Ljava/lang/String;)Lorg/apache/http/client/entity/EntityBuilder;
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 113
    invoke-direct {p0}, Lorg/apache/http/client/entity/EntityBuilder;->clearContent()V

    .line 114
    iput-object p1, p0, Lorg/apache/http/client/entity/EntityBuilder;->text:Ljava/lang/String;

    .line 115
    return-object p0
.end method
