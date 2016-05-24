.class public final Lcom/squareup/okhttp/CertificatePinner;
.super Ljava/lang/Object;
.source "CertificatePinner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/CertificatePinner$1;,
        Lcom/squareup/okhttp/CertificatePinner$Builder;
    }
.end annotation


# static fields
.field public static final DEFAULT:Lcom/squareup/okhttp/CertificatePinner;


# instance fields
.field private final hostnameToPins:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lokio/ByteString;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 104
    new-instance v0, Lcom/squareup/okhttp/CertificatePinner$Builder;

    invoke-direct {v0}, Lcom/squareup/okhttp/CertificatePinner$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/squareup/okhttp/CertificatePinner$Builder;->build()Lcom/squareup/okhttp/CertificatePinner;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/CertificatePinner;->DEFAULT:Lcom/squareup/okhttp/CertificatePinner;

    return-void
.end method

.method private constructor <init>(Lcom/squareup/okhttp/CertificatePinner$Builder;)V
    .registers 3
    .param p1, "builder"    # Lcom/squareup/okhttp/CertificatePinner$Builder;

    .prologue
    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    # getter for: Lcom/squareup/okhttp/CertificatePinner$Builder;->hostnameToPins:Ljava/util/Map;
    invoke-static {p1}, Lcom/squareup/okhttp/CertificatePinner$Builder;->access$000(Lcom/squareup/okhttp/CertificatePinner$Builder;)Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Lcom/squareup/okhttp/internal/Util;->immutableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/CertificatePinner;->hostnameToPins:Ljava/util/Map;

    .line 110
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/CertificatePinner$Builder;Lcom/squareup/okhttp/CertificatePinner$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/squareup/okhttp/CertificatePinner$Builder;
    .param p2, "x1"    # Lcom/squareup/okhttp/CertificatePinner$1;

    .prologue
    .line 103
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/CertificatePinner;-><init>(Lcom/squareup/okhttp/CertificatePinner$Builder;)V

    return-void
.end method

.method private static sha1(Ljava/security/cert/X509Certificate;)Lokio/ByteString;
    .registers 2
    .param p0, "x509Certificate"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 160
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v0

    invoke-interface {v0}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v0

    invoke-static {v0}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v0

    invoke-static {v0}, Lcom/squareup/okhttp/internal/Util;->sha1(Lokio/ByteString;)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public varargs check(Ljava/lang/String;[Ljava/security/cert/Certificate;)V
    .registers 13
    .param p1, "hostname"    # Ljava/lang/String;
    .param p2, "peerCertificates"    # [Ljava/security/cert/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLPeerUnverifiedException;
        }
    .end annotation

    .prologue
    .line 123
    iget-object v8, p0, Lcom/squareup/okhttp/CertificatePinner;->hostnameToPins:Ljava/util/Map;

    invoke-interface {v8, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 124
    .local v6, "pins":Ljava/util/List;, "Ljava/util/List<Lokio/ByteString;>;"
    if-nez v6, :cond_b

    .line 128
    :cond_a
    return-void

    .line 126
    :cond_b
    move-object v0, p2

    .local v0, "arr$":[Ljava/security/cert/Certificate;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_e
    if-ge v2, v3, :cond_22

    aget-object v1, v0, v2

    .local v1, "c":Ljava/security/cert/Certificate;
    move-object v7, v1

    .line 127
    check-cast v7, Ljava/security/cert/X509Certificate;

    .line 128
    .local v7, "x509Certificate":Ljava/security/cert/X509Certificate;
    invoke-static {v7}, Lcom/squareup/okhttp/CertificatePinner;->sha1(Ljava/security/cert/X509Certificate;)Lokio/ByteString;

    move-result-object v8

    invoke-interface {v6, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_a

    .line 126
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 132
    .end local v1    # "c":Ljava/security/cert/Certificate;
    .end local v7    # "x509Certificate":Ljava/security/cert/X509Certificate;
    :cond_22
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Certificate pinning failure!"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\n  Peer certificate chain:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 135
    .local v4, "message":Ljava/lang/StringBuilder;
    move-object v0, p2

    array-length v3, v0

    const/4 v2, 0x0

    :goto_36
    if-ge v2, v3, :cond_63

    aget-object v1, v0, v2

    .restart local v1    # "c":Ljava/security/cert/Certificate;
    move-object v7, v1

    .line 136
    check-cast v7, Ljava/security/cert/X509Certificate;

    .line 137
    .restart local v7    # "x509Certificate":Ljava/security/cert/X509Certificate;
    const-string v8, "\n    sha1/"

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v7}, Lcom/squareup/okhttp/CertificatePinner;->sha1(Ljava/security/cert/X509Certificate;)Lokio/ByteString;

    move-result-object v9

    invoke-virtual {v9}, Lokio/ByteString;->base64()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ": "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v7}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v9

    invoke-interface {v9}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    add-int/lit8 v2, v2, 0x1

    goto :goto_36

    .line 140
    .end local v1    # "c":Ljava/security/cert/Certificate;
    .end local v7    # "x509Certificate":Ljava/security/cert/X509Certificate;
    :cond_63
    const-string v8, "\n  Pinned certificates for "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_76
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_90

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lokio/ByteString;

    .line 142
    .local v5, "pin":Lokio/ByteString;
    const-string v8, "\n    sha1/"

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v5}, Lokio/ByteString;->base64()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_76

    .line 144
    .end local v5    # "pin":Lokio/ByteString;
    :cond_90
    new-instance v8, Ljavax/net/ssl/SSLPeerUnverifiedException;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    throw v8
.end method
