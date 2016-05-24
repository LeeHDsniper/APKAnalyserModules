.class public Lorg/apache/http/impl/cookie/RFC2965VersionAttributeHandler;
.super Ljava/lang/Object;
.source "RFC2965VersionAttributeHandler.java"

# interfaces
.implements Lorg/apache/http/cookie/CookieAttributeHandler;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    return-void
.end method


# virtual methods
.method public match(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)Z
    .registers 4
    .param p1, "cookie"    # Lorg/apache/http/cookie/Cookie;
    .param p2, "origin"    # Lorg/apache/http/cookie/CookieOrigin;

    .prologue
    .line 91
    const/4 v0, 0x1

    return v0
.end method

.method public parse(Lorg/apache/http/cookie/SetCookie;Ljava/lang/String;)V
    .registers 7
    .param p1, "cookie"    # Lorg/apache/http/cookie/SetCookie;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/cookie/MalformedCookieException;
        }
    .end annotation

    .prologue
    .line 58
    const-string v2, "Cookie"

    invoke-static {p1, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 59
    if-nez p2, :cond_f

    .line 60
    new-instance v2, Lorg/apache/http/cookie/MalformedCookieException;

    const-string v3, "Missing value for version attribute"

    invoke-direct {v2, v3}, Lorg/apache/http/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 63
    :cond_f
    const/4 v1, -0x1

    .line 65
    .local v1, "version":I
    :try_start_10
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_13
    .catch Ljava/lang/NumberFormatException; {:try_start_10 .. :try_end_13} :catch_1e

    move-result v1

    .line 69
    :goto_14
    if-gez v1, :cond_21

    .line 70
    new-instance v2, Lorg/apache/http/cookie/MalformedCookieException;

    const-string v3, "Invalid cookie version."

    invoke-direct {v2, v3}, Lorg/apache/http/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 66
    :catch_1e
    move-exception v0

    .line 67
    .local v0, "e":Ljava/lang/NumberFormatException;
    const/4 v1, -0x1

    goto :goto_14

    .line 72
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_21
    invoke-interface {p1, v1}, Lorg/apache/http/cookie/SetCookie;->setVersion(I)V

    .line 73
    return-void
.end method

.method public validate(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)V
    .registers 5
    .param p1, "cookie"    # Lorg/apache/http/cookie/Cookie;
    .param p2, "origin"    # Lorg/apache/http/cookie/CookieOrigin;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/cookie/MalformedCookieException;
        }
    .end annotation

    .prologue
    .line 80
    const-string v0, "Cookie"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 81
    instance-of v0, p1, Lorg/apache/http/cookie/SetCookie2;

    if-eqz v0, :cond_1f

    .line 82
    instance-of v0, p1, Lorg/apache/http/cookie/ClientCookie;

    if-eqz v0, :cond_1f

    check-cast p1, Lorg/apache/http/cookie/ClientCookie;

    .end local p1    # "cookie":Lorg/apache/http/cookie/Cookie;
    const-string v0, "version"

    invoke-interface {p1, v0}, Lorg/apache/http/cookie/ClientCookie;->containsAttribute(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1f

    .line 84
    new-instance v0, Lorg/apache/http/cookie/CookieRestrictionViolationException;

    const-string v1, "Violates RFC 2965. Version attribute is required."

    invoke-direct {v0, v1}, Lorg/apache/http/cookie/CookieRestrictionViolationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_1f
    return-void
.end method
