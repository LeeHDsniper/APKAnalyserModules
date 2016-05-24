.class public abstract Lorg/apache/http/entity/mime/content/AbstractContentBody;
.super Ljava/lang/Object;
.source "AbstractContentBody.java"

# interfaces
.implements Lorg/apache/http/entity/mime/content/ContentBody;


# instance fields
.field private final contentType:Lorg/apache/http/entity/ContentType;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "mimeType"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 57
    invoke-static {p1}, Lorg/apache/http/entity/ContentType;->parse(Ljava/lang/String;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/http/entity/mime/content/AbstractContentBody;-><init>(Lorg/apache/http/entity/ContentType;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/entity/ContentType;)V
    .registers 3
    .param p1, "contentType"    # Lorg/apache/http/entity/ContentType;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const-string v0, "Content type"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 49
    iput-object p1, p0, Lorg/apache/http/entity/mime/content/AbstractContentBody;->contentType:Lorg/apache/http/entity/ContentType;

    .line 50
    return-void
.end method


# virtual methods
.method public getCharset()Ljava/lang/String;
    .registers 3

    .prologue
    .line 92
    iget-object v1, p0, Lorg/apache/http/entity/mime/content/AbstractContentBody;->contentType:Lorg/apache/http/entity/ContentType;

    invoke-virtual {v1}, Lorg/apache/http/entity/ContentType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    .line 93
    .local v0, "charset":Ljava/nio/charset/Charset;
    if-eqz v0, :cond_d

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    :goto_c
    return-object v1

    :cond_d
    const/4 v1, 0x0

    goto :goto_c
.end method

.method public getContentType()Lorg/apache/http/entity/ContentType;
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lorg/apache/http/entity/mime/content/AbstractContentBody;->contentType:Lorg/apache/http/entity/ContentType;

    return-object v0
.end method

.method public getMediaType()Ljava/lang/String;
    .registers 4

    .prologue
    .line 72
    iget-object v2, p0, Lorg/apache/http/entity/mime/content/AbstractContentBody;->contentType:Lorg/apache/http/entity/ContentType;

    invoke-virtual {v2}, Lorg/apache/http/entity/ContentType;->getMimeType()Ljava/lang/String;

    move-result-object v1

    .line 73
    .local v1, "mimeType":Ljava/lang/String;
    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 74
    .local v0, "i":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_14

    .line 75
    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 77
    .end local v1    # "mimeType":Ljava/lang/String;
    :cond_14
    return-object v1
.end method

.method public getMimeType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lorg/apache/http/entity/mime/content/AbstractContentBody;->contentType:Lorg/apache/http/entity/ContentType;

    invoke-virtual {v0}, Lorg/apache/http/entity/ContentType;->getMimeType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSubType()Ljava/lang/String;
    .registers 4

    .prologue
    .line 82
    iget-object v2, p0, Lorg/apache/http/entity/mime/content/AbstractContentBody;->contentType:Lorg/apache/http/entity/ContentType;

    invoke-virtual {v2}, Lorg/apache/http/entity/ContentType;->getMimeType()Ljava/lang/String;

    move-result-object v1

    .line 83
    .local v1, "mimeType":Ljava/lang/String;
    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 84
    .local v0, "i":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_16

    .line 85
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 87
    :goto_15
    return-object v2

    :cond_16
    const/4 v2, 0x0

    goto :goto_15
.end method
