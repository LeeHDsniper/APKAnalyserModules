.class Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$11;
.super Ljava/lang/Object;
.source "AdobeCollaborationSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

.field final synthetic val$request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

.field final synthetic val$responseCallback:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    .prologue
    .line 662
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$11;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$11;->val$request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$11;->val$responseCallback:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 3
    .param p1, "err"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 672
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$11;->val$responseCallback:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;->onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    .line 673
    return-void
.end method

.method public onSuccess(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 4
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 665
    # getter for: Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->requestMap:Ljava/util/Map;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->access$500()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$11;->val$request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 666
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$11;->val$responseCallback:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;->onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V

    .line 667
    return-void
.end method
