.class public final Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;
.super Ljava/lang/Object;
.source "OkHostnameVerifier.java"

# interfaces
.implements Ljavax/net/ssl/HostnameVerifier;


# static fields
.field public static final INSTANCE:Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;

.field private static final VERIFY_AS_IP_ADDRESS:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 39
    new-instance v0, Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;

    invoke-direct {v0}, Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;-><init>()V

    sput-object v0, Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;->INSTANCE:Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;

    .line 52
    const-string v0, "([0-9a-fA-F]*:[0-9a-fA-F:.]*)|([\\d.]+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;->VERIFY_AS_IP_ADDRESS:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    return-void
.end method

.method private getSubjectAltNames(Ljava/security/cert/X509Certificate;I)Ljava/util/List;
    .registers 14
    .param p1, "certificate"    # Ljava/security/cert/X509Certificate;
    .param p2, "type"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/security/cert/X509Certificate;",
            "I)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 118
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .local v6, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :try_start_5
    invoke-virtual {p1}, Ljava/security/cert/X509Certificate;->getSubjectAlternativeNames()Ljava/util/Collection;

    move-result-object v8

    .line 121
    .local v8, "subjectAltNames":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    if-nez v8, :cond_10

    .line 122
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v6

    .line 142
    .end local v6    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v8    # "subjectAltNames":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    :cond_f
    :goto_f
    return-object v6

    .line 124
    .restart local v6    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v8    # "subjectAltNames":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    :cond_10
    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_14
    :goto_14
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_f

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 125
    .local v7, "subjectAltName":Ljava/lang/Object;
    move-object v0, v7

    check-cast v0, Ljava/util/List;

    move-object v4, v0

    .line 126
    .local v4, "entry":Ljava/util/List;, "Ljava/util/List<*>;"
    if-eqz v4, :cond_14

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v9

    const/4 v10, 0x2

    if-lt v9, v10, :cond_14

    .line 129
    const/4 v9, 0x0

    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 130
    .local v2, "altNameType":Ljava/lang/Integer;
    if-eqz v2, :cond_14

    .line 133
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-ne v9, p2, :cond_14

    .line 134
    const/4 v9, 0x1

    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 135
    .local v1, "altName":Ljava/lang/String;
    if-eqz v1, :cond_14

    .line 136
    invoke-interface {v6, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_46
    .catch Ljava/security/cert/CertificateParsingException; {:try_start_5 .. :try_end_46} :catch_47

    goto :goto_14

    .line 141
    .end local v1    # "altName":Ljava/lang/String;
    .end local v2    # "altNameType":Ljava/lang/Integer;
    .end local v4    # "entry":Ljava/util/List;, "Ljava/util/List<*>;"
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v7    # "subjectAltName":Ljava/lang/Object;
    .end local v8    # "subjectAltNames":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    :catch_47
    move-exception v3

    .line 142
    .local v3, "e":Ljava/security/cert/CertificateParsingException;
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v6

    goto :goto_f
.end method

.method static verifyAsIpAddress(Ljava/lang/String;)Z
    .registers 2
    .param p0, "host"    # Ljava/lang/String;

    .prologue
    .line 77
    sget-object v0, Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;->VERIFY_AS_IP_ADDRESS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    return v0
.end method

.method private verifyHostName(Ljava/lang/String;Ljava/security/cert/X509Certificate;)Z
    .registers 10
    .param p1, "hostName"    # Ljava/lang/String;
    .param p2, "certificate"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 96
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 97
    const/4 v2, 0x0

    .line 98
    .local v2, "hasDns":Z
    const/4 v5, 0x2

    invoke-direct {p0, p2, v5}, Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;->getSubjectAltNames(Ljava/security/cert/X509Certificate;I)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_10
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_25

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 99
    .local v0, "altName":Ljava/lang/String;
    const/4 v2, 0x1

    .line 100
    invoke-virtual {p0, p1, v0}, Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;->verifyHostName(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_10

    .line 101
    const/4 v5, 0x1

    .line 114
    .end local v0    # "altName":Ljava/lang/String;
    :goto_24
    return v5

    .line 105
    :cond_25
    if-nez v2, :cond_3d

    .line 106
    invoke-virtual {p2}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v4

    .line 108
    .local v4, "principal":Ljavax/security/auth/x500/X500Principal;
    new-instance v5, Lcom/squareup/okhttp/internal/tls/DistinguishedNameParser;

    invoke-direct {v5, v4}, Lcom/squareup/okhttp/internal/tls/DistinguishedNameParser;-><init>(Ljavax/security/auth/x500/X500Principal;)V

    const-string v6, "cn"

    invoke-virtual {v5, v6}, Lcom/squareup/okhttp/internal/tls/DistinguishedNameParser;->findMostSpecific(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 109
    .local v1, "cn":Ljava/lang/String;
    if-eqz v1, :cond_3d

    .line 110
    invoke-virtual {p0, p1, v1}, Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;->verifyHostName(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    goto :goto_24

    .line 114
    .end local v1    # "cn":Ljava/lang/String;
    .end local v4    # "principal":Ljavax/security/auth/x500/X500Principal;
    :cond_3d
    const/4 v5, 0x0

    goto :goto_24
.end method

.method private verifyIpAddress(Ljava/lang/String;Ljava/security/cert/X509Certificate;)Z
    .registers 6
    .param p1, "ipAddress"    # Ljava/lang/String;
    .param p2, "certificate"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 84
    const/4 v2, 0x7

    invoke-direct {p0, p2, v2}, Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;->getSubjectAltNames(Ljava/security/cert/X509Certificate;I)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 85
    .local v0, "altName":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 86
    const/4 v2, 0x1

    .line 89
    .end local v0    # "altName":Ljava/lang/String;
    :goto_1c
    return v2

    :cond_1d
    const/4 v2, 0x0

    goto :goto_1c
.end method


# virtual methods
.method public verify(Ljava/lang/String;Ljava/security/cert/X509Certificate;)Z
    .registers 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "certificate"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 71
    invoke-static {p1}, Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;->verifyAsIpAddress(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-direct {p0, p1, p2}, Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;->verifyIpAddress(Ljava/lang/String;Ljava/security/cert/X509Certificate;)Z

    move-result v0

    :goto_a
    return v0

    :cond_b
    invoke-direct {p0, p1, p2}, Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;->verifyHostName(Ljava/lang/String;Ljava/security/cert/X509Certificate;)Z

    move-result v0

    goto :goto_a
.end method

.method public verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    .registers 7
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "session"    # Ljavax/net/ssl/SSLSession;

    .prologue
    const/4 v3, 0x0

    .line 63
    :try_start_1
    invoke-interface {p2}, Ljavax/net/ssl/SSLSession;->getPeerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v0

    .line 64
    .local v0, "certificates":[Ljava/security/cert/Certificate;
    const/4 v2, 0x0

    aget-object v2, v0, v2

    check-cast v2, Ljava/security/cert/X509Certificate;

    invoke-virtual {p0, p1, v2}, Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;->verify(Ljava/lang/String;Ljava/security/cert/X509Certificate;)Z
    :try_end_d
    .catch Ljavax/net/ssl/SSLException; {:try_start_1 .. :try_end_d} :catch_f

    move-result v2

    .line 66
    .end local v0    # "certificates":[Ljava/security/cert/Certificate;
    :goto_e
    return v2

    .line 65
    :catch_f
    move-exception v1

    .local v1, "e":Ljavax/net/ssl/SSLException;
    move v2, v3

    .line 66
    goto :goto_e
.end method

.method public verifyHostName(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 12
    .param p1, "hostName"    # Ljava/lang/String;
    .param p2, "cn"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x2e

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 155
    if-eqz p1, :cond_14

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_14

    if-eqz p2, :cond_14

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_16

    :cond_14
    move v4, v5

    .line 189
    :cond_15
    :goto_15
    return v4

    .line 159
    :cond_16
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p2, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    .line 161
    const-string v6, "*"

    invoke-virtual {p2, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_29

    .line 162
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    goto :goto_15

    .line 165
    :cond_29
    const-string v6, "*."

    invoke-virtual {p2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3e

    const/4 v6, 0x2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x2

    invoke-virtual {p1, v5, p2, v6, v7}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v6

    if-nez v6, :cond_15

    .line 169
    :cond_3e
    const/16 v6, 0x2a

    invoke-virtual {p2, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 170
    .local v0, "asterisk":I
    invoke-virtual {p2, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 171
    .local v1, "dot":I
    if-le v0, v1, :cond_4c

    move v4, v5

    .line 172
    goto :goto_15

    .line 175
    :cond_4c
    invoke-virtual {p1, v5, p2, v5, v0}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v6

    if-nez v6, :cond_54

    move v4, v5

    .line 176
    goto :goto_15

    .line 179
    :cond_54
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v7, v0, 0x1

    sub-int v2, v6, v7

    .line 180
    .local v2, "suffixLength":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    sub-int v3, v6, v2

    .line 181
    .local v3, "suffixStart":I
    invoke-virtual {p1, v8, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v6

    if-ge v6, v3, :cond_6a

    move v4, v5

    .line 182
    goto :goto_15

    .line 185
    :cond_6a
    add-int/lit8 v6, v0, 0x1

    invoke-virtual {p1, v3, p2, v6, v2}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v6

    if-nez v6, :cond_15

    move v4, v5

    .line 186
    goto :goto_15
.end method
