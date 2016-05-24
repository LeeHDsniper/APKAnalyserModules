.class Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$2;
.super Ljava/lang/Object;
.source "AdobeCollaborationSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->removeCollaborator(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationRemoveCollaboratorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

.field final synthetic val$removeCollaboratorCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationRemoveCollaboratorCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationRemoveCollaboratorCallback;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    .prologue
    .line 187
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$2;->val$removeCollaboratorCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationRemoveCollaboratorCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 5
    .param p1, "httpResponse"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 202
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v0

    .line 203
    .local v0, "statusCode":I
    const/16 v1, 0xc8

    if-lt v0, v1, :cond_12

    const/16 v1, 0x12b

    if-gt v0, v1, :cond_12

    .line 204
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$2;->val$removeCollaboratorCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationRemoveCollaboratorCallback;

    invoke-interface {v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationRemoveCollaboratorCallback;->onComplete()V

    .line 209
    :goto_11
    return-void

    .line 207
    :cond_12
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$2;->val$removeCollaboratorCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationRemoveCollaboratorCallback;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getCollaborationExceptionFromNetworkResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    invoke-static {v2, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->access$200(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationRemoveCollaboratorCallback;->onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V

    goto :goto_11
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 7
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 191
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseFromError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    invoke-static {v2, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->access$100(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    move-result-object v1

    .line 192
    .local v1, "response":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    const/4 v0, 0x0

    .line 193
    .local v0, "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    if-eqz v1, :cond_15

    .line 194
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getCollaborationExceptionFromNetworkResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    invoke-static {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->access$200(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v0

    .line 197
    :goto_f
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$2;->val$removeCollaboratorCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationRemoveCollaboratorCallback;

    invoke-interface {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationRemoveCollaboratorCallback;->onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V

    .line 198
    return-void

    .line 196
    :cond_15
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    .end local v0    # "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;->ADOBE_COLLABORATION_ERROR_UNEXPECTED_RESPONSE:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getData()Ljava/util/HashMap;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v0, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;Ljava/util/HashMap;Ljava/lang/String;)V

    .restart local v0    # "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    goto :goto_f
.end method
