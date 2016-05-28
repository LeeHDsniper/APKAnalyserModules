.class Lorg/apache/http/conn/ssl/SSLContextBuilder$TrustManagerDelegate;
.super Ljava/lang/Object;
.source "SSLContextBuilder.java"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/conn/ssl/SSLContextBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TrustManagerDelegate"
.end annotation


# instance fields
.field private final trustManager:Ljavax/net/ssl/X509TrustManager;

.field private final trustStrategy:Lorg/apache/http/conn/ssl/TrustStrategy;


# direct methods
.method constructor <init>(Ljavax/net/ssl/X509TrustManager;Lorg/apache/http/conn/ssl/TrustStrategy;)V
    .registers 3
    .param p1, "trustManager"    # Ljavax/net/ssl/X509TrustManager;
    .param p2, "trustStrategy"    # Lorg/apache/http/conn/ssl/TrustStrategy;

    .prologue
    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 178
    iput-object p1, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder$TrustManagerDelegate;->trustManager:Ljavax/net/ssl/X509TrustManager;

    .line 179
    iput-object p2, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder$TrustManagerDelegate;->trustStrategy:Lorg/apache/http/conn/ssl/TrustStrategy;

    .line 180
    return-void
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .registers 4
    .param p1, "chain"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 184
    iget-object v0, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder$TrustManagerDelegate;->trustManager:Ljavax/net/ssl/X509TrustManager;

    invoke-interface {v0, p1, p2}, Ljavax/net/ssl/X509TrustManager;->checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V

    .line 185
    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .registers 4
    .param p1, "chain"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 189
    iget-object v0, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder$TrustManagerDelegate;->trustStrategy:Lorg/apache/http/conn/ssl/TrustStrategy;

    invoke-interface {v0, p1, p2}, Lorg/apache/http/conn/ssl/TrustStrategy;->isTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 190
    iget-object v0, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder$TrustManagerDelegate;->trustManager:Ljavax/net/ssl/X509TrustManager;

    invoke-interface {v0, p1, p2}, Ljavax/net/ssl/X509TrustManager;->checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V

    .line 192
    :cond_d
    return-void
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .registers 2

    .prologue
    .line 195
    iget-object v0, p0, Lorg/apache/http/conn/ssl/SSLContextBuilder$TrustManagerDelegate;->trustManager:Ljavax/net/ssl/X509TrustManager;

    invoke-interface {v0}, Ljavax/net/ssl/X509TrustManager;->getAcceptedIssuers()[Ljava/security/cert/X509Certificate;

    move-result-object v0

    return-object v0
.end method
