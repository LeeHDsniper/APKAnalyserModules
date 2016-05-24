.class public Lorg/apache/http/client/protocol/RequestAddCookies;
.super Ljava/lang/Object;
.source "RequestAddCookies.java"

# interfaces
.implements Lorg/apache/http/HttpRequestInterceptor;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    .line 74
    return-void
.end method


# virtual methods
.method public process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V
    .registers 34
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    const-string v28, "HTTP request"

    move-object/from16 v0, p1

    move-object/from16 v1, v28

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 79
    const-string v28, "HTTP context"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 81
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v28

    invoke-interface/range {v28 .. v28}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v15

    .line 82
    .local v15, "method":Ljava/lang/String;
    const-string v28, "CONNECT"

    move-object/from16 v0, v28

    invoke-virtual {v15, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v28

    if-eqz v28, :cond_25

    .line 202
    :goto_24
    return-void

    .line 86
    :cond_25
    invoke-static/range {p2 .. p2}, Lorg/apache/http/client/protocol/HttpClientContext;->adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/protocol/HttpClientContext;

    move-result-object v3

    .line 89
    .local v3, "clientContext":Lorg/apache/http/client/protocol/HttpClientContext;
    invoke-virtual {v3}, Lorg/apache/http/client/protocol/HttpClientContext;->getCookieStore()Lorg/apache/http/client/CookieStore;

    move-result-object v8

    .line 90
    .local v8, "cookieStore":Lorg/apache/http/client/CookieStore;
    if-nez v8, :cond_3b

    .line 91
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v28, v0

    const-string v29, "Cookie store not specified in HTTP context"

    invoke-interface/range {v28 .. v29}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_24

    .line 96
    :cond_3b
    invoke-virtual {v3}, Lorg/apache/http/client/protocol/HttpClientContext;->getCookieSpecRegistry()Lorg/apache/http/config/Lookup;

    move-result-object v22

    .line 97
    .local v22, "registry":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/cookie/CookieSpecProvider;>;"
    if-nez v22, :cond_4d

    .line 98
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v28, v0

    const-string v29, "CookieSpec registry not specified in HTTP context"

    invoke-interface/range {v28 .. v29}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_24

    .line 103
    :cond_4d
    invoke-virtual {v3}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v26

    .line 104
    .local v26, "targetHost":Lorg/apache/http/HttpHost;
    if-nez v26, :cond_5f

    .line 105
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v28, v0

    const-string v29, "Target host not set in the context"

    invoke-interface/range {v28 .. v29}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_24

    .line 110
    :cond_5f
    invoke-virtual {v3}, Lorg/apache/http/client/protocol/HttpClientContext;->getHttpRoute()Lorg/apache/http/conn/routing/RouteInfo;

    move-result-object v25

    .line 111
    .local v25, "route":Lorg/apache/http/conn/routing/RouteInfo;
    if-nez v25, :cond_71

    .line 112
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v28, v0

    const-string v29, "Connection route not set in the context"

    invoke-interface/range {v28 .. v29}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_24

    .line 116
    :cond_71
    invoke-virtual {v3}, Lorg/apache/http/client/protocol/HttpClientContext;->getRequestConfig()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v4

    .line 117
    .local v4, "config":Lorg/apache/http/client/config/RequestConfig;
    invoke-virtual {v4}, Lorg/apache/http/client/config/RequestConfig;->getCookieSpec()Ljava/lang/String;

    move-result-object v19

    .line 118
    .local v19, "policy":Ljava/lang/String;
    if-nez v19, :cond_7d

    .line 119
    const-string v19, "best-match"

    .line 121
    :cond_7d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v28, v0

    invoke-interface/range {v28 .. v28}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v28

    if-eqz v28, :cond_a9

    .line 122
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v28, v0

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "CookieSpec selected: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-interface/range {v28 .. v29}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 125
    :cond_a9
    const/16 v23, 0x0

    .line 126
    .local v23, "requestURI":Ljava/net/URI;
    move-object/from16 v0, p1

    instance-of v0, v0, Lorg/apache/http/client/methods/HttpUriRequest;

    move/from16 v28, v0

    if-eqz v28, :cond_113

    move-object/from16 v28, p1

    .line 127
    check-cast v28, Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-interface/range {v28 .. v28}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v23

    .line 134
    :goto_bb
    if-eqz v23, :cond_127

    invoke-virtual/range {v23 .. v23}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v18

    .line 135
    .local v18, "path":Ljava/lang/String;
    :goto_c1
    invoke-virtual/range {v26 .. v26}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v12

    .line 136
    .local v12, "hostName":Ljava/lang/String;
    invoke-virtual/range {v26 .. v26}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v20

    .line 137
    .local v20, "port":I
    if-gez v20, :cond_d3

    .line 138
    invoke-interface/range {v25 .. v25}, Lorg/apache/http/conn/routing/RouteInfo;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v20

    .line 141
    :cond_d3
    new-instance v6, Lorg/apache/http/cookie/CookieOrigin;

    if-ltz v20, :cond_12a

    .end local v20    # "port":I
    :goto_d7
    invoke-static/range {v18 .. v18}, Lorg/apache/http/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v28

    if-nez v28, :cond_12d

    .end local v18    # "path":Ljava/lang/String;
    :goto_dd
    invoke-interface/range {v25 .. v25}, Lorg/apache/http/conn/routing/RouteInfo;->isSecure()Z

    move-result v28

    move/from16 v0, v20

    move-object/from16 v1, v18

    move/from16 v2, v28

    invoke-direct {v6, v12, v0, v1, v2}, Lorg/apache/http/cookie/CookieOrigin;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    .line 148
    .local v6, "cookieOrigin":Lorg/apache/http/cookie/CookieOrigin;
    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Lorg/apache/http/config/Lookup;->lookup(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lorg/apache/http/cookie/CookieSpecProvider;

    .line 149
    .local v21, "provider":Lorg/apache/http/cookie/CookieSpecProvider;
    if-nez v21, :cond_130

    .line 150
    new-instance v28, Lorg/apache/http/HttpException;

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Unsupported cookie policy: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-direct/range {v28 .. v29}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw v28

    .line 130
    .end local v6    # "cookieOrigin":Lorg/apache/http/cookie/CookieOrigin;
    .end local v12    # "hostName":Ljava/lang/String;
    .end local v21    # "provider":Lorg/apache/http/cookie/CookieSpecProvider;
    :cond_113
    :try_start_113
    new-instance v24, Ljava/net/URI;

    invoke-interface/range {p1 .. p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v28

    invoke-interface/range {v28 .. v28}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v24

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_124
    .catch Ljava/net/URISyntaxException; {:try_start_113 .. :try_end_124} :catch_241

    .end local v23    # "requestURI":Ljava/net/URI;
    .local v24, "requestURI":Ljava/net/URI;
    move-object/from16 v23, v24

    .line 132
    .end local v24    # "requestURI":Ljava/net/URI;
    .restart local v23    # "requestURI":Ljava/net/URI;
    goto :goto_bb

    .line 134
    :cond_127
    const/16 v18, 0x0

    goto :goto_c1

    .line 141
    .restart local v12    # "hostName":Ljava/lang/String;
    .restart local v18    # "path":Ljava/lang/String;
    .restart local v20    # "port":I
    :cond_12a
    const/16 v20, 0x0

    goto :goto_d7

    .end local v20    # "port":I
    :cond_12d
    const-string v18, "/"

    goto :goto_dd

    .line 152
    .end local v18    # "path":Ljava/lang/String;
    .restart local v6    # "cookieOrigin":Lorg/apache/http/cookie/CookieOrigin;
    .restart local v21    # "provider":Lorg/apache/http/cookie/CookieSpecProvider;
    :cond_130
    move-object/from16 v0, v21

    invoke-interface {v0, v3}, Lorg/apache/http/cookie/CookieSpecProvider;->create(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/cookie/CookieSpec;

    move-result-object v7

    .line 154
    .local v7, "cookieSpec":Lorg/apache/http/cookie/CookieSpec;
    new-instance v9, Ljava/util/ArrayList;

    invoke-interface {v8}, Lorg/apache/http/client/CookieStore;->getCookies()Ljava/util/List;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-direct {v9, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 156
    .local v9, "cookies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 157
    .local v14, "matchedCookies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    new-instance v17, Ljava/util/Date;

    invoke-direct/range {v17 .. v17}, Ljava/util/Date;-><init>()V

    .line 158
    .local v17, "now":Ljava/util/Date;
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "i$":Ljava/util/Iterator;
    :cond_14f
    :goto_14f
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_1d5

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/http/cookie/Cookie;

    .line 159
    .local v5, "cookie":Lorg/apache/http/cookie/Cookie;
    move-object/from16 v0, v17

    invoke-interface {v5, v0}, Lorg/apache/http/cookie/Cookie;->isExpired(Ljava/util/Date;)Z

    move-result v28

    if-nez v28, :cond_1a3

    .line 160
    invoke-interface {v7, v5, v6}, Lorg/apache/http/cookie/CookieSpec;->match(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)Z

    move-result v28

    if-eqz v28, :cond_14f

    .line 161
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v28, v0

    invoke-interface/range {v28 .. v28}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v28

    if-eqz v28, :cond_19f

    .line 162
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v28, v0

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Cookie "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, " match "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-interface/range {v28 .. v29}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 164
    :cond_19f
    invoke-interface {v14, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_14f

    .line 167
    :cond_1a3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v28, v0

    invoke-interface/range {v28 .. v28}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v28

    if-eqz v28, :cond_14f

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v28, v0

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Cookie "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, " expired"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-interface/range {v28 .. v29}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto/16 :goto_14f

    .line 173
    .end local v5    # "cookie":Lorg/apache/http/cookie/Cookie;
    :cond_1d5
    invoke-interface {v14}, Ljava/util/List;->isEmpty()Z

    move-result v28

    if-nez v28, :cond_1f5

    .line 174
    invoke-interface {v7, v14}, Lorg/apache/http/cookie/CookieSpec;->formatCookies(Ljava/util/List;)Ljava/util/List;

    move-result-object v11

    .line 175
    .local v11, "headers":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/Header;>;"
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_1e3
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_1f5

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/apache/http/Header;

    .line 176
    .local v10, "header":Lorg/apache/http/Header;
    move-object/from16 v0, p1

    invoke-interface {v0, v10}, Lorg/apache/http/HttpRequest;->addHeader(Lorg/apache/http/Header;)V

    goto :goto_1e3

    .line 180
    .end local v10    # "header":Lorg/apache/http/Header;
    .end local v11    # "headers":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/Header;>;"
    :cond_1f5
    invoke-interface {v7}, Lorg/apache/http/cookie/CookieSpec;->getVersion()I

    move-result v27

    .line 181
    .local v27, "ver":I
    if-lez v27, :cond_22d

    .line 182
    const/16 v16, 0x0

    .line 183
    .local v16, "needVersionHeader":Z
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_201
    :goto_201
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_220

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/http/cookie/Cookie;

    .line 184
    .restart local v5    # "cookie":Lorg/apache/http/cookie/Cookie;
    invoke-interface {v5}, Lorg/apache/http/cookie/Cookie;->getVersion()I

    move-result v28

    move/from16 v0, v27

    move/from16 v1, v28

    if-ne v0, v1, :cond_21d

    instance-of v0, v5, Lorg/apache/http/cookie/SetCookie2;

    move/from16 v28, v0

    if-nez v28, :cond_201

    .line 185
    :cond_21d
    const/16 v16, 0x1

    goto :goto_201

    .line 189
    .end local v5    # "cookie":Lorg/apache/http/cookie/Cookie;
    :cond_220
    if-eqz v16, :cond_22d

    .line 190
    invoke-interface {v7}, Lorg/apache/http/cookie/CookieSpec;->getVersionHeader()Lorg/apache/http/Header;

    move-result-object v10

    .line 191
    .restart local v10    # "header":Lorg/apache/http/Header;
    if-eqz v10, :cond_22d

    .line 193
    move-object/from16 v0, p1

    invoke-interface {v0, v10}, Lorg/apache/http/HttpRequest;->addHeader(Lorg/apache/http/Header;)V

    .line 200
    .end local v10    # "header":Lorg/apache/http/Header;
    .end local v16    # "needVersionHeader":Z
    :cond_22d
    const-string v28, "http.cookie-spec"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-interface {v0, v1, v7}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 201
    const-string v28, "http.cookie-origin"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-interface {v0, v1, v6}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_24

    .line 131
    .end local v6    # "cookieOrigin":Lorg/apache/http/cookie/CookieOrigin;
    .end local v7    # "cookieSpec":Lorg/apache/http/cookie/CookieSpec;
    .end local v9    # "cookies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    .end local v12    # "hostName":Ljava/lang/String;
    .end local v13    # "i$":Ljava/util/Iterator;
    .end local v14    # "matchedCookies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    .end local v17    # "now":Ljava/util/Date;
    .end local v21    # "provider":Lorg/apache/http/cookie/CookieSpecProvider;
    .end local v27    # "ver":I
    :catch_241
    move-exception v28

    goto/16 :goto_bb
.end method
