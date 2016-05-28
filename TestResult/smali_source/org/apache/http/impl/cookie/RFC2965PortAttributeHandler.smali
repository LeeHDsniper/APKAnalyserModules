.class public Lorg/apache/http/impl/cookie/RFC2965PortAttributeHandler;
.super Ljava/lang/Object;
.source "RFC2965PortAttributeHandler.java"

# interfaces
.implements Lorg/apache/http/cookie/CookieAttributeHandler;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method

.method private static parsePortAttribute(Ljava/lang/String;)[I
    .registers 8
    .param p0, "portValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/cookie/MalformedCookieException;
        }
    .end annotation

    .prologue
    .line 66
    new-instance v3, Ljava/util/StringTokenizer;

    const-string v4, ","

    invoke-direct {v3, p0, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .local v3, "st":Ljava/util/StringTokenizer;
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v4

    new-array v2, v4, [I

    .line 69
    .local v2, "ports":[I
    const/4 v1, 0x0

    .line 70
    .local v1, "i":I
    :goto_e
    :try_start_e
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-eqz v4, :cond_4f

    .line 71
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    aput v4, v2, v1

    .line 72
    aget v4, v2, v1

    if-gez v4, :cond_4c

    .line 73
    new-instance v4, Lorg/apache/http/cookie/MalformedCookieException;

    const-string v5, "Invalid Port attribute."

    invoke-direct {v4, v5}, Lorg/apache/http/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_2e
    .catch Ljava/lang/NumberFormatException; {:try_start_e .. :try_end_2e} :catch_2e

    .line 77
    :catch_2e
    move-exception v0

    .line 78
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v4, Lorg/apache/http/cookie/MalformedCookieException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid Port attribute: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/http/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 75
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_4c
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 81
    :cond_4f
    return-object v2
.end method

.method private static portMatch(I[I)Z
    .registers 7
    .param p0, "port"    # I
    .param p1, "ports"    # [I

    .prologue
    .line 94
    const/4 v4, 0x0

    .line 95
    .local v4, "portInList":Z
    move-object v0, p1

    .local v0, "arr$":[I
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_4
    if-ge v1, v2, :cond_b

    aget v3, v0, v1

    .line 96
    .local v3, "port2":I
    if-ne p0, v3, :cond_c

    .line 97
    const/4 v4, 0x1

    .line 101
    .end local v3    # "port2":I
    :cond_b
    return v4

    .line 95
    .restart local v3    # "port2":I
    :cond_c
    add-int/lit8 v1, v1, 0x1

    goto :goto_4
.end method


# virtual methods
.method public match(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)Z
    .registers 7
    .param p1, "cookie"    # Lorg/apache/http/cookie/Cookie;
    .param p2, "origin"    # Lorg/apache/http/cookie/CookieOrigin;

    .prologue
    const/4 v2, 0x0

    .line 144
    const-string v1, "Cookie"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 145
    const-string v1, "Cookie origin"

    invoke-static {p2, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 146
    invoke-virtual {p2}, Lorg/apache/http/cookie/CookieOrigin;->getPort()I

    move-result v0

    .line 147
    .local v0, "port":I
    instance-of v1, p1, Lorg/apache/http/cookie/ClientCookie;

    if-eqz v1, :cond_32

    move-object v1, p1

    check-cast v1, Lorg/apache/http/cookie/ClientCookie;

    const-string v3, "port"

    invoke-interface {v1, v3}, Lorg/apache/http/cookie/ClientCookie;->containsAttribute(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_32

    .line 149
    invoke-interface {p1}, Lorg/apache/http/cookie/Cookie;->getPorts()[I

    move-result-object v1

    if-nez v1, :cond_26

    move v1, v2

    .line 157
    :goto_25
    return v1

    .line 153
    :cond_26
    invoke-interface {p1}, Lorg/apache/http/cookie/Cookie;->getPorts()[I

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/http/impl/cookie/RFC2965PortAttributeHandler;->portMatch(I[I)Z

    move-result v1

    if-nez v1, :cond_32

    move v1, v2

    .line 154
    goto :goto_25

    .line 157
    :cond_32
    const/4 v1, 0x1

    goto :goto_25
.end method

.method public parse(Lorg/apache/http/cookie/SetCookie;Ljava/lang/String;)V
    .registers 6
    .param p1, "cookie"    # Lorg/apache/http/cookie/SetCookie;
    .param p2, "portValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/cookie/MalformedCookieException;
        }
    .end annotation

    .prologue
    .line 109
    const-string v2, "Cookie"

    invoke-static {p1, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 110
    instance-of v2, p1, Lorg/apache/http/cookie/SetCookie2;

    if-eqz v2, :cond_1f

    move-object v0, p1

    .line 111
    check-cast v0, Lorg/apache/http/cookie/SetCookie2;

    .line 112
    .local v0, "cookie2":Lorg/apache/http/cookie/SetCookie2;
    if-eqz p2, :cond_1f

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1f

    .line 113
    invoke-static {p2}, Lorg/apache/http/impl/cookie/RFC2965PortAttributeHandler;->parsePortAttribute(Ljava/lang/String;)[I

    move-result-object v1

    .line 114
    .local v1, "ports":[I
    invoke-interface {v0, v1}, Lorg/apache/http/cookie/SetCookie2;->setPorts([I)V

    .line 117
    .end local v0    # "cookie2":Lorg/apache/http/cookie/SetCookie2;
    .end local v1    # "ports":[I
    :cond_1f
    return-void
.end method

.method public validate(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)V
    .registers 6
    .param p1, "cookie"    # Lorg/apache/http/cookie/Cookie;
    .param p2, "origin"    # Lorg/apache/http/cookie/CookieOrigin;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/cookie/MalformedCookieException;
        }
    .end annotation

    .prologue
    .line 125
    const-string v1, "Cookie"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 126
    const-string v1, "Cookie origin"

    invoke-static {p2, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 127
    invoke-virtual {p2}, Lorg/apache/http/cookie/CookieOrigin;->getPort()I

    move-result v0

    .line 128
    .local v0, "port":I
    instance-of v1, p1, Lorg/apache/http/cookie/ClientCookie;

    if-eqz v1, :cond_2f

    move-object v1, p1

    check-cast v1, Lorg/apache/http/cookie/ClientCookie;

    const-string v2, "port"

    invoke-interface {v1, v2}, Lorg/apache/http/cookie/ClientCookie;->containsAttribute(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 130
    invoke-interface {p1}, Lorg/apache/http/cookie/Cookie;->getPorts()[I

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/http/impl/cookie/RFC2965PortAttributeHandler;->portMatch(I[I)Z

    move-result v1

    if-nez v1, :cond_2f

    .line 131
    new-instance v1, Lorg/apache/http/cookie/CookieRestrictionViolationException;

    const-string v2, "Port attribute violates RFC 2965: Request port not found in cookie\'s port list."

    invoke-direct {v1, v2}, Lorg/apache/http/cookie/CookieRestrictionViolationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 136
    :cond_2f
    return-void
.end method
