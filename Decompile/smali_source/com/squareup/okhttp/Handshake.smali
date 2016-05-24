.class public final Lcom/squareup/okhttp/Handshake;
.super Ljava/lang/Object;
.source "Handshake.java"


# instance fields
.field private final cipherSuite:Ljava/lang/String;

.field private final localCertificates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation
.end field

.field private final peerCertificates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .registers 4
    .param p1, "cipherSuite"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/Certificate;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/Certificate;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p2, "peerCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    .local p3, "localCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/squareup/okhttp/Handshake;->cipherSuite:Ljava/lang/String;

    .line 43
    iput-object p2, p0, Lcom/squareup/okhttp/Handshake;->peerCertificates:Ljava/util/List;

    .line 44
    iput-object p3, p0, Lcom/squareup/okhttp/Handshake;->localCertificates:Ljava/util/List;

    .line 45
    return-void
.end method

.method public static get(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)Lcom/squareup/okhttp/Handshake;
    .registers 6
    .param p0, "cipherSuite"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/Certificate;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/Certificate;",
            ">;)",
            "Lcom/squareup/okhttp/Handshake;"
        }
    .end annotation

    .prologue
    .line 71
    .local p1, "peerCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    .local p2, "localCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    if-nez p0, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "cipherSuite == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_a
    new-instance v0, Lcom/squareup/okhttp/Handshake;

    invoke-static {p1}, Lcom/squareup/okhttp/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-static {p2}, Lcom/squareup/okhttp/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Lcom/squareup/okhttp/Handshake;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method public static get(Ljavax/net/ssl/SSLSession;)Lcom/squareup/okhttp/Handshake;
    .registers 9
    .param p0, "session"    # Ljavax/net/ssl/SSLSession;

    .prologue
    .line 48
    invoke-interface {p0}, Ljavax/net/ssl/SSLSession;->getCipherSuite()Ljava/lang/String;

    move-result-object v0

    .line 49
    .local v0, "cipherSuite":Ljava/lang/String;
    if-nez v0, :cond_e

    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "cipherSuite == null"

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 53
    :cond_e
    :try_start_e
    invoke-interface {p0}, Ljavax/net/ssl/SSLSession;->getPeerCertificates()[Ljava/security/cert/Certificate;
    :try_end_11
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_e .. :try_end_11} :catch_28

    move-result-object v4

    .line 57
    .local v4, "peerCertificates":[Ljava/security/cert/Certificate;
    :goto_12
    if-eqz v4, :cond_2b

    invoke-static {v4}, Lcom/squareup/okhttp/internal/Util;->immutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    .line 61
    .local v5, "peerCertificatesList":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    :goto_18
    invoke-interface {p0}, Ljavax/net/ssl/SSLSession;->getLocalCertificates()[Ljava/security/cert/Certificate;

    move-result-object v2

    .line 62
    .local v2, "localCertificates":[Ljava/security/cert/Certificate;
    if-eqz v2, :cond_30

    invoke-static {v2}, Lcom/squareup/okhttp/internal/Util;->immutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    .line 66
    .local v3, "localCertificatesList":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    :goto_22
    new-instance v6, Lcom/squareup/okhttp/Handshake;

    invoke-direct {v6, v0, v5, v3}, Lcom/squareup/okhttp/Handshake;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    return-object v6

    .line 54
    .end local v2    # "localCertificates":[Ljava/security/cert/Certificate;
    .end local v3    # "localCertificatesList":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    .end local v4    # "peerCertificates":[Ljava/security/cert/Certificate;
    .end local v5    # "peerCertificatesList":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    :catch_28
    move-exception v1

    .line 55
    .local v1, "ignored":Ljavax/net/ssl/SSLPeerUnverifiedException;
    const/4 v4, 0x0

    .restart local v4    # "peerCertificates":[Ljava/security/cert/Certificate;
    goto :goto_12

    .line 57
    .end local v1    # "ignored":Ljavax/net/ssl/SSLPeerUnverifiedException;
    :cond_2b
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v5

    goto :goto_18

    .line 62
    .restart local v2    # "localCertificates":[Ljava/security/cert/Certificate;
    .restart local v5    # "peerCertificatesList":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    :cond_30
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    goto :goto_22
.end method


# virtual methods
.method public cipherSuite()Ljava/lang/String;
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lcom/squareup/okhttp/Handshake;->cipherSuite:Ljava/lang/String;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 106
    instance-of v2, p1, Lcom/squareup/okhttp/Handshake;

    if-nez v2, :cond_6

    .line 108
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 107
    check-cast v0, Lcom/squareup/okhttp/Handshake;

    .line 108
    .local v0, "that":Lcom/squareup/okhttp/Handshake;
    iget-object v2, p0, Lcom/squareup/okhttp/Handshake;->cipherSuite:Ljava/lang/String;

    iget-object v3, v0, Lcom/squareup/okhttp/Handshake;->cipherSuite:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/squareup/okhttp/Handshake;->peerCertificates:Ljava/util/List;

    iget-object v3, v0, Lcom/squareup/okhttp/Handshake;->peerCertificates:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/squareup/okhttp/Handshake;->localCertificates:Ljava/util/List;

    iget-object v3, v0, Lcom/squareup/okhttp/Handshake;->localCertificates:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 114
    const/16 v0, 0x11

    .line 115
    .local v0, "result":I
    iget-object v1, p0, Lcom/squareup/okhttp/Handshake;->cipherSuite:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/lit16 v0, v1, 0x20f

    .line 116
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/squareup/okhttp/Handshake;->peerCertificates:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 117
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/squareup/okhttp/Handshake;->localCertificates:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 118
    return v0
.end method

.method public localCertificates()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation

    .prologue
    .line 95
    iget-object v0, p0, Lcom/squareup/okhttp/Handshake;->localCertificates:Ljava/util/List;

    return-object v0
.end method

.method public localPrincipal()Ljava/security/Principal;
    .registers 3

    .prologue
    .line 100
    iget-object v0, p0, Lcom/squareup/okhttp/Handshake;->localCertificates:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_16

    iget-object v0, p0, Lcom/squareup/okhttp/Handshake;->localCertificates:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v0

    :goto_15
    return-object v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public peerCertificates()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lcom/squareup/okhttp/Handshake;->peerCertificates:Ljava/util/List;

    return-object v0
.end method

.method public peerPrincipal()Ljava/security/Principal;
    .registers 3

    .prologue
    .line 88
    iget-object v0, p0, Lcom/squareup/okhttp/Handshake;->peerCertificates:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_16

    iget-object v0, p0, Lcom/squareup/okhttp/Handshake;->peerCertificates:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v0

    :goto_15
    return-object v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method
