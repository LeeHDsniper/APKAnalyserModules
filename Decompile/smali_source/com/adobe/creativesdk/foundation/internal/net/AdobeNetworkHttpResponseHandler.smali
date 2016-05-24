.class abstract Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;
.super Ljava/lang/Object;
.source "AdobeNetworkHttpResponseHandler.java"


# instance fields
.field _requestRunner:Ljava/lang/Runnable;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;->_requestRunner:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method abstract handleResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
.end method
