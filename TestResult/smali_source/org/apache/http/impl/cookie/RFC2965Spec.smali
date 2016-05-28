.class public Lorg/apache/http/impl/cookie/RFC2965Spec;
.super Lorg/apache/http/impl/cookie/RFC2109Spec;
.source "RFC2965Spec.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 62
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/http/impl/cookie/RFC2965Spec;-><init>([Ljava/lang/String;Z)V

    .line 63
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;Z)V
    .registers 5
    .param p1, "datepatterns"    # [Ljava/lang/String;
    .param p2, "oneHeader"    # Z

    .prologue
    .line 66
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/cookie/RFC2109Spec;-><init>([Ljava/lang/String;Z)V

    .line 67
    const-string v0, "domain"

    new-instance v1, Lorg/apache/http/impl/cookie/RFC2965DomainAttributeHandler;

    invoke-direct {v1}, Lorg/apache/http/impl/cookie/RFC2965DomainAttributeHandler;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/RFC2965Spec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 68
    const-string v0, "port"

    new-instance v1, Lorg/apache/http/impl/cookie/RFC2965PortAttributeHandler;

    invoke-direct {v1}, Lorg/apache/http/impl/cookie/RFC2965PortAttributeHandler;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/RFC2965Spec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 69
    const-string v0, "commenturl"

    new-instance v1, Lorg/apache/http/impl/cookie/RFC2965CommentUrlAttributeHandler;

    invoke-direct {v1}, Lorg/apache/http/impl/cookie/RFC2965CommentUrlAttributeHandler;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/RFC2965Spec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 70
    const-string v0, "discard"

    new-instance v1, Lorg/apache/http/impl/cookie/RFC2965DiscardAttributeHandler;

    invoke-direct {v1}, Lorg/apache/http/impl/cookie/RFC2965DiscardAttributeHandler;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/RFC2965Spec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 71
    const-string v0, "version"

    new-instance v1, Lorg/apache/http/impl/cookie/RFC2965VersionAttributeHandler;

    invoke-direct {v1}, Lorg/apache/http/impl/cookie/RFC2965VersionAttributeHandler;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/RFC2965Spec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 72
    return-void
.end method

.method private static adjustEffectiveHost(Lorg/apache/http/cookie/CookieOrigin;)Lorg/apache/http/cookie/CookieOrigin;
    .registers 9
    .param p0, "origin"    # Lorg/apache/http/cookie/CookieOrigin;

    .prologue
    .line 194
    invoke-virtual {p0}, Lorg/apache/http/cookie/CookieOrigin;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 198
    .local v1, "host":Ljava/lang/String;
    const/4 v3, 0x1

    .line 199
    .local v3, "isLocalHost":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_6
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_19

    .line 200
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 201
    .local v0, "ch":C
    const/16 v4, 0x2e

    if-eq v0, v4, :cond_18

    const/16 v4, 0x3a

    if-ne v0, v4, :cond_41

    .line 202
    :cond_18
    const/4 v3, 0x0

    .line 206
    .end local v0    # "ch":C
    :cond_19
    if-eqz v3, :cond_40

    .line 207
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".local"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 208
    new-instance v4, Lorg/apache/http/cookie/CookieOrigin;

    invoke-virtual {p0}, Lorg/apache/http/cookie/CookieOrigin;->getPort()I

    move-result v5

    invoke-virtual {p0}, Lorg/apache/http/cookie/CookieOrigin;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/http/cookie/CookieOrigin;->isSecure()Z

    move-result v7

    invoke-direct {v4, v1, v5, v6, v7}, Lorg/apache/http/cookie/CookieOrigin;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    move-object p0, v4

    .line 214
    .end local p0    # "origin":Lorg/apache/http/cookie/CookieOrigin;
    :cond_40
    return-object p0

    .line 199
    .restart local v0    # "ch":C
    .restart local p0    # "origin":Lorg/apache/http/cookie/CookieOrigin;
    :cond_41
    add-int/lit8 v2, v2, 0x1

    goto :goto_6
.end method

.method private createCookies([Lorg/apache/http/HeaderElement;Lorg/apache/http/cookie/CookieOrigin;)Ljava/util/List;
    .registers 25
    .param p1, "elems"    # [Lorg/apache/http/HeaderElement;
    .param p2, "origin"    # Lorg/apache/http/cookie/CookieOrigin;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/apache/http/HeaderElement;",
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
    .line 98
    new-instance v7, Ljava/util/ArrayList;

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    invoke-direct {v7, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 99
    .local v7, "cookies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    move-object/from16 v2, p1

    .local v2, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v14, v2

    .local v14, "len$":I
    const/4 v11, 0x0

    .local v11, "i$":I
    move v12, v11

    .end local v11    # "i$":I
    .local v12, "i$":I
    :goto_11
    if-ge v12, v14, :cond_d1

    aget-object v10, v2, v12

    .line 100
    .local v10, "headerelement":Lorg/apache/http/HeaderElement;
    invoke-interface {v10}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v15

    .line 101
    .local v15, "name":Ljava/lang/String;
    invoke-interface {v10}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v18

    .line 102
    .local v18, "value":Ljava/lang/String;
    if-eqz v15, :cond_25

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v19

    if-nez v19, :cond_2d

    .line 103
    :cond_25
    new-instance v19, Lorg/apache/http/cookie/MalformedCookieException;

    const-string v20, "Cookie name may not be empty"

    invoke-direct/range {v19 .. v20}, Lorg/apache/http/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 106
    :cond_2d
    new-instance v6, Lorg/apache/http/impl/cookie/BasicClientCookie2;

    move-object/from16 v0, v18

    invoke-direct {v6, v15, v0}, Lorg/apache/http/impl/cookie/BasicClientCookie2;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .local v6, "cookie":Lorg/apache/http/impl/cookie/BasicClientCookie2;
    invoke-static/range {p2 .. p2}, Lorg/apache/http/impl/cookie/RFC2965Spec;->getDefaultPath(Lorg/apache/http/cookie/CookieOrigin;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v6, v0}, Lorg/apache/http/impl/cookie/BasicClientCookie2;->setPath(Ljava/lang/String;)V

    .line 108
    invoke-static/range {p2 .. p2}, Lorg/apache/http/impl/cookie/RFC2965Spec;->getDefaultDomain(Lorg/apache/http/cookie/CookieOrigin;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v6, v0}, Lorg/apache/http/impl/cookie/BasicClientCookie2;->setDomain(Ljava/lang/String;)V

    .line 109
    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [I

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {p2 .. p2}, Lorg/apache/http/cookie/CookieOrigin;->getPort()I

    move-result v21

    aput v21, v19, v20

    move-object/from16 v0, v19

    invoke-virtual {v6, v0}, Lorg/apache/http/impl/cookie/BasicClientCookie2;->setPorts([I)V

    .line 111
    invoke-interface {v10}, Lorg/apache/http/HeaderElement;->getParameters()[Lorg/apache/http/NameValuePair;

    move-result-object v5

    .line 115
    .local v5, "attribs":[Lorg/apache/http/NameValuePair;
    new-instance v4, Ljava/util/HashMap;

    array-length v0, v5

    move/from16 v19, v0

    move/from16 v0, v19

    invoke-direct {v4, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 117
    .local v4, "attribmap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/NameValuePair;>;"
    array-length v0, v5

    move/from16 v19, v0

    add-int/lit8 v13, v19, -0x1

    .local v13, "j":I
    :goto_6e
    if-ltz v13, :cond_86

    .line 118
    aget-object v16, v5, v13

    .line 119
    .local v16, "param":Lorg/apache/http/NameValuePair;
    invoke-interface/range {v16 .. v16}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v19

    sget-object v20, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    add-int/lit8 v13, v13, -0x1

    goto :goto_6e

    .line 121
    .end local v16    # "param":Lorg/apache/http/NameValuePair;
    :cond_86
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .end local v12    # "i$":I
    .local v11, "i$":Ljava/util/Iterator;
    :cond_8e
    :goto_8e
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_c9

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map$Entry;

    .line 122
    .local v8, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/apache/http/NameValuePair;>;"
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/NameValuePair;

    .line 123
    .local v3, "attrib":Lorg/apache/http/NameValuePair;
    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v19

    sget-object v20, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v17

    .line 125
    .local v17, "s":Ljava/lang/String;
    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v6, v0, v1}, Lorg/apache/http/impl/cookie/BasicClientCookie2;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/cookie/RFC2965Spec;->findAttribHandler(Ljava/lang/String;)Lorg/apache/http/cookie/CookieAttributeHandler;

    move-result-object v9

    .line 128
    .local v9, "handler":Lorg/apache/http/cookie/CookieAttributeHandler;
    if-eqz v9, :cond_8e

    .line 129
    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v9, v6, v0}, Lorg/apache/http/cookie/CookieAttributeHandler;->parse(Lorg/apache/http/cookie/SetCookie;Ljava/lang/String;)V

    goto :goto_8e

    .line 132
    .end local v3    # "attrib":Lorg/apache/http/NameValuePair;
    .end local v8    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/apache/http/NameValuePair;>;"
    .end local v9    # "handler":Lorg/apache/http/cookie/CookieAttributeHandler;
    .end local v17    # "s":Ljava/lang/String;
    :cond_c9
    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    add-int/lit8 v11, v12, 0x1

    .local v11, "i$":I
    move v12, v11

    .end local v11    # "i$":I
    .restart local v12    # "i$":I
    goto/16 :goto_11

    .line 134
    .end local v4    # "attribmap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/NameValuePair;>;"
    .end local v5    # "attribs":[Lorg/apache/http/NameValuePair;
    .end local v6    # "cookie":Lorg/apache/http/impl/cookie/BasicClientCookie2;
    .end local v10    # "headerelement":Lorg/apache/http/HeaderElement;
    .end local v13    # "j":I
    .end local v15    # "name":Ljava/lang/String;
    .end local v18    # "value":Ljava/lang/String;
    :cond_d1
    return-object v7
.end method


# virtual methods
.method protected formatCookieAsVer(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/cookie/Cookie;I)V
    .registers 10
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "cookie"    # Lorg/apache/http/cookie/Cookie;
    .param p3, "version"    # I

    .prologue
    .line 158
    invoke-super {p0, p1, p2, p3}, Lorg/apache/http/impl/cookie/RFC2109Spec;->formatCookieAsVer(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/cookie/Cookie;I)V

    .line 160
    instance-of v4, p2, Lorg/apache/http/cookie/ClientCookie;

    if-eqz v4, :cond_48

    move-object v4, p2

    .line 162
    check-cast v4, Lorg/apache/http/cookie/ClientCookie;

    const-string v5, "port"

    invoke-interface {v4, v5}, Lorg/apache/http/cookie/ClientCookie;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 163
    .local v3, "s":Ljava/lang/String;
    if-eqz v3, :cond_48

    .line 164
    const-string v4, "; $Port"

    invoke-virtual {p1, v4}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 165
    const-string v4, "=\""

    invoke-virtual {p1, v4}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 166
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_43

    .line 167
    invoke-interface {p2}, Lorg/apache/http/cookie/Cookie;->getPorts()[I

    move-result-object v2

    .line 168
    .local v2, "ports":[I
    if-eqz v2, :cond_43

    .line 169
    array-length v1, v2

    .line 170
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2e
    if-ge v0, v1, :cond_43

    .line 171
    if-lez v0, :cond_37

    .line 172
    const-string v4, ","

    invoke-virtual {p1, v4}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 174
    :cond_37
    aget v4, v2, v0

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 170
    add-int/lit8 v0, v0, 0x1

    goto :goto_2e

    .line 178
    .end local v0    # "i":I
    .end local v1    # "len":I
    .end local v2    # "ports":[I
    :cond_43
    const-string v4, "\""

    invoke-virtual {p1, v4}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 181
    .end local v3    # "s":Ljava/lang/String;
    :cond_48
    return-void
.end method

.method public getVersion()I
    .registers 2

    .prologue
    .line 220
    const/4 v0, 0x1

    return v0
.end method

.method public getVersionHeader()Lorg/apache/http/Header;
    .registers 3

    .prologue
    .line 225
    new-instance v0, Lorg/apache/http/util/CharArrayBuffer;

    const/16 v1, 0x28

    invoke-direct {v0, v1}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 226
    .local v0, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    const-string v1, "Cookie2"

    invoke-virtual {v0, v1}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 227
    const-string v1, ": "

    invoke-virtual {v0, v1}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 228
    const-string v1, "$Version="

    invoke-virtual {v0, v1}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 229
    invoke-virtual {p0}, Lorg/apache/http/impl/cookie/RFC2965Spec;->getVersion()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 230
    new-instance v1, Lorg/apache/http/message/BufferedHeader;

    invoke-direct {v1, v0}, Lorg/apache/http/message/BufferedHeader;-><init>(Lorg/apache/http/util/CharArrayBuffer;)V

    return-object v1
.end method

.method public match(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)Z
    .registers 4
    .param p1, "cookie"    # Lorg/apache/http/cookie/Cookie;
    .param p2, "origin"    # Lorg/apache/http/cookie/CookieOrigin;

    .prologue
    .line 147
    const-string v0, "Cookie"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 148
    const-string v0, "Cookie origin"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 149
    invoke-static {p2}, Lorg/apache/http/impl/cookie/RFC2965Spec;->adjustEffectiveHost(Lorg/apache/http/cookie/CookieOrigin;)Lorg/apache/http/cookie/CookieOrigin;

    move-result-object v0

    invoke-super {p0, p1, v0}, Lorg/apache/http/impl/cookie/RFC2109Spec;->match(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)Z

    move-result v0

    return v0
.end method

.method public parse(Lorg/apache/http/Header;Lorg/apache/http/cookie/CookieOrigin;)Ljava/util/List;
    .registers 7
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
    .line 78
    const-string v1, "Header"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 79
    const-string v1, "Cookie origin"

    invoke-static {p2, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 80
    invoke-interface {p1}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Set-Cookie2"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_39

    .line 81
    new-instance v1, Lorg/apache/http/cookie/MalformedCookieException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unrecognized cookie header \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/http/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 84
    :cond_39
    invoke-interface {p1}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v0

    .line 85
    .local v0, "elems":[Lorg/apache/http/HeaderElement;
    invoke-static {p2}, Lorg/apache/http/impl/cookie/RFC2965Spec;->adjustEffectiveHost(Lorg/apache/http/cookie/CookieOrigin;)Lorg/apache/http/cookie/CookieOrigin;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/apache/http/impl/cookie/RFC2965Spec;->createCookies([Lorg/apache/http/HeaderElement;Lorg/apache/http/cookie/CookieOrigin;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method protected parse([Lorg/apache/http/HeaderElement;Lorg/apache/http/cookie/CookieOrigin;)Ljava/util/List;
    .registers 4
    .param p1, "elems"    # [Lorg/apache/http/HeaderElement;
    .param p2, "origin"    # Lorg/apache/http/cookie/CookieOrigin;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/apache/http/HeaderElement;",
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
    .line 92
    invoke-static {p2}, Lorg/apache/http/impl/cookie/RFC2965Spec;->adjustEffectiveHost(Lorg/apache/http/cookie/CookieOrigin;)Lorg/apache/http/cookie/CookieOrigin;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/cookie/RFC2965Spec;->createCookies([Lorg/apache/http/HeaderElement;Lorg/apache/http/cookie/CookieOrigin;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 235
    const-string v0, "rfc2965"

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
    .line 140
    const-string v0, "Cookie"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 141
    const-string v0, "Cookie origin"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 142
    invoke-static {p2}, Lorg/apache/http/impl/cookie/RFC2965Spec;->adjustEffectiveHost(Lorg/apache/http/cookie/CookieOrigin;)Lorg/apache/http/cookie/CookieOrigin;

    move-result-object v0

    invoke-super {p0, p1, v0}, Lorg/apache/http/impl/cookie/RFC2109Spec;->validate(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)V

    .line 143
    return-void
.end method
