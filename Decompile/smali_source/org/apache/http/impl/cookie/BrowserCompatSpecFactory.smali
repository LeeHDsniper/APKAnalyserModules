.class public Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory;
.super Ljava/lang/Object;
.source "BrowserCompatSpecFactory.java"

# interfaces
.implements Lorg/apache/http/cookie/CookieSpecFactory;
.implements Lorg/apache/http/cookie/CookieSpecProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;
    }
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final datepatterns:[Ljava/lang/String;

.field private final securityLevel:Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 69
    const/4 v0, 0x0

    sget-object v1, Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;->SECURITYLEVEL_DEFAULT:Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;

    invoke-direct {p0, v0, v1}, Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory;-><init>([Ljava/lang/String;Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;)V

    .line 70
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .registers 4
    .param p1, "datepatterns"    # [Ljava/lang/String;

    .prologue
    .line 65
    const/4 v0, 0x0

    sget-object v1, Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;->SECURITYLEVEL_DEFAULT:Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;

    invoke-direct {p0, v0, v1}, Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory;-><init>([Ljava/lang/String;Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;)V

    .line 66
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;)V
    .registers 3
    .param p1, "datepatterns"    # [Ljava/lang/String;
    .param p2, "securityLevel"    # Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory;->datepatterns:[Ljava/lang/String;

    .line 61
    iput-object p2, p0, Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory;->securityLevel:Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;

    .line 62
    return-void
.end method


# virtual methods
.method public create(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/cookie/CookieSpec;
    .registers 4
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 89
    new-instance v0, Lorg/apache/http/impl/cookie/BrowserCompatSpec;

    iget-object v1, p0, Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory;->datepatterns:[Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;-><init>([Ljava/lang/String;)V

    return-object v0
.end method

.method public newInstance(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/cookie/CookieSpec;
    .registers 7
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 73
    if-eqz p1, :cond_21

    .line 75
    const/4 v1, 0x0

    .line 76
    .local v1, "patterns":[Ljava/lang/String;
    const-string v2, "http.protocol.cookie-datepatterns"

    invoke-interface {p1, v2}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    .line 78
    .local v0, "param":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    if-eqz v0, :cond_19

    .line 79
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v2

    new-array v1, v2, [Ljava/lang/String;

    .line 80
    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "patterns":[Ljava/lang/String;
    check-cast v1, [Ljava/lang/String;

    .line 82
    .restart local v1    # "patterns":[Ljava/lang/String;
    :cond_19
    new-instance v2, Lorg/apache/http/impl/cookie/BrowserCompatSpec;

    iget-object v3, p0, Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory;->securityLevel:Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;

    invoke-direct {v2, v1, v3}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;-><init>([Ljava/lang/String;Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;)V

    .line 84
    .end local v0    # "param":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    .end local v1    # "patterns":[Ljava/lang/String;
    :goto_20
    return-object v2

    :cond_21
    new-instance v2, Lorg/apache/http/impl/cookie/BrowserCompatSpec;

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory;->securityLevel:Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;

    invoke-direct {v2, v3, v4}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;-><init>([Ljava/lang/String;Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;)V

    goto :goto_20
.end method
