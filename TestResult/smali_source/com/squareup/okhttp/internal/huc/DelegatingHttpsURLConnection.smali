.class abstract Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;
.super Ljavax/net/ssl/HttpsURLConnection;
.source "DelegatingHttpsURLConnection.java"


# instance fields
.field private final delegate:Ljava/net/HttpURLConnection;


# direct methods
.method public constructor <init>(Ljava/net/HttpURLConnection;)V
    .registers 3
    .param p1, "delegate"    # Ljava/net/HttpURLConnection;

    .prologue
    .line 44
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v0

    invoke-direct {p0, v0}, Ljavax/net/ssl/HttpsURLConnection;-><init>(Ljava/net/URL;)V

    .line 45
    iput-object p1, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    .line 46
    return-void
.end method


# virtual methods
.method public addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "newValue"    # Ljava/lang/String;

    .prologue
    .line 186
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    return-void
.end method

.method public connect()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->connected:Z

    .line 89
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    .line 90
    return-void
.end method

.method public disconnect()V
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 94
    return-void
.end method

.method public getAllowUserInteraction()Z
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getAllowUserInteraction()Z

    move-result v0

    return v0
.end method

.method public getCipherSuite()Ljava/lang/String;
    .registers 3

    .prologue
    .line 59
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->handshake()Lcom/squareup/okhttp/Handshake;

    move-result-object v0

    .line 60
    .local v0, "handshake":Lcom/squareup/okhttp/Handshake;
    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lcom/squareup/okhttp/Handshake;->cipherSuite()Ljava/lang/String;

    move-result-object v1

    :goto_a
    return-object v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public getConnectTimeout()I
    .registers 2

    .prologue
    .line 270
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getConnectTimeout()I

    move-result v0

    return v0
.end method

.method public getContent()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContent()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getContent([Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p1, "types"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->getContent([Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getContentEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContentEncoding()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentLength()I
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v0

    return v0
.end method

.method public getContentType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 150
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDate()J
    .registers 3

    .prologue
    .line 154
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getDate()J

    move-result-wide v0

    return-wide v0
.end method

.method public getDefaultUseCaches()Z
    .registers 2

    .prologue
    .line 158
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getDefaultUseCaches()Z

    move-result v0

    return v0
.end method

.method public getDoInput()Z
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getDoInput()Z

    move-result v0

    return v0
.end method

.method public getDoOutput()Z
    .registers 2

    .prologue
    .line 166
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getDoOutput()Z

    move-result v0

    return v0
.end method

.method public getErrorStream()Ljava/io/InputStream;
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getExpiration()J
    .registers 3

    .prologue
    .line 170
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getExpiration()J

    move-result-wide v0

    return-wide v0
.end method

.method public getHeaderField(I)Ljava/lang/String;
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 174
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->getHeaderField(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHeaderField(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 190
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHeaderFieldDate(Ljava/lang/String;J)J
    .registers 6
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "defaultValue"    # J

    .prologue
    .line 194
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1, p2, p3}, Ljava/net/HttpURLConnection;->getHeaderFieldDate(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getHeaderFieldInt(Ljava/lang/String;I)I
    .registers 4
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    .line 198
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->getHeaderFieldInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getHeaderFieldKey(I)Ljava/lang/String;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 202
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->getHeaderFieldKey(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHeaderFields()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 178
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getIfModifiedSince()J
    .registers 3

    .prologue
    .line 206
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getIfModifiedSince()J

    move-result-wide v0

    return-wide v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 210
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getInstanceFollowRedirects()Z
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInstanceFollowRedirects()Z

    move-result v0

    return v0
.end method

.method public getLastModified()J
    .registers 3

    .prologue
    .line 214
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getLastModified()J

    move-result-wide v0

    return-wide v0
.end method

.method public getLocalCertificates()[Ljava/security/cert/Certificate;
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 64
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->handshake()Lcom/squareup/okhttp/Handshake;

    move-result-object v0

    .line 65
    .local v0, "handshake":Lcom/squareup/okhttp/Handshake;
    if-nez v0, :cond_8

    .line 67
    :cond_7
    :goto_7
    return-object v2

    .line 66
    :cond_8
    invoke-virtual {v0}, Lcom/squareup/okhttp/Handshake;->localCertificates()Ljava/util/List;

    move-result-object v1

    .line 67
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_7

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/security/cert/Certificate;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/security/cert/Certificate;

    goto :goto_7
.end method

.method public getLocalPrincipal()Ljava/security/Principal;
    .registers 3

    .prologue
    .line 83
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->handshake()Lcom/squareup/okhttp/Handshake;

    move-result-object v0

    .line 84
    .local v0, "handshake":Lcom/squareup/okhttp/Handshake;
    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lcom/squareup/okhttp/Handshake;->localPrincipal()Ljava/security/Principal;

    move-result-object v1

    :goto_a
    return-object v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 218
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public getPeerPrincipal()Ljava/security/Principal;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLPeerUnverifiedException;
        }
    .end annotation

    .prologue
    .line 78
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->handshake()Lcom/squareup/okhttp/Handshake;

    move-result-object v0

    .line 79
    .local v0, "handshake":Lcom/squareup/okhttp/Handshake;
    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lcom/squareup/okhttp/Handshake;->peerPrincipal()Ljava/security/Principal;

    move-result-object v1

    :goto_a
    return-object v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public getPermission()Ljava/security/Permission;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 222
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getPermission()Ljava/security/Permission;

    move-result-object v0

    return-object v0
.end method

.method public getReadTimeout()I
    .registers 2

    .prologue
    .line 278
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getReadTimeout()I

    move-result v0

    return v0
.end method

.method public getRequestMethod()Ljava/lang/String;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRequestProperties()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 182
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getRequestProperties()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getRequestProperty(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "field"    # Ljava/lang/String;

    .prologue
    .line 226
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResponseCode()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    return v0
.end method

.method public getResponseMessage()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 109
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getServerCertificates()[Ljava/security/cert/Certificate;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLPeerUnverifiedException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 71
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->handshake()Lcom/squareup/okhttp/Handshake;

    move-result-object v0

    .line 72
    .local v0, "handshake":Lcom/squareup/okhttp/Handshake;
    if-nez v0, :cond_8

    .line 74
    :cond_7
    :goto_7
    return-object v2

    .line 73
    :cond_8
    invoke-virtual {v0}, Lcom/squareup/okhttp/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object v1

    .line 74
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_7

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/security/cert/Certificate;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/security/cert/Certificate;

    goto :goto_7
.end method

.method public getURL()Ljava/net/URL;
    .registers 2

    .prologue
    .line 230
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method

.method public getUseCaches()Z
    .registers 2

    .prologue
    .line 234
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getUseCaches()Z

    move-result v0

    return v0
.end method

.method protected abstract handshake()Lcom/squareup/okhttp/Handshake;
.end method

.method public setAllowUserInteraction(Z)V
    .registers 3
    .param p1, "newValue"    # Z

    .prologue
    .line 238
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setAllowUserInteraction(Z)V

    .line 239
    return-void
.end method

.method public setChunkedStreamingMode(I)V
    .registers 3
    .param p1, "chunkLength"    # I

    .prologue
    .line 290
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 291
    return-void
.end method

.method public setConnectTimeout(I)V
    .registers 3
    .param p1, "timeoutMillis"    # I

    .prologue
    .line 266
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 267
    return-void
.end method

.method public setDefaultUseCaches(Z)V
    .registers 3
    .param p1, "newValue"    # Z

    .prologue
    .line 242
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setDefaultUseCaches(Z)V

    .line 243
    return-void
.end method

.method public setDoInput(Z)V
    .registers 3
    .param p1, "newValue"    # Z

    .prologue
    .line 246
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 247
    return-void
.end method

.method public setDoOutput(Z)V
    .registers 3
    .param p1, "newValue"    # Z

    .prologue
    .line 250
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 251
    return-void
.end method

.method public setFixedLengthStreamingMode(I)V
    .registers 3
    .param p1, "contentLength"    # I

    .prologue
    .line 286
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 287
    return-void
.end method

.method public setIfModifiedSince(J)V
    .registers 4
    .param p1, "newValue"    # J

    .prologue
    .line 254
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->setIfModifiedSince(J)V

    .line 255
    return-void
.end method

.method public setInstanceFollowRedirects(Z)V
    .registers 3
    .param p1, "followRedirects"    # Z

    .prologue
    .line 125
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 126
    return-void
.end method

.method public setReadTimeout(I)V
    .registers 3
    .param p1, "timeoutMillis"    # I

    .prologue
    .line 274
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 275
    return-void
.end method

.method public setRequestMethod(Ljava/lang/String;)V
    .registers 3
    .param p1, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/ProtocolException;
        }
    .end annotation

    .prologue
    .line 113
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 114
    return-void
.end method

.method public setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "newValue"    # Ljava/lang/String;

    .prologue
    .line 258
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    return-void
.end method

.method public setUseCaches(Z)V
    .registers 3
    .param p1, "newValue"    # Z

    .prologue
    .line 262
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 263
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 282
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public usingProxy()Z
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection;->delegate:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->usingProxy()Z

    move-result v0

    return v0
.end method
