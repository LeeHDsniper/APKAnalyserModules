.class public Lorg/apache/http/impl/cookie/IgnoreSpec;
.super Lorg/apache/http/impl/cookie/CookieSpecBase;
.source "IgnoreSpec.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/CookieSpecBase;-><init>()V

    return-void
.end method


# virtual methods
.method public formatCookies(Ljava/util/List;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/cookie/Cookie;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/Header;",
            ">;"
        }
    .end annotation

    .prologue
    .line 57
    .local p1, "cookies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getVersion()I
    .registers 2

    .prologue
    .line 48
    const/4 v0, 0x0

    return v0
.end method

.method public getVersionHeader()Lorg/apache/http/Header;
    .registers 2

    .prologue
    .line 61
    const/4 v0, 0x0

    return-object v0
.end method

.method public parse(Lorg/apache/http/Header;Lorg/apache/http/cookie/CookieOrigin;)Ljava/util/List;
    .registers 4
    .param p1, "header"    # Lorg/apache/http/Header;
    .param p2, "origin"    # Lorg/apache/http/cookie/CookieOrigin;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/Header;",
            "Lorg/apache/http/cookie/CookieOrigin;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/cookie/Cookie;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/cookie/MalformedCookieException;
        }
    .end annotation

    .prologue
    .line 53
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
