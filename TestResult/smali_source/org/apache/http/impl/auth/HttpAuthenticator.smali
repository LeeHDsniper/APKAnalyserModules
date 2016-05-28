.class public Lorg/apache/http/impl/auth/HttpAuthenticator;
.super Ljava/lang/Object;
.source "HttpAuthenticator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/auth/HttpAuthenticator$1;
    }
.end annotation


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/http/impl/auth/HttpAuthenticator;-><init>(Lorg/apache/commons/logging/Log;)V

    .line 68
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/logging/Log;)V
    .registers 3
    .param p1, "log"    # Lorg/apache/commons/logging/Log;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    if-eqz p1, :cond_8

    .end local p1    # "log":Lorg/apache/commons/logging/Log;
    :goto_5
    iput-object p1, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    .line 64
    return-void

    .line 63
    .restart local p1    # "log":Lorg/apache/commons/logging/Log;
    :cond_8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object p1

    goto :goto_5
.end method

.method private doAuth(Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;
    .registers 6
    .param p1, "authScheme"    # Lorg/apache/http/auth/AuthScheme;
    .param p2, "creds"    # Lorg/apache/http/auth/Credentials;
    .param p3, "request"    # Lorg/apache/http/HttpRequest;
    .param p4, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/AuthenticationException;
        }
    .end annotation

    .prologue
    .line 238
    instance-of v0, p1, Lorg/apache/http/auth/ContextAwareAuthScheme;

    if-eqz v0, :cond_b

    .line 239
    check-cast p1, Lorg/apache/http/auth/ContextAwareAuthScheme;

    .end local p1    # "authScheme":Lorg/apache/http/auth/AuthScheme;
    invoke-interface {p1, p2, p3, p4}, Lorg/apache/http/auth/ContextAwareAuthScheme;->authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;

    move-result-object v0

    .line 241
    :goto_a
    return-object v0

    .restart local p1    # "authScheme":Lorg/apache/http/auth/AuthScheme;
    :cond_b
    invoke-interface {p1, p2, p3}, Lorg/apache/http/auth/AuthScheme;->authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;)Lorg/apache/http/Header;

    move-result-object v0

    goto :goto_a
.end method

.method private ensureAuthScheme(Lorg/apache/http/auth/AuthScheme;)V
    .registers 3
    .param p1, "authScheme"    # Lorg/apache/http/auth/AuthScheme;

    .prologue
    .line 229
    const-string v0, "Auth scheme"

    invoke-static {p1, v0}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 230
    return-void
.end method


# virtual methods
.method public generateAuthResponse(Lorg/apache/http/HttpRequest;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)V
    .registers 13
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "authState"    # Lorg/apache/http/auth/AuthState;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    invoke-virtual {p2}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v2

    .line 179
    .local v2, "authScheme":Lorg/apache/http/auth/AuthScheme;
    invoke-virtual {p2}, Lorg/apache/http/auth/AuthState;->getCredentials()Lorg/apache/http/auth/Credentials;

    move-result-object v3

    .line 180
    .local v3, "creds":Lorg/apache/http/auth/Credentials;
    sget-object v6, Lorg/apache/http/impl/auth/HttpAuthenticator$1;->$SwitchMap$org$apache$http$auth$AuthProtocolState:[I

    invoke-virtual {p2}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/http/auth/AuthProtocolState;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_d4

    .line 216
    :cond_17
    :goto_17
    :pswitch_17
    if-eqz v2, :cond_20

    .line 218
    :try_start_19
    invoke-direct {p0, v2, v3, p1, p3}, Lorg/apache/http/impl/auth/HttpAuthenticator;->doAuth(Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;

    move-result-object v5

    .line 219
    .local v5, "header":Lorg/apache/http/Header;
    invoke-interface {p1, v5}, Lorg/apache/http/HttpRequest;->addHeader(Lorg/apache/http/Header;)V
    :try_end_20
    .catch Lorg/apache/http/auth/AuthenticationException; {:try_start_19 .. :try_end_20} :catch_a9

    .line 226
    .end local v5    # "header":Lorg/apache/http/Header;
    :cond_20
    :goto_20
    :pswitch_20
    return-void

    .line 184
    :pswitch_21
    invoke-direct {p0, v2}, Lorg/apache/http/impl/auth/HttpAuthenticator;->ensureAuthScheme(Lorg/apache/http/auth/AuthScheme;)V

    .line 185
    invoke-interface {v2}, Lorg/apache/http/auth/AuthScheme;->isConnectionBased()Z

    move-result v6

    if-eqz v6, :cond_17

    goto :goto_20

    .line 190
    :pswitch_2b
    invoke-virtual {p2}, Lorg/apache/http/auth/AuthState;->getAuthOptions()Ljava/util/Queue;

    move-result-object v1

    .line 191
    .local v1, "authOptions":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/apache/http/auth/AuthOption;>;"
    if-eqz v1, :cond_a4

    .line 192
    :cond_31
    :goto_31
    invoke-interface {v1}, Ljava/util/Queue;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_20

    .line 193
    invoke-interface {v1}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/auth/AuthOption;

    .line 194
    .local v0, "authOption":Lorg/apache/http/auth/AuthOption;
    invoke-virtual {v0}, Lorg/apache/http/auth/AuthOption;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v2

    .line 195
    invoke-virtual {v0}, Lorg/apache/http/auth/AuthOption;->getCredentials()Lorg/apache/http/auth/Credentials;

    move-result-object v3

    .line 196
    invoke-virtual {p2, v2, v3}, Lorg/apache/http/auth/AuthState;->update(Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/auth/Credentials;)V

    .line 197
    iget-object v6, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_72

    .line 198
    iget-object v6, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Generating response to an authentication challenge using "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v2}, Lorg/apache/http/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " scheme"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 202
    :cond_72
    :try_start_72
    invoke-direct {p0, v2, v3, p1, p3}, Lorg/apache/http/impl/auth/HttpAuthenticator;->doAuth(Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;

    move-result-object v5

    .line 203
    .restart local v5    # "header":Lorg/apache/http/Header;
    invoke-interface {p1, v5}, Lorg/apache/http/HttpRequest;->addHeader(Lorg/apache/http/Header;)V
    :try_end_79
    .catch Lorg/apache/http/auth/AuthenticationException; {:try_start_72 .. :try_end_79} :catch_7a

    goto :goto_20

    .line 205
    .end local v5    # "header":Lorg/apache/http/Header;
    :catch_7a
    move-exception v4

    .line 206
    .local v4, "ex":Lorg/apache/http/auth/AuthenticationException;
    iget-object v6, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v6

    if-eqz v6, :cond_31

    .line 207
    iget-object v6, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " authentication error: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Lorg/apache/http/auth/AuthenticationException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    goto :goto_31

    .line 213
    .end local v0    # "authOption":Lorg/apache/http/auth/AuthOption;
    .end local v4    # "ex":Lorg/apache/http/auth/AuthenticationException;
    :cond_a4
    invoke-direct {p0, v2}, Lorg/apache/http/impl/auth/HttpAuthenticator;->ensureAuthScheme(Lorg/apache/http/auth/AuthScheme;)V

    goto/16 :goto_17

    .line 220
    .end local v1    # "authOptions":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/apache/http/auth/AuthOption;>;"
    :catch_a9
    move-exception v4

    .line 221
    .restart local v4    # "ex":Lorg/apache/http/auth/AuthenticationException;
    iget-object v6, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isErrorEnabled()Z

    move-result v6

    if-eqz v6, :cond_20

    .line 222
    iget-object v6, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " authentication error: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Lorg/apache/http/auth/AuthenticationException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    goto/16 :goto_20

    .line 180
    :pswitch_data_d4
    .packed-switch 0x1
        :pswitch_2b
        :pswitch_17
        :pswitch_21
        :pswitch_20
    .end packed-switch
.end method

.method public handleAuthChallenge(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z
    .registers 15
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .param p3, "authStrategy"    # Lorg/apache/http/client/AuthenticationStrategy;
    .param p4, "authState"    # Lorg/apache/http/auth/AuthState;
    .param p5, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 106
    :try_start_0
    iget-object v6, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_24

    .line 107
    iget-object v6, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " requested authentication"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 109
    :cond_24
    invoke-interface {p3, p1, p2, p5}, Lorg/apache/http/client/AuthenticationStrategy;->getChallenges(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Ljava/util/Map;

    move-result-object v3

    .line 110
    .local v3, "challenges":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/Header;>;"
    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_37

    .line 111
    iget-object v6, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    const-string v7, "Response contains no authentication challenges"

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 112
    const/4 v6, 0x0

    .line 170
    .end local v3    # "challenges":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/Header;>;"
    :goto_36
    return v6

    .line 115
    .restart local v3    # "challenges":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/Header;>;"
    :cond_37
    invoke-virtual {p4}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v1

    .line 116
    .local v1, "authScheme":Lorg/apache/http/auth/AuthScheme;
    sget-object v6, Lorg/apache/http/impl/auth/HttpAuthenticator$1;->$SwitchMap$org$apache$http$auth$AuthProtocolState:[I

    invoke-virtual {p4}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/http/auth/AuthProtocolState;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_116

    .line 154
    :cond_4a
    :goto_4a
    invoke-interface {p3, v3, p1, p2, p5}, Lorg/apache/http/client/AuthenticationStrategy;->select(Ljava/util/Map;Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Ljava/util/Queue;

    move-result-object v0

    .line 155
    .local v0, "authOptions":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/apache/http/auth/AuthOption;>;"
    if-eqz v0, :cond_112

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_112

    .line 156
    iget-object v6, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_76

    .line 157
    iget-object v6, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Selected authentication options: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 159
    :cond_76
    sget-object v6, Lorg/apache/http/auth/AuthProtocolState;->CHALLENGED:Lorg/apache/http/auth/AuthProtocolState;

    invoke-virtual {p4, v6}, Lorg/apache/http/auth/AuthState;->setState(Lorg/apache/http/auth/AuthProtocolState;)V

    .line 160
    invoke-virtual {p4, v0}, Lorg/apache/http/auth/AuthState;->update(Ljava/util/Queue;)V

    .line 161
    const/4 v6, 0x1

    goto :goto_36

    .line 118
    .end local v0    # "authOptions":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/apache/http/auth/AuthOption;>;"
    :pswitch_80
    const/4 v6, 0x0

    goto :goto_36

    .line 120
    :pswitch_82
    invoke-virtual {p4}, Lorg/apache/http/auth/AuthState;->reset()V
    :try_end_85
    .catch Lorg/apache/http/auth/MalformedChallengeException; {:try_start_0 .. :try_end_85} :catch_86

    goto :goto_4a

    .line 165
    .end local v1    # "authScheme":Lorg/apache/http/auth/AuthScheme;
    .end local v3    # "challenges":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/Header;>;"
    :catch_86
    move-exception v4

    .line 166
    .local v4, "ex":Lorg/apache/http/auth/MalformedChallengeException;
    iget-object v6, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v6

    if-eqz v6, :cond_ab

    .line 167
    iget-object v6, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Malformed challenge: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Lorg/apache/http/auth/MalformedChallengeException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 169
    :cond_ab
    invoke-virtual {p4}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 170
    const/4 v6, 0x0

    goto :goto_36

    .line 124
    .end local v4    # "ex":Lorg/apache/http/auth/MalformedChallengeException;
    .restart local v1    # "authScheme":Lorg/apache/http/auth/AuthScheme;
    .restart local v3    # "challenges":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/Header;>;"
    :pswitch_b0
    if-nez v1, :cond_c8

    .line 125
    :try_start_b2
    iget-object v6, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    const-string v7, "Auth scheme is null"

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 126
    const/4 v6, 0x0

    invoke-interface {p3, p1, v6, p5}, Lorg/apache/http/client/AuthenticationStrategy;->authFailed(Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/protocol/HttpContext;)V

    .line 127
    invoke-virtual {p4}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 128
    sget-object v6, Lorg/apache/http/auth/AuthProtocolState;->FAILURE:Lorg/apache/http/auth/AuthProtocolState;

    invoke-virtual {p4, v6}, Lorg/apache/http/auth/AuthState;->setState(Lorg/apache/http/auth/AuthProtocolState;)V

    .line 129
    const/4 v6, 0x0

    goto/16 :goto_36

    .line 132
    :cond_c8
    :pswitch_c8
    if-eqz v1, :cond_4a

    .line 133
    invoke-interface {v1}, Lorg/apache/http/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v5

    .line 134
    .local v5, "id":Ljava/lang/String;
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/http/Header;

    .line 135
    .local v2, "challenge":Lorg/apache/http/Header;
    if-eqz v2, :cond_10d

    .line 136
    iget-object v6, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    const-string v7, "Authorization challenge processed"

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 137
    invoke-interface {v1, v2}, Lorg/apache/http/auth/AuthScheme;->processChallenge(Lorg/apache/http/Header;)V

    .line 138
    invoke-interface {v1}, Lorg/apache/http/auth/AuthScheme;->isComplete()Z

    move-result v6

    if-eqz v6, :cond_105

    .line 139
    iget-object v6, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    const-string v7, "Authentication failed"

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 140
    invoke-virtual {p4}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v6

    invoke-interface {p3, p1, v6, p5}, Lorg/apache/http/client/AuthenticationStrategy;->authFailed(Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/protocol/HttpContext;)V

    .line 141
    invoke-virtual {p4}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 142
    sget-object v6, Lorg/apache/http/auth/AuthProtocolState;->FAILURE:Lorg/apache/http/auth/AuthProtocolState;

    invoke-virtual {p4, v6}, Lorg/apache/http/auth/AuthState;->setState(Lorg/apache/http/auth/AuthProtocolState;)V

    .line 143
    const/4 v6, 0x0

    goto/16 :goto_36

    .line 145
    :cond_105
    sget-object v6, Lorg/apache/http/auth/AuthProtocolState;->HANDSHAKE:Lorg/apache/http/auth/AuthProtocolState;

    invoke-virtual {p4, v6}, Lorg/apache/http/auth/AuthState;->setState(Lorg/apache/http/auth/AuthProtocolState;)V

    .line 146
    const/4 v6, 0x1

    goto/16 :goto_36

    .line 149
    :cond_10d
    invoke-virtual {p4}, Lorg/apache/http/auth/AuthState;->reset()V
    :try_end_110
    .catch Lorg/apache/http/auth/MalformedChallengeException; {:try_start_b2 .. :try_end_110} :catch_86

    goto/16 :goto_4a

    .line 163
    .end local v2    # "challenge":Lorg/apache/http/Header;
    .end local v5    # "id":Ljava/lang/String;
    .restart local v0    # "authOptions":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/apache/http/auth/AuthOption;>;"
    :cond_112
    const/4 v6, 0x0

    goto/16 :goto_36

    .line 116
    nop

    :pswitch_data_116
    .packed-switch 0x1
        :pswitch_b0
        :pswitch_b0
        :pswitch_82
        :pswitch_80
        :pswitch_c8
    .end packed-switch
.end method

.method public isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z
    .registers 8
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .param p3, "authStrategy"    # Lorg/apache/http/client/AuthenticationStrategy;
    .param p4, "authState"    # Lorg/apache/http/auth/AuthState;
    .param p5, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 76
    invoke-interface {p3, p1, p2, p5}, Lorg/apache/http/client/AuthenticationStrategy;->isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 77
    iget-object v0, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    const-string v1, "Authentication required"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 78
    invoke-virtual {p4}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v0

    sget-object v1, Lorg/apache/http/auth/AuthProtocolState;->SUCCESS:Lorg/apache/http/auth/AuthProtocolState;

    if-ne v0, v1, :cond_1c

    .line 79
    invoke-virtual {p4}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v0

    invoke-interface {p3, p1, v0, p5}, Lorg/apache/http/client/AuthenticationStrategy;->authFailed(Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/protocol/HttpContext;)V

    .line 81
    :cond_1c
    const/4 v0, 0x1

    .line 95
    :goto_1d
    return v0

    .line 83
    :cond_1e
    sget-object v0, Lorg/apache/http/impl/auth/HttpAuthenticator$1;->$SwitchMap$org$apache$http$auth$AuthProtocolState:[I

    invoke-virtual {p4}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/http/auth/AuthProtocolState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_48

    .line 93
    sget-object v0, Lorg/apache/http/auth/AuthProtocolState;->UNCHALLENGED:Lorg/apache/http/auth/AuthProtocolState;

    invoke-virtual {p4, v0}, Lorg/apache/http/auth/AuthState;->setState(Lorg/apache/http/auth/AuthProtocolState;)V

    .line 95
    :goto_32
    :pswitch_32
    const/4 v0, 0x0

    goto :goto_1d

    .line 86
    :pswitch_34
    iget-object v0, p0, Lorg/apache/http/impl/auth/HttpAuthenticator;->log:Lorg/apache/commons/logging/Log;

    const-string v1, "Authentication succeeded"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 87
    sget-object v0, Lorg/apache/http/auth/AuthProtocolState;->SUCCESS:Lorg/apache/http/auth/AuthProtocolState;

    invoke-virtual {p4, v0}, Lorg/apache/http/auth/AuthState;->setState(Lorg/apache/http/auth/AuthProtocolState;)V

    .line 88
    invoke-virtual {p4}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v0

    invoke-interface {p3, p1, v0, p5}, Lorg/apache/http/client/AuthenticationStrategy;->authSucceeded(Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/protocol/HttpContext;)V

    goto :goto_32

    .line 83
    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_34
        :pswitch_34
        :pswitch_32
    .end packed-switch
.end method
