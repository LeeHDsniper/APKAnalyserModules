.class abstract Lorg/apache/http/client/protocol/RequestAuthenticationBase;
.super Ljava/lang/Object;
.source "RequestAuthenticationBase.java"

# interfaces
.implements Lorg/apache/http/HttpRequestInterceptor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/client/protocol/RequestAuthenticationBase$1;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field final log:Lorg/apache/commons/logging/Log;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/protocol/RequestAuthenticationBase;->log:Lorg/apache/commons/logging/Log;

    .line 53
    return-void
.end method

.method private authenticate(Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;
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
    .line 118
    const-string v0, "Auth scheme"

    invoke-static {p1, v0}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 119
    instance-of v0, p1, Lorg/apache/http/auth/ContextAwareAuthScheme;

    if-eqz v0, :cond_10

    .line 120
    check-cast p1, Lorg/apache/http/auth/ContextAwareAuthScheme;

    .end local p1    # "authScheme":Lorg/apache/http/auth/AuthScheme;
    invoke-interface {p1, p2, p3, p4}, Lorg/apache/http/auth/ContextAwareAuthScheme;->authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;

    move-result-object v0

    .line 122
    :goto_f
    return-object v0

    .restart local p1    # "authScheme":Lorg/apache/http/auth/AuthScheme;
    :cond_10
    invoke-interface {p1, p2, p3}, Lorg/apache/http/auth/AuthScheme;->authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;)Lorg/apache/http/Header;

    move-result-object v0

    goto :goto_f
.end method

.method private ensureAuthScheme(Lorg/apache/http/auth/AuthScheme;)V
    .registers 3
    .param p1, "authScheme"    # Lorg/apache/http/auth/AuthScheme;

    .prologue
    .line 110
    const-string v0, "Auth scheme"

    invoke-static {p1, v0}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 111
    return-void
.end method


# virtual methods
.method process(Lorg/apache/http/auth/AuthState;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V
    .registers 13
    .param p1, "authState"    # Lorg/apache/http/auth/AuthState;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 59
    invoke-virtual {p1}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v2

    .line 60
    .local v2, "authScheme":Lorg/apache/http/auth/AuthScheme;
    invoke-virtual {p1}, Lorg/apache/http/auth/AuthState;->getCredentials()Lorg/apache/http/auth/Credentials;

    move-result-object v3

    .line 61
    .local v3, "creds":Lorg/apache/http/auth/Credentials;
    sget-object v6, Lorg/apache/http/client/protocol/RequestAuthenticationBase$1;->$SwitchMap$org$apache$http$auth$AuthProtocolState:[I

    invoke-virtual {p1}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/http/auth/AuthProtocolState;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_d4

    .line 97
    :cond_17
    :goto_17
    if-eqz v2, :cond_20

    .line 99
    :try_start_19
    invoke-direct {p0, v2, v3, p2, p3}, Lorg/apache/http/client/protocol/RequestAuthenticationBase;->authenticate(Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;

    move-result-object v5

    .line 100
    .local v5, "header":Lorg/apache/http/Header;
    invoke-interface {p2, v5}, Lorg/apache/http/HttpRequest;->addHeader(Lorg/apache/http/Header;)V
    :try_end_20
    .catch Lorg/apache/http/auth/AuthenticationException; {:try_start_19 .. :try_end_20} :catch_a9

    .line 107
    .end local v5    # "header":Lorg/apache/http/Header;
    :cond_20
    :goto_20
    :pswitch_20
    return-void

    .line 65
    :pswitch_21
    invoke-direct {p0, v2}, Lorg/apache/http/client/protocol/RequestAuthenticationBase;->ensureAuthScheme(Lorg/apache/http/auth/AuthScheme;)V

    .line 66
    invoke-interface {v2}, Lorg/apache/http/auth/AuthScheme;->isConnectionBased()Z

    move-result v6

    if-eqz v6, :cond_17

    goto :goto_20

    .line 71
    :pswitch_2b
    invoke-virtual {p1}, Lorg/apache/http/auth/AuthState;->getAuthOptions()Ljava/util/Queue;

    move-result-object v1

    .line 72
    .local v1, "authOptions":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/apache/http/auth/AuthOption;>;"
    if-eqz v1, :cond_a4

    .line 73
    :cond_31
    :goto_31
    invoke-interface {v1}, Ljava/util/Queue;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_20

    .line 74
    invoke-interface {v1}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/auth/AuthOption;

    .line 75
    .local v0, "authOption":Lorg/apache/http/auth/AuthOption;
    invoke-virtual {v0}, Lorg/apache/http/auth/AuthOption;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v2

    .line 76
    invoke-virtual {v0}, Lorg/apache/http/auth/AuthOption;->getCredentials()Lorg/apache/http/auth/Credentials;

    move-result-object v3

    .line 77
    invoke-virtual {p1, v2, v3}, Lorg/apache/http/auth/AuthState;->update(Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/auth/Credentials;)V

    .line 78
    iget-object v6, p0, Lorg/apache/http/client/protocol/RequestAuthenticationBase;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_72

    .line 79
    iget-object v6, p0, Lorg/apache/http/client/protocol/RequestAuthenticationBase;->log:Lorg/apache/commons/logging/Log;

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

    .line 83
    :cond_72
    :try_start_72
    invoke-direct {p0, v2, v3, p2, p3}, Lorg/apache/http/client/protocol/RequestAuthenticationBase;->authenticate(Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;

    move-result-object v5

    .line 84
    .restart local v5    # "header":Lorg/apache/http/Header;
    invoke-interface {p2, v5}, Lorg/apache/http/HttpRequest;->addHeader(Lorg/apache/http/Header;)V
    :try_end_79
    .catch Lorg/apache/http/auth/AuthenticationException; {:try_start_72 .. :try_end_79} :catch_7a

    goto :goto_20

    .line 86
    .end local v5    # "header":Lorg/apache/http/Header;
    :catch_7a
    move-exception v4

    .line 87
    .local v4, "ex":Lorg/apache/http/auth/AuthenticationException;
    iget-object v6, p0, Lorg/apache/http/client/protocol/RequestAuthenticationBase;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v6

    if-eqz v6, :cond_31

    .line 88
    iget-object v6, p0, Lorg/apache/http/client/protocol/RequestAuthenticationBase;->log:Lorg/apache/commons/logging/Log;

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

    .line 94
    .end local v0    # "authOption":Lorg/apache/http/auth/AuthOption;
    .end local v4    # "ex":Lorg/apache/http/auth/AuthenticationException;
    :cond_a4
    invoke-direct {p0, v2}, Lorg/apache/http/client/protocol/RequestAuthenticationBase;->ensureAuthScheme(Lorg/apache/http/auth/AuthScheme;)V

    goto/16 :goto_17

    .line 101
    .end local v1    # "authOptions":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/apache/http/auth/AuthOption;>;"
    :catch_a9
    move-exception v4

    .line 102
    .restart local v4    # "ex":Lorg/apache/http/auth/AuthenticationException;
    iget-object v6, p0, Lorg/apache/http/client/protocol/RequestAuthenticationBase;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isErrorEnabled()Z

    move-result v6

    if-eqz v6, :cond_20

    .line 103
    iget-object v6, p0, Lorg/apache/http/client/protocol/RequestAuthenticationBase;->log:Lorg/apache/commons/logging/Log;

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

    .line 61
    :pswitch_data_d4
    .packed-switch 0x1
        :pswitch_20
        :pswitch_21
        :pswitch_2b
    .end packed-switch
.end method
