.class public Lorg/apache/http/client/protocol/ResponseContentEncoding;
.super Ljava/lang/Object;
.source "ResponseContentEncoding.java"

# interfaces
.implements Lorg/apache/http/HttpResponseInterceptor;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final UNCOMPRESSED:Ljava/lang/String; = "http.client.response.uncompressed"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V
    .registers 17
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v5

    .line 78
    .local v5, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v5, :cond_5a

    invoke-interface {v5}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v10

    const-wide/16 v12, 0x0

    cmp-long v9, v10, v12

    if-eqz v9, :cond_5a

    .line 79
    invoke-interface {v5}, Lorg/apache/http/HttpEntity;->getContentEncoding()Lorg/apache/http/Header;

    move-result-object v1

    .line 80
    .local v1, "ceheader":Lorg/apache/http/Header;
    if-eqz v1, :cond_5a

    .line 81
    invoke-interface {v1}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v4

    .line 82
    .local v4, "codecs":[Lorg/apache/http/HeaderElement;
    const/4 v8, 0x0

    .line 83
    .local v8, "uncompressed":Z
    move-object v0, v4

    .local v0, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v7, v0

    .local v7, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    if-ge v6, v7, :cond_49

    aget-object v2, v0, v6

    .line 84
    .local v2, "codec":Lorg/apache/http/HeaderElement;
    invoke-interface {v2}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v9

    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v9, v10}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    .line 85
    .local v3, "codecname":Ljava/lang/String;
    const-string v9, "gzip"

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_3c

    const-string v9, "x-gzip"

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5b

    .line 86
    :cond_3c
    new-instance v9, Lorg/apache/http/client/entity/GzipDecompressingEntity;

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/apache/http/client/entity/GzipDecompressingEntity;-><init>(Lorg/apache/http/HttpEntity;)V

    invoke-interface {p1, v9}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 87
    const/4 v8, 0x1

    .line 101
    .end local v2    # "codec":Lorg/apache/http/HeaderElement;
    .end local v3    # "codecname":Ljava/lang/String;
    :cond_49
    :goto_49
    if-eqz v8, :cond_5a

    .line 102
    const-string v9, "Content-Length"

    invoke-interface {p1, v9}, Lorg/apache/http/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 103
    const-string v9, "Content-Encoding"

    invoke-interface {p1, v9}, Lorg/apache/http/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 104
    const-string v9, "Content-MD5"

    invoke-interface {p1, v9}, Lorg/apache/http/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 108
    .end local v0    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v1    # "ceheader":Lorg/apache/http/Header;
    .end local v4    # "codecs":[Lorg/apache/http/HeaderElement;
    .end local v6    # "i$":I
    .end local v7    # "len$":I
    .end local v8    # "uncompressed":Z
    :cond_5a
    return-void

    .line 89
    .restart local v0    # "arr$":[Lorg/apache/http/HeaderElement;
    .restart local v1    # "ceheader":Lorg/apache/http/Header;
    .restart local v2    # "codec":Lorg/apache/http/HeaderElement;
    .restart local v3    # "codecname":Ljava/lang/String;
    .restart local v4    # "codecs":[Lorg/apache/http/HeaderElement;
    .restart local v6    # "i$":I
    .restart local v7    # "len$":I
    .restart local v8    # "uncompressed":Z
    :cond_5b
    const-string v9, "deflate"

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_71

    .line 90
    new-instance v9, Lorg/apache/http/client/entity/DeflateDecompressingEntity;

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/apache/http/client/entity/DeflateDecompressingEntity;-><init>(Lorg/apache/http/HttpEntity;)V

    invoke-interface {p1, v9}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 91
    const/4 v8, 0x1

    .line 92
    goto :goto_49

    .line 93
    :cond_71
    const-string v9, "identity"

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_5a

    .line 98
    new-instance v9, Lorg/apache/http/HttpException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unsupported Content-Coding: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v2}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw v9
.end method
