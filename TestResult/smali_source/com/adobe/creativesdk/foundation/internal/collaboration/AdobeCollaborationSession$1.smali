.class Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$1;
.super Ljava/lang/Object;
.source "AdobeCollaborationSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getCollaboration(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

.field final synthetic val$getCollaborationCallback:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    .prologue
    .line 143
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$1;->val$getCollaborationCallback:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 8
    .param p1, "httpResponse"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 160
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v3

    .line 161
    .local v3, "statusCode":I
    const/16 v4, 0xc8

    if-lt v3, v4, :cond_22

    const/16 v4, 0x12b

    if-gt v3, v4, :cond_22

    .line 162
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v1

    .line 163
    .local v1, "data":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v4

    # invokes: Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->jsonObjectFromResponse(Ljava/lang/String;)Lorg/json/JSONObject;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->access$300(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 164
    .local v2, "object":Lorg/json/JSONObject;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->collaborationWithDictionary(Lorg/json/JSONObject;)Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;

    move-result-object v0

    .line 165
    .local v0, "collaborations":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$1;->val$getCollaborationCallback:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;

    invoke-interface {v4, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;->onComplete(Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;)V

    .line 171
    .end local v0    # "collaborations":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;
    .end local v1    # "data":Ljava/lang/String;
    .end local v2    # "object":Lorg/json/JSONObject;
    :goto_21
    return-void

    .line 167
    :cond_22
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$1;->val$getCollaborationCallback:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getCollaborationExceptionFromNetworkResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    invoke-static {v5, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->access$200(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;->onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V

    goto :goto_21
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 7
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 149
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseFromError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    invoke-static {v2, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->access$100(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    move-result-object v1

    .line 150
    .local v1, "response":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    const/4 v0, 0x0

    .line 151
    .local v0, "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    if-eqz v1, :cond_15

    .line 152
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getCollaborationExceptionFromNetworkResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    invoke-static {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->access$200(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v0

    .line 155
    :goto_f
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$1;->val$getCollaborationCallback:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;

    invoke-interface {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;->onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V

    .line 156
    return-void

    .line 154
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
