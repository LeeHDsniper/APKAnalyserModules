.class public Lorg/apache/http/client/methods/RequestBuilder;
.super Ljava/lang/Object;
.source "RequestBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/client/methods/RequestBuilder$InternalEntityEclosingRequest;,
        Lorg/apache/http/client/methods/RequestBuilder$InternalRequest;
    }
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private config:Lorg/apache/http/client/config/RequestConfig;

.field private entity:Lorg/apache/http/HttpEntity;

.field private headergroup:Lorg/apache/http/message/HeaderGroup;

.field private method:Ljava/lang/String;

.field private parameters:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation
.end field

.field private uri:Ljava/net/URI;

.field private version:Lorg/apache/http/ProtocolVersion;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 81
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/http/client/methods/RequestBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object p1, p0, Lorg/apache/http/client/methods/RequestBuilder;->method:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public static copy(Lorg/apache/http/HttpRequest;)Lorg/apache/http/client/methods/RequestBuilder;
    .registers 2
    .param p0, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 118
    const-string v0, "HTTP request"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 119
    new-instance v0, Lorg/apache/http/client/methods/RequestBuilder;

    invoke-direct {v0}, Lorg/apache/http/client/methods/RequestBuilder;-><init>()V

    invoke-direct {v0, p0}, Lorg/apache/http/client/methods/RequestBuilder;->doCopy(Lorg/apache/http/HttpRequest;)Lorg/apache/http/client/methods/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/lang/String;)Lorg/apache/http/client/methods/RequestBuilder;
    .registers 2
    .param p0, "method"    # Ljava/lang/String;

    .prologue
    .line 85
    const-string v0, "HTTP method"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notBlank(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 86
    new-instance v0, Lorg/apache/http/client/methods/RequestBuilder;

    invoke-direct {v0, p0}, Lorg/apache/http/client/methods/RequestBuilder;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static delete()Lorg/apache/http/client/methods/RequestBuilder;
    .registers 2

    .prologue
    .line 106
    new-instance v0, Lorg/apache/http/client/methods/RequestBuilder;

    const-string v1, "DELETE"

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/RequestBuilder;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private doCopy(Lorg/apache/http/HttpRequest;)Lorg/apache/http/client/methods/RequestBuilder;
    .registers 5
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    const/4 v2, 0x0

    .line 123
    if-nez p1, :cond_4

    .line 149
    .end local p1    # "request":Lorg/apache/http/HttpRequest;
    :goto_3
    return-object p0

    .line 126
    .restart local p1    # "request":Lorg/apache/http/HttpRequest;
    :cond_4
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->method:Ljava/lang/String;

    .line 127
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/RequestLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->version:Lorg/apache/http/ProtocolVersion;

    .line 128
    instance-of v0, p1, Lorg/apache/http/client/methods/HttpUriRequest;

    if-eqz v0, :cond_5a

    move-object v0, p1

    .line 129
    check-cast v0, Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-interface {v0}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->uri:Ljava/net/URI;

    .line 133
    :goto_25
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    if-nez v0, :cond_30

    .line 134
    new-instance v0, Lorg/apache/http/message/HeaderGroup;

    invoke-direct {v0}, Lorg/apache/http/message/HeaderGroup;-><init>()V

    iput-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    .line 136
    :cond_30
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    invoke-virtual {v0}, Lorg/apache/http/message/HeaderGroup;->clear()V

    .line 137
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/message/HeaderGroup;->setHeaders([Lorg/apache/http/Header;)V

    .line 138
    instance-of v0, p1, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v0, :cond_69

    move-object v0, p1

    .line 139
    check-cast v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    invoke-interface {v0}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->entity:Lorg/apache/http/HttpEntity;

    .line 143
    :goto_4b
    instance-of v0, p1, Lorg/apache/http/client/methods/Configurable;

    if-eqz v0, :cond_6c

    .line 144
    check-cast p1, Lorg/apache/http/client/methods/Configurable;

    .end local p1    # "request":Lorg/apache/http/HttpRequest;
    invoke-interface {p1}, Lorg/apache/http/client/methods/Configurable;->getConfig()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->config:Lorg/apache/http/client/config/RequestConfig;

    .line 148
    :goto_57
    iput-object v2, p0, Lorg/apache/http/client/methods/RequestBuilder;->parameters:Ljava/util/LinkedList;

    goto :goto_3

    .line 131
    .restart local p1    # "request":Lorg/apache/http/HttpRequest;
    :cond_5a
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->uri:Ljava/net/URI;

    goto :goto_25

    .line 141
    :cond_69
    iput-object v2, p0, Lorg/apache/http/client/methods/RequestBuilder;->entity:Lorg/apache/http/HttpEntity;

    goto :goto_4b

    .line 146
    :cond_6c
    iput-object v2, p0, Lorg/apache/http/client/methods/RequestBuilder;->config:Lorg/apache/http/client/config/RequestConfig;

    goto :goto_57
.end method

.method public static get()Lorg/apache/http/client/methods/RequestBuilder;
    .registers 2

    .prologue
    .line 90
    new-instance v0, Lorg/apache/http/client/methods/RequestBuilder;

    const-string v1, "GET"

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/RequestBuilder;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static head()Lorg/apache/http/client/methods/RequestBuilder;
    .registers 2

    .prologue
    .line 94
    new-instance v0, Lorg/apache/http/client/methods/RequestBuilder;

    const-string v1, "HEAD"

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/RequestBuilder;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static options()Lorg/apache/http/client/methods/RequestBuilder;
    .registers 2

    .prologue
    .line 114
    new-instance v0, Lorg/apache/http/client/methods/RequestBuilder;

    const-string v1, "OPTIONS"

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/RequestBuilder;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static post()Lorg/apache/http/client/methods/RequestBuilder;
    .registers 2

    .prologue
    .line 98
    new-instance v0, Lorg/apache/http/client/methods/RequestBuilder;

    const-string v1, "POST"

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/RequestBuilder;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static put()Lorg/apache/http/client/methods/RequestBuilder;
    .registers 2

    .prologue
    .line 102
    new-instance v0, Lorg/apache/http/client/methods/RequestBuilder;

    const-string v1, "PUT"

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/RequestBuilder;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static trace()Lorg/apache/http/client/methods/RequestBuilder;
    .registers 2

    .prologue
    .line 110
    new-instance v0, Lorg/apache/http/client/methods/RequestBuilder;

    const-string v1, "TRACE"

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/RequestBuilder;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/RequestBuilder;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 200
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    if-nez v0, :cond_b

    .line 201
    new-instance v0, Lorg/apache/http/message/HeaderGroup;

    invoke-direct {v0}, Lorg/apache/http/message/HeaderGroup;-><init>()V

    iput-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    .line 203
    :cond_b
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    new-instance v1, Lorg/apache/http/message/BasicHeader;

    invoke-direct {v1, p1, p2}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/http/message/HeaderGroup;->addHeader(Lorg/apache/http/Header;)V

    .line 204
    return-object p0
.end method

.method public addHeader(Lorg/apache/http/Header;)Lorg/apache/http/client/methods/RequestBuilder;
    .registers 3
    .param p1, "header"    # Lorg/apache/http/Header;

    .prologue
    .line 192
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    if-nez v0, :cond_b

    .line 193
    new-instance v0, Lorg/apache/http/message/HeaderGroup;

    invoke-direct {v0}, Lorg/apache/http/message/HeaderGroup;-><init>()V

    iput-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    .line 195
    :cond_b
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lorg/apache/http/message/HeaderGroup;->addHeader(Lorg/apache/http/Header;)V

    .line 196
    return-object p0
.end method

.method public addParameter(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/RequestBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 268
    new-instance v0, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v0, p1, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/apache/http/client/methods/RequestBuilder;->addParameter(Lorg/apache/http/NameValuePair;)Lorg/apache/http/client/methods/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addParameter(Lorg/apache/http/NameValuePair;)Lorg/apache/http/client/methods/RequestBuilder;
    .registers 3
    .param p1, "nvp"    # Lorg/apache/http/NameValuePair;

    .prologue
    .line 259
    const-string v0, "Name value pair"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 260
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->parameters:Ljava/util/LinkedList;

    if-nez v0, :cond_10

    .line 261
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->parameters:Ljava/util/LinkedList;

    .line 263
    :cond_10
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->parameters:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 264
    return-object p0
.end method

.method public varargs addParameters([Lorg/apache/http/NameValuePair;)Lorg/apache/http/client/methods/RequestBuilder;
    .registers 6
    .param p1, "nvps"    # [Lorg/apache/http/NameValuePair;

    .prologue
    .line 272
    move-object v0, p1

    .local v0, "arr$":[Lorg/apache/http/NameValuePair;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_3
    if-ge v1, v2, :cond_d

    aget-object v3, v0, v1

    .line 273
    .local v3, "nvp":Lorg/apache/http/NameValuePair;
    invoke-virtual {p0, v3}, Lorg/apache/http/client/methods/RequestBuilder;->addParameter(Lorg/apache/http/NameValuePair;)Lorg/apache/http/client/methods/RequestBuilder;

    .line 272
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 275
    .end local v3    # "nvp":Lorg/apache/http/NameValuePair;
    :cond_d
    return-object p0
.end method

.method public build()Lorg/apache/http/client/methods/HttpUriRequest;
    .registers 7

    .prologue
    .line 289
    iget-object v4, p0, Lorg/apache/http/client/methods/RequestBuilder;->uri:Ljava/net/URI;

    if-eqz v4, :cond_57

    iget-object v3, p0, Lorg/apache/http/client/methods/RequestBuilder;->uri:Ljava/net/URI;

    .line 290
    .local v3, "uri":Ljava/net/URI;
    :goto_6
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->entity:Lorg/apache/http/HttpEntity;

    .line 291
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    iget-object v4, p0, Lorg/apache/http/client/methods/RequestBuilder;->parameters:Ljava/util/LinkedList;

    if-eqz v4, :cond_33

    iget-object v4, p0, Lorg/apache/http/client/methods/RequestBuilder;->parameters:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_33

    .line 292
    if-nez v0, :cond_5e

    const-string v4, "POST"

    iget-object v5, p0, Lorg/apache/http/client/methods/RequestBuilder;->method:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2a

    const-string v4, "PUT"

    iget-object v5, p0, Lorg/apache/http/client/methods/RequestBuilder;->method:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5e

    .line 294
    :cond_2a
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    .end local v0    # "entity":Lorg/apache/http/HttpEntity;
    iget-object v4, p0, Lorg/apache/http/client/methods/RequestBuilder;->parameters:Ljava/util/LinkedList;

    sget-object v5, Lorg/apache/http/protocol/HTTP;->DEF_CONTENT_CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {v0, v4, v5}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/lang/Iterable;Ljava/nio/charset/Charset;)V

    .line 303
    .restart local v0    # "entity":Lorg/apache/http/HttpEntity;
    :cond_33
    :goto_33
    if-nez v0, :cond_6e

    .line 304
    new-instance v2, Lorg/apache/http/client/methods/RequestBuilder$InternalRequest;

    iget-object v4, p0, Lorg/apache/http/client/methods/RequestBuilder;->method:Ljava/lang/String;

    invoke-direct {v2, v4}, Lorg/apache/http/client/methods/RequestBuilder$InternalRequest;-><init>(Ljava/lang/String;)V

    .line 310
    .local v2, "result":Lorg/apache/http/client/methods/HttpRequestBase;
    :goto_3c
    iget-object v4, p0, Lorg/apache/http/client/methods/RequestBuilder;->version:Lorg/apache/http/ProtocolVersion;

    invoke-virtual {v2, v4}, Lorg/apache/http/client/methods/HttpRequestBase;->setProtocolVersion(Lorg/apache/http/ProtocolVersion;)V

    .line 311
    invoke-virtual {v2, v3}, Lorg/apache/http/client/methods/HttpRequestBase;->setURI(Ljava/net/URI;)V

    .line 312
    iget-object v4, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    if-eqz v4, :cond_51

    .line 313
    iget-object v4, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    invoke-virtual {v4}, Lorg/apache/http/message/HeaderGroup;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/apache/http/client/methods/HttpRequestBase;->setHeaders([Lorg/apache/http/Header;)V

    .line 315
    :cond_51
    iget-object v4, p0, Lorg/apache/http/client/methods/RequestBuilder;->config:Lorg/apache/http/client/config/RequestConfig;

    invoke-virtual {v2, v4}, Lorg/apache/http/client/methods/HttpRequestBase;->setConfig(Lorg/apache/http/client/config/RequestConfig;)V

    .line 316
    return-object v2

    .line 289
    .end local v0    # "entity":Lorg/apache/http/HttpEntity;
    .end local v2    # "result":Lorg/apache/http/client/methods/HttpRequestBase;
    .end local v3    # "uri":Ljava/net/URI;
    :cond_57
    const-string v4, "/"

    invoke-static {v4}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v3

    goto :goto_6

    .line 297
    .restart local v0    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v3    # "uri":Ljava/net/URI;
    :cond_5e
    :try_start_5e
    new-instance v4, Lorg/apache/http/client/utils/URIBuilder;

    invoke-direct {v4, v3}, Lorg/apache/http/client/utils/URIBuilder;-><init>(Ljava/net/URI;)V

    iget-object v5, p0, Lorg/apache/http/client/methods/RequestBuilder;->parameters:Ljava/util/LinkedList;

    invoke-virtual {v4, v5}, Lorg/apache/http/client/utils/URIBuilder;->addParameters(Ljava/util/List;)Lorg/apache/http/client/utils/URIBuilder;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/http/client/utils/URIBuilder;->build()Ljava/net/URI;
    :try_end_6c
    .catch Ljava/net/URISyntaxException; {:try_start_5e .. :try_end_6c} :catch_7a

    move-result-object v3

    goto :goto_33

    .line 306
    :cond_6e
    new-instance v1, Lorg/apache/http/client/methods/RequestBuilder$InternalEntityEclosingRequest;

    iget-object v4, p0, Lorg/apache/http/client/methods/RequestBuilder;->method:Ljava/lang/String;

    invoke-direct {v1, v4}, Lorg/apache/http/client/methods/RequestBuilder$InternalEntityEclosingRequest;-><init>(Ljava/lang/String;)V

    .line 307
    .local v1, "request":Lorg/apache/http/client/methods/RequestBuilder$InternalEntityEclosingRequest;
    invoke-virtual {v1, v0}, Lorg/apache/http/client/methods/RequestBuilder$InternalEntityEclosingRequest;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 308
    move-object v2, v1

    .restart local v2    # "result":Lorg/apache/http/client/methods/HttpRequestBase;
    goto :goto_3c

    .line 298
    .end local v1    # "request":Lorg/apache/http/client/methods/RequestBuilder$InternalEntityEclosingRequest;
    .end local v2    # "result":Lorg/apache/http/client/methods/HttpRequestBase;
    :catch_7a
    move-exception v4

    goto :goto_33
.end method

.method public getConfig()Lorg/apache/http/client/config/RequestConfig;
    .registers 2

    .prologue
    .line 279
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->config:Lorg/apache/http/client/config/RequestConfig;

    return-object v0
.end method

.method public getEntity()Lorg/apache/http/HttpEntity;
    .registers 2

    .prologue
    .line 245
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->entity:Lorg/apache/http/HttpEntity;

    return-object v0
.end method

.method public getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 180
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lorg/apache/http/message/HeaderGroup;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 188
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lorg/apache/http/message/HeaderGroup;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getLastHeader(Ljava/lang/String;)Lorg/apache/http/Header;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 184
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lorg/apache/http/message/HeaderGroup;->getLastHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getMethod()Ljava/lang/String;
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->method:Ljava/lang/String;

    return-object v0
.end method

.method public getParameters()Ljava/util/List;
    .registers 3
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
    .line 254
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->parameters:Ljava/util/LinkedList;

    if-eqz v0, :cond_c

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/apache/http/client/methods/RequestBuilder;->parameters:Ljava/util/LinkedList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :goto_b
    return-object v0

    :cond_c
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_b
.end method

.method public getUri()Ljava/net/URI;
    .registers 2

    .prologue
    .line 166
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->uri:Ljava/net/URI;

    return-object v0
.end method

.method public getVersion()Lorg/apache/http/ProtocolVersion;
    .registers 2

    .prologue
    .line 157
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->version:Lorg/apache/http/ProtocolVersion;

    return-object v0
.end method

.method public removeHeader(Lorg/apache/http/Header;)Lorg/apache/http/client/methods/RequestBuilder;
    .registers 3
    .param p1, "header"    # Lorg/apache/http/Header;

    .prologue
    .line 208
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    if-nez v0, :cond_b

    .line 209
    new-instance v0, Lorg/apache/http/message/HeaderGroup;

    invoke-direct {v0}, Lorg/apache/http/message/HeaderGroup;-><init>()V

    iput-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    .line 211
    :cond_b
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lorg/apache/http/message/HeaderGroup;->removeHeader(Lorg/apache/http/Header;)V

    .line 212
    return-object p0
.end method

.method public removeHeaders(Ljava/lang/String;)Lorg/apache/http/client/methods/RequestBuilder;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 216
    if-eqz p1, :cond_6

    iget-object v2, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    if-nez v2, :cond_7

    .line 225
    :cond_6
    return-object p0

    .line 219
    :cond_7
    iget-object v2, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    invoke-virtual {v2}, Lorg/apache/http/message/HeaderGroup;->iterator()Lorg/apache/http/HeaderIterator;

    move-result-object v1

    .local v1, "i":Lorg/apache/http/HeaderIterator;
    :cond_d
    :goto_d
    invoke-interface {v1}, Lorg/apache/http/HeaderIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 220
    invoke-interface {v1}, Lorg/apache/http/HeaderIterator;->nextHeader()Lorg/apache/http/Header;

    move-result-object v0

    .line 221
    .local v0, "header":Lorg/apache/http/Header;
    invoke-interface {v0}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 222
    invoke-interface {v1}, Lorg/apache/http/HeaderIterator;->remove()V

    goto :goto_d
.end method

.method public setConfig(Lorg/apache/http/client/config/RequestConfig;)Lorg/apache/http/client/methods/RequestBuilder;
    .registers 2
    .param p1, "config"    # Lorg/apache/http/client/config/RequestConfig;

    .prologue
    .line 283
    iput-object p1, p0, Lorg/apache/http/client/methods/RequestBuilder;->config:Lorg/apache/http/client/config/RequestConfig;

    .line 284
    return-object p0
.end method

.method public setEntity(Lorg/apache/http/HttpEntity;)Lorg/apache/http/client/methods/RequestBuilder;
    .registers 2
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;

    .prologue
    .line 249
    iput-object p1, p0, Lorg/apache/http/client/methods/RequestBuilder;->entity:Lorg/apache/http/HttpEntity;

    .line 250
    return-object p0
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/RequestBuilder;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 237
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    if-nez v0, :cond_b

    .line 238
    new-instance v0, Lorg/apache/http/message/HeaderGroup;

    invoke-direct {v0}, Lorg/apache/http/message/HeaderGroup;-><init>()V

    iput-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    .line 240
    :cond_b
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    new-instance v1, Lorg/apache/http/message/BasicHeader;

    invoke-direct {v1, p1, p2}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/http/message/HeaderGroup;->updateHeader(Lorg/apache/http/Header;)V

    .line 241
    return-object p0
.end method

.method public setHeader(Lorg/apache/http/Header;)Lorg/apache/http/client/methods/RequestBuilder;
    .registers 3
    .param p1, "header"    # Lorg/apache/http/Header;

    .prologue
    .line 229
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    if-nez v0, :cond_b

    .line 230
    new-instance v0, Lorg/apache/http/message/HeaderGroup;

    invoke-direct {v0}, Lorg/apache/http/message/HeaderGroup;-><init>()V

    iput-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    .line 232
    :cond_b
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->headergroup:Lorg/apache/http/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lorg/apache/http/message/HeaderGroup;->updateHeader(Lorg/apache/http/Header;)V

    .line 233
    return-object p0
.end method

.method public setUri(Ljava/lang/String;)Lorg/apache/http/client/methods/RequestBuilder;
    .registers 3
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 175
    if-eqz p1, :cond_9

    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    :goto_6
    iput-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder;->uri:Ljava/net/URI;

    .line 176
    return-object p0

    .line 175
    :cond_9
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public setUri(Ljava/net/URI;)Lorg/apache/http/client/methods/RequestBuilder;
    .registers 2
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 170
    iput-object p1, p0, Lorg/apache/http/client/methods/RequestBuilder;->uri:Ljava/net/URI;

    .line 171
    return-object p0
.end method

.method public setVersion(Lorg/apache/http/ProtocolVersion;)Lorg/apache/http/client/methods/RequestBuilder;
    .registers 2
    .param p1, "version"    # Lorg/apache/http/ProtocolVersion;

    .prologue
    .line 161
    iput-object p1, p0, Lorg/apache/http/client/methods/RequestBuilder;->version:Lorg/apache/http/ProtocolVersion;

    .line 162
    return-object p0
.end method
