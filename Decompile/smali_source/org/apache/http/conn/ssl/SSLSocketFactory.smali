.class public Lorg/apache/http/conn/ssl/SSLSocketFactory;
.super Ljava/lang/Object;
.source "SSLSocketFactory.java"

# interfaces
.implements Lorg/apache/http/conn/scheme/LayeredSchemeSocketFactory;
.implements Lorg/apache/http/conn/scheme/LayeredSocketFactory;
.implements Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactory;
.implements Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# static fields
.field public static final ALLOW_ALL_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

.field public static final BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

.field public static final SSL:Ljava/lang/String; = "SSL"

.field public static final SSLV2:Ljava/lang/String; = "SSLv2"

.field public static final STRICT_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

.field public static final TLS:Ljava/lang/String; = "TLS"


# instance fields
.field private volatile hostnameVerifier:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

.field private final nameResolver:Lorg/apache/http/conn/scheme/HostNameResolver;

.field private final socketfactory:Ljavax/net/ssl/SSLSocketFactory;

.field private final supportedCipherSuites:[Ljava/lang/String;

.field private final supportedProtocols:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 145
    new-instance v0, Lorg/apache/http/conn/ssl/AllowAllHostnameVerifier;

    invoke-direct {v0}, Lorg/apache/http/conn/ssl/AllowAllHostnameVerifier;-><init>()V

    sput-object v0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->ALLOW_ALL_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    .line 148
    new-instance v0, Lorg/apache/http/conn/ssl/BrowserCompatHostnameVerifier;

    invoke-direct {v0}, Lorg/apache/http/conn/ssl/BrowserCompatHostnameVerifier;-><init>()V

    sput-object v0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    .line 151
    new-instance v0, Lorg/apache/http/conn/ssl/StrictHostnameVerifier;

    invoke-direct {v0}, Lorg/apache/http/conn/ssl/StrictHostnameVerifier;-><init>()V

    sput-object v0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->STRICT_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/security/KeyStore;Ljava/lang/String;Ljava/security/KeyStore;Ljava/security/SecureRandom;Lorg/apache/http/conn/scheme/HostNameResolver;)V
    .registers 9
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "keystore"    # Ljava/security/KeyStore;
    .param p3, "keyPassword"    # Ljava/lang/String;
    .param p4, "truststore"    # Ljava/security/KeyStore;
    .param p5, "random"    # Ljava/security/SecureRandom;
    .param p6, "nameResolver"    # Lorg/apache/http/conn/scheme/HostNameResolver;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyManagementException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/UnrecoverableKeyException;
        }
    .end annotation

    .prologue
    .line 206
    invoke-static {}, Lorg/apache/http/conn/ssl/SSLContexts;->custom()Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->useProtocol(Ljava/lang/String;)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0, p5}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->setSecureRandom(Ljava/security/SecureRandom;)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v1

    if-eqz p3, :cond_22

    invoke-virtual {p3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    :goto_12
    invoke-virtual {v1, p2, v0}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->loadKeyMaterial(Ljava/security/KeyStore;[C)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->loadTrustMaterial(Ljava/security/KeyStore;)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->build()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    invoke-direct {p0, v0, p6}, Lorg/apache/http/conn/ssl/SSLSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;Lorg/apache/http/conn/scheme/HostNameResolver;)V

    .line 213
    return-void

    .line 206
    :cond_22
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/security/KeyStore;Ljava/lang/String;Ljava/security/KeyStore;Ljava/security/SecureRandom;Lorg/apache/http/conn/ssl/TrustStrategy;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V
    .registers 10
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "keystore"    # Ljava/security/KeyStore;
    .param p3, "keyPassword"    # Ljava/lang/String;
    .param p4, "truststore"    # Ljava/security/KeyStore;
    .param p5, "random"    # Ljava/security/SecureRandom;
    .param p6, "trustStrategy"    # Lorg/apache/http/conn/ssl/TrustStrategy;
    .param p7, "hostnameVerifier"    # Lorg/apache/http/conn/ssl/X509HostnameVerifier;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyManagementException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/UnrecoverableKeyException;
        }
    .end annotation

    .prologue
    .line 227
    invoke-static {}, Lorg/apache/http/conn/ssl/SSLContexts;->custom()Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->useProtocol(Ljava/lang/String;)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0, p5}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->setSecureRandom(Ljava/security/SecureRandom;)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v1

    if-eqz p3, :cond_22

    invoke-virtual {p3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    :goto_12
    invoke-virtual {v1, p2, v0}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->loadKeyMaterial(Ljava/security/KeyStore;[C)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0, p4, p6}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->loadTrustMaterial(Ljava/security/KeyStore;Lorg/apache/http/conn/ssl/TrustStrategy;)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->build()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    invoke-direct {p0, v0, p7}, Lorg/apache/http/conn/ssl/SSLSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 234
    return-void

    .line 227
    :cond_22
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/security/KeyStore;Ljava/lang/String;Ljava/security/KeyStore;Ljava/security/SecureRandom;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V
    .registers 9
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "keystore"    # Ljava/security/KeyStore;
    .param p3, "keyPassword"    # Ljava/lang/String;
    .param p4, "truststore"    # Ljava/security/KeyStore;
    .param p5, "random"    # Ljava/security/SecureRandom;
    .param p6, "hostnameVerifier"    # Lorg/apache/http/conn/ssl/X509HostnameVerifier;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyManagementException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/UnrecoverableKeyException;
        }
    .end annotation

    .prologue
    .line 247
    invoke-static {}, Lorg/apache/http/conn/ssl/SSLContexts;->custom()Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->useProtocol(Ljava/lang/String;)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0, p5}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->setSecureRandom(Ljava/security/SecureRandom;)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v1

    if-eqz p3, :cond_22

    invoke-virtual {p3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    :goto_12
    invoke-virtual {v1, p2, v0}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->loadKeyMaterial(Ljava/security/KeyStore;[C)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->loadTrustMaterial(Ljava/security/KeyStore;)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->build()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    invoke-direct {p0, v0, p6}, Lorg/apache/http/conn/ssl/SSLSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 254
    return-void

    .line 247
    :cond_22
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public constructor <init>(Ljava/security/KeyStore;)V
    .registers 4
    .param p1, "truststore"    # Ljava/security/KeyStore;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyManagementException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/UnrecoverableKeyException;
        }
    .end annotation

    .prologue
    .line 281
    invoke-static {}, Lorg/apache/http/conn/ssl/SSLContexts;->custom()Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->loadTrustMaterial(Ljava/security/KeyStore;)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->build()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    sget-object v1, Lorg/apache/http/conn/ssl/SSLSocketFactory;->BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-direct {p0, v0, v1}, Lorg/apache/http/conn/ssl/SSLSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 285
    return-void
.end method

.method public constructor <init>(Ljava/security/KeyStore;Ljava/lang/String;)V
    .registers 5
    .param p1, "keystore"    # Ljava/security/KeyStore;
    .param p2, "keystorePassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyManagementException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/UnrecoverableKeyException;
        }
    .end annotation

    .prologue
    .line 272
    invoke-static {}, Lorg/apache/http/conn/ssl/SSLContexts;->custom()Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v1

    if-eqz p2, :cond_18

    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    :goto_a
    invoke-virtual {v1, p1, v0}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->loadKeyMaterial(Ljava/security/KeyStore;[C)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->build()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    sget-object v1, Lorg/apache/http/conn/ssl/SSLSocketFactory;->BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-direct {p0, v0, v1}, Lorg/apache/http/conn/ssl/SSLSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 276
    return-void

    .line 272
    :cond_18
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public constructor <init>(Ljava/security/KeyStore;Ljava/lang/String;Ljava/security/KeyStore;)V
    .registers 6
    .param p1, "keystore"    # Ljava/security/KeyStore;
    .param p2, "keystorePassword"    # Ljava/lang/String;
    .param p3, "truststore"    # Ljava/security/KeyStore;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyManagementException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/UnrecoverableKeyException;
        }
    .end annotation

    .prologue
    .line 261
    invoke-static {}, Lorg/apache/http/conn/ssl/SSLContexts;->custom()Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v1

    if-eqz p2, :cond_1c

    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    :goto_a
    invoke-virtual {v1, p1, v0}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->loadKeyMaterial(Ljava/security/KeyStore;[C)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->loadTrustMaterial(Ljava/security/KeyStore;)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->build()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    sget-object v1, Lorg/apache/http/conn/ssl/SSLSocketFactory;->BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-direct {p0, v0, v1}, Lorg/apache/http/conn/ssl/SSLSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 266
    return-void

    .line 261
    :cond_1c
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLContext;)V
    .registers 3
    .param p1, "sslContext"    # Ljavax/net/ssl/SSLContext;

    .prologue
    .line 313
    sget-object v0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-direct {p0, p1, v0}, Lorg/apache/http/conn/ssl/SSLSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 314
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLContext;Lorg/apache/http/conn/scheme/HostNameResolver;)V
    .registers 5
    .param p1, "sslContext"    # Ljavax/net/ssl/SSLContext;
    .param p2, "nameResolver"    # Lorg/apache/http/conn/scheme/HostNameResolver;

    .prologue
    const/4 v1, 0x0

    .line 318
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 319
    invoke-virtual {p1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->socketfactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 320
    sget-object v0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    iput-object v0, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->hostnameVerifier:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    .line 321
    iput-object p2, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->nameResolver:Lorg/apache/http/conn/scheme/HostNameResolver;

    .line 322
    iput-object v1, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->supportedProtocols:[Ljava/lang/String;

    .line 323
    iput-object v1, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->supportedCipherSuites:[Ljava/lang/String;

    .line 324
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLContext;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V
    .registers 5
    .param p1, "sslContext"    # Ljavax/net/ssl/SSLContext;
    .param p2, "hostnameVerifier"    # Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    .prologue
    const/4 v1, 0x0

    .line 331
    const-string v0, "SSL context"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLContext;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    invoke-direct {p0, v0, v1, v1, p2}, Lorg/apache/http/conn/ssl/SSLSocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;[Ljava/lang/String;[Ljava/lang/String;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 333
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLContext;[Ljava/lang/String;[Ljava/lang/String;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V
    .registers 6
    .param p1, "sslContext"    # Ljavax/net/ssl/SSLContext;
    .param p2, "supportedProtocols"    # [Ljava/lang/String;
    .param p3, "supportedCipherSuites"    # [Ljava/lang/String;
    .param p4, "hostnameVerifier"    # Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    .prologue
    .line 343
    const-string v0, "SSL context"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLContext;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3, p4}, Lorg/apache/http/conn/ssl/SSLSocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;[Ljava/lang/String;[Ljava/lang/String;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 345
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLSocketFactory;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V
    .registers 4
    .param p1, "socketfactory"    # Ljavax/net/ssl/SSLSocketFactory;
    .param p2, "hostnameVerifier"    # Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    .prologue
    const/4 v0, 0x0

    .line 353
    invoke-direct {p0, p1, v0, v0, p2}, Lorg/apache/http/conn/ssl/SSLSocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;[Ljava/lang/String;[Ljava/lang/String;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 354
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLSocketFactory;[Ljava/lang/String;[Ljava/lang/String;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V
    .registers 6
    .param p1, "socketfactory"    # Ljavax/net/ssl/SSLSocketFactory;
    .param p2, "supportedProtocols"    # [Ljava/lang/String;
    .param p3, "supportedCipherSuites"    # [Ljava/lang/String;
    .param p4, "hostnameVerifier"    # Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    .prologue
    .line 363
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 364
    const-string v0, "SSL socket factory"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocketFactory;

    iput-object v0, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->socketfactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 365
    iput-object p2, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->supportedProtocols:[Ljava/lang/String;

    .line 366
    iput-object p3, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->supportedCipherSuites:[Ljava/lang/String;

    .line 367
    if-eqz p4, :cond_19

    .end local p4    # "hostnameVerifier":Lorg/apache/http/conn/ssl/X509HostnameVerifier;
    :goto_13
    iput-object p4, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->hostnameVerifier:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    .line 368
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->nameResolver:Lorg/apache/http/conn/scheme/HostNameResolver;

    .line 369
    return-void

    .line 367
    .restart local p4    # "hostnameVerifier":Lorg/apache/http/conn/ssl/X509HostnameVerifier;
    :cond_19
    sget-object p4, Lorg/apache/http/conn/ssl/SSLSocketFactory;->BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    goto :goto_13
.end method

.method public constructor <init>(Lorg/apache/http/conn/ssl/TrustStrategy;)V
    .registers 4
    .param p1, "trustStrategy"    # Lorg/apache/http/conn/ssl/TrustStrategy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyManagementException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/UnrecoverableKeyException;
        }
    .end annotation

    .prologue
    .line 306
    invoke-static {}, Lorg/apache/http/conn/ssl/SSLContexts;->custom()Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->loadTrustMaterial(Ljava/security/KeyStore;Lorg/apache/http/conn/ssl/TrustStrategy;)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->build()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    sget-object v1, Lorg/apache/http/conn/ssl/SSLSocketFactory;->BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-direct {p0, v0, v1}, Lorg/apache/http/conn/ssl/SSLSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 310
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/ssl/TrustStrategy;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V
    .registers 5
    .param p1, "trustStrategy"    # Lorg/apache/http/conn/ssl/TrustStrategy;
    .param p2, "hostnameVerifier"    # Lorg/apache/http/conn/ssl/X509HostnameVerifier;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyManagementException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/UnrecoverableKeyException;
        }
    .end annotation

    .prologue
    .line 294
    invoke-static {}, Lorg/apache/http/conn/ssl/SSLContexts;->custom()Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->loadTrustMaterial(Ljava/security/KeyStore;Lorg/apache/http/conn/ssl/TrustStrategy;)Lorg/apache/http/conn/ssl/SSLContextBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/conn/ssl/SSLContextBuilder;->build()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/apache/http/conn/ssl/SSLSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 298
    return-void
.end method

.method public static getSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/conn/ssl/SSLInitializationException;
        }
    .end annotation

    .prologue
    .line 162
    new-instance v0, Lorg/apache/http/conn/ssl/SSLSocketFactory;

    invoke-static {}, Lorg/apache/http/conn/ssl/SSLContexts;->createDefault()Ljavax/net/ssl/SSLContext;

    move-result-object v1

    sget-object v2, Lorg/apache/http/conn/ssl/SSLSocketFactory;->BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-direct {v0, v1, v2}, Lorg/apache/http/conn/ssl/SSLSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    return-object v0
.end method

.method public static getSystemSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/conn/ssl/SSLInitializationException;
        }
    .end annotation

    .prologue
    .line 184
    new-instance v1, Lorg/apache/http/conn/ssl/SSLSocketFactory;

    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocketFactory;

    const-string v2, "https.protocols"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    const-string v3, "https.cipherSuites"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lorg/apache/http/conn/ssl/SSLSocketFactory;->BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-direct {v1, v0, v2, v3, v4}, Lorg/apache/http/conn/ssl/SSLSocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;[Ljava/lang/String;[Ljava/lang/String;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    return-object v1
.end method

.method private internalPrepareSocket(Ljavax/net/ssl/SSLSocket;)V
    .registers 3
    .param p1, "socket"    # Ljavax/net/ssl/SSLSocket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 493
    iget-object v0, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->supportedProtocols:[Ljava/lang/String;

    if-eqz v0, :cond_9

    .line 494
    iget-object v0, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->supportedProtocols:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 496
    :cond_9
    iget-object v0, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->supportedCipherSuites:[Ljava/lang/String;

    if-eqz v0, :cond_12

    .line 497
    iget-object v0, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->supportedCipherSuites:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 499
    :cond_12
    invoke-virtual {p0, p1}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->prepareSocket(Ljavax/net/ssl/SSLSocket;)V

    .line 500
    return-void
.end method

.method private static split(Ljava/lang/String;)[Ljava/lang/String;
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 168
    invoke-static {p0}, Lorg/apache/http/util/TextUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 169
    const/4 v0, 0x0

    .line 171
    :goto_7
    return-object v0

    :cond_8
    const-string v0, " *, *"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    goto :goto_7
.end method

.method private verifyHostname(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;)V
    .registers 5
    .param p1, "sslsock"    # Ljavax/net/ssl/SSLSocket;
    .param p2, "hostname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 559
    :try_start_0
    iget-object v1, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->hostnameVerifier:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-interface {v1, p2, p1}, Lorg/apache/http/conn/ssl/X509HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSocket;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 566
    return-void

    .line 561
    :catch_6
    move-exception v0

    .line 563
    .local v0, "iox":Ljava/io/IOException;
    :try_start_7
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_a} :catch_b

    .line 564
    :goto_a
    throw v0

    .line 563
    :catch_b
    move-exception v1

    goto :goto_a
.end method


# virtual methods
.method public connectSocket(ILjava/net/Socket;Lorg/apache/http/HttpHost;Ljava/net/InetSocketAddress;Ljava/net/InetSocketAddress;Lorg/apache/http/protocol/HttpContext;)Ljava/net/Socket;
    .registers 12
    .param p1, "connectTimeout"    # I
    .param p2, "socket"    # Ljava/net/Socket;
    .param p3, "host"    # Lorg/apache/http/HttpHost;
    .param p4, "remoteAddress"    # Ljava/net/InetSocketAddress;
    .param p5, "localAddress"    # Ljava/net/InetSocketAddress;
    .param p6, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 515
    const-string v3, "HTTP host"

    invoke-static {p3, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 516
    const-string v3, "Remote address"

    invoke-static {p4, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 517
    if-eqz p2, :cond_27

    move-object v1, p2

    .line 518
    .local v1, "sock":Ljava/net/Socket;
    :goto_d
    if-eqz p5, :cond_12

    .line 519
    invoke-virtual {v1, p5}, Ljava/net/Socket;->bind(Ljava/net/SocketAddress;)V

    .line 522
    :cond_12
    :try_start_12
    invoke-virtual {v1, p4, p1}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_15} :catch_2c

    .line 531
    instance-of v3, v1, Ljavax/net/ssl/SSLSocket;

    if-eqz v3, :cond_31

    move-object v2, v1

    .line 532
    check-cast v2, Ljavax/net/ssl/SSLSocket;

    .line 533
    .local v2, "sslsock":Ljavax/net/ssl/SSLSocket;
    invoke-virtual {v2}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 534
    invoke-virtual {p3}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->verifyHostname(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;)V

    .line 537
    .end local v1    # "sock":Ljava/net/Socket;
    .end local v2    # "sslsock":Ljavax/net/ssl/SSLSocket;
    :goto_26
    return-object v1

    .line 517
    :cond_27
    invoke-virtual {p0, p6}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->createSocket(Lorg/apache/http/protocol/HttpContext;)Ljava/net/Socket;

    move-result-object v1

    goto :goto_d

    .line 523
    .restart local v1    # "sock":Ljava/net/Socket;
    :catch_2c
    move-exception v0

    .line 525
    .local v0, "ex":Ljava/io/IOException;
    :try_start_2d
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_30
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_30} :catch_3e

    .line 528
    :goto_30
    throw v0

    .line 537
    .end local v0    # "ex":Ljava/io/IOException;
    :cond_31
    invoke-virtual {p3}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p4}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v4

    invoke-virtual {p0, v1, v3, v4, p6}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;ILorg/apache/http/protocol/HttpContext;)Ljava/net/Socket;

    move-result-object v1

    goto :goto_26

    .line 526
    .restart local v0    # "ex":Ljava/io/IOException;
    :catch_3e
    move-exception v3

    goto :goto_30
.end method

.method public connectSocket(Ljava/net/Socket;Ljava/lang/String;ILjava/net/InetAddress;ILorg/apache/http/params/HttpParams;)Ljava/net/Socket;
    .registers 11
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "local"    # Ljava/net/InetAddress;
    .param p5, "localPort"    # I
    .param p6, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;,
            Lorg/apache/http/conn/ConnectTimeoutException;
        }
    .end annotation

    .prologue
    .line 459
    iget-object v3, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->nameResolver:Lorg/apache/http/conn/scheme/HostNameResolver;

    if-eqz v3, :cond_25

    .line 460
    iget-object v3, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->nameResolver:Lorg/apache/http/conn/scheme/HostNameResolver;

    invoke-interface {v3, p2}, Lorg/apache/http/conn/scheme/HostNameResolver;->resolve(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    .line 464
    .local v1, "remote":Ljava/net/InetAddress;
    :goto_a
    const/4 v0, 0x0

    .line 465
    .local v0, "localAddress":Ljava/net/InetSocketAddress;
    if-nez p4, :cond_f

    if-lez p5, :cond_16

    .line 466
    :cond_f
    new-instance v0, Ljava/net/InetSocketAddress;

    .end local v0    # "localAddress":Ljava/net/InetSocketAddress;
    if-lez p5, :cond_2a

    .end local p5    # "localPort":I
    :goto_13
    invoke-direct {v0, p4, p5}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 468
    .restart local v0    # "localAddress":Ljava/net/InetSocketAddress;
    :cond_16
    new-instance v2, Lorg/apache/http/conn/HttpInetSocketAddress;

    new-instance v3, Lorg/apache/http/HttpHost;

    invoke-direct {v3, p2, p3}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;I)V

    invoke-direct {v2, v3, v1, p3}, Lorg/apache/http/conn/HttpInetSocketAddress;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;I)V

    .line 470
    .local v2, "remoteAddress":Ljava/net/InetSocketAddress;
    invoke-virtual {p0, p1, v2, v0, p6}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->connectSocket(Ljava/net/Socket;Ljava/net/InetSocketAddress;Ljava/net/InetSocketAddress;Lorg/apache/http/params/HttpParams;)Ljava/net/Socket;

    move-result-object v3

    return-object v3

    .line 462
    .end local v0    # "localAddress":Ljava/net/InetSocketAddress;
    .end local v1    # "remote":Ljava/net/InetAddress;
    .end local v2    # "remoteAddress":Ljava/net/InetSocketAddress;
    .restart local p5    # "localPort":I
    :cond_25
    invoke-static {p2}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    .restart local v1    # "remote":Ljava/net/InetAddress;
    goto :goto_a

    .line 466
    :cond_2a
    const/4 p5, 0x0

    goto :goto_13
.end method

.method public connectSocket(Ljava/net/Socket;Ljava/net/InetSocketAddress;Ljava/net/InetSocketAddress;Lorg/apache/http/params/HttpParams;)Ljava/net/Socket;
    .registers 12
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "remoteAddress"    # Ljava/net/InetSocketAddress;
    .param p3, "localAddress"    # Ljava/net/InetSocketAddress;
    .param p4, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;,
            Lorg/apache/http/conn/ConnectTimeoutException;
        }
    .end annotation

    .prologue
    .line 392
    const-string v0, "Remote address"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 393
    const-string v0, "HTTP parameters"

    invoke-static {p4, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 395
    instance-of v0, p2, Lorg/apache/http/conn/HttpInetSocketAddress;

    if-eqz v0, :cond_23

    move-object v0, p2

    .line 396
    check-cast v0, Lorg/apache/http/conn/HttpInetSocketAddress;

    invoke-virtual {v0}, Lorg/apache/http/conn/HttpInetSocketAddress;->getHttpHost()Lorg/apache/http/HttpHost;

    move-result-object v3

    .line 400
    .local v3, "host":Lorg/apache/http/HttpHost;
    :goto_15
    invoke-static {p4}, Lorg/apache/http/params/HttpConnectionParams;->getConnectionTimeout(Lorg/apache/http/params/HttpParams;)I

    move-result v1

    .line 401
    .local v1, "connectTimeout":I
    const/4 v6, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v6}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->connectSocket(ILjava/net/Socket;Lorg/apache/http/HttpHost;Ljava/net/InetSocketAddress;Ljava/net/InetSocketAddress;Lorg/apache/http/protocol/HttpContext;)Ljava/net/Socket;

    move-result-object v0

    return-object v0

    .line 398
    .end local v1    # "connectTimeout":I
    .end local v3    # "host":Lorg/apache/http/HttpHost;
    :cond_23
    new-instance v3, Lorg/apache/http/HttpHost;

    invoke-virtual {p2}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v2

    const-string v4, "https"

    invoke-direct {v3, v0, v2, v4}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .restart local v3    # "host":Lorg/apache/http/HttpHost;
    goto :goto_15
.end method

.method public createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;ILorg/apache/http/params/HttpParams;)Ljava/net/Socket;
    .registers 6
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 433
    const/4 v0, 0x0

    check-cast v0, Lorg/apache/http/protocol/HttpContext;

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;ILorg/apache/http/protocol/HttpContext;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;ILorg/apache/http/protocol/HttpContext;)Ljava/net/Socket;
    .registers 8
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "target"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 546
    iget-object v1, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->socketfactory:Ljavax/net/ssl/SSLSocketFactory;

    const/4 v2, 0x1

    invoke-virtual {v1, p1, p2, p3, v2}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    .line 551
    .local v0, "sslsock":Ljavax/net/ssl/SSLSocket;
    invoke-direct {p0, v0}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->internalPrepareSocket(Ljavax/net/ssl/SSLSocket;)V

    .line 552
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 553
    invoke-direct {p0, v0, p2}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->verifyHostname(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;)V

    .line 554
    return-object v0
.end method

.method public createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
    .registers 6
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "autoClose"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 441
    const/4 v0, 0x0

    check-cast v0, Lorg/apache/http/protocol/HttpContext;

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;ILorg/apache/http/protocol/HttpContext;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket()Ljava/net/Socket;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 381
    const/4 v0, 0x0

    check-cast v0, Lorg/apache/http/protocol/HttpContext;

    invoke-virtual {p0, v0}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->createSocket(Lorg/apache/http/protocol/HttpContext;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
    .registers 6
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "autoClose"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 477
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Lorg/apache/http/params/HttpParams;)Ljava/net/Socket;
    .registers 3
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 377
    const/4 v0, 0x0

    check-cast v0, Lorg/apache/http/protocol/HttpContext;

    invoke-virtual {p0, v0}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->createSocket(Lorg/apache/http/protocol/HttpContext;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Lorg/apache/http/protocol/HttpContext;)Ljava/net/Socket;
    .registers 4
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 503
    iget-object v1, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->socketfactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v1}, Ljavax/net/ssl/SSLSocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    .line 504
    .local v0, "sock":Ljavax/net/ssl/SSLSocket;
    invoke-direct {p0, v0}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->internalPrepareSocket(Ljavax/net/ssl/SSLSocket;)V

    .line 505
    return-object v0
.end method

.method public getHostnameVerifier()Lorg/apache/http/conn/ssl/X509HostnameVerifier;
    .registers 2

    .prologue
    .line 450
    iget-object v0, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->hostnameVerifier:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    return-object v0
.end method

.method public isSecure(Ljava/net/Socket;)Z
    .registers 5
    .param p1, "sock"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 419
    const-string v0, "Socket"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 420
    instance-of v0, p1, Ljavax/net/ssl/SSLSocket;

    const-string v2, "Socket not created by this factory"

    invoke-static {v0, v2}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 421
    invoke-virtual {p1}, Ljava/net/Socket;->isClosed()Z

    move-result v0

    if-nez v0, :cond_1a

    move v0, v1

    :goto_14
    const-string v2, "Socket is closed"

    invoke-static {v0, v2}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 422
    return v1

    .line 421
    :cond_1a
    const/4 v0, 0x0

    goto :goto_14
.end method

.method protected prepareSocket(Ljavax/net/ssl/SSLSocket;)V
    .registers 2
    .param p1, "socket"    # Ljavax/net/ssl/SSLSocket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 490
    return-void
.end method

.method public setHostnameVerifier(Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V
    .registers 3
    .param p1, "hostnameVerifier"    # Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    .prologue
    .line 445
    const-string v0, "Hostname verifier"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 446
    iput-object p1, p0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->hostnameVerifier:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    .line 447
    return-void
.end method
