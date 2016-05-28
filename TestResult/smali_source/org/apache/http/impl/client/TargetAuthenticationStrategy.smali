.class public Lorg/apache/http/impl/client/TargetAuthenticationStrategy;
.super Lorg/apache/http/impl/client/AuthenticationStrategyImpl;
.source "TargetAuthenticationStrategy.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final INSTANCE:Lorg/apache/http/impl/client/TargetAuthenticationStrategy;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 46
    new-instance v0, Lorg/apache/http/impl/client/TargetAuthenticationStrategy;

    invoke-direct {v0}, Lorg/apache/http/impl/client/TargetAuthenticationStrategy;-><init>()V

    sput-object v0, Lorg/apache/http/impl/client/TargetAuthenticationStrategy;->INSTANCE:Lorg/apache/http/impl/client/TargetAuthenticationStrategy;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 49
    const/16 v0, 0x191

    const-string v1, "WWW-Authenticate"

    invoke-direct {p0, v0, v1}, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;-><init>(ILjava/lang/String;)V

    .line 50
    return-void
.end method


# virtual methods
.method public bridge synthetic authFailed(Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/protocol/HttpContext;)V
    .registers 4
    .param p1, "x0"    # Lorg/apache/http/HttpHost;
    .param p2, "x1"    # Lorg/apache/http/auth/AuthScheme;
    .param p3, "x2"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 43
    invoke-super {p0, p1, p2, p3}, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->authFailed(Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/protocol/HttpContext;)V

    return-void
.end method

.method public bridge synthetic authSucceeded(Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/protocol/HttpContext;)V
    .registers 4
    .param p1, "x0"    # Lorg/apache/http/HttpHost;
    .param p2, "x1"    # Lorg/apache/http/auth/AuthScheme;
    .param p3, "x2"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 43
    invoke-super {p0, p1, p2, p3}, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->authSucceeded(Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/protocol/HttpContext;)V

    return-void
.end method

.method public bridge synthetic getChallenges(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Ljava/util/Map;
    .registers 5
    .param p1, "x0"    # Lorg/apache/http/HttpHost;
    .param p2, "x1"    # Lorg/apache/http/HttpResponse;
    .param p3, "x2"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/MalformedChallengeException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-super {p0, p1, p2, p3}, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->getChallenges(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method getPreferredAuthSchemes(Lorg/apache/http/client/config/RequestConfig;)Ljava/util/Collection;
    .registers 3
    .param p1, "config"    # Lorg/apache/http/client/config/RequestConfig;
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

    .prologue
    .line 54
    invoke-virtual {p1}, Lorg/apache/http/client/config/RequestConfig;->getTargetPreferredAuthSchemes()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z
    .registers 5
    .param p1, "x0"    # Lorg/apache/http/HttpHost;
    .param p2, "x1"    # Lorg/apache/http/HttpResponse;
    .param p3, "x2"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 43
    invoke-super {p0, p1, p2, p3}, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic select(Ljava/util/Map;Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Ljava/util/Queue;
    .registers 6
    .param p1, "x0"    # Ljava/util/Map;
    .param p2, "x1"    # Lorg/apache/http/HttpHost;
    .param p3, "x2"    # Lorg/apache/http/HttpResponse;
    .param p4, "x3"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/MalformedChallengeException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-super {p0, p1, p2, p3, p4}, Lorg/apache/http/impl/client/AuthenticationStrategyImpl;->select(Ljava/util/Map;Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Ljava/util/Queue;

    move-result-object v0

    return-object v0
.end method
