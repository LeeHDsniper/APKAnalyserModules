.class abstract Lorg/apache/http/impl/client/AuthenticationStrategyImpl;
.super Ljava/lang/Object;
.source "AuthenticationStrategyImpl.java"

# interfaces
.implements Lorg/apache/http/client/AuthenticationStrategy;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final DEFAULT_SCHEME_PRIORITY:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final challengeCode:I

.field private final headerName:Ljava/lang/String;

.field private final log:Lorg/apache/commons/logging/Log;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 70
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "negotiate"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Kerberos"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "NTLM"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Digest"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "Basic"

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->DEFAULT_SCHEME_PRIORITY:Ljava/util/List;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;)V
    .registers 4
    .param p1, "challengeCode"    # I
    .param p2, "headerName"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->log:Lorg/apache/commons/logging/Log;

    .line 82
    iput p1, p0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->challengeCode:I

    .line 83
    iput-object p2, p0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->headerName:Ljava/lang/String;

    .line 84
    return-void
.end method


# virtual methods
.method public authFailed(Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/protocol/HttpContext;)V
    .registers 9
    .param p1, "authhost"    # Lorg/apache/http/HttpHost;
    .param p2, "authScheme"    # Lorg/apache/http/auth/AuthScheme;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 231
    const-string v2, "Host"

    invoke-static {p1, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 232
    const-string v2, "HTTP context"

    invoke-static {p3, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 234
    invoke-static {p3}, Lorg/apache/http/client/protocol/HttpClientContext;->adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/protocol/HttpClientContext;

    move-result-object v1

    .line 236
    .local v1, "clientContext":Lorg/apache/http/client/protocol/HttpClientContext;
    invoke-virtual {v1}, Lorg/apache/http/client/protocol/HttpClientContext;->getAuthCache()Lorg/apache/http/client/AuthCache;

    move-result-object v0

    .line 237
    .local v0, "authCache":Lorg/apache/http/client/AuthCache;
    if-eqz v0, :cond_37

    .line 238
    iget-object v2, p0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_34

    .line 239
    iget-object v2, p0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Clearing cached auth scheme for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 241
    :cond_34
    invoke-interface {v0, p1}, Lorg/apache/http/client/AuthCache;->remove(Lorg/apache/http/HttpHost;)V

    .line 243
    :cond_37
    return-void
.end method

.method public authSucceeded(Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/protocol/HttpContext;)V
    .registers 9
    .param p1, "authhost"    # Lorg/apache/http/HttpHost;
    .param p2, "authScheme"    # Lorg/apache/http/auth/AuthScheme;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 200
    const-string v2, "Host"

    invoke-static {p1, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 201
    const-string v2, "Auth scheme"

    invoke-static {p2, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 202
    const-string v2, "HTTP context"

    invoke-static {p3, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 204
    invoke-static {p3}, Lorg/apache/http/client/protocol/HttpClientContext;->adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/protocol/HttpClientContext;

    move-result-object v1

    .line 206
    .local v1, "clientContext":Lorg/apache/http/client/protocol/HttpClientContext;
    invoke-virtual {p0, p2}, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->isCachable(Lorg/apache/http/auth/AuthScheme;)Z

    move-result v2

    if-eqz v2, :cond_58

    .line 207
    invoke-virtual {v1}, Lorg/apache/http/client/protocol/HttpClientContext;->getAuthCache()Lorg/apache/http/client/AuthCache;

    move-result-object v0

    .line 208
    .local v0, "authCache":Lorg/apache/http/client/AuthCache;
    if-nez v0, :cond_27

    .line 209
    new-instance v0, Lorg/apache/http/impl/client/BasicAuthCache;

    .end local v0    # "authCache":Lorg/apache/http/client/AuthCache;
    invoke-direct {v0}, Lorg/apache/http/impl/client/BasicAuthCache;-><init>()V

    .line 210
    .restart local v0    # "authCache":Lorg/apache/http/client/AuthCache;
    invoke-virtual {v1, v0}, Lorg/apache/http/client/protocol/HttpClientContext;->setAuthCache(Lorg/apache/http/client/AuthCache;)V

    .line 212
    :cond_27
    iget-object v2, p0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_55

    .line 213
    iget-object v2, p0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Caching \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p2}, Lorg/apache/http/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' auth scheme for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 216
    :cond_55
    invoke-interface {v0, p1, p2}, Lorg/apache/http/client/AuthCache;->put(Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;)V

    .line 218
    .end local v0    # "authCache":Lorg/apache/http/client/AuthCache;
    :cond_58
    return-void
.end method

.method public getChallenges(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Ljava/util/Map;
    .registers 17
    .param p1, "authhost"    # Lorg/apache/http/HttpHost;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/HttpHost;",
            "Lorg/apache/http/HttpResponse;",
            "Lorg/apache/http/protocol/HttpContext;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/http/Header;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/MalformedChallengeException;
        }
    .end annotation

    .prologue
    .line 99
    const-string v11, "HTTP response"

    invoke-static {p2, v11}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 100
    iget-object v11, p0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->headerName:Ljava/lang/String;

    invoke-interface {p2, v11}, Lorg/apache/http/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v5

    .line 101
    .local v5, "headers":[Lorg/apache/http/Header;
    new-instance v8, Ljava/util/HashMap;

    array-length v11, v5

    invoke-direct {v8, v11}, Ljava/util/HashMap;-><init>(I)V

    .line 102
    .local v8, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/Header;>;"
    move-object v0, v5

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v7, v0

    .local v7, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_14
    if-ge v6, v7, :cond_7e

    aget-object v4, v0, v6

    .line 105
    .local v4, "header":Lorg/apache/http/Header;
    instance-of v11, v4, Lorg/apache/http/FormattedHeader;

    if-eqz v11, :cond_3d

    move-object v11, v4

    .line 106
    check-cast v11, Lorg/apache/http/FormattedHeader;

    invoke-interface {v11}, Lorg/apache/http/FormattedHeader;->getBuffer()Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v2

    .local v2, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    move-object v11, v4

    .line 107
    check-cast v11, Lorg/apache/http/FormattedHeader;

    invoke-interface {v11}, Lorg/apache/http/FormattedHeader;->getValuePos()I

    move-result v9

    .line 117
    .local v9, "pos":I
    :goto_2a
    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v11

    if-ge v9, v11, :cond_59

    invoke-virtual {v2, v9}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v11

    invoke-static {v11}, Lorg/apache/http/protocol/HTTP;->isWhitespace(C)Z

    move-result v11

    if-eqz v11, :cond_59

    .line 118
    add-int/lit8 v9, v9, 0x1

    goto :goto_2a

    .line 109
    .end local v2    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    .end local v9    # "pos":I
    :cond_3d
    invoke-interface {v4}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v10

    .line 110
    .local v10, "s":Ljava/lang/String;
    if-nez v10, :cond_4b

    .line 111
    new-instance v11, Lorg/apache/http/auth/MalformedChallengeException;

    const-string v12, "Header value is null"

    invoke-direct {v11, v12}, Lorg/apache/http/auth/MalformedChallengeException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 113
    :cond_4b
    new-instance v2, Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    invoke-direct {v2, v11}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 114
    .restart local v2    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    invoke-virtual {v2, v10}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 115
    const/4 v9, 0x0

    .restart local v9    # "pos":I
    goto :goto_2a

    .line 120
    .end local v10    # "s":Ljava/lang/String;
    :cond_59
    move v1, v9

    .line 121
    .local v1, "beginIndex":I
    :goto_5a
    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v11

    if-ge v9, v11, :cond_6d

    invoke-virtual {v2, v9}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v11

    invoke-static {v11}, Lorg/apache/http/protocol/HTTP;->isWhitespace(C)Z

    move-result v11

    if-nez v11, :cond_6d

    .line 122
    add-int/lit8 v9, v9, 0x1

    goto :goto_5a

    .line 124
    :cond_6d
    move v3, v9

    .line 125
    .local v3, "endIndex":I
    invoke-virtual {v2, v1, v3}, Lorg/apache/http/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 126
    .restart local v10    # "s":Ljava/lang/String;
    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v10, v11}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v8, v11, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    add-int/lit8 v6, v6, 0x1

    goto :goto_14

    .line 128
    .end local v1    # "beginIndex":I
    .end local v2    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    .end local v3    # "endIndex":I
    .end local v4    # "header":Lorg/apache/http/Header;
    .end local v9    # "pos":I
    .end local v10    # "s":Ljava/lang/String;
    :cond_7e
    return-object v8
.end method

.method abstract getPreferredAuthSchemes(Lorg/apache/http/client/config/RequestConfig;)Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/client/config/RequestConfig;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z
    .registers 6
    .param p1, "authhost"    # Lorg/apache/http/HttpHost;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 90
    const-string v1, "HTTP response"

    invoke-static {p2, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 91
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    .line 92
    .local v0, "status":I
    iget v1, p0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->challengeCode:I

    if-ne v0, v1, :cond_13

    const/4 v1, 0x1

    :goto_12
    return v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method protected isCachable(Lorg/apache/http/auth/AuthScheme;)Z
    .registers 5
    .param p1, "authScheme"    # Lorg/apache/http/auth/AuthScheme;

    .prologue
    const/4 v1, 0x0

    .line 221
    if-eqz p1, :cond_9

    invoke-interface {p1}, Lorg/apache/http/auth/AuthScheme;->isComplete()Z

    move-result v2

    if-nez v2, :cond_a

    .line 225
    :cond_9
    :goto_9
    return v1

    .line 224
    :cond_a
    invoke-interface {p1}, Lorg/apache/http/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v0

    .line 225
    .local v0, "schemeName":Ljava/lang/String;
    const-string v2, "Basic"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1e

    const-string v2, "Digest"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    :cond_1e
    const/4 v1, 0x1

    goto :goto_9
.end method

.method public select(Ljava/util/Map;Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Ljava/util/Queue;
    .registers 26
    .param p2, "authhost"    # Lorg/apache/http/HttpHost;
    .param p3, "response"    # Lorg/apache/http/HttpResponse;
    .param p4, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/http/Header;",
            ">;",
            "Lorg/apache/http/HttpHost;",
            "Lorg/apache/http/HttpResponse;",
            "Lorg/apache/http/protocol/HttpContext;",
            ")",
            "Ljava/util/Queue",
            "<",
            "Lorg/apache/http/auth/AuthOption;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/MalformedChallengeException;
        }
    .end annotation

    .prologue
    .line 138
    .local p1, "challenges":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/Header;>;"
    const-string v17, "Map of auth challenges"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 139
    const-string v17, "Host"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 140
    const-string v17, "HTTP response"

    move-object/from16 v0, p3

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 141
    const-string v17, "HTTP context"

    move-object/from16 v0, p4

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 142
    invoke-static/range {p4 .. p4}, Lorg/apache/http/client/protocol/HttpClientContext;->adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/protocol/HttpClientContext;

    move-result-object v9

    .line 144
    .local v9, "clientContext":Lorg/apache/http/client/protocol/HttpClientContext;
    new-instance v15, Ljava/util/LinkedList;

    invoke-direct {v15}, Ljava/util/LinkedList;-><init>()V

    .line 145
    .local v15, "options":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/apache/http/auth/AuthOption;>;"
    invoke-virtual {v9}, Lorg/apache/http/client/protocol/HttpClientContext;->getAuthSchemeRegistry()Lorg/apache/http/config/Lookup;

    move-result-object v16

    .line 146
    .local v16, "registry":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/auth/AuthSchemeProvider;>;"
    if-nez v16, :cond_3f

    .line 147
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    const-string v18, "Auth scheme registry not set in the context"

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 195
    :cond_3e
    :goto_3e
    return-object v15

    .line 150
    :cond_3f
    invoke-virtual {v9}, Lorg/apache/http/client/protocol/HttpClientContext;->getCredentialsProvider()Lorg/apache/http/client/CredentialsProvider;

    move-result-object v12

    .line 151
    .local v12, "credsProvider":Lorg/apache/http/client/CredentialsProvider;
    if-nez v12, :cond_51

    .line 152
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    const-string v18, "Credentials provider not set in the context"

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_3e

    .line 155
    :cond_51
    invoke-virtual {v9}, Lorg/apache/http/client/protocol/HttpClientContext;->getRequestConfig()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v10

    .line 156
    .local v10, "config":Lorg/apache/http/client/config/RequestConfig;
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->getPreferredAuthSchemes(Lorg/apache/http/client/config/RequestConfig;)Ljava/util/Collection;

    move-result-object v4

    .line 157
    .local v4, "authPrefs":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    if-nez v4, :cond_5f

    .line 158
    sget-object v4, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->DEFAULT_SCHEME_PRIORITY:Ljava/util/List;

    .line 160
    :cond_5f
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v17

    if-eqz v17, :cond_89

    .line 161
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Authentication schemes in the order of preference: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 164
    :cond_89
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "i$":Ljava/util/Iterator;
    :cond_8d
    :goto_8d
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_3e

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 165
    .local v14, "id":Ljava/lang/String;
    sget-object v17, Ljava/util/Locale;->US:Ljava/util/Locale;

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/http/Header;

    .line 166
    .local v8, "challenge":Lorg/apache/http/Header;
    if-eqz v8, :cond_122

    .line 167
    move-object/from16 v0, v16

    invoke-interface {v0, v14}, Lorg/apache/http/config/Lookup;->lookup(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/http/auth/AuthSchemeProvider;

    .line 168
    .local v6, "authSchemeProvider":Lorg/apache/http/auth/AuthSchemeProvider;
    if-nez v6, :cond_e8

    .line 169
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v17

    if-eqz v17, :cond_8d

    .line 170
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Authentication scheme "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " not supported"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    goto :goto_8d

    .line 175
    :cond_e8
    move-object/from16 v0, p4

    invoke-interface {v6, v0}, Lorg/apache/http/auth/AuthSchemeProvider;->create(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/auth/AuthScheme;

    move-result-object v5

    .line 176
    .local v5, "authScheme":Lorg/apache/http/auth/AuthScheme;
    invoke-interface {v5, v8}, Lorg/apache/http/auth/AuthScheme;->processChallenge(Lorg/apache/http/Header;)V

    .line 178
    new-instance v7, Lorg/apache/http/auth/AuthScope;

    invoke-virtual/range {p2 .. p2}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {p2 .. p2}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v18

    invoke-interface {v5}, Lorg/apache/http/auth/AuthScheme;->getRealm()Ljava/lang/String;

    move-result-object v19

    invoke-interface {v5}, Lorg/apache/http/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v17

    move/from16 v1, v18

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    invoke-direct {v7, v0, v1, v2, v3}, Lorg/apache/http/auth/AuthScope;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 184
    .local v7, "authScope":Lorg/apache/http/auth/AuthScope;
    invoke-interface {v12, v7}, Lorg/apache/http/client/CredentialsProvider;->getCredentials(Lorg/apache/http/auth/AuthScope;)Lorg/apache/http/auth/Credentials;

    move-result-object v11

    .line 185
    .local v11, "credentials":Lorg/apache/http/auth/Credentials;
    if-eqz v11, :cond_8d

    .line 186
    new-instance v17, Lorg/apache/http/auth/AuthOption;

    move-object/from16 v0, v17

    invoke-direct {v0, v5, v11}, Lorg/apache/http/auth/AuthOption;-><init>(Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/auth/Credentials;)V

    move-object/from16 v0, v17

    invoke-interface {v15, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto/16 :goto_8d

    .line 189
    .end local v5    # "authScheme":Lorg/apache/http/auth/AuthScheme;
    .end local v6    # "authSchemeProvider":Lorg/apache/http/auth/AuthSchemeProvider;
    .end local v7    # "authScope":Lorg/apache/http/auth/AuthScope;
    .end local v11    # "credentials":Lorg/apache/http/auth/Credentials;
    :cond_122
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v17

    if-eqz v17, :cond_8d

    .line 190
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Challenge for "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " authentication scheme not available"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto/16 :goto_8d
.end method
