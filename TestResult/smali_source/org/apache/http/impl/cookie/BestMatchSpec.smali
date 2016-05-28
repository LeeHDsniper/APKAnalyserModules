.class public Lorg/apache/http/impl/cookie/BestMatchSpec;
.super Ljava/lang/Object;
.source "BestMatchSpec.java"

# interfaces
.implements Lorg/apache/http/cookie/CookieSpec;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private compat:Lorg/apache/http/impl/cookie/BrowserCompatSpec;

.field private final datepatterns:[Ljava/lang/String;

.field private obsoleteStrict:Lorg/apache/http/impl/cookie/RFC2109Spec;

.field private final oneHeader:Z

.field private strict:Lorg/apache/http/impl/cookie/RFC2965Spec;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 70
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/http/impl/cookie/BestMatchSpec;-><init>([Ljava/lang/String;Z)V

    .line 71
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;Z)V
    .registers 4
    .param p1, "datepatterns"    # [Ljava/lang/String;
    .param p2, "oneHeader"    # Z

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    if-nez p1, :cond_b

    const/4 v0, 0x0

    :goto_6
    iput-object v0, p0, Lorg/apache/http/impl/cookie/BestMatchSpec;->datepatterns:[Ljava/lang/String;

    .line 66
    iput-boolean p2, p0, Lorg/apache/http/impl/cookie/BestMatchSpec;->oneHeader:Z

    .line 67
    return-void

    .line 65
    :cond_b
    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    goto :goto_6
.end method

.method private getCompat()Lorg/apache/http/impl/cookie/BrowserCompatSpec;
    .registers 3

    .prologue
    .line 88
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BestMatchSpec;->compat:Lorg/apache/http/impl/cookie/BrowserCompatSpec;

    if-nez v0, :cond_d

    .line 89
    new-instance v0, Lorg/apache/http/impl/cookie/BrowserCompatSpec;

    iget-object v1, p0, Lorg/apache/http/impl/cookie/BestMatchSpec;->datepatterns:[Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;-><init>([Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/http/impl/cookie/BestMatchSpec;->compat:Lorg/apache/http/impl/cookie/BrowserCompatSpec;

    .line 91
    :cond_d
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BestMatchSpec;->compat:Lorg/apache/http/impl/cookie/BrowserCompatSpec;

    return-object v0
.end method

.method private getObsoleteStrict()Lorg/apache/http/impl/cookie/RFC2109Spec;
    .registers 4

    .prologue
    .line 81
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BestMatchSpec;->obsoleteStrict:Lorg/apache/http/impl/cookie/RFC2109Spec;

    if-nez v0, :cond_f

    .line 82
    new-instance v0, Lorg/apache/http/impl/cookie/RFC2109Spec;

    iget-object v1, p0, Lorg/apache/http/impl/cookie/BestMatchSpec;->datepatterns:[Ljava/lang/String;

    iget-boolean v2, p0, Lorg/apache/http/impl/cookie/BestMatchSpec;->oneHeader:Z

    invoke-direct {v0, v1, v2}, Lorg/apache/http/impl/cookie/RFC2109Spec;-><init>([Ljava/lang/String;Z)V

    iput-object v0, p0, Lorg/apache/http/impl/cookie/BestMatchSpec;->obsoleteStrict:Lorg/apache/http/impl/cookie/RFC2109Spec;

    .line 84
    :cond_f
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BestMatchSpec;->obsoleteStrict:Lorg/apache/http/impl/cookie/RFC2109Spec;

    return-object v0
.end method

.method private getStrict()Lorg/apache/http/impl/cookie/RFC2965Spec;
    .registers 4

    .prologue
    .line 74
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BestMatchSpec;->strict:Lorg/apache/http/impl/cookie/RFC2965Spec;

    if-nez v0, :cond_f

    .line 75
    new-instance v0, Lorg/apache/http/impl/cookie/RFC2965Spec;

    iget-object v1, p0, Lorg/apache/http/impl/cookie/BestMatchSpec;->datepatterns:[Ljava/lang/String;

    iget-boolean v2, p0, Lorg/apache/http/impl/cookie/BestMatchSpec;->oneHeader:Z

    invoke-direct {v0, v1, v2}, Lorg/apache/http/impl/cookie/RFC2965Spec;-><init>([Ljava/lang/String;Z)V

    iput-object v0, p0, Lorg/apache/http/impl/cookie/BestMatchSpec;->strict:Lorg/apache/http/impl/cookie/RFC2965Spec;

    .line 77
    :cond_f
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BestMatchSpec;->strict:Lorg/apache/http/impl/cookie/RFC2965Spec;

    return-object v0
.end method


# virtual methods
.method public formatCookies(Ljava/util/List;)Ljava/util/List;
    .registers 7
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
    .line 172
    .local p1, "cookies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    const-string v4, "List of cookies"

    invoke-static {p1, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 173
    const v3, 0x7fffffff

    .line 174
    .local v3, "version":I
    const/4 v2, 0x1

    .line 175
    .local v2, "isSetCookie2":Z
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_d
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_29

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/cookie/Cookie;

    .line 176
    .local v0, "cookie":Lorg/apache/http/cookie/Cookie;
    instance-of v4, v0, Lorg/apache/http/cookie/SetCookie2;

    if-nez v4, :cond_1e

    .line 177
    const/4 v2, 0x0

    .line 179
    :cond_1e
    invoke-interface {v0}, Lorg/apache/http/cookie/Cookie;->getVersion()I

    move-result v4

    if-ge v4, v3, :cond_d

    .line 180
    invoke-interface {v0}, Lorg/apache/http/cookie/Cookie;->getVersion()I

    move-result v3

    goto :goto_d

    .line 183
    .end local v0    # "cookie":Lorg/apache/http/cookie/Cookie;
    :cond_29
    if-lez v3, :cond_3f

    .line 184
    if-eqz v2, :cond_36

    .line 185
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/BestMatchSpec;->getStrict()Lorg/apache/http/impl/cookie/RFC2965Spec;

    move-result-object v4

    invoke-virtual {v4, p1}, Lorg/apache/http/impl/cookie/RFC2965Spec;->formatCookies(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    .line 190
    :goto_35
    return-object v4

    .line 187
    :cond_36
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/BestMatchSpec;->getObsoleteStrict()Lorg/apache/http/impl/cookie/RFC2109Spec;

    move-result-object v4

    invoke-virtual {v4, p1}, Lorg/apache/http/impl/cookie/RFC2109Spec;->formatCookies(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    goto :goto_35

    .line 190
    :cond_3f
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/BestMatchSpec;->getCompat()Lorg/apache/http/impl/cookie/BrowserCompatSpec;

    move-result-object v4

    invoke-virtual {v4, p1}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->formatCookies(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    goto :goto_35
.end method

.method public getVersion()I
    .registers 2

    .prologue
    .line 195
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/BestMatchSpec;->getStrict()Lorg/apache/http/impl/cookie/RFC2965Spec;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/impl/cookie/RFC2965Spec;->getVersion()I

    move-result v0

    return v0
.end method

.method public getVersionHeader()Lorg/apache/http/Header;
    .registers 2

    .prologue
    .line 199
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/BestMatchSpec;->getStrict()Lorg/apache/http/impl/cookie/RFC2965Spec;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/impl/cookie/RFC2965Spec;->getVersionHeader()Lorg/apache/http/Header;

    move-result-object v0

    return-object v0
.end method

.method public match(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)Z
    .registers 4
    .param p1, "cookie"    # Lorg/apache/http/cookie/Cookie;
    .param p2, "origin"    # Lorg/apache/http/cookie/CookieOrigin;

    .prologue
    .line 158
    const-string v0, "Cookie"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 159
    const-string v0, "Cookie origin"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 160
    invoke-interface {p1}, Lorg/apache/http/cookie/Cookie;->getVersion()I

    move-result v0

    if-lez v0, :cond_26

    .line 161
    instance-of v0, p1, Lorg/apache/http/cookie/SetCookie2;

    if-eqz v0, :cond_1d

    .line 162
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/BestMatchSpec;->getStrict()Lorg/apache/http/impl/cookie/RFC2965Spec;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/http/impl/cookie/RFC2965Spec;->match(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)Z

    move-result v0

    .line 167
    :goto_1c
    return v0

    .line 164
    :cond_1d
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/BestMatchSpec;->getObsoleteStrict()Lorg/apache/http/impl/cookie/RFC2109Spec;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/http/impl/cookie/RFC2109Spec;->match(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)Z

    move-result v0

    goto :goto_1c

    .line 167
    :cond_26
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/BestMatchSpec;->getCompat()Lorg/apache/http/impl/cookie/BrowserCompatSpec;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->match(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)Z

    move-result v0

    goto :goto_1c
.end method

.method public parse(Lorg/apache/http/Header;Lorg/apache/http/cookie/CookieOrigin;)Ljava/util/List;
    .registers 16
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
    .line 97
    const-string v11, "Header"

    invoke-static {p1, v11}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 98
    const-string v11, "Cookie origin"

    invoke-static {p2, v11}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 99
    invoke-interface {p1}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v4

    .line 100
    .local v4, "helems":[Lorg/apache/http/HeaderElement;
    const/4 v10, 0x0

    .line 101
    .local v10, "versioned":Z
    const/4 v7, 0x0

    .line 102
    .local v7, "netscape":Z
    move-object v0, v4

    .local v0, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_13
    if-ge v5, v6, :cond_2c

    aget-object v3, v0, v5

    .line 103
    .local v3, "helem":Lorg/apache/http/HeaderElement;
    const-string v11, "version"

    invoke-interface {v3, v11}, Lorg/apache/http/HeaderElement;->getParameterByName(Ljava/lang/String;)Lorg/apache/http/NameValuePair;

    move-result-object v11

    if-eqz v11, :cond_20

    .line 104
    const/4 v10, 0x1

    .line 106
    :cond_20
    const-string v11, "expires"

    invoke-interface {v3, v11}, Lorg/apache/http/HeaderElement;->getParameterByName(Ljava/lang/String;)Lorg/apache/http/NameValuePair;

    move-result-object v11

    if-eqz v11, :cond_29

    .line 107
    const/4 v7, 0x1

    .line 102
    :cond_29
    add-int/lit8 v5, v5, 0x1

    goto :goto_13

    .line 110
    .end local v3    # "helem":Lorg/apache/http/HeaderElement;
    :cond_2c
    if-nez v7, :cond_30

    if-nez v10, :cond_84

    .line 113
    :cond_30
    sget-object v8, Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;->DEFAULT:Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;

    .line 116
    .local v8, "parser":Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;
    instance-of v11, p1, Lorg/apache/http/FormattedHeader;

    if-eqz v11, :cond_5f

    move-object v11, p1

    .line 117
    check-cast v11, Lorg/apache/http/FormattedHeader;

    invoke-interface {v11}, Lorg/apache/http/FormattedHeader;->getBuffer()Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v1

    .line 118
    .local v1, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    new-instance v2, Lorg/apache/http/message/ParserCursor;

    check-cast p1, Lorg/apache/http/FormattedHeader;

    .end local p1    # "header":Lorg/apache/http/Header;
    invoke-interface {p1}, Lorg/apache/http/FormattedHeader;->getValuePos()I

    move-result v11

    invoke-virtual {v1}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v12

    invoke-direct {v2, v11, v12}, Lorg/apache/http/message/ParserCursor;-><init>(II)V

    .line 130
    .local v2, "cursor":Lorg/apache/http/message/ParserCursor;
    :goto_4c
    const/4 v11, 0x1

    new-array v4, v11, [Lorg/apache/http/HeaderElement;

    .end local v4    # "helems":[Lorg/apache/http/HeaderElement;
    const/4 v11, 0x0

    invoke-virtual {v8, v1, v2}, Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;->parseHeader(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;)Lorg/apache/http/HeaderElement;

    move-result-object v12

    aput-object v12, v4, v11

    .line 131
    .restart local v4    # "helems":[Lorg/apache/http/HeaderElement;
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/BestMatchSpec;->getCompat()Lorg/apache/http/impl/cookie/BrowserCompatSpec;

    move-result-object v11

    invoke-virtual {v11, v4, p2}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->parse([Lorg/apache/http/HeaderElement;Lorg/apache/http/cookie/CookieOrigin;)Ljava/util/List;

    move-result-object v11

    .line 136
    .end local v1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    .end local v2    # "cursor":Lorg/apache/http/message/ParserCursor;
    .end local v8    # "parser":Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;
    :goto_5e
    return-object v11

    .line 122
    .restart local v8    # "parser":Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;
    .restart local p1    # "header":Lorg/apache/http/Header;
    :cond_5f
    invoke-interface {p1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v9

    .line 123
    .local v9, "s":Ljava/lang/String;
    if-nez v9, :cond_6d

    .line 124
    new-instance v11, Lorg/apache/http/cookie/MalformedCookieException;

    const-string v12, "Header value is null"

    invoke-direct {v11, v12}, Lorg/apache/http/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 126
    :cond_6d
    new-instance v1, Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v11

    invoke-direct {v1, v11}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 127
    .restart local v1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    invoke-virtual {v1, v9}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 128
    new-instance v2, Lorg/apache/http/message/ParserCursor;

    const/4 v11, 0x0

    invoke-virtual {v1}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v12

    invoke-direct {v2, v11, v12}, Lorg/apache/http/message/ParserCursor;-><init>(II)V

    .restart local v2    # "cursor":Lorg/apache/http/message/ParserCursor;
    goto :goto_4c

    .line 133
    .end local v1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    .end local v2    # "cursor":Lorg/apache/http/message/ParserCursor;
    .end local v8    # "parser":Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;
    .end local v9    # "s":Ljava/lang/String;
    :cond_84
    const-string v11, "Set-Cookie2"

    invoke-interface {p1}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_99

    .line 134
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/BestMatchSpec;->getStrict()Lorg/apache/http/impl/cookie/RFC2965Spec;

    move-result-object v11

    invoke-virtual {v11, v4, p2}, Lorg/apache/http/impl/cookie/RFC2965Spec;->parse([Lorg/apache/http/HeaderElement;Lorg/apache/http/cookie/CookieOrigin;)Ljava/util/List;

    move-result-object v11

    goto :goto_5e

    .line 136
    :cond_99
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/BestMatchSpec;->getObsoleteStrict()Lorg/apache/http/impl/cookie/RFC2109Spec;

    move-result-object v11

    invoke-virtual {v11, v4, p2}, Lorg/apache/http/impl/cookie/RFC2109Spec;->parse([Lorg/apache/http/HeaderElement;Lorg/apache/http/cookie/CookieOrigin;)Ljava/util/List;

    move-result-object v11

    goto :goto_5e
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 204
    const-string v0, "best-match"

    return-object v0
.end method

.method public validate(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)V
    .registers 4
    .param p1, "cookie"    # Lorg/apache/http/cookie/Cookie;
    .param p2, "origin"    # Lorg/apache/http/cookie/CookieOrigin;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/cookie/MalformedCookieException;
        }
    .end annotation

    .prologue
    .line 144
    const-string v0, "Cookie"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 145
    const-string v0, "Cookie origin"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 146
    invoke-interface {p1}, Lorg/apache/http/cookie/Cookie;->getVersion()I

    move-result v0

    if-lez v0, :cond_24

    .line 147
    instance-of v0, p1, Lorg/apache/http/cookie/SetCookie2;

    if-eqz v0, :cond_1c

    .line 148
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/BestMatchSpec;->getStrict()Lorg/apache/http/impl/cookie/RFC2965Spec;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/http/impl/cookie/RFC2965Spec;->validate(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)V

    .line 155
    :goto_1b
    return-void

    .line 150
    :cond_1c
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/BestMatchSpec;->getObsoleteStrict()Lorg/apache/http/impl/cookie/RFC2109Spec;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/http/impl/cookie/RFC2109Spec;->validate(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)V

    goto :goto_1b

    .line 153
    :cond_24
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/BestMatchSpec;->getCompat()Lorg/apache/http/impl/cookie/BrowserCompatSpec;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->validate(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)V

    goto :goto_1b
.end method
