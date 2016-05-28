.class public Lorg/apache/http/client/utils/URIBuilder;
.super Ljava/lang/Object;
.source "URIBuilder.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private encodedAuthority:Ljava/lang/String;

.field private encodedFragment:Ljava/lang/String;

.field private encodedPath:Ljava/lang/String;

.field private encodedQuery:Ljava/lang/String;

.field private encodedSchemeSpecificPart:Ljava/lang/String;

.field private encodedUserInfo:Ljava/lang/String;

.field private fragment:Ljava/lang/String;

.field private host:Ljava/lang/String;

.field private path:Ljava/lang/String;

.field private port:I

.field private query:Ljava/lang/String;

.field private queryParams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation
.end field

.field private scheme:Ljava/lang/String;

.field private userInfo:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/http/client/utils/URIBuilder;->port:I

    .line 71
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/apache/http/client/utils/URIBuilder;->digestURI(Ljava/net/URI;)V

    .line 82
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .registers 2
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    invoke-direct {p0, p1}, Lorg/apache/http/client/utils/URIBuilder;->digestURI(Ljava/net/URI;)V

    .line 91
    return-void
.end method

.method private buildString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 109
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->scheme:Ljava/lang/String;

    if-eqz v1, :cond_14

    .line 110
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->scheme:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 112
    :cond_14
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    if-eqz v1, :cond_31

    .line 113
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    :cond_1d
    :goto_1d
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedFragment:Ljava/lang/String;

    if-eqz v1, :cond_f4

    .line 147
    const-string v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedFragment:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    :cond_2c
    :goto_2c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 115
    :cond_31
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedAuthority:Ljava/lang/String;

    if-eqz v1, :cond_5d

    .line 116
    const-string v1, "//"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedAuthority:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    :cond_40
    :goto_40
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedPath:Ljava/lang/String;

    if-eqz v1, :cond_b8

    .line 134
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedPath:Ljava/lang/String;

    invoke-static {v1}, Lorg/apache/http/client/utils/URIBuilder;->normalizePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    :cond_4d
    :goto_4d
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedQuery:Ljava/lang/String;

    if-eqz v1, :cond_ca

    .line 139
    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedQuery:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1d

    .line 117
    :cond_5d
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->host:Ljava/lang/String;

    if-eqz v1, :cond_40

    .line 118
    const-string v1, "//"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedUserInfo:Ljava/lang/String;

    if-eqz v1, :cond_9e

    .line 120
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedUserInfo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    :cond_75
    :goto_75
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->host:Ljava/lang/String;

    invoke-static {v1}, Lorg/apache/http/conn/util/InetAddressUtils;->isIPv6Address(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b2

    .line 125
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/client/utils/URIBuilder;->host:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    :goto_8e
    iget v1, p0, Lorg/apache/http/client/utils/URIBuilder;->port:I

    if-ltz v1, :cond_40

    .line 130
    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/apache/http/client/utils/URIBuilder;->port:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_40

    .line 121
    :cond_9e
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->userInfo:Ljava/lang/String;

    if-eqz v1, :cond_75

    .line 122
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->userInfo:Ljava/lang/String;

    invoke-direct {p0, v1}, Lorg/apache/http/client/utils/URIBuilder;->encodeUserInfo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_75

    .line 127
    :cond_b2
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_8e

    .line 135
    :cond_b8
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->path:Ljava/lang/String;

    if-eqz v1, :cond_4d

    .line 136
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->path:Ljava/lang/String;

    invoke-static {v1}, Lorg/apache/http/client/utils/URIBuilder;->normalizePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/http/client/utils/URIBuilder;->encodePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4d

    .line 140
    :cond_ca
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    if-eqz v1, :cond_df

    .line 141
    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    invoke-direct {p0, v2}, Lorg/apache/http/client/utils/URIBuilder;->encodeUrlForm(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1d

    .line 142
    :cond_df
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->query:Ljava/lang/String;

    if-eqz v1, :cond_1d

    .line 143
    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/client/utils/URIBuilder;->query:Ljava/lang/String;

    invoke-direct {p0, v2}, Lorg/apache/http/client/utils/URIBuilder;->encodeUric(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1d

    .line 148
    :cond_f4
    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->fragment:Ljava/lang/String;

    if-eqz v1, :cond_2c

    .line 149
    const-string v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/client/utils/URIBuilder;->fragment:Ljava/lang/String;

    invoke-direct {p0, v2}, Lorg/apache/http/client/utils/URIBuilder;->encodeUric(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_2c
.end method

.method private digestURI(Ljava/net/URI;)V
    .registers 4
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 155
    invoke-virtual {p1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->scheme:Ljava/lang/String;

    .line 156
    invoke-virtual {p1}, Ljava/net/URI;->getRawSchemeSpecificPart()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 157
    invoke-virtual {p1}, Ljava/net/URI;->getRawAuthority()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedAuthority:Ljava/lang/String;

    .line 158
    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->host:Ljava/lang/String;

    .line 159
    invoke-virtual {p1}, Ljava/net/URI;->getPort()I

    move-result v0

    iput v0, p0, Lorg/apache/http/client/utils/URIBuilder;->port:I

    .line 160
    invoke-virtual {p1}, Ljava/net/URI;->getRawUserInfo()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedUserInfo:Ljava/lang/String;

    .line 161
    invoke-virtual {p1}, Ljava/net/URI;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->userInfo:Ljava/lang/String;

    .line 162
    invoke-virtual {p1}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedPath:Ljava/lang/String;

    .line 163
    invoke-virtual {p1}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->path:Ljava/lang/String;

    .line 164
    invoke-virtual {p1}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedQuery:Ljava/lang/String;

    .line 165
    invoke-virtual {p1}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lorg/apache/http/Consts;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p0, v0, v1}, Lorg/apache/http/client/utils/URIBuilder;->parseQuery(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    .line 166
    invoke-virtual {p1}, Ljava/net/URI;->getRawFragment()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedFragment:Ljava/lang/String;

    .line 167
    invoke-virtual {p1}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->fragment:Ljava/lang/String;

    .line 168
    return-void
.end method

.method private encodePath(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 175
    sget-object v0, Lorg/apache/http/Consts;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {p1, v0}, Lorg/apache/http/client/utils/URLEncodedUtils;->encPath(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private encodeUric(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "fragment"    # Ljava/lang/String;

    .prologue
    .line 183
    sget-object v0, Lorg/apache/http/Consts;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {p1, v0}, Lorg/apache/http/client/utils/URLEncodedUtils;->encUric(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private encodeUrlForm(Ljava/util/List;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 179
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    sget-object v0, Lorg/apache/http/Consts;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {p1, v0}, Lorg/apache/http/client/utils/URLEncodedUtils;->format(Ljava/lang/Iterable;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private encodeUserInfo(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "userInfo"    # Ljava/lang/String;

    .prologue
    .line 171
    sget-object v0, Lorg/apache/http/Consts;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {p1, v0}, Lorg/apache/http/client/utils/URLEncodedUtils;->encUserInfo(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static normalizePath(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 474
    move-object v1, p0

    .line 475
    .local v1, "s":Ljava/lang/String;
    if-nez v1, :cond_5

    .line 476
    const/4 v2, 0x0

    .line 487
    :goto_4
    return-object v2

    .line 478
    :cond_5
    const/4 v0, 0x0

    .line 479
    .local v0, "n":I
    :goto_6
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_14

    .line 480
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2f

    if-eq v2, v3, :cond_1f

    .line 484
    :cond_14
    const/4 v2, 0x1

    if-le v0, v2, :cond_1d

    .line 485
    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :cond_1d
    move-object v2, v1

    .line 487
    goto :goto_4

    .line 479
    :cond_1f
    add-int/lit8 v0, v0, 0x1

    goto :goto_6
.end method

.method private parseQuery(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/util/List;
    .registers 4
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/nio/charset/Charset;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 94
    if-eqz p1, :cond_d

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_d

    .line 95
    invoke-static {p1, p2}, Lorg/apache/http/client/utils/URLEncodedUtils;->parse(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/util/List;

    move-result-object v0

    .line 97
    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method


# virtual methods
.method public addParameter(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;
    .registers 6
    .param p1, "param"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 347
    iget-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    if-nez v0, :cond_c

    .line 348
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    .line 350
    :cond_c
    iget-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v1, p1, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 351
    iput-object v2, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedQuery:Ljava/lang/String;

    .line 352
    iput-object v2, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 353
    iput-object v2, p0, Lorg/apache/http/client/utils/URIBuilder;->query:Ljava/lang/String;

    .line 354
    return-object p0
.end method

.method public addParameters(Ljava/util/List;)Lorg/apache/http/client/utils/URIBuilder;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;)",
            "Lorg/apache/http/client/utils/URIBuilder;"
        }
    .end annotation

    .prologue
    .local p1, "nvps":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    const/4 v1, 0x0

    .line 305
    iget-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    if-nez v0, :cond_c

    .line 306
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    .line 308
    :cond_c
    iget-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 309
    iput-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedQuery:Ljava/lang/String;

    .line 310
    iput-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 311
    iput-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->query:Ljava/lang/String;

    .line 312
    return-object p0
.end method

.method public build()Ljava/net/URI;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 104
    new-instance v0, Ljava/net/URI;

    invoke-direct {p0}, Lorg/apache/http/client/utils/URIBuilder;->buildString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public clearParameters()Lorg/apache/http/client/utils/URIBuilder;
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 389
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    .line 390
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedQuery:Ljava/lang/String;

    .line 391
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 392
    return-object p0
.end method

.method public getFragment()Ljava/lang/String;
    .registers 2

    .prologue
    .line 465
    iget-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->fragment:Ljava/lang/String;

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .registers 2

    .prologue
    .line 445
    iget-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 453
    iget-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .registers 2

    .prologue
    .line 449
    iget v0, p0, Lorg/apache/http/client/utils/URIBuilder;->port:I

    return v0
.end method

.method public getQueryParams()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 457
    iget-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    if-eqz v0, :cond_c

    .line 458
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 460
    :goto_b
    return-object v0

    :cond_c
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_b
.end method

.method public getScheme()Ljava/lang/String;
    .registers 2

    .prologue
    .line 437
    iget-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->scheme:Ljava/lang/String;

    return-object v0
.end method

.method public getUserInfo()Ljava/lang/String;
    .registers 2

    .prologue
    .line 441
    iget-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->userInfo:Ljava/lang/String;

    return-object v0
.end method

.method public isAbsolute()Z
    .registers 2

    .prologue
    .line 426
    iget-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->scheme:Ljava/lang/String;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isOpaque()Z
    .registers 2

    .prologue
    .line 433
    iget-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->path:Ljava/lang/String;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public removeQuery()Lorg/apache/http/client/utils/URIBuilder;
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 248
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    .line 249
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->query:Ljava/lang/String;

    .line 250
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedQuery:Ljava/lang/String;

    .line 251
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 252
    return-object p0
.end method

.method public setCustomQuery(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;
    .registers 3
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 405
    iput-object p1, p0, Lorg/apache/http/client/utils/URIBuilder;->query:Ljava/lang/String;

    .line 406
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedQuery:Ljava/lang/String;

    .line 407
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 408
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    .line 409
    return-object p0
.end method

.method public setFragment(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;
    .registers 3
    .param p1, "fragment"    # Ljava/lang/String;

    .prologue
    .line 417
    iput-object p1, p0, Lorg/apache/http/client/utils/URIBuilder;->fragment:Ljava/lang/String;

    .line 418
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedFragment:Ljava/lang/String;

    .line 419
    return-object p0
.end method

.method public setHost(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;
    .registers 3
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 218
    iput-object p1, p0, Lorg/apache/http/client/utils/URIBuilder;->host:Ljava/lang/String;

    .line 219
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 220
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedAuthority:Ljava/lang/String;

    .line 221
    return-object p0
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;
    .registers 8
    .param p1, "param"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 365
    iget-object v2, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    if-nez v2, :cond_c

    .line 366
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    .line 368
    :cond_c
    iget-object v2, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_34

    .line 369
    iget-object v2, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/apache/http/NameValuePair;>;"
    :cond_1a
    :goto_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_34

    .line 370
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/NameValuePair;

    .line 371
    .local v1, "nvp":Lorg/apache/http/NameValuePair;
    invoke-interface {v1}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 372
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_1a

    .line 376
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/apache/http/NameValuePair;>;"
    .end local v1    # "nvp":Lorg/apache/http/NameValuePair;
    :cond_34
    iget-object v2, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    new-instance v3, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v3, p1, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 377
    iput-object v4, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedQuery:Ljava/lang/String;

    .line 378
    iput-object v4, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 379
    iput-object v4, p0, Lorg/apache/http/client/utils/URIBuilder;->query:Ljava/lang/String;

    .line 380
    return-object p0
.end method

.method public setParameters(Ljava/util/List;)Lorg/apache/http/client/utils/URIBuilder;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;)",
            "Lorg/apache/http/client/utils/URIBuilder;"
        }
    .end annotation

    .prologue
    .local p1, "nvps":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    const/4 v1, 0x0

    .line 283
    iget-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    if-nez v0, :cond_18

    .line 284
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    .line 288
    :goto_c
    iget-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 289
    iput-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedQuery:Ljava/lang/String;

    .line 290
    iput-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 291
    iput-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->query:Ljava/lang/String;

    .line 292
    return-object p0

    .line 286
    :cond_18
    iget-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    goto :goto_c
.end method

.method public varargs setParameters([Lorg/apache/http/NameValuePair;)Lorg/apache/http/client/utils/URIBuilder;
    .registers 8
    .param p1, "nvps"    # [Lorg/apache/http/NameValuePair;

    .prologue
    const/4 v5, 0x0

    .line 325
    iget-object v4, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    if-nez v4, :cond_1b

    .line 326
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    .line 330
    :goto_c
    move-object v0, p1

    .local v0, "arr$":[Lorg/apache/http/NameValuePair;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_f
    if-ge v1, v2, :cond_21

    aget-object v3, v0, v1

    .line 331
    .local v3, "nvp":Lorg/apache/http/NameValuePair;
    iget-object v4, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 330
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 328
    .end local v0    # "arr$":[Lorg/apache/http/NameValuePair;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "nvp":Lorg/apache/http/NameValuePair;
    :cond_1b
    iget-object v4, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    goto :goto_c

    .line 333
    .restart local v0    # "arr$":[Lorg/apache/http/NameValuePair;
    .restart local v1    # "i$":I
    .restart local v2    # "len$":I
    :cond_21
    iput-object v5, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedQuery:Ljava/lang/String;

    .line 334
    iput-object v5, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 335
    iput-object v5, p0, Lorg/apache/http/client/utils/URIBuilder;->query:Ljava/lang/String;

    .line 336
    return-object p0
.end method

.method public setPath(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;
    .registers 3
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 238
    iput-object p1, p0, Lorg/apache/http/client/utils/URIBuilder;->path:Ljava/lang/String;

    .line 239
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 240
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedPath:Ljava/lang/String;

    .line 241
    return-object p0
.end method

.method public setPort(I)Lorg/apache/http/client/utils/URIBuilder;
    .registers 3
    .param p1, "port"    # I

    .prologue
    const/4 v0, 0x0

    .line 228
    if-gez p1, :cond_4

    const/4 p1, -0x1

    .end local p1    # "port":I
    :cond_4
    iput p1, p0, Lorg/apache/http/client/utils/URIBuilder;->port:I

    .line 229
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 230
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedAuthority:Ljava/lang/String;

    .line 231
    return-object p0
.end method

.method public setQuery(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;
    .registers 4
    .param p1, "query"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 266
    sget-object v0, Lorg/apache/http/Consts;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p0, p1, v0}, Lorg/apache/http/client/utils/URIBuilder;->parseQuery(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->queryParams:Ljava/util/List;

    .line 267
    iput-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->query:Ljava/lang/String;

    .line 268
    iput-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedQuery:Ljava/lang/String;

    .line 269
    iput-object v1, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 270
    return-object p0
.end method

.method public setScheme(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;
    .registers 2
    .param p1, "scheme"    # Ljava/lang/String;

    .prologue
    .line 190
    iput-object p1, p0, Lorg/apache/http/client/utils/URIBuilder;->scheme:Ljava/lang/String;

    .line 191
    return-object p0
.end method

.method public setUserInfo(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;
    .registers 3
    .param p1, "userInfo"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 199
    iput-object p1, p0, Lorg/apache/http/client/utils/URIBuilder;->userInfo:Ljava/lang/String;

    .line 200
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedSchemeSpecificPart:Ljava/lang/String;

    .line 201
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedAuthority:Ljava/lang/String;

    .line 202
    iput-object v0, p0, Lorg/apache/http/client/utils/URIBuilder;->encodedUserInfo:Ljava/lang/String;

    .line 203
    return-object p0
.end method

.method public setUserInfo(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;
    .registers 5
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;

    .prologue
    .line 211
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/http/client/utils/URIBuilder;->setUserInfo(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 470
    invoke-direct {p0}, Lorg/apache/http/client/utils/URIBuilder;->buildString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
