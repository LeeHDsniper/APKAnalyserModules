.class public Lorg/apache/http/impl/cookie/NetscapeDraftSpecFactory;
.super Ljava/lang/Object;
.source "NetscapeDraftSpecFactory.java"

# interfaces
.implements Lorg/apache/http/cookie/CookieSpecFactory;
.implements Lorg/apache/http/cookie/CookieSpecProvider;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final datepatterns:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 58
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/http/impl/cookie/NetscapeDraftSpecFactory;-><init>([Ljava/lang/String;)V

    .line 59
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .registers 2
    .param p1, "datepatterns"    # [Ljava/lang/String;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lorg/apache/http/impl/cookie/NetscapeDraftSpecFactory;->datepatterns:[Ljava/lang/String;

    .line 55
    return-void
.end method


# virtual methods
.method public create(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/cookie/CookieSpec;
    .registers 4
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 78
    new-instance v0, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;

    iget-object v1, p0, Lorg/apache/http/impl/cookie/NetscapeDraftSpecFactory;->datepatterns:[Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;-><init>([Ljava/lang/String;)V

    return-object v0
.end method

.method public newInstance(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/cookie/CookieSpec;
    .registers 5
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 62
    if-eqz p1, :cond_1f

    .line 64
    const/4 v1, 0x0

    .line 65
    .local v1, "patterns":[Ljava/lang/String;
    const-string v2, "http.protocol.cookie-datepatterns"

    invoke-interface {p1, v2}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    .line 67
    .local v0, "param":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    if-eqz v0, :cond_19

    .line 68
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v2

    new-array v1, v2, [Ljava/lang/String;

    .line 69
    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "patterns":[Ljava/lang/String;
    check-cast v1, [Ljava/lang/String;

    .line 71
    .restart local v1    # "patterns":[Ljava/lang/String;
    :cond_19
    new-instance v2, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;

    invoke-direct {v2, v1}, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;-><init>([Ljava/lang/String;)V

    .line 73
    .end local v0    # "param":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    .end local v1    # "patterns":[Ljava/lang/String;
    :goto_1e
    return-object v2

    :cond_1f
    new-instance v2, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;

    invoke-direct {v2}, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;-><init>()V

    goto :goto_1e
.end method
