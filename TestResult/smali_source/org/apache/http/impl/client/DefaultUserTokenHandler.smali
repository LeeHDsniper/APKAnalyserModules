.class public Lorg/apache/http/impl/client/DefaultUserTokenHandler;
.super Ljava/lang/Object;
.source "DefaultUserTokenHandler.java"

# interfaces
.implements Lorg/apache/http/client/UserTokenHandler;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final INSTANCE:Lorg/apache/http/impl/client/DefaultUserTokenHandler;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 60
    new-instance v0, Lorg/apache/http/impl/client/DefaultUserTokenHandler;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultUserTokenHandler;-><init>()V

    sput-object v0, Lorg/apache/http/impl/client/DefaultUserTokenHandler;->INSTANCE:Lorg/apache/http/impl/client/DefaultUserTokenHandler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getAuthPrincipal(Lorg/apache/http/auth/AuthState;)Ljava/security/Principal;
    .registers 4
    .param p0, "authState"    # Lorg/apache/http/auth/AuthState;

    .prologue
    .line 91
    invoke-virtual {p0}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v1

    .line 92
    .local v1, "scheme":Lorg/apache/http/auth/AuthScheme;
    if-eqz v1, :cond_1d

    invoke-interface {v1}, Lorg/apache/http/auth/AuthScheme;->isComplete()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v1}, Lorg/apache/http/auth/AuthScheme;->isConnectionBased()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 93
    invoke-virtual {p0}, Lorg/apache/http/auth/AuthState;->getCredentials()Lorg/apache/http/auth/Credentials;

    move-result-object v0

    .line 94
    .local v0, "creds":Lorg/apache/http/auth/Credentials;
    if-eqz v0, :cond_1d

    .line 95
    invoke-interface {v0}, Lorg/apache/http/auth/Credentials;->getUserPrincipal()Ljava/security/Principal;

    move-result-object v2

    .line 98
    .end local v0    # "creds":Lorg/apache/http/auth/Credentials;
    :goto_1c
    return-object v2

    :cond_1d
    const/4 v2, 0x0

    goto :goto_1c
.end method


# virtual methods
.method public getUserToken(Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;
    .registers 9
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 64
    invoke-static {p1}, Lorg/apache/http/client/protocol/HttpClientContext;->adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/protocol/HttpClientContext;

    move-result-object v0

    .line 66
    .local v0, "clientContext":Lorg/apache/http/client/protocol/HttpClientContext;
    const/4 v5, 0x0

    .line 68
    .local v5, "userPrincipal":Ljava/security/Principal;
    invoke-virtual {v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetAuthState()Lorg/apache/http/auth/AuthState;

    move-result-object v4

    .line 69
    .local v4, "targetAuthState":Lorg/apache/http/auth/AuthState;
    if-eqz v4, :cond_19

    .line 70
    invoke-static {v4}, Lorg/apache/http/impl/client/DefaultUserTokenHandler;->getAuthPrincipal(Lorg/apache/http/auth/AuthState;)Ljava/security/Principal;

    move-result-object v5

    .line 71
    if-nez v5, :cond_19

    .line 72
    invoke-virtual {v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getProxyAuthState()Lorg/apache/http/auth/AuthState;

    move-result-object v2

    .line 73
    .local v2, "proxyAuthState":Lorg/apache/http/auth/AuthState;
    invoke-static {v2}, Lorg/apache/http/impl/client/DefaultUserTokenHandler;->getAuthPrincipal(Lorg/apache/http/auth/AuthState;)Ljava/security/Principal;

    move-result-object v5

    .line 77
    .end local v2    # "proxyAuthState":Lorg/apache/http/auth/AuthState;
    :cond_19
    if-nez v5, :cond_35

    .line 78
    invoke-virtual {v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getConnection()Lorg/apache/http/HttpConnection;

    move-result-object v1

    .line 79
    .local v1, "conn":Lorg/apache/http/HttpConnection;
    invoke-interface {v1}, Lorg/apache/http/HttpConnection;->isOpen()Z

    move-result v6

    if-eqz v6, :cond_35

    instance-of v6, v1, Lorg/apache/http/conn/ManagedHttpClientConnection;

    if-eqz v6, :cond_35

    .line 80
    check-cast v1, Lorg/apache/http/conn/ManagedHttpClientConnection;

    .end local v1    # "conn":Lorg/apache/http/HttpConnection;
    invoke-interface {v1}, Lorg/apache/http/conn/ManagedHttpClientConnection;->getSSLSession()Ljavax/net/ssl/SSLSession;

    move-result-object v3

    .line 81
    .local v3, "sslsession":Ljavax/net/ssl/SSLSession;
    if-eqz v3, :cond_35

    .line 82
    invoke-interface {v3}, Ljavax/net/ssl/SSLSession;->getLocalPrincipal()Ljava/security/Principal;

    move-result-object v5

    .line 87
    .end local v3    # "sslsession":Ljavax/net/ssl/SSLSession;
    :cond_35
    return-object v5
.end method
