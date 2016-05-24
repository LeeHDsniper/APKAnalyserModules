.class public final Lcom/squareup/okhttp/Address;
.super Ljava/lang/Object;
.source "Address.java"


# instance fields
.field final authenticator:Lcom/squareup/okhttp/Authenticator;

.field final certificatePinner:Lcom/squareup/okhttp/CertificatePinner;

.field final connectionSpecs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/ConnectionSpec;",
            ">;"
        }
    .end annotation
.end field

.field final hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field final protocols:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/Protocol;",
            ">;"
        }
    .end annotation
.end field

.field final proxy:Ljava/net/Proxy;

.field final socketFactory:Ljavax/net/SocketFactory;

.field final sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

.field final uriHost:Ljava/lang/String;

.field final uriPort:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/HostnameVerifier;Lcom/squareup/okhttp/CertificatePinner;Lcom/squareup/okhttp/Authenticator;Ljava/net/Proxy;Ljava/util/List;Ljava/util/List;)V
    .registers 14
    .param p1, "uriHost"    # Ljava/lang/String;
    .param p2, "uriPort"    # I
    .param p3, "socketFactory"    # Ljavax/net/SocketFactory;
    .param p4, "sslSocketFactory"    # Ljavax/net/ssl/SSLSocketFactory;
    .param p5, "hostnameVerifier"    # Ljavax/net/ssl/HostnameVerifier;
    .param p6, "certificatePinner"    # Lcom/squareup/okhttp/CertificatePinner;
    .param p7, "authenticator"    # Lcom/squareup/okhttp/Authenticator;
    .param p8, "proxy"    # Ljava/net/Proxy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljavax/net/SocketFactory;",
            "Ljavax/net/ssl/SSLSocketFactory;",
            "Ljavax/net/ssl/HostnameVerifier;",
            "Lcom/squareup/okhttp/CertificatePinner;",
            "Lcom/squareup/okhttp/Authenticator;",
            "Ljava/net/Proxy;",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/Protocol;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/ConnectionSpec;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p9, "protocols":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Protocol;>;"
    .local p10, "connectionSpecs":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/ConnectionSpec;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    if-nez p1, :cond_d

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "uriHost == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 54
    :cond_d
    if-gtz p2, :cond_28

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "uriPort <= 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_28
    if-nez p7, :cond_32

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "authenticator == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 56
    :cond_32
    if-nez p9, :cond_3c

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "protocols == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 57
    :cond_3c
    iput-object p8, p0, Lcom/squareup/okhttp/Address;->proxy:Ljava/net/Proxy;

    .line 58
    iput-object p1, p0, Lcom/squareup/okhttp/Address;->uriHost:Ljava/lang/String;

    .line 59
    iput p2, p0, Lcom/squareup/okhttp/Address;->uriPort:I

    .line 60
    iput-object p3, p0, Lcom/squareup/okhttp/Address;->socketFactory:Ljavax/net/SocketFactory;

    .line 61
    iput-object p4, p0, Lcom/squareup/okhttp/Address;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 62
    iput-object p5, p0, Lcom/squareup/okhttp/Address;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 63
    iput-object p6, p0, Lcom/squareup/okhttp/Address;->certificatePinner:Lcom/squareup/okhttp/CertificatePinner;

    .line 64
    iput-object p7, p0, Lcom/squareup/okhttp/Address;->authenticator:Lcom/squareup/okhttp/Authenticator;

    .line 65
    invoke-static {p9}, Lcom/squareup/okhttp/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Address;->protocols:Ljava/util/List;

    .line 66
    invoke-static {p10}, Lcom/squareup/okhttp/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Address;->connectionSpecs:Ljava/util/List;

    .line 67
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 131
    instance-of v2, p1, Lcom/squareup/okhttp/Address;

    if-eqz v2, :cond_55

    move-object v0, p1

    .line 132
    check-cast v0, Lcom/squareup/okhttp/Address;

    .line 133
    .local v0, "that":Lcom/squareup/okhttp/Address;
    iget-object v2, p0, Lcom/squareup/okhttp/Address;->proxy:Ljava/net/Proxy;

    iget-object v3, v0, Lcom/squareup/okhttp/Address;->proxy:Ljava/net/Proxy;

    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/Util;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_55

    iget-object v2, p0, Lcom/squareup/okhttp/Address;->uriHost:Ljava/lang/String;

    iget-object v3, v0, Lcom/squareup/okhttp/Address;->uriHost:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_55

    iget v2, p0, Lcom/squareup/okhttp/Address;->uriPort:I

    iget v3, v0, Lcom/squareup/okhttp/Address;->uriPort:I

    if-ne v2, v3, :cond_55

    iget-object v2, p0, Lcom/squareup/okhttp/Address;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    iget-object v3, v0, Lcom/squareup/okhttp/Address;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/Util;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_55

    iget-object v2, p0, Lcom/squareup/okhttp/Address;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    iget-object v3, v0, Lcom/squareup/okhttp/Address;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/Util;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_55

    iget-object v2, p0, Lcom/squareup/okhttp/Address;->certificatePinner:Lcom/squareup/okhttp/CertificatePinner;

    iget-object v3, v0, Lcom/squareup/okhttp/Address;->certificatePinner:Lcom/squareup/okhttp/CertificatePinner;

    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/Util;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_55

    iget-object v2, p0, Lcom/squareup/okhttp/Address;->authenticator:Lcom/squareup/okhttp/Authenticator;

    iget-object v3, v0, Lcom/squareup/okhttp/Address;->authenticator:Lcom/squareup/okhttp/Authenticator;

    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/Util;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_55

    iget-object v2, p0, Lcom/squareup/okhttp/Address;->protocols:Ljava/util/List;

    iget-object v3, v0, Lcom/squareup/okhttp/Address;->protocols:Ljava/util/List;

    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/Util;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_55

    const/4 v1, 0x1

    .line 142
    .end local v0    # "that":Lcom/squareup/okhttp/Address;
    :cond_55
    return v1
.end method

.method public getConnectionSpecs()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/ConnectionSpec;",
            ">;"
        }
    .end annotation

    .prologue
    .line 119
    iget-object v0, p0, Lcom/squareup/okhttp/Address;->connectionSpecs:Ljava/util/List;

    return-object v0
.end method

.method public getProxy()Ljava/net/Proxy;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/squareup/okhttp/Address;->proxy:Ljava/net/Proxy;

    return-object v0
.end method

.method public getUriHost()Ljava/lang/String;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/squareup/okhttp/Address;->uriHost:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 146
    const/16 v0, 0x11

    .line 147
    .local v0, "result":I
    iget-object v1, p0, Lcom/squareup/okhttp/Address;->uriHost:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/lit16 v0, v1, 0x20f

    .line 148
    mul-int/lit8 v1, v0, 0x1f

    iget v3, p0, Lcom/squareup/okhttp/Address;->uriPort:I

    add-int v0, v1, v3

    .line 149
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lcom/squareup/okhttp/Address;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v1, :cond_5e

    iget-object v1, p0, Lcom/squareup/okhttp/Address;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_1d
    add-int v0, v3, v1

    .line 150
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lcom/squareup/okhttp/Address;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    if-eqz v1, :cond_60

    iget-object v1, p0, Lcom/squareup/okhttp/Address;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_2b
    add-int v0, v3, v1

    .line 151
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lcom/squareup/okhttp/Address;->certificatePinner:Lcom/squareup/okhttp/CertificatePinner;

    if-eqz v1, :cond_62

    iget-object v1, p0, Lcom/squareup/okhttp/Address;->certificatePinner:Lcom/squareup/okhttp/CertificatePinner;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_39
    add-int v0, v3, v1

    .line 152
    mul-int/lit8 v1, v0, 0x1f

    iget-object v3, p0, Lcom/squareup/okhttp/Address;->authenticator:Lcom/squareup/okhttp/Authenticator;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int v0, v1, v3

    .line 153
    mul-int/lit8 v1, v0, 0x1f

    iget-object v3, p0, Lcom/squareup/okhttp/Address;->proxy:Ljava/net/Proxy;

    if-eqz v3, :cond_51

    iget-object v2, p0, Lcom/squareup/okhttp/Address;->proxy:Ljava/net/Proxy;

    invoke-virtual {v2}, Ljava/net/Proxy;->hashCode()I

    move-result v2

    :cond_51
    add-int v0, v1, v2

    .line 154
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/squareup/okhttp/Address;->protocols:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 155
    return v0

    :cond_5e
    move v1, v2

    .line 149
    goto :goto_1d

    :cond_60
    move v1, v2

    .line 150
    goto :goto_2b

    :cond_62
    move v1, v2

    .line 151
    goto :goto_39
.end method
