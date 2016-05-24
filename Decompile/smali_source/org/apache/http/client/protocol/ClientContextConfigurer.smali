.class public Lorg/apache/http/client/protocol/ClientContextConfigurer;
.super Ljava/lang/Object;
.source "ClientContextConfigurer.java"

# interfaces
.implements Lorg/apache/http/client/protocol/ClientContext;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final context:Lorg/apache/http/protocol/HttpContext;


# direct methods
.method public constructor <init>(Lorg/apache/http/protocol/HttpContext;)V
    .registers 3
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const-string v0, "HTTP context"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 53
    iput-object p1, p0, Lorg/apache/http/client/protocol/ClientContextConfigurer;->context:Lorg/apache/http/protocol/HttpContext;

    .line 54
    return-void
.end method


# virtual methods
.method public setAuthSchemeRegistry(Lorg/apache/http/auth/AuthSchemeRegistry;)V
    .registers 4
    .param p1, "registry"    # Lorg/apache/http/auth/AuthSchemeRegistry;

    .prologue
    .line 61
    iget-object v0, p0, Lorg/apache/http/client/protocol/ClientContextConfigurer;->context:Lorg/apache/http/protocol/HttpContext;

    const-string v1, "http.authscheme-registry"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 62
    return-void
.end method

.method public setCookieSpecRegistry(Lorg/apache/http/cookie/CookieSpecRegistry;)V
    .registers 4
    .param p1, "registry"    # Lorg/apache/http/cookie/CookieSpecRegistry;

    .prologue
    .line 57
    iget-object v0, p0, Lorg/apache/http/client/protocol/ClientContextConfigurer;->context:Lorg/apache/http/protocol/HttpContext;

    const-string v1, "http.cookiespec-registry"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 58
    return-void
.end method

.method public setCookieStore(Lorg/apache/http/client/CookieStore;)V
    .registers 4
    .param p1, "store"    # Lorg/apache/http/client/CookieStore;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/apache/http/client/protocol/ClientContextConfigurer;->context:Lorg/apache/http/protocol/HttpContext;

    const-string v1, "http.cookie-store"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 66
    return-void
.end method

.method public setCredentialsProvider(Lorg/apache/http/client/CredentialsProvider;)V
    .registers 4
    .param p1, "provider"    # Lorg/apache/http/client/CredentialsProvider;

    .prologue
    .line 69
    iget-object v0, p0, Lorg/apache/http/client/protocol/ClientContextConfigurer;->context:Lorg/apache/http/protocol/HttpContext;

    const-string v1, "http.auth.credentials-provider"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 70
    return-void
.end method
