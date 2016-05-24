.class public Lorg/apache/http/conn/ssl/SSLContextBuilder;
.super Ljava/lang/Object;
.source "SSLContextBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/conn/ssl/SSLContextBuilder$KeyManagerDelegate;,
        Lorg/apache/http/conn/ssl/SSLContextBuilder$TrustManagerDelegate;
    }
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field static final SSL:Ljava/lang/String; = "SSL"

.field static final TLS:Ljava/lang/String; = "TLS"


# instance fields
.field private keymanagers:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljavax/net/ssl/KeyManager;",
            ">;"
        }
    .end annotation
.end field

.field private protocol:Ljava/lang/String;

.field private secureRandom:Ljava/security/SecureRandom;

.field private trustmanagers:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljavax/net/ssl/TrustManager;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder;->keymanagers:Ljava/util/Set;

    .line 75
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder;->trustmanagers:Ljava/util/Set;

    .line 76
    return-void
.end method


# virtual methods
.method public build()Ljavax/net/ssl/SSLContext;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyManagementException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 162
    iget-object v1, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder;->protocol:Ljava/lang/String;

    if-eqz v1, :cond_42

    iget-object v1, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder;->protocol:Ljava/lang/String;

    :goto_7
    invoke-static {v1}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    .line 164
    .local v0, "sslcontext":Ljavax/net/ssl/SSLContext;
    iget-object v1, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder;->keymanagers:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_45

    iget-object v1, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder;->keymanagers:Ljava/util/Set;

    iget-object v2, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder;->keymanagers:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v2

    new-array v2, v2, [Ljavax/net/ssl/KeyManager;

    invoke-interface {v1, v2}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljavax/net/ssl/KeyManager;

    move-object v2, v1

    :goto_24
    iget-object v1, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder;->trustmanagers:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_47

    iget-object v1, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder;->trustmanagers:Ljava/util/Set;

    iget-object v3, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder;->trustmanagers:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    new-array v3, v3, [Ljavax/net/ssl/TrustManager;

    invoke-interface {v1, v3}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljavax/net/ssl/TrustManager;

    :goto_3c
    iget-object v3, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder;->secureRandom:Ljava/security/SecureRandom;

    invoke-virtual {v0, v2, v1, v3}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 168
    return-object v0

    .line 162
    .end local v0    # "sslcontext":Ljavax/net/ssl/SSLContext;
    :cond_42
    const-string v1, "TLS"

    goto :goto_7

    .restart local v0    # "sslcontext":Ljavax/net/ssl/SSLContext;
    :cond_45
    move-object v2, v3

    .line 164
    goto :goto_24

    :cond_47
    move-object v1, v3

    goto :goto_3c
.end method

.method public loadKeyMaterial(Ljava/security/KeyStore;[C)Lorg/apache/http/conn/ssl/SSLContextBuilder;
    .registers 4
    .param p1, "keystore"    # Ljava/security/KeyStore;
    .param p2, "keyPassword"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/UnrecoverableKeyException;
        }
    .end annotation

    .prologue
    .line 131
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->loadKeyMaterial(Ljava/security/KeyStore;[CLorg/apache/http/conn/ssl/PrivateKeyStrategy;)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    .line 132
    return-object p0
.end method

.method public loadKeyMaterial(Ljava/security/KeyStore;[CLorg/apache/http/conn/ssl/PrivateKeyStrategy;)Lorg/apache/http/conn/ssl/SSLContextBuilder;
    .registers 10
    .param p1, "keystore"    # Ljava/security/KeyStore;
    .param p2, "keyPassword"    # [C
    .param p3, "aliasStrategy"    # Lorg/apache/http/conn/ssl/PrivateKeyStrategy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/UnrecoverableKeyException;
        }
    .end annotation

    .prologue
    .line 140
    invoke-static {}, Ljavax/net/ssl/KeyManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljavax/net/ssl/KeyManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/KeyManagerFactory;

    move-result-object v2

    .line 142
    .local v2, "kmfactory":Ljavax/net/ssl/KeyManagerFactory;
    invoke-virtual {v2, p1, p2}, Ljavax/net/ssl/KeyManagerFactory;->init(Ljava/security/KeyStore;[C)V

    .line 143
    invoke-virtual {v2}, Ljavax/net/ssl/KeyManagerFactory;->getKeyManagers()[Ljavax/net/ssl/KeyManager;

    move-result-object v3

    .line 144
    .local v3, "kms":[Ljavax/net/ssl/KeyManager;
    if-eqz v3, :cond_37

    .line 145
    if-eqz p3, :cond_29

    .line 146
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_14
    array-length v4, v3

    if-ge v0, v4, :cond_29

    .line 147
    aget-object v1, v3, v0

    .line 148
    .local v1, "km":Ljavax/net/ssl/KeyManager;
    instance-of v4, v1, Ljavax/net/ssl/X509KeyManager;

    if-eqz v4, :cond_26

    .line 149
    new-instance v4, Lorg/apache/http/conn/ssl/SSLContextBuilder$KeyManagerDelegate;

    check-cast v1, Ljavax/net/ssl/X509KeyManager;

    .end local v1    # "km":Ljavax/net/ssl/KeyManager;
    invoke-direct {v4, v1, p3}, Lorg/apache/http/conn/ssl/SSLContextBuilder$KeyManagerDelegate;-><init>(Ljavax/net/ssl/X509KeyManager;Lorg/apache/http/conn/ssl/PrivateKeyStrategy;)V

    aput-object v4, v3, v0

    .line 146
    :cond_26
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 154
    .end local v0    # "i":I
    :cond_29
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2a
    array-length v4, v3

    if-ge v0, v4, :cond_37

    .line 155
    iget-object v4, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder;->keymanagers:Ljava/util/Set;

    aget-object v5, v3, v0

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 154
    add-int/lit8 v0, v0, 0x1

    goto :goto_2a

    .line 158
    .end local v0    # "i":I
    :cond_37
    return-object p0
.end method

.method public loadTrustMaterial(Ljava/security/KeyStore;)Lorg/apache/http/conn/ssl/SSLContextBuilder;
    .registers 3
    .param p1, "truststore"    # Ljava/security/KeyStore;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyStoreException;
        }
    .end annotation

    .prologue
    .line 124
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->loadTrustMaterial(Ljava/security/KeyStore;Lorg/apache/http/conn/ssl/TrustStrategy;)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    return-object v0
.end method

.method public loadTrustMaterial(Ljava/security/KeyStore;Lorg/apache/http/conn/ssl/TrustStrategy;)Lorg/apache/http/conn/ssl/SSLContextBuilder;
    .registers 9
    .param p1, "truststore"    # Ljava/security/KeyStore;
    .param p2, "trustStrategy"    # Lorg/apache/http/conn/ssl/TrustStrategy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyStoreException;
        }
    .end annotation

    .prologue
    .line 101
    invoke-static {}, Ljavax/net/ssl/TrustManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v2

    .line 103
    .local v2, "tmfactory":Ljavax/net/ssl/TrustManagerFactory;
    invoke-virtual {v2, p1}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 104
    invoke-virtual {v2}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v3

    .line 105
    .local v3, "tms":[Ljavax/net/ssl/TrustManager;
    if-eqz v3, :cond_37

    .line 106
    if-eqz p2, :cond_29

    .line 107
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_14
    array-length v4, v3

    if-ge v0, v4, :cond_29

    .line 108
    aget-object v1, v3, v0

    .line 109
    .local v1, "tm":Ljavax/net/ssl/TrustManager;
    instance-of v4, v1, Ljavax/net/ssl/X509TrustManager;

    if-eqz v4, :cond_26

    .line 110
    new-instance v4, Lorg/apache/http/conn/ssl/SSLContextBuilder$TrustManagerDelegate;

    check-cast v1, Ljavax/net/ssl/X509TrustManager;

    .end local v1    # "tm":Ljavax/net/ssl/TrustManager;
    invoke-direct {v4, v1, p2}, Lorg/apache/http/conn/ssl/SSLContextBuilder$TrustManagerDelegate;-><init>(Ljavax/net/ssl/X509TrustManager;Lorg/apache/http/conn/ssl/TrustStrategy;)V

    aput-object v4, v3, v0

    .line 107
    :cond_26
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 115
    .end local v0    # "i":I
    :cond_29
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2a
    array-length v4, v3

    if-ge v0, v4, :cond_37

    .line 116
    iget-object v4, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder;->trustmanagers:Ljava/util/Set;

    aget-object v5, v3, v0

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 115
    add-int/lit8 v0, v0, 0x1

    goto :goto_2a

    .line 119
    .end local v0    # "i":I
    :cond_37
    return-object p0
.end method

.method public setSecureRandom(Ljava/security/SecureRandom;)Lorg/apache/http/conn/ssl/SSLContextBuilder;
    .registers 2
    .param p1, "secureRandom"    # Ljava/security/SecureRandom;

    .prologue
    .line 94
    iput-object p1, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder;->secureRandom:Ljava/security/SecureRandom;

    .line 95
    return-object p0
.end method

.method public useProtocol(Ljava/lang/String;)Lorg/apache/http/conn/ssl/SSLContextBuilder;
    .registers 2
    .param p1, "protocol"    # Ljava/lang/String;

    .prologue
    .line 89
    iput-object p1, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder;->protocol:Ljava/lang/String;

    .line 90
    return-object p0
.end method

.method public useSSL()Lorg/apache/http/conn/ssl/SSLContextBuilder;
    .registers 2

    .prologue
    .line 84
    const-string v0, "SSL"

    iput-object v0, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder;->protocol:Ljava/lang/String;

    .line 85
    return-object p0
.end method

.method public useTLS()Lorg/apache/http/conn/ssl/SSLContextBuilder;
    .registers 2

    .prologue
    .line 79
    const-string v0, "TLS"

    iput-object v0, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder;->protocol:Ljava/lang/String;

    .line 80
    return-object p0
.end method
