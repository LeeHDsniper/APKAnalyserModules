.class Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$7;
.super Ljava/lang/Object;
.source "AdobeCollaborationSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->retrieveLink(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

.field final synthetic val$retrieveLinkCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    .prologue
    .line 435
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$7;->val$retrieveLinkCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 7
    .param p1, "httpResponse"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 443
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v2

    .line 445
    .local v2, "response":Ljava/lang/String;
    :try_start_4
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 446
    .local v1, "object":Lorg/json/JSONObject;
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$7;->val$retrieveLinkCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;

    const-string v3, "publicURL"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v4, v3}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;->onComplete(Ljava/lang/String;)V
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_16} :catch_17

    .line 450
    .end local v1    # "object":Lorg/json/JSONObject;
    :goto_16
    return-void

    .line 447
    :catch_17
    move-exception v0

    .line 448
    .local v0, "e":Lorg/json/JSONException;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$7;->val$retrieveLinkCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;

    const/16 v4, 0x190

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;->onError(I)V

    goto :goto_16
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 4
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 438
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$7;->val$retrieveLinkCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getStatusCode()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;->onError(I)V

    .line 439
    return-void
.end method
