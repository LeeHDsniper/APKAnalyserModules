.class public abstract Lorg/apache/http/conn/ssl/AbstractVerifier;
.super Ljava/lang/Object;
.source "AbstractVerifier.java"

# interfaces
.implements Lorg/apache/http/conn/ssl/X509HostnameVerifier;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final BAD_COUNTRY_2LDS:[Ljava/lang/String;


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 73
    const/16 v0, 0xe

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "ac"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "co"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "com"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "ed"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "edu"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "go"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "gouv"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "gov"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "info"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "lg"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "ne"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "net"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "or"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "org"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/http/conn/ssl/AbstractVerifier;->BAD_COUNTRY_2LDS:[Ljava/lang/String;

    .line 79
    sget-object v0, Lorg/apache/http/conn/ssl/AbstractVerifier;->BAD_COUNTRY_2LDS:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 80
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/conn/ssl/AbstractVerifier;->log:Lorg/apache/commons/logging/Log;

    .line 86
    return-void
.end method

.method public static acceptableCountryWildcard(Ljava/lang/String;)Z
    .registers 6
    .param p0, "cn"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v4, 0x2

    const/4 v1, 0x1

    .line 240
    const-string v2, "\\."

    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 241
    .local v0, "parts":[Ljava/lang/String;
    array-length v2, v0

    const/4 v3, 0x3

    if-ne v2, v3, :cond_14

    aget-object v2, v0, v4

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v2, v4, :cond_15

    .line 244
    :cond_14
    :goto_14
    return v1

    :cond_15
    sget-object v2, Lorg/apache/http/conn/ssl/AbstractVerifier;->BAD_COUNTRY_2LDS:[Ljava/lang/String;

    aget-object v3, v0, v1

    invoke-static {v2, v3}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-ltz v2, :cond_14

    const/4 v1, 0x0

    goto :goto_14
.end method

.method public static countDots(Ljava/lang/String;)I
    .registers 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 366
    const/4 v0, 0x0

    .line 367
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_15

    .line 368
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2e

    if-ne v2, v3, :cond_12

    .line 369
    add-int/lit8 v0, v0, 0x1

    .line 367
    :cond_12
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 372
    :cond_15
    return v0
.end method

.method public static getCNs(Ljava/security/cert/X509Certificate;)[Ljava/lang/String;
    .registers 9
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;

    .prologue
    const/4 v7, 0x3

    .line 256
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 280
    .local v0, "cnList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v5

    invoke-virtual {v5}, Ljavax/security/auth/x500/X500Principal;->toString()Ljava/lang/String;

    move-result-object v3

    .line 281
    .local v3, "subjectPrincipal":Ljava/lang/String;
    new-instance v2, Ljava/util/StringTokenizer;

    const-string v5, ",+"

    invoke-direct {v2, v3, v5}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    .local v2, "st":Ljava/util/StringTokenizer;
    :cond_15
    :goto_15
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v5

    if-eqz v5, :cond_3e

    .line 283
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 284
    .local v4, "tok":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-le v5, v7, :cond_15

    .line 285
    const/4 v5, 0x0

    invoke-virtual {v4, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    const-string v6, "CN="

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_15

    .line 286
    invoke-virtual {v4, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_15

    .line 290
    .end local v4    # "tok":Ljava/lang/String;
    :cond_3e
    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_4e

    .line 291
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v5

    new-array v1, v5, [Ljava/lang/String;

    .line 292
    .local v1, "cns":[Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 295
    .end local v1    # "cns":[Ljava/lang/String;
    :goto_4d
    return-object v1

    :cond_4e
    const/4 v1, 0x0

    goto :goto_4d
.end method

.method public static getDNSSubjectAlts(Ljava/security/cert/X509Certificate;)[Ljava/lang/String;
    .registers 2
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 357
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/http/conn/ssl/AbstractVerifier;->getSubjectAlts(Ljava/security/cert/X509Certificate;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getSubjectAlts(Ljava/security/cert/X509Certificate;Ljava/lang/String;)[Ljava/lang/String;
    .registers 12
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;
    .param p1, "hostname"    # Ljava/lang/String;

    .prologue
    .line 310
    invoke-static {p1}, Lorg/apache/http/conn/ssl/AbstractVerifier;->isIPAddress(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3c

    .line 311
    const/4 v7, 0x7

    .line 316
    .local v7, "subjectType":I
    :goto_7
    new-instance v5, Ljava/util/LinkedList;

    invoke-direct {v5}, Ljava/util/LinkedList;-><init>()V

    .line 317
    .local v5, "subjectAltList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 319
    .local v1, "c":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/List<*>;>;"
    :try_start_d
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectAlternativeNames()Ljava/util/Collection;
    :try_end_10
    .catch Ljava/security/cert/CertificateParsingException; {:try_start_d .. :try_end_10} :catch_50

    move-result-object v1

    .line 323
    :goto_11
    if-eqz v1, :cond_3e

    .line 324
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_17
    :goto_17
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 325
    .local v0, "aC":Ljava/util/List;, "Ljava/util/List<*>;"
    move-object v3, v0

    .line 326
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<*>;"
    const/4 v9, 0x0

    invoke-interface {v3, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 327
    .local v8, "type":I
    if-ne v8, v7, :cond_17

    .line 328
    const/4 v9, 0x1

    invoke-interface {v3, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 329
    .local v4, "s":Ljava/lang/String;
    invoke-virtual {v5, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_17

    .line 313
    .end local v0    # "aC":Ljava/util/List;, "Ljava/util/List<*>;"
    .end local v1    # "c":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/List<*>;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "list":Ljava/util/List;, "Ljava/util/List<*>;"
    .end local v4    # "s":Ljava/lang/String;
    .end local v5    # "subjectAltList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    .end local v7    # "subjectType":I
    .end local v8    # "type":I
    :cond_3c
    const/4 v7, 0x2

    .restart local v7    # "subjectType":I
    goto :goto_7

    .line 333
    .restart local v1    # "c":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/List<*>;>;"
    .restart local v5    # "subjectAltList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_3e
    invoke-virtual {v5}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_4e

    .line 334
    invoke-virtual {v5}, Ljava/util/LinkedList;->size()I

    move-result v9

    new-array v6, v9, [Ljava/lang/String;

    .line 335
    .local v6, "subjectAlts":[Ljava/lang/String;
    invoke-virtual {v5, v6}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 338
    .end local v6    # "subjectAlts":[Ljava/lang/String;
    :goto_4d
    return-object v6

    :cond_4e
    const/4 v6, 0x0

    goto :goto_4d

    .line 321
    :catch_50
    move-exception v9

    goto :goto_11
.end method

.method private static isIPAddress(Ljava/lang/String;)Z
    .registers 2
    .param p0, "hostname"    # Ljava/lang/String;

    .prologue
    .line 376
    if-eqz p0, :cond_10

    invoke-static {p0}, Lorg/apache/http/conn/util/InetAddressUtils;->isIPv4Address(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    invoke-static {p0}, Lorg/apache/http/conn/util/InetAddressUtils;->isIPv6Address(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method private normaliseIPv6Address(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "hostname"    # Ljava/lang/String;

    .prologue
    .line 385
    if-eqz p1, :cond_8

    invoke-static {p1}, Lorg/apache/http/conn/util/InetAddressUtils;->isIPv6Address(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_9

    .line 393
    .end local p1    # "hostname":Ljava/lang/String;
    :cond_8
    :goto_8
    return-object p1

    .line 389
    .restart local p1    # "hostname":Ljava/lang/String;
    :cond_9
    :try_start_9
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    .line 390
    .local v0, "inetAddress":Ljava/net/InetAddress;
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;
    :try_end_10
    .catch Ljava/net/UnknownHostException; {:try_start_9 .. :try_end_10} :catch_12

    move-result-object p1

    goto :goto_8

    .line 391
    .end local v0    # "inetAddress":Ljava/net/InetAddress;
    :catch_12
    move-exception v1

    .line 392
    .local v1, "uhe":Ljava/net/UnknownHostException;
    iget-object v2, p0, Lorg/apache/http/conn/ssl/AbstractVerifier;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected error converting "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_8
.end method


# virtual methods
.method validCountryWildcard(Ljava/lang/String;)Z
    .registers 7
    .param p1, "cn"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x2

    const/4 v1, 0x1

    .line 248
    const-string v2, "\\."

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 249
    .local v0, "parts":[Ljava/lang/String;
    array-length v2, v0

    const/4 v3, 0x3

    if-ne v2, v3, :cond_14

    aget-object v2, v0, v4

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v2, v4, :cond_15

    .line 252
    :cond_14
    :goto_14
    return v1

    :cond_15
    sget-object v2, Lorg/apache/http/conn/ssl/AbstractVerifier;->BAD_COUNTRY_2LDS:[Ljava/lang/String;

    aget-object v3, v0, v1

    invoke-static {v2, v3}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-ltz v2, :cond_14

    const/4 v1, 0x0

    goto :goto_14
.end method

.method public final verify(Ljava/lang/String;Ljava/security/cert/X509Certificate;)V
    .registers 5
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "cert"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 150
    invoke-static {p2}, Lorg/apache/http/conn/ssl/AbstractVerifier;->getCNs(Ljava/security/cert/X509Certificate;)[Ljava/lang/String;

    move-result-object v0

    .line 151
    .local v0, "cns":[Ljava/lang/String;
    invoke-static {p2, p1}, Lorg/apache/http/conn/ssl/AbstractVerifier;->getSubjectAlts(Ljava/security/cert/X509Certificate;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 152
    .local v1, "subjectAlts":[Ljava/lang/String;
    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/http/conn/ssl/AbstractVerifier;->verify(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 153
    return-void
.end method

.method public final verify(Ljava/lang/String;Ljavax/net/ssl/SSLSocket;)V
    .registers 9
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "ssl"    # Ljavax/net/ssl/SSLSocket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    if-nez p1, :cond_a

    .line 91
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "host to verify is null"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 94
    :cond_a
    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v2

    .line 95
    .local v2, "session":Ljavax/net/ssl/SSLSession;
    if-nez v2, :cond_24

    .line 99
    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 100
    .local v1, "in":Ljava/io/InputStream;
    invoke-virtual {v1}, Ljava/io/InputStream;->available()I

    .line 119
    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v2

    .line 120
    if-nez v2, :cond_24

    .line 123
    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 127
    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v2

    .line 131
    .end local v1    # "in":Ljava/io/InputStream;
    :cond_24
    invoke-interface {v2}, Ljavax/net/ssl/SSLSession;->getPeerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v0

    .line 132
    .local v0, "certs":[Ljava/security/cert/Certificate;
    const/4 v4, 0x0

    aget-object v3, v0, v4

    check-cast v3, Ljava/security/cert/X509Certificate;

    .line 133
    .local v3, "x509":Ljava/security/cert/X509Certificate;
    invoke-virtual {p0, p1, v3}, Lorg/apache/http/conn/ssl/AbstractVerifier;->verify(Ljava/lang/String;Ljava/security/cert/X509Certificate;)V

    .line 134
    return-void
.end method

.method public final verify(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)V
    .registers 27
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "cns"    # [Ljava/lang/String;
    .param p3, "subjectAlts"    # [Ljava/lang/String;
    .param p4, "strictWithSubDomains"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 164
    new-instance v14, Ljava/util/LinkedList;

    invoke-direct {v14}, Ljava/util/LinkedList;-><init>()V

    .line 165
    .local v14, "names":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    if-eqz p2, :cond_1d

    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v19, v0

    if-lez v19, :cond_1d

    const/16 v19, 0x0

    aget-object v19, p2, v19

    if-eqz v19, :cond_1d

    .line 166
    const/16 v19, 0x0

    aget-object v19, p2, v19

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 168
    :cond_1d
    if-eqz p3, :cond_31

    .line 169
    move-object/from16 v2, p3

    .local v2, "arr$":[Ljava/lang/String;
    array-length v11, v2

    .local v11, "len$":I
    const/4 v9, 0x0

    .local v9, "i$":I
    :goto_23
    if-ge v9, v11, :cond_31

    aget-object v17, v2, v9

    .line 170
    .local v17, "subjectAlt":Ljava/lang/String;
    if-eqz v17, :cond_2e

    .line 171
    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 169
    :cond_2e
    add-int/lit8 v9, v9, 0x1

    goto :goto_23

    .line 176
    .end local v2    # "arr$":[Ljava/lang/String;
    .end local v9    # "i$":I
    .end local v11    # "len$":I
    .end local v17    # "subjectAlt":Ljava/lang/String;
    :cond_31
    invoke-virtual {v14}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v19

    if-eqz v19, :cond_5c

    .line 177
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Certificate for <"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "> doesn\'t contain CN or DNS subjectAlt"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 178
    .local v13, "msg":Ljava/lang/String;
    new-instance v19, Ljavax/net/ssl/SSLException;

    move-object/from16 v0, v19

    invoke-direct {v0, v13}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 182
    .end local v13    # "msg":Ljava/lang/String;
    :cond_5c
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 186
    .local v3, "buf":Ljava/lang/StringBuilder;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    sget-object v20, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/apache/http/conn/ssl/AbstractVerifier;->normaliseIPv6Address(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 187
    .local v7, "hostName":Ljava/lang/String;
    const/4 v12, 0x0

    .line 188
    .local v12, "match":Z
    invoke-virtual {v14}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_78
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_134

    .line 190
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 191
    .local v4, "cn":Ljava/lang/String;
    sget-object v19, Ljava/util/Locale;->US:Ljava/util/Locale;

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    .line 193
    const-string v19, " <"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    const/16 v19, 0x3e

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 196
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_aa

    .line 197
    const-string v19, " OR"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    :cond_aa
    const-string v19, "\\."

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 204
    .local v15, "parts":[Ljava/lang/String;
    array-length v0, v15

    move/from16 v19, v0

    const/16 v20, 0x3

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_15f

    const/16 v19, 0x0

    aget-object v19, v15, v19

    const-string v20, "*"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_15f

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lorg/apache/http/conn/ssl/AbstractVerifier;->validCountryWildcard(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_15f

    invoke-static/range {p1 .. p1}, Lorg/apache/http/conn/ssl/AbstractVerifier;->isIPAddress(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_15f

    const/4 v5, 0x1

    .line 208
    .local v5, "doWildcard":Z
    :goto_d8
    if-eqz v5, :cond_175

    .line 209
    const/16 v19, 0x0

    aget-object v6, v15, v19

    .line 210
    .local v6, "firstpart":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v19

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_164

    .line 211
    const/16 v19, 0x0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v20

    add-int/lit8 v20, v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v6, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v16

    .line 212
    .local v16, "prefix":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v18

    .line 213
    .local v18, "suffix":Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 214
    .local v8, "hostSuffix":Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-virtual {v7, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_162

    move-object/from16 v0, v18

    invoke-virtual {v8, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_162

    const/4 v12, 0x1

    .line 218
    .end local v8    # "hostSuffix":Ljava/lang/String;
    .end local v16    # "prefix":Ljava/lang/String;
    .end local v18    # "suffix":Ljava/lang/String;
    :goto_11f
    if-eqz v12, :cond_132

    if-eqz p4, :cond_132

    .line 221
    invoke-static {v7}, Lorg/apache/http/conn/ssl/AbstractVerifier;->countDots(Ljava/lang/String;)I

    move-result v19

    invoke-static {v4}, Lorg/apache/http/conn/ssl/AbstractVerifier;->countDots(Ljava/lang/String;)I

    move-result v20

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_173

    const/4 v12, 0x1

    .line 226
    .end local v6    # "firstpart":Ljava/lang/String;
    :cond_132
    :goto_132
    if-eqz v12, :cond_78

    .line 230
    .end local v4    # "cn":Ljava/lang/String;
    .end local v5    # "doWildcard":Z
    .end local v15    # "parts":[Ljava/lang/String;
    :cond_134
    if-nez v12, :cond_182

    .line 231
    new-instance v19, Ljavax/net/ssl/SSLException;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "hostname in certificate didn\'t match: <"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "> !="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 204
    .restart local v4    # "cn":Ljava/lang/String;
    .restart local v15    # "parts":[Ljava/lang/String;
    :cond_15f
    const/4 v5, 0x0

    goto/16 :goto_d8

    .line 214
    .restart local v5    # "doWildcard":Z
    .restart local v6    # "firstpart":Ljava/lang/String;
    .restart local v8    # "hostSuffix":Ljava/lang/String;
    .restart local v16    # "prefix":Ljava/lang/String;
    .restart local v18    # "suffix":Ljava/lang/String;
    :cond_162
    const/4 v12, 0x0

    goto :goto_11f

    .line 216
    .end local v8    # "hostSuffix":Ljava/lang/String;
    .end local v16    # "prefix":Ljava/lang/String;
    .end local v18    # "suffix":Ljava/lang/String;
    :cond_164
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    goto :goto_11f

    .line 221
    :cond_173
    const/4 v12, 0x0

    goto :goto_132

    .line 224
    .end local v6    # "firstpart":Ljava/lang/String;
    :cond_175
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/apache/http/conn/ssl/AbstractVerifier;->normaliseIPv6Address(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    goto :goto_132

    .line 233
    .end local v4    # "cn":Ljava/lang/String;
    .end local v5    # "doWildcard":Z
    .end local v15    # "parts":[Ljava/lang/String;
    :cond_182
    return-void
.end method

.method public final verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    .registers 8
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "session"    # Ljavax/net/ssl/SSLSession;

    .prologue
    const/4 v3, 0x0

    .line 138
    :try_start_1
    invoke-interface {p2}, Ljavax/net/ssl/SSLSession;->getPeerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v0

    .line 139
    .local v0, "certs":[Ljava/security/cert/Certificate;
    const/4 v4, 0x0

    aget-object v2, v0, v4

    check-cast v2, Ljava/security/cert/X509Certificate;

    .line 140
    .local v2, "x509":Ljava/security/cert/X509Certificate;
    invoke-virtual {p0, p1, v2}, Lorg/apache/http/conn/ssl/AbstractVerifier;->verify(Ljava/lang/String;Ljava/security/cert/X509Certificate;)V
    :try_end_d
    .catch Ljavax/net/ssl/SSLException; {:try_start_1 .. :try_end_d} :catch_f

    .line 141
    const/4 v3, 0x1

    .line 144
    .end local v0    # "certs":[Ljava/security/cert/Certificate;
    .end local v2    # "x509":Ljava/security/cert/X509Certificate;
    :goto_e
    return v3

    .line 143
    :catch_f
    move-exception v1

    .line 144
    .local v1, "e":Ljavax/net/ssl/SSLException;
    goto :goto_e
.end method
