.class public Lorg/apache/http/impl/cookie/NetscapeDraftSpec;
.super Lorg/apache/http/impl/cookie/CookieSpecBase;
.source "NetscapeDraftSpec.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field protected static final EXPIRES_PATTERN:Ljava/lang/String; = "EEE, dd-MMM-yy HH:mm:ss z"


# instance fields
.field private final datepatterns:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 81
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;-><init>([Ljava/lang/String;)V

    .line 82
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .registers 5
    .param p1, "datepatterns"    # [Ljava/lang/String;

    .prologue
    .line 64
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/CookieSpecBase;-><init>()V

    .line 65
    if-eqz p1, :cond_4c

    .line 66
    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;->datepatterns:[Ljava/lang/String;

    .line 70
    :goto_d
    const-string v0, "path"

    new-instance v1, Lorg/apache/http/impl/cookie/BasicPathHandler;

    invoke-direct {v1}, Lorg/apache/http/impl/cookie/BasicPathHandler;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 71
    const-string v0, "domain"

    new-instance v1, Lorg/apache/http/impl/cookie/NetscapeDomainHandler;

    invoke-direct {v1}, Lorg/apache/http/impl/cookie/NetscapeDomainHandler;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 72
    const-string v0, "max-age"

    new-instance v1, Lorg/apache/http/impl/cookie/BasicMaxAgeHandler;

    invoke-direct {v1}, Lorg/apache/http/impl/cookie/BasicMaxAgeHandler;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 73
    const-string v0, "secure"

    new-instance v1, Lorg/apache/http/impl/cookie/BasicSecureHandler;

    invoke-direct {v1}, Lorg/apache/http/impl/cookie/BasicSecureHandler;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 74
    const-string v0, "comment"

    new-instance v1, Lorg/apache/http/impl/cookie/BasicCommentHandler;

    invoke-direct {v1}, Lorg/apache/http/impl/cookie/BasicCommentHandler;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 75
    const-string v0, "expires"

    new-instance v1, Lorg/apache/http/impl/cookie/BasicExpiresHandler;

    iget-object v2, p0, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;->datepatterns:[Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/apache/http/impl/cookie/BasicExpiresHandler;-><init>([Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 77
    return-void

    .line 68
    :cond_4c
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "EEE, dd-MMM-yy HH:mm:ss z"

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;->datepatterns:[Ljava/lang/String;

    goto :goto_d
.end method


# virtual methods
.method public formatCookies(Ljava/util/List;)Ljava/util/List;
    .registers 8
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
    .line 137
    .local p1, "cookies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    const-string v5, "List of cookies"

    invoke-static {p1, v5}, Lorg/apache/http/util/Args;->notEmpty(Ljava/util/Collection;Ljava/lang/String;)Ljava/util/Collection;

    .line 138
    new-instance v0, Lorg/apache/http/util/CharArrayBuffer;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    mul-int/lit8 v5, v5, 0x14

    invoke-direct {v0, v5}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 139
    .local v0, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    const-string v5, "Cookie"

    invoke-virtual {v0, v5}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 140
    const-string v5, ": "

    invoke-virtual {v0, v5}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 141
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1b
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v3, v5, :cond_46

    .line 142
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/cookie/Cookie;

    .line 143
    .local v1, "cookie":Lorg/apache/http/cookie/Cookie;
    if-lez v3, :cond_2e

    .line 144
    const-string v5, "; "

    invoke-virtual {v0, v5}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 146
    :cond_2e
    invoke-interface {v1}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 147
    invoke-interface {v1}, Lorg/apache/http/cookie/Cookie;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 148
    .local v4, "s":Ljava/lang/String;
    if-eqz v4, :cond_43

    .line 149
    const-string v5, "="

    invoke-virtual {v0, v5}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 150
    invoke-virtual {v0, v4}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 141
    :cond_43
    add-int/lit8 v3, v3, 0x1

    goto :goto_1b

    .line 153
    .end local v1    # "cookie":Lorg/apache/http/cookie/Cookie;
    .end local v4    # "s":Ljava/lang/String;
    :cond_46
    new-instance v2, Ljava/util/ArrayList;

    const/4 v5, 0x1

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 154
    .local v2, "headers":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/Header;>;"
    new-instance v5, Lorg/apache/http/message/BufferedHeader;

    invoke-direct {v5, v0}, Lorg/apache/http/message/BufferedHeader;-><init>(Lorg/apache/http/util/CharArrayBuffer;)V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    return-object v2
.end method

.method public getVersion()I
    .registers 2

    .prologue
    .line 159
    const/4 v0, 0x0

    return v0
.end method

.method public getVersionHeader()Lorg/apache/http/Header;
    .registers 2

    .prologue
    .line 163
    const/4 v0, 0x0

    return-object v0
.end method

.method public parse(Lorg/apache/http/Header;Lorg/apache/http/cookie/CookieOrigin;)Ljava/util/List;
    .registers 10
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
    const/4 v6, 0x0

    .line 110
    const-string v4, "Header"

    invoke-static {p1, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 111
    const-string v4, "Cookie origin"

    invoke-static {p2, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 112
    invoke-interface {p1}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Set-Cookie"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3a

    .line 113
    new-instance v4, Lorg/apache/http/cookie/MalformedCookieException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unrecognized cookie header \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/http/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 116
    :cond_3a
    sget-object v2, Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;->DEFAULT:Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;

    .line 119
    .local v2, "parser":Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;
    instance-of v4, p1, Lorg/apache/http/FormattedHeader;

    if-eqz v4, :cond_64

    move-object v4, p1

    .line 120
    check-cast v4, Lorg/apache/http/FormattedHeader;

    invoke-interface {v4}, Lorg/apache/http/FormattedHeader;->getBuffer()Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v0

    .line 121
    .local v0, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    new-instance v1, Lorg/apache/http/message/ParserCursor;

    check-cast p1, Lorg/apache/http/FormattedHeader;

    .end local p1    # "header":Lorg/apache/http/Header;
    invoke-interface {p1}, Lorg/apache/http/FormattedHeader;->getValuePos()I

    move-result v4

    invoke-virtual {v0}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v5

    invoke-direct {v1, v4, v5}, Lorg/apache/http/message/ParserCursor;-><init>(II)V

    .line 133
    .local v1, "cursor":Lorg/apache/http/message/ParserCursor;
    :goto_56
    const/4 v4, 0x1

    new-array v4, v4, [Lorg/apache/http/HeaderElement;

    invoke-virtual {v2, v0, v1}, Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;->parseHeader(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;)Lorg/apache/http/HeaderElement;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p0, v4, p2}, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;->parse([Lorg/apache/http/HeaderElement;Lorg/apache/http/cookie/CookieOrigin;)Ljava/util/List;

    move-result-object v4

    return-object v4

    .line 125
    .end local v0    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    .end local v1    # "cursor":Lorg/apache/http/message/ParserCursor;
    .restart local p1    # "header":Lorg/apache/http/Header;
    :cond_64
    invoke-interface {p1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 126
    .local v3, "s":Ljava/lang/String;
    if-nez v3, :cond_72

    .line 127
    new-instance v4, Lorg/apache/http/cookie/MalformedCookieException;

    const-string v5, "Header value is null"

    invoke-direct {v4, v5}, Lorg/apache/http/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 129
    :cond_72
    new-instance v0, Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    invoke-direct {v0, v4}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 130
    .restart local v0    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    invoke-virtual {v0, v3}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 131
    new-instance v1, Lorg/apache/http/message/ParserCursor;

    invoke-virtual {v0}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v4

    invoke-direct {v1, v6, v4}, Lorg/apache/http/message/ParserCursor;-><init>(II)V

    .restart local v1    # "cursor":Lorg/apache/http/message/ParserCursor;
    goto :goto_56
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 168
    const-string v0, "netscape"

    return-object v0
.end method
