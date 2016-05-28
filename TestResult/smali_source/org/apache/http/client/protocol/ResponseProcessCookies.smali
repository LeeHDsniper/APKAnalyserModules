.class public Lorg/apache/http/client/protocol/ResponseProcessCookies;
.super Ljava/lang/Object;
.source "ResponseProcessCookies.java"

# interfaces
.implements Lorg/apache/http/HttpResponseInterceptor;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/protocol/ResponseProcessCookies;->log:Lorg/apache/commons/logging/Log;

    .line 63
    return-void
.end method

.method private processCookies(Lorg/apache/http/HeaderIterator;Lorg/apache/http/cookie/CookieSpec;Lorg/apache/http/cookie/CookieOrigin;Lorg/apache/http/client/CookieStore;)V
    .registers 13
    .param p1, "iterator"    # Lorg/apache/http/HeaderIterator;
    .param p2, "cookieSpec"    # Lorg/apache/http/cookie/CookieSpec;
    .param p3, "cookieOrigin"    # Lorg/apache/http/cookie/CookieOrigin;
    .param p4, "cookieStore"    # Lorg/apache/http/client/CookieStore;

    .prologue
    .line 107
    :cond_0
    :goto_0
    invoke-interface {p1}, Lorg/apache/http/HeaderIterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_ac

    .line 108
    invoke-interface {p1}, Lorg/apache/http/HeaderIterator;->nextHeader()Lorg/apache/http/Header;

    move-result-object v3

    .line 110
    .local v3, "header":Lorg/apache/http/Header;
    :try_start_a
    invoke-interface {p2, v3, p3}, Lorg/apache/http/cookie/CookieSpec;->parse(Lorg/apache/http/Header;Lorg/apache/http/cookie/CookieOrigin;)Ljava/util/List;

    move-result-object v1

    .line 111
    .local v1, "cookies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_12
    :goto_12
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/cookie/Cookie;
    :try_end_1e
    .catch Lorg/apache/http/cookie/MalformedCookieException; {:try_start_a .. :try_end_1e} :catch_7b

    .line 113
    .local v0, "cookie":Lorg/apache/http/cookie/Cookie;
    :try_start_1e
    invoke-interface {p2, v0, p3}, Lorg/apache/http/cookie/CookieSpec;->validate(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)V

    .line 114
    invoke-interface {p4, v0}, Lorg/apache/http/client/CookieStore;->addCookie(Lorg/apache/http/cookie/Cookie;)V

    .line 116
    iget-object v5, p0, Lorg/apache/http/client/protocol/ResponseProcessCookies;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v5}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v5

    if-eqz v5, :cond_12

    .line 117
    iget-object v5, p0, Lorg/apache/http/client/protocol/ResponseProcessCookies;->log:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Cookie accepted: \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\". "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_4a
    .catch Lorg/apache/http/cookie/MalformedCookieException; {:try_start_1e .. :try_end_4a} :catch_4b

    goto :goto_12

    .line 120
    :catch_4b
    move-exception v2

    .line 121
    .local v2, "ex":Lorg/apache/http/cookie/MalformedCookieException;
    :try_start_4c
    iget-object v5, p0, Lorg/apache/http/client/protocol/ResponseProcessCookies;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v5}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v5

    if-eqz v5, :cond_12

    .line 122
    iget-object v5, p0, Lorg/apache/http/client/protocol/ResponseProcessCookies;->log:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Cookie rejected: \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\". "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Lorg/apache/http/cookie/MalformedCookieException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V
    :try_end_7a
    .catch Lorg/apache/http/cookie/MalformedCookieException; {:try_start_4c .. :try_end_7a} :catch_7b

    goto :goto_12

    .line 127
    .end local v0    # "cookie":Lorg/apache/http/cookie/Cookie;
    .end local v1    # "cookies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    .end local v2    # "ex":Lorg/apache/http/cookie/MalformedCookieException;
    .end local v4    # "i$":Ljava/util/Iterator;
    :catch_7b
    move-exception v2

    .line 128
    .restart local v2    # "ex":Lorg/apache/http/cookie/MalformedCookieException;
    iget-object v5, p0, Lorg/apache/http/client/protocol/ResponseProcessCookies;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v5}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 129
    iget-object v5, p0, Lorg/apache/http/client/protocol/ResponseProcessCookies;->log:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid cookie header: \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\". "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Lorg/apache/http/cookie/MalformedCookieException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 134
    .end local v2    # "ex":Lorg/apache/http/cookie/MalformedCookieException;
    .end local v3    # "header":Lorg/apache/http/Header;
    :cond_ac
    return-void
.end method


# virtual methods
.method public process(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V
    .registers 10
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    const-string v5, "HTTP request"

    invoke-static {p1, v5}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 68
    const-string v5, "HTTP context"

    invoke-static {p2, v5}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 70
    invoke-static {p2}, Lorg/apache/http/client/protocol/HttpClientContext;->adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/protocol/HttpClientContext;

    move-result-object v0

    .line 73
    .local v0, "clientContext":Lorg/apache/http/client/protocol/HttpClientContext;
    invoke-virtual {v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getCookieSpec()Lorg/apache/http/cookie/CookieSpec;

    move-result-object v2

    .line 74
    .local v2, "cookieSpec":Lorg/apache/http/cookie/CookieSpec;
    if-nez v2, :cond_1c

    .line 75
    iget-object v5, p0, Lorg/apache/http/client/protocol/ResponseProcessCookies;->log:Lorg/apache/commons/logging/Log;

    const-string v6, "Cookie spec not specified in HTTP context"

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 100
    :cond_1b
    :goto_1b
    return-void

    .line 79
    :cond_1c
    invoke-virtual {v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getCookieStore()Lorg/apache/http/client/CookieStore;

    move-result-object v3

    .line 80
    .local v3, "cookieStore":Lorg/apache/http/client/CookieStore;
    if-nez v3, :cond_2a

    .line 81
    iget-object v5, p0, Lorg/apache/http/client/protocol/ResponseProcessCookies;->log:Lorg/apache/commons/logging/Log;

    const-string v6, "Cookie store not specified in HTTP context"

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_1b

    .line 85
    :cond_2a
    invoke-virtual {v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getCookieOrigin()Lorg/apache/http/cookie/CookieOrigin;

    move-result-object v1

    .line 86
    .local v1, "cookieOrigin":Lorg/apache/http/cookie/CookieOrigin;
    if-nez v1, :cond_38

    .line 87
    iget-object v5, p0, Lorg/apache/http/client/protocol/ResponseProcessCookies;->log:Lorg/apache/commons/logging/Log;

    const-string v6, "Cookie origin not specified in HTTP context"

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_1b

    .line 90
    :cond_38
    const-string v5, "Set-Cookie"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->headerIterator(Ljava/lang/String;)Lorg/apache/http/HeaderIterator;

    move-result-object v4

    .line 91
    .local v4, "it":Lorg/apache/http/HeaderIterator;
    invoke-direct {p0, v4, v2, v1, v3}, Lorg/apache/http/client/protocol/ResponseProcessCookies;->processCookies(Lorg/apache/http/HeaderIterator;Lorg/apache/http/cookie/CookieSpec;Lorg/apache/http/cookie/CookieOrigin;Lorg/apache/http/client/CookieStore;)V

    .line 94
    invoke-interface {v2}, Lorg/apache/http/cookie/CookieSpec;->getVersion()I

    move-result v5

    if-lez v5, :cond_1b

    .line 97
    const-string v5, "Set-Cookie2"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->headerIterator(Ljava/lang/String;)Lorg/apache/http/HeaderIterator;

    move-result-object v4

    .line 98
    invoke-direct {p0, v4, v2, v1, v3}, Lorg/apache/http/client/protocol/ResponseProcessCookies;->processCookies(Lorg/apache/http/HeaderIterator;Lorg/apache/http/cookie/CookieSpec;Lorg/apache/http/cookie/CookieOrigin;Lorg/apache/http/client/CookieStore;)V

    goto :goto_1b
.end method
