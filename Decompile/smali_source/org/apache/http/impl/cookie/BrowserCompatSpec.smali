.class public Lorg/apache/http/impl/cookie/BrowserCompatSpec;
.super Lorg/apache/http/impl/cookie/CookieSpecBase;
.source "BrowserCompatSpec.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/cookie/BrowserCompatSpec$2;
    }
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final DEFAULT_DATE_PATTERNS:[Ljava/lang/String;


# instance fields
.field private final datepatterns:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 63
    const/16 v0, 0xe

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "EEE, dd MMM yyyy HH:mm:ss zzz"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "EEE, dd-MMM-yy HH:mm:ss zzz"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "EEE MMM d HH:mm:ss yyyy"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "EEE, dd-MMM-yyyy HH:mm:ss z"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "EEE, dd-MMM-yyyy HH-mm-ss z"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "EEE, dd MMM yy HH:mm:ss z"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "EEE dd-MMM-yyyy HH:mm:ss z"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "EEE dd MMM yyyy HH:mm:ss z"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "EEE dd-MMM-yyyy HH-mm-ss z"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "EEE dd-MMM-yy HH:mm:ss z"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "EEE dd MMM yy HH:mm:ss z"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "EEE,dd-MMM-yy HH:mm:ss z"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "EEE,dd-MMM-yyyy HH:mm:ss z"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "EEE, dd-MM-yyyy HH:mm:ss z"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->DEFAULT_DATE_PATTERNS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 123
    const/4 v0, 0x0

    sget-object v1, Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;->SECURITYLEVEL_DEFAULT:Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;

    invoke-direct {p0, v0, v1}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;-><init>([Ljava/lang/String;Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;)V

    .line 124
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .registers 3
    .param p1, "datepatterns"    # [Ljava/lang/String;

    .prologue
    .line 118
    sget-object v0, Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;->SECURITYLEVEL_DEFAULT:Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;

    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;-><init>([Ljava/lang/String;Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;)V

    .line 119
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;)V
    .registers 6
    .param p1, "datepatterns"    # [Ljava/lang/String;
    .param p2, "securityLevel"    # Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;

    .prologue
    .line 84
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/CookieSpecBase;-><init>()V

    .line 85
    if-eqz p1, :cond_20

    .line 86
    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->datepatterns:[Ljava/lang/String;

    .line 90
    :goto_d
    sget-object v0, Lorg/apache/http/impl/cookie/BrowserCompatSpec$2;->$SwitchMap$org$apache$http$impl$cookie$BrowserCompatSpecFactory$SecurityLevel:[I

    invoke-virtual {p2}, Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_7a

    .line 104
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Unknown security level"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_20
    sget-object v0, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->DEFAULT_DATE_PATTERNS:[Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->datepatterns:[Ljava/lang/String;

    goto :goto_d

    .line 92
    :pswitch_25
    const-string v0, "path"

    new-instance v1, Lorg/apache/http/impl/cookie/BasicPathHandler;

    invoke-direct {v1}, Lorg/apache/http/impl/cookie/BasicPathHandler;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 107
    :goto_2f
    const-string v0, "domain"

    new-instance v1, Lorg/apache/http/impl/cookie/BasicDomainHandler;

    invoke-direct {v1}, Lorg/apache/http/impl/cookie/BasicDomainHandler;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 108
    const-string v0, "max-age"

    new-instance v1, Lorg/apache/http/impl/cookie/BasicMaxAgeHandler;

    invoke-direct {v1}, Lorg/apache/http/impl/cookie/BasicMaxAgeHandler;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 109
    const-string v0, "secure"

    new-instance v1, Lorg/apache/http/impl/cookie/BasicSecureHandler;

    invoke-direct {v1}, Lorg/apache/http/impl/cookie/BasicSecureHandler;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 110
    const-string v0, "comment"

    new-instance v1, Lorg/apache/http/impl/cookie/BasicCommentHandler;

    invoke-direct {v1}, Lorg/apache/http/impl/cookie/BasicCommentHandler;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 111
    const-string v0, "expires"

    new-instance v1, Lorg/apache/http/impl/cookie/BasicExpiresHandler;

    iget-object v2, p0, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->datepatterns:[Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/apache/http/impl/cookie/BasicExpiresHandler;-><init>([Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 113
    const-string v0, "version"

    new-instance v1, Lorg/apache/http/impl/cookie/BrowserCompatVersionAttributeHandler;

    invoke-direct {v1}, Lorg/apache/http/impl/cookie/BrowserCompatVersionAttributeHandler;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    .line 114
    return-void

    .line 95
    :pswitch_6e
    const-string v0, "path"

    new-instance v1, Lorg/apache/http/impl/cookie/BrowserCompatSpec$1;

    invoke-direct {v1, p0}, Lorg/apache/http/impl/cookie/BrowserCompatSpec$1;-><init>(Lorg/apache/http/impl/cookie/BrowserCompatSpec;)V

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->registerAttribHandler(Ljava/lang/String;Lorg/apache/http/cookie/CookieAttributeHandler;)V

    goto :goto_2f

    .line 90
    nop

    :pswitch_data_7a
    .packed-switch 0x1
        :pswitch_25
        :pswitch_6e
    .end packed-switch
.end method


# virtual methods
.method public formatCookies(Ljava/util/List;)Ljava/util/List;
    .registers 11
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
    const-string v6, "List of cookies"

    invoke-static {p1, v6}, Lorg/apache/http/util/Args;->notEmpty(Ljava/util/Collection;Ljava/lang/String;)Ljava/util/Collection;

    .line 173
    new-instance v0, Lorg/apache/http/util/CharArrayBuffer;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    mul-int/lit8 v6, v6, 0x14

    invoke-direct {v0, v6}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 174
    .local v0, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    const-string v6, "Cookie"

    invoke-virtual {v0, v6}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 175
    const-string v6, ": "

    invoke-virtual {v0, v6}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 176
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1b
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_68

    .line 177
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/cookie/Cookie;

    .line 178
    .local v1, "cookie":Lorg/apache/http/cookie/Cookie;
    if-lez v5, :cond_2e

    .line 179
    const-string v6, "; "

    invoke-virtual {v0, v6}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 181
    :cond_2e
    invoke-interface {v1}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v2

    .line 182
    .local v2, "cookieName":Ljava/lang/String;
    invoke-interface {v1}, Lorg/apache/http/cookie/Cookie;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 183
    .local v3, "cookieValue":Ljava/lang/String;
    invoke-interface {v1}, Lorg/apache/http/cookie/Cookie;->getVersion()I

    move-result v6

    if-lez v6, :cond_5a

    const-string v6, "\""

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4c

    const-string v6, "\""

    invoke-virtual {v3, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_5a

    .line 185
    :cond_4c
    sget-object v6, Lorg/apache/http/message/BasicHeaderValueFormatter;->INSTANCE:Lorg/apache/http/message/BasicHeaderValueFormatter;

    new-instance v7, Lorg/apache/http/message/BasicHeaderElement;

    invoke-direct {v7, v2, v3}, Lorg/apache/http/message/BasicHeaderElement;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v8, 0x0

    invoke-virtual {v6, v0, v7, v8}, Lorg/apache/http/message/BasicHeaderValueFormatter;->formatHeaderElement(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/HeaderElement;Z)Lorg/apache/http/util/CharArrayBuffer;

    .line 176
    :cond_57
    :goto_57
    add-int/lit8 v5, v5, 0x1

    goto :goto_1b

    .line 191
    :cond_5a
    invoke-virtual {v0, v2}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 192
    const-string v6, "="

    invoke-virtual {v0, v6}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 193
    if-eqz v3, :cond_57

    .line 194
    invoke-virtual {v0, v3}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    goto :goto_57

    .line 198
    .end local v1    # "cookie":Lorg/apache/http/cookie/Cookie;
    .end local v2    # "cookieName":Ljava/lang/String;
    .end local v3    # "cookieValue":Ljava/lang/String;
    :cond_68
    new-instance v4, Ljava/util/ArrayList;

    const/4 v6, 0x1

    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 199
    .local v4, "headers":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/Header;>;"
    new-instance v6, Lorg/apache/http/message/BufferedHeader;

    invoke-direct {v6, v0}, Lorg/apache/http/message/BufferedHeader;-><init>(Lorg/apache/http/util/CharArrayBuffer;)V

    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    return-object v4
.end method

.method public getVersion()I
    .registers 2

    .prologue
    .line 204
    const/4 v0, 0x0

    return v0
.end method

.method public getVersionHeader()Lorg/apache/http/Header;
    .registers 2

    .prologue
    .line 208
    const/4 v0, 0x0

    return-object v0
.end method

.method public parse(Lorg/apache/http/Header;Lorg/apache/http/cookie/CookieOrigin;)Ljava/util/List;
    .registers 20
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
    .line 128
    const-string v14, "Header"

    move-object/from16 v0, p1

    invoke-static {v0, v14}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 129
    const-string v14, "Cookie origin"

    move-object/from16 v0, p2

    invoke-static {v0, v14}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 130
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v5

    .line 131
    .local v5, "headername":Ljava/lang/String;
    const-string v14, "Set-Cookie"

    invoke-virtual {v5, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_3d

    .line 132
    new-instance v14, Lorg/apache/http/cookie/MalformedCookieException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Unrecognized cookie header \'"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "\'"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lorg/apache/http/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 135
    :cond_3d
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v7

    .line 136
    .local v7, "helems":[Lorg/apache/http/HeaderElement;
    const/4 v13, 0x0

    .line 137
    .local v13, "versioned":Z
    const/4 v10, 0x0

    .line 138
    .local v10, "netscape":Z
    move-object v2, v7

    .local v2, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v9, v2

    .local v9, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_46
    if-ge v8, v9, :cond_5f

    aget-object v6, v2, v8

    .line 139
    .local v6, "helem":Lorg/apache/http/HeaderElement;
    const-string v14, "version"

    invoke-interface {v6, v14}, Lorg/apache/http/HeaderElement;->getParameterByName(Ljava/lang/String;)Lorg/apache/http/NameValuePair;

    move-result-object v14

    if-eqz v14, :cond_53

    .line 140
    const/4 v13, 0x1

    .line 142
    :cond_53
    const-string v14, "expires"

    invoke-interface {v6, v14}, Lorg/apache/http/HeaderElement;->getParameterByName(Ljava/lang/String;)Lorg/apache/http/NameValuePair;

    move-result-object v14

    if-eqz v14, :cond_5c

    .line 143
    const/4 v10, 0x1

    .line 138
    :cond_5c
    add-int/lit8 v8, v8, 0x1

    goto :goto_46

    .line 146
    .end local v6    # "helem":Lorg/apache/http/HeaderElement;
    :cond_5f
    if-nez v10, :cond_63

    if-nez v13, :cond_8c

    .line 149
    :cond_63
    sget-object v11, Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;->DEFAULT:Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;

    .line 152
    .local v11, "parser":Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;
    move-object/from16 v0, p1

    instance-of v14, v0, Lorg/apache/http/FormattedHeader;

    if-eqz v14, :cond_95

    move-object/from16 v14, p1

    .line 153
    check-cast v14, Lorg/apache/http/FormattedHeader;

    invoke-interface {v14}, Lorg/apache/http/FormattedHeader;->getBuffer()Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v3

    .line 154
    .local v3, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    new-instance v4, Lorg/apache/http/message/ParserCursor;

    check-cast p1, Lorg/apache/http/FormattedHeader;

    .end local p1    # "header":Lorg/apache/http/Header;
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/FormattedHeader;->getValuePos()I

    move-result v14

    invoke-virtual {v3}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v15

    invoke-direct {v4, v14, v15}, Lorg/apache/http/message/ParserCursor;-><init>(II)V

    .line 166
    .local v4, "cursor":Lorg/apache/http/message/ParserCursor;
    :goto_82
    const/4 v14, 0x1

    new-array v7, v14, [Lorg/apache/http/HeaderElement;

    .end local v7    # "helems":[Lorg/apache/http/HeaderElement;
    const/4 v14, 0x0

    invoke-virtual {v11, v3, v4}, Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;->parseHeader(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;)Lorg/apache/http/HeaderElement;

    move-result-object v15

    aput-object v15, v7, v14

    .line 168
    .end local v3    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    .end local v4    # "cursor":Lorg/apache/http/message/ParserCursor;
    .end local v11    # "parser":Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;
    .restart local v7    # "helems":[Lorg/apache/http/HeaderElement;
    :cond_8c
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v7, v1}, Lorg/apache/http/impl/cookie/BrowserCompatSpec;->parse([Lorg/apache/http/HeaderElement;Lorg/apache/http/cookie/CookieOrigin;)Ljava/util/List;

    move-result-object v14

    return-object v14

    .line 158
    .restart local v11    # "parser":Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;
    .restart local p1    # "header":Lorg/apache/http/Header;
    :cond_95
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v12

    .line 159
    .local v12, "s":Ljava/lang/String;
    if-nez v12, :cond_a3

    .line 160
    new-instance v14, Lorg/apache/http/cookie/MalformedCookieException;

    const-string v15, "Header value is null"

    invoke-direct {v14, v15}, Lorg/apache/http/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 162
    :cond_a3
    new-instance v3, Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v14

    invoke-direct {v3, v14}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 163
    .restart local v3    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    invoke-virtual {v3, v12}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 164
    new-instance v4, Lorg/apache/http/message/ParserCursor;

    const/4 v14, 0x0

    invoke-virtual {v3}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v15

    invoke-direct {v4, v14, v15}, Lorg/apache/http/message/ParserCursor;-><init>(II)V

    .restart local v4    # "cursor":Lorg/apache/http/message/ParserCursor;
    goto :goto_82
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 213
    const-string v0, "compatibility"

    return-object v0
.end method
