.class Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$8;
.super Ljava/lang/Object;
.source "AdobeNetworkHttpService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_analyseResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;Ljava/lang/Runnable;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

.field final synthetic val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

.field final synthetic val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .prologue
    .line 630
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$8;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$8;->val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 632
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$8;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

    if-eqz v2, :cond_11

    .line 634
    sget-object v0, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorCancelled:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    .line 635
    .local v0, "errorCode":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;
    new-instance v1, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;Ljava/util/HashMap;)V

    .line 636
    .local v1, "netError":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$8;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

    invoke-interface {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;->onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    .line 638
    .end local v0    # "errorCode":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;
    .end local v1    # "netError":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    :cond_11
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$8;->val$requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->markFinished()V

    .line 639
    return-void
.end method
