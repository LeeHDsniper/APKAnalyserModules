.class Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;
.super Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;
.source "AdobeNetworkHttpDataDownloadTask.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected captureInputStream()V
    .registers 2

    .prologue
    .line 24
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;->captureData(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V

    .line 25
    return-void
.end method
