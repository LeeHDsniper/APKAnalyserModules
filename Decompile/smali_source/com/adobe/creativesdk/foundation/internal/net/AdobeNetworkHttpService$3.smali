.class Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$3;
.super Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;
.source "AdobeNetworkHttpService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForDownloadRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

.field final synthetic val$callBackRequiredForHandler:Landroid/os/Handler;

.field final synthetic val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

.field final synthetic val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .prologue
    .line 404
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$3;->val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$3;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$3;->val$callBackRequiredForHandler:Landroid/os/Handler;

    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 8
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 406
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$3;->val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$3;->_requestRunner:Ljava/lang/Runnable;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$3;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$3;->val$callBackRequiredForHandler:Landroid/os/Handler;

    move-object v1, p1

    # invokes: Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_analyseResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;Ljava/lang/Runnable;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V
    invoke-static/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->access$000(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;Ljava/lang/Runnable;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V

    .line 408
    return-void
.end method
