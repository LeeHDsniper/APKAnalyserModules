.class public Lorg/apache/http/impl/client/DefaultRedirectStrategy;
.super Ljava/lang/Object;
.source "DefaultRedirectStrategy.java"

# interfaces
.implements Lorg/apache/http/client/RedirectStrategy;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final INSTANCE:Lorg/apache/http/impl/client/DefaultRedirectStrategy;

.field public static final REDIRECT_LOCATIONS:Ljava/lang/String; = "http.protocol.redirect-locations"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private static final REDIRECT_METHODS:[Ljava/lang/String;


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 83
    new-instance v0, Lorg/apache/http/impl/client/DefaultRedirectStrategy;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultRedirectStrategy;-><init>()V

    sput-object v0, Lorg/apache/http/impl/client/DefaultRedirectStrategy;->INSTANCE:Lorg/apache/http/impl/client/DefaultRedirectStrategy;

    .line 88
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "GET"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "HEAD"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/http/impl/client/DefaultRedirectStrategy;->REDIRECT_METHODS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/DefaultRedirectStrategy;->log:Lorg/apache/commons/logging/Log;

    .line 95
    return-void
.end method


# virtual methods
.method protected createLocationURI(Ljava/lang/String;)Ljava/net/URI;
    .registers 9
    .param p1, "location"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ProtocolException;
        }
    .end annotation

    .prologue
    .line 186
    :try_start_0
    new-instance v0, Lorg/apache/http/client/utils/URIBuilder;

    new-instance v4, Ljava/net/URI;

    invoke-direct {v4, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/net/URI;->normalize()Ljava/net/URI;

    move-result-object v4

    invoke-direct {v0, v4}, Lorg/apache/http/client/utils/URIBuilder;-><init>(Ljava/net/URI;)V

    .line 187
    .local v0, "b":Lorg/apache/http/client/utils/URIBuilder;
    invoke-virtual {v0}, Lorg/apache/http/client/utils/URIBuilder;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 188
    .local v2, "host":Ljava/lang/String;
    if-eqz v2, :cond_1d

    .line 189
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lorg/apache/http/client/utils/URIBuilder;->setHost(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 191
    :cond_1d
    invoke-virtual {v0}, Lorg/apache/http/client/utils/URIBuilder;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 192
    .local v3, "path":Ljava/lang/String;
    invoke-static {v3}, Lorg/apache/http/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 193
    const-string v4, "/"

    invoke-virtual {v0, v4}, Lorg/apache/http/client/utils/URIBuilder;->setPath(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 195
    :cond_2c
    invoke-virtual {v0}, Lorg/apache/http/client/utils/URIBuilder;->build()Ljava/net/URI;
    :try_end_2f
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_2f} :catch_31

    move-result-object v4

    return-object v4

    .line 196
    .end local v0    # "b":Lorg/apache/http/client/utils/URIBuilder;
    .end local v2    # "host":Ljava/lang/String;
    .end local v3    # "path":Ljava/lang/String;
    :catch_31
    move-exception v1

    .line 197
    .local v1, "ex":Ljava/net/URISyntaxException;
    new-instance v4, Lorg/apache/http/ProtocolException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid redirect URI: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method public getLocationURI(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Ljava/net/URI;
    .registers 18
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ProtocolException;
        }
    .end annotation

    .prologue
    .line 124
    const-string v11, "HTTP request"

    invoke-static {p1, v11}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 125
    const-string v11, "HTTP response"

    move-object/from16 v0, p2

    invoke-static {v0, v11}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 126
    const-string v11, "HTTP context"

    move-object/from16 v0, p3

    invoke-static {v0, v11}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 128
    invoke-static/range {p3 .. p3}, Lorg/apache/http/client/protocol/HttpClientContext;->adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/protocol/HttpClientContext;

    move-result-object v2

    .line 131
    .local v2, "clientContext":Lorg/apache/http/client/protocol/HttpClientContext;
    const-string v11, "location"

    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v6

    .line 132
    .local v6, "locationHeader":Lorg/apache/http/Header;
    if-nez v6, :cond_44

    .line 134
    new-instance v11, Lorg/apache/http/ProtocolException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Received redirect response "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-interface/range {p2 .. p2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " but no location header"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 138
    :cond_44
    invoke-interface {v6}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    .line 139
    .local v5, "location":Ljava/lang/String;
    iget-object v11, p0, Lorg/apache/http/impl/client/DefaultRedirectStrategy;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v11}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v11

    if-eqz v11, :cond_6e

    .line 140
    iget-object v11, p0, Lorg/apache/http/impl/client/DefaultRedirectStrategy;->log:Lorg/apache/commons/logging/Log;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Redirect requested to location \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 143
    :cond_6e
    invoke-virtual {v2}, Lorg/apache/http/client/protocol/HttpClientContext;->getRequestConfig()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v3

    .line 145
    .local v3, "config":Lorg/apache/http/client/config/RequestConfig;
    invoke-virtual {p0, v5}, Lorg/apache/http/impl/client/DefaultRedirectStrategy;->createLocationURI(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v10

    .line 150
    .local v10, "uri":Ljava/net/URI;
    :try_start_76
    invoke-virtual {v10}, Ljava/net/URI;->isAbsolute()Z

    move-result v11

    if-nez v11, :cond_cb

    .line 151
    invoke-virtual {v3}, Lorg/apache/http/client/config/RequestConfig;->isRelativeRedirectsAllowed()Z

    move-result v11

    if-nez v11, :cond_ac

    .line 152
    new-instance v11, Lorg/apache/http/ProtocolException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Relative redirect location \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\' not allowed"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v11
    :try_end_a1
    .catch Ljava/net/URISyntaxException; {:try_start_76 .. :try_end_a1} :catch_a1

    .line 162
    :catch_a1
    move-exception v4

    .line 163
    .local v4, "ex":Ljava/net/URISyntaxException;
    new-instance v11, Lorg/apache/http/ProtocolException;

    invoke-virtual {v4}, Ljava/net/URISyntaxException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12, v4}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11

    .line 156
    .end local v4    # "ex":Ljava/net/URISyntaxException;
    :cond_ac
    :try_start_ac
    invoke-virtual {v2}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v9

    .line 157
    .local v9, "target":Lorg/apache/http/HttpHost;
    const-string v11, "Target host"

    invoke-static {v9, v11}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 158
    new-instance v8, Ljava/net/URI;

    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v11

    invoke-interface {v11}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v8, v11}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 159
    .local v8, "requestURI":Ljava/net/URI;
    const/4 v11, 0x0

    invoke-static {v8, v9, v11}, Lorg/apache/http/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;Lorg/apache/http/HttpHost;Z)Ljava/net/URI;

    move-result-object v1

    .line 160
    .local v1, "absoluteRequestURI":Ljava/net/URI;
    invoke-static {v1, v10}, Lorg/apache/http/client/utils/URIUtils;->resolve(Ljava/net/URI;Ljava/net/URI;)Ljava/net/URI;
    :try_end_ca
    .catch Ljava/net/URISyntaxException; {:try_start_ac .. :try_end_ca} :catch_a1

    move-result-object v10

    .line 166
    .end local v1    # "absoluteRequestURI":Ljava/net/URI;
    .end local v8    # "requestURI":Ljava/net/URI;
    .end local v9    # "target":Lorg/apache/http/HttpHost;
    :cond_cb
    const-string v11, "http.protocol.redirect-locations"

    invoke-virtual {v2, v11}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/http/impl/client/RedirectLocations;

    .line 168
    .local v7, "redirectLocations":Lorg/apache/http/impl/client/RedirectLocations;
    if-nez v7, :cond_e1

    .line 169
    new-instance v7, Lorg/apache/http/impl/client/RedirectLocations;

    .end local v7    # "redirectLocations":Lorg/apache/http/impl/client/RedirectLocations;
    invoke-direct {v7}, Lorg/apache/http/impl/client/RedirectLocations;-><init>()V

    .line 170
    .restart local v7    # "redirectLocations":Lorg/apache/http/impl/client/RedirectLocations;
    const-string v11, "http.protocol.redirect-locations"

    move-object/from16 v0, p3

    invoke-interface {v0, v11, v7}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 172
    :cond_e1
    invoke-virtual {v3}, Lorg/apache/http/client/config/RequestConfig;->isCircularRedirectsAllowed()Z

    move-result v11

    if-nez v11, :cond_10c

    .line 173
    invoke-virtual {v7, v10}, Lorg/apache/http/impl/client/RedirectLocations;->contains(Ljava/net/URI;)Z

    move-result v11

    if-eqz v11, :cond_10c

    .line 174
    new-instance v11, Lorg/apache/http/client/CircularRedirectException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Circular redirect to \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lorg/apache/http/client/CircularRedirectException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 177
    :cond_10c
    invoke-virtual {v7, v10}, Lorg/apache/http/impl/client/RedirectLocations;->add(Ljava/net/URI;)V

    .line 178
    return-object v10
.end method

.method public getRedirect(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/methods/HttpUriRequest;
    .registers 8
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ProtocolException;
        }
    .end annotation

    .prologue
    .line 217
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/http/impl/client/DefaultRedirectStrategy;->getLocationURI(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Ljava/net/URI;

    move-result-object v2

    .line 218
    .local v2, "uri":Ljava/net/URI;
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    .line 219
    .local v0, "method":Ljava/lang/String;
    const-string v3, "HEAD"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 220
    new-instance v3, Lorg/apache/http/client/methods/HttpHead;

    invoke-direct {v3, v2}, Lorg/apache/http/client/methods/HttpHead;-><init>(Ljava/net/URI;)V

    .line 228
    :goto_19
    return-object v3

    .line 221
    :cond_1a
    const-string v3, "GET"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_28

    .line 222
    new-instance v3, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v3, v2}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/net/URI;)V

    goto :goto_19

    .line 224
    :cond_28
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    .line 225
    .local v1, "status":I
    const/16 v3, 0x133

    if-ne v1, v3, :cond_41

    .line 226
    invoke-static {p1}, Lorg/apache/http/client/methods/RequestBuilder;->copy(Lorg/apache/http/HttpRequest;)Lorg/apache/http/client/methods/RequestBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/apache/http/client/methods/RequestBuilder;->setUri(Ljava/net/URI;)Lorg/apache/http/client/methods/RequestBuilder;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/http/client/methods/RequestBuilder;->build()Lorg/apache/http/client/methods/HttpUriRequest;

    move-result-object v3

    goto :goto_19

    .line 228
    :cond_41
    new-instance v3, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v3, v2}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/net/URI;)V

    goto :goto_19
.end method

.method protected isRedirectable(Ljava/lang/String;)Z
    .registers 7
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 205
    sget-object v0, Lorg/apache/http/impl/client/DefaultRedirectStrategy;->REDIRECT_METHODS:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_4
    if-ge v1, v2, :cond_13

    aget-object v3, v0, v1

    .line 206
    .local v3, "m":Ljava/lang/String;
    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 207
    const/4 v4, 0x1

    .line 210
    .end local v3    # "m":Ljava/lang/String;
    :goto_f
    return v4

    .line 205
    .restart local v3    # "m":Ljava/lang/String;
    :cond_10
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 210
    .end local v3    # "m":Ljava/lang/String;
    :cond_13
    const/4 v4, 0x0

    goto :goto_f
.end method

.method public isRedirected(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z
    .registers 10
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ProtocolException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 101
    const-string v5, "HTTP request"

    invoke-static {p1, v5}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 102
    const-string v5, "HTTP response"

    invoke-static {p2, v5}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 104
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    .line 105
    .local v2, "statusCode":I
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    .line 106
    .local v1, "method":Ljava/lang/String;
    const-string v5, "location"

    invoke-interface {p2, v5}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 107
    .local v0, "locationHeader":Lorg/apache/http/Header;
    packed-switch v2, :pswitch_data_36

    :pswitch_25
    move v3, v4

    .line 116
    :cond_26
    :goto_26
    :pswitch_26
    return v3

    .line 109
    :pswitch_27
    invoke-virtual {p0, v1}, Lorg/apache/http/impl/client/DefaultRedirectStrategy;->isRedirectable(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2f

    if-nez v0, :cond_26

    :cond_2f
    move v3, v4

    goto :goto_26

    .line 112
    :pswitch_31
    invoke-virtual {p0, v1}, Lorg/apache/http/impl/client/DefaultRedirectStrategy;->isRedirectable(Ljava/lang/String;)Z

    move-result v3

    goto :goto_26

    .line 107
    :pswitch_data_36
    .packed-switch 0x12d
        :pswitch_31
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_25
        :pswitch_25
        :pswitch_31
    .end packed-switch
.end method
