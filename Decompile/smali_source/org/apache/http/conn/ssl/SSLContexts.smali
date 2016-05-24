.class public Lorg/apache/http/conn/ssl/SSLContexts;
.super Ljava/lang/Object;
.source "SSLContexts.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createDefault()Ljavax/net/ssl/SSLContext;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/conn/ssl/SSLInitializationException;
        }
    .end annotation

    .prologue
    .line 54
    :try_start_0
    const-string v2, "TLS"

    invoke-static {v2}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 55
    .local v1, "sslcontext":Ljavax/net/ssl/SSLContext;
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    :try_end_c
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_c} :catch_d
    .catch Ljava/security/KeyManagementException; {:try_start_0 .. :try_end_c} :catch_18

    .line 56
    return-object v1

    .line 57
    :catch_d
    move-exception v0

    .line 58
    .local v0, "ex":Ljava/security/NoSuchAlgorithmException;
    new-instance v2, Lorg/apache/http/conn/ssl/SSLInitializationException;

    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/apache/http/conn/ssl/SSLInitializationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 59
    .end local v0    # "ex":Ljava/security/NoSuchAlgorithmException;
    :catch_18
    move-exception v0

    .line 60
    .local v0, "ex":Ljava/security/KeyManagementException;
    new-instance v2, Lorg/apache/http/conn/ssl/SSLInitializationException;

    invoke-virtual {v0}, Ljava/security/KeyManagementException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/apache/http/conn/ssl/SSLInitializationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static createSystemDefault()Ljavax/net/ssl/SSLContext;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/conn/ssl/SSLInitializationException;
        }
    .end annotation

    .prologue
    .line 75
    :try_start_0
    const-string v1, "Default"

    invoke-static {v1}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;
    :try_end_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 77
    .local v0, "ex":Ljava/security/NoSuchAlgorithmException;
    :goto_6
    return-object v1

    .line 76
    .end local v0    # "ex":Ljava/security/NoSuchAlgorithmException;
    :catch_7
    move-exception v0

    .line 77
    .restart local v0    # "ex":Ljava/security/NoSuchAlgorithmException;
    invoke-static {}, Lorg/apache/http/conn/ssl/SSLContexts;->createDefault()Ljavax/net/ssl/SSLContext;

    move-result-object v1

    goto :goto_6
.end method

.method public static custom()Lorg/apache/http/conn/ssl/SSLContextBuilder;
    .registers 1

    .prologue
    .line 87
    new-instance v0, Lorg/apache/http/conn/ssl/SSLContextBuilder;

    invoke-direct {v0}, Lorg/apache/http/conn/ssl/SSLContextBuilder;-><init>()V

    return-object v0
.end method
