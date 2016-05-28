.class Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$3;
.super Ljava/lang/Object;
.source "AdobeCollaborationSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->createInvite(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

.field final synthetic val$inviteUserCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    .prologue
    .line 239
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$3;->val$inviteUserCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 7
    .param p1, "httpResponse"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 254
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v2

    .line 255
    .local v2, "statusCode":I
    const/16 v3, 0xc8

    if-lt v2, v3, :cond_1e

    const/16 v3, 0x12b

    if-gt v2, v3, :cond_1e

    .line 256
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v3

    # invokes: Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->jsonObjectFromResponse(Ljava/lang/String;)Lorg/json/JSONObject;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->access$300(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 257
    .local v1, "object":Lorg/json/JSONObject;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->inviteWithDictionary(Lorg/json/JSONObject;)Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;

    move-result-object v0

    .line 258
    .local v0, "invite":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$3;->val$inviteUserCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;

    invoke-interface {v3, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;->onComplete(Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;)V

    .line 263
    .end local v0    # "invite":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;
    .end local v1    # "object":Lorg/json/JSONObject;
    :goto_1d
    return-void

    .line 261
    :cond_1e
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$3;->val$inviteUserCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getCollaborationExceptionFromNetworkResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    invoke-static {v4, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->access$200(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;->onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V

    goto :goto_1d
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 7
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 243
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseFromError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    invoke-static {v2, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->access$100(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    move-result-object v1

    .line 244
    .local v1, "response":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    const/4 v0, 0x0

    .line 245
    .local v0, "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    if-eqz v1, :cond_15

    .line 246
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getCollaborationExceptionFromNetworkResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    invoke-static {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->access$200(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v0

    .line 249
    :goto_f
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$3;->val$inviteUserCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;

    invoke-interface {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;->onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V

    .line 250
    return-void

    .line 248
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
