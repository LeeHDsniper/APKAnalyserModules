.class Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$12;
.super Ljava/lang/Object;
.source "AdobeCollaborationSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getComments(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeGetCommentsCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

.field final synthetic val$commentsCallback:Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeGetCommentsCallback;

.field final synthetic val$resource:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeGetCommentsCallback;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    .prologue
    .line 705
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$12;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$12;->val$commentsCallback:Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeGetCommentsCallback;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$12;->val$resource:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 7
    .param p1, "httpResponse"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 709
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v2

    .line 711
    .local v2, "jsonData":Ljava/lang/String;
    :try_start_4
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 712
    .local v0, "commentsData":Lorg/json/JSONArray;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$12;->val$commentsCallback:Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeGetCommentsCallback;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$12;->val$resource:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-static {v0, v4}, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentsDataSource;->commentsFromJSONData(Lorg/json/JSONArray;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentsDataSource;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeGetCommentsCallback;->onSuccess(Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentsDataSource;)V
    :try_end_14
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_14} :catch_15

    .line 717
    .end local v0    # "commentsData":Lorg/json/JSONArray;
    :goto_14
    return-void

    .line 713
    :catch_15
    move-exception v1

    .line 714
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_14
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 723
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$12;->val$commentsCallback:Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeGetCommentsCallback;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeGetCommentsCallback;->onError()V

    .line 725
    return-void
.end method
