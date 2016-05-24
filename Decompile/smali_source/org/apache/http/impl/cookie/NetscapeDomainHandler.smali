.class public Lorg/apache/http/impl/cookie/NetscapeDomainHandler;
.super Lorg/apache/http/impl/cookie/BasicDomainHandler;
.source "NetscapeDomainHandler.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/BasicDomainHandler;-><init>()V

    .line 48
    return-void
.end method

.method private static isSpecialDomain(Ljava/lang/String;)Z
    .registers 3
    .param p0, "domain"    # Ljava/lang/String;

    .prologue
    .line 84
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 85
    .local v0, "ucDomain":Ljava/lang/String;
    const-string v1, ".COM"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3e

    const-string v1, ".EDU"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3e

    const-string v1, ".NET"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3e

    const-string v1, ".GOV"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3e

    const-string v1, ".MIL"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3e

    const-string v1, ".ORG"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3e

    const-string v1, ".INT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_40

    :cond_3e
    const/4 v1, 0x1

    :goto_3f
    return v1

    :cond_40
    const/4 v1, 0x0

    goto :goto_3f
.end method


# virtual methods
.method public match(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)Z
    .registers 6
    .param p1, "cookie"    # Lorg/apache/http/cookie/Cookie;
    .param p2, "origin"    # Lorg/apache/http/cookie/CookieOrigin;

    .prologue
    .line 96
    const-string v2, "Cookie"

    invoke-static {p1, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 97
    const-string v2, "Cookie origin"

    invoke-static {p2, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 98
    invoke-virtual {p2}, Lorg/apache/http/cookie/CookieOrigin;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 99
    .local v1, "host":Ljava/lang/String;
    invoke-interface {p1}, Lorg/apache/http/cookie/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v0

    .line 100
    .local v0, "domain":Ljava/lang/String;
    if-nez v0, :cond_16

    .line 101
    const/4 v2, 0x0

    .line 103
    :goto_15
    return v2

    :cond_16
    invoke-virtual {v1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    goto :goto_15
.end method

.method public validate(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)V
    .registers 9
    .param p1, "cookie"    # Lorg/apache/http/cookie/Cookie;
    .param p2, "origin"    # Lorg/apache/http/cookie/CookieOrigin;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/cookie/MalformedCookieException;
        }
    .end annotation

    .prologue
    .line 53
    invoke-super {p0, p1, p2}, Lorg/apache/http/impl/cookie/BasicDomainHandler;->validate(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)V

    .line 55
    invoke-virtual {p2}, Lorg/apache/http/cookie/CookieOrigin;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 56
    .local v2, "host":Ljava/lang/String;
    invoke-interface {p1}, Lorg/apache/http/cookie/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v0

    .line 57
    .local v0, "domain":Ljava/lang/String;
    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_6e

    .line 58
    new-instance v3, Ljava/util/StringTokenizer;

    const-string v4, "."

    invoke-direct {v3, v0, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v1

    .line 60
    .local v1, "domainParts":I
    invoke-static {v0}, Lorg/apache/http/impl/cookie/NetscapeDomainHandler;->isSpecialDomain(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4c

    .line 61
    const/4 v3, 0x2

    if-ge v1, v3, :cond_6e

    .line 62
    new-instance v3, Lorg/apache/http/cookie/CookieRestrictionViolationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Domain attribute \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\" violates the Netscape cookie specification for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "special domains"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/http/cookie/CookieRestrictionViolationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 68
    :cond_4c
    const/4 v3, 0x3

    if-ge v1, v3, :cond_6e

    .line 69
    new-instance v3, Lorg/apache/http/cookie/CookieRestrictionViolationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Domain attribute \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\" violates the Netscape cookie specification"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/http/cookie/CookieRestrictionViolationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 75
    .end local v1    # "domainParts":I
    :cond_6e
    return-void
.end method
