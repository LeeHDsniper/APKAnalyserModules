.class public Lorg/apache/http/client/entity/UrlEncodedFormEntity;
.super Lorg/apache/http/entity/StringEntity;
.source "UrlEncodedFormEntity.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/apache/http/NameValuePair;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 104
    .local p1, "parameters":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/apache/http/NameValuePair;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/lang/Iterable;Ljava/nio/charset/Charset;)V

    .line 105
    return-void
.end method

.method public constructor <init>(Ljava/lang/Iterable;Ljava/nio/charset/Charset;)V
    .registers 5
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/nio/charset/Charset;",
            ")V"
        }
    .end annotation

    .prologue
    .line 77
    .local p1, "parameters":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/apache/http/NameValuePair;>;"
    if-eqz p2, :cond_11

    move-object v0, p2

    :goto_3
    invoke-static {p1, v0}, Lorg/apache/http/client/utils/URLEncodedUtils;->format(Ljava/lang/Iterable;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "application/x-www-form-urlencoded"

    invoke-static {v1, p2}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/ContentType;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Lorg/apache/http/entity/ContentType;)V

    .line 80
    return-void

    .line 77
    :cond_11
    sget-object v0, Lorg/apache/http/protocol/HTTP;->DEF_CONTENT_CHARSET:Ljava/nio/charset/Charset;

    goto :goto_3
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lorg/apache/http/NameValuePair;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 91
    .local p1, "parameters":Ljava/util/List;, "Ljava/util/List<+Lorg/apache/http/NameValuePair;>;"
    const/4 v0, 0x0

    check-cast v0, Ljava/nio/charset/Charset;

    invoke-direct {p0, p1, v0}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/lang/Iterable;Ljava/nio/charset/Charset;)V

    .line 92
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .registers 5
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 60
    .local p1, "parameters":Ljava/util/List;, "Ljava/util/List<+Lorg/apache/http/NameValuePair;>;"
    if-eqz p2, :cond_11

    move-object v0, p2

    :goto_3
    invoke-static {p1, v0}, Lorg/apache/http/client/utils/URLEncodedUtils;->format(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "application/x-www-form-urlencoded"

    invoke-static {v1, p2}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/ContentType;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Lorg/apache/http/entity/ContentType;)V

    .line 63
    return-void

    .line 60
    :cond_11
    sget-object v0, Lorg/apache/http/protocol/HTTP;->DEF_CONTENT_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method
