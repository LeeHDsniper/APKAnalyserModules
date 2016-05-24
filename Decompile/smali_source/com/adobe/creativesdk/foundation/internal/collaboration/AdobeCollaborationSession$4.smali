.class Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$4;
.super Ljava/lang/Object;
.source "AdobeCollaborationSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getInvites(Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetInvitesCallBack;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

.field final synthetic val$getInvitesCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetInvitesCallBack;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetInvitesCallBack;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    .prologue
    .line 277
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$4;->val$getInvitesCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetInvitesCallBack;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 12
    .param p1, "httpResponse"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 293
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v7

    .line 294
    .local v7, "statusCode":I
    const/16 v8, 0xc8

    if-lt v7, v8, :cond_3e

    const/16 v8, 0x12b

    if-gt v7, v8, :cond_3e

    .line 296
    :try_start_c
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v6

    .line 297
    .local v6, "jsonString":Ljava/lang/String;
    # invokes: Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->jsonArrayFromResponse(Ljava/lang/String;)Lorg/json/JSONArray;
    invoke-static {v6}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->access$400(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 298
    .local v5, "invitesArray":Lorg/json/JSONArray;
    const/4 v4, 0x0

    .line 299
    .local v4, "invites":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;>;"
    if-eqz v6, :cond_33

    .line 300
    new-instance v4, Ljava/util/ArrayList;

    .end local v4    # "invites":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;>;"
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 301
    .restart local v4    # "invites":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1d
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v1, v8, :cond_33

    .line 302
    invoke-virtual {v5, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 303
    .local v3, "inviteJsonObject":Lorg/json/JSONObject;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->inviteWithDictionary(Lorg/json/JSONObject;)Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;

    move-result-object v2

    .line 304
    .local v2, "invite":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;
    if-eqz v2, :cond_30

    .line 305
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 301
    :cond_30
    add-int/lit8 v1, v1, 0x1

    goto :goto_1d

    .line 308
    .end local v1    # "i":I
    .end local v2    # "invite":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;
    .end local v3    # "inviteJsonObject":Lorg/json/JSONObject;
    :cond_33
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$4;->val$getInvitesCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetInvitesCallBack;

    invoke-interface {v8, v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetInvitesCallBack;->onComplete(Ljava/util/ArrayList;)V
    :try_end_38
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_38} :catch_39

    .line 316
    .end local v4    # "invites":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;>;"
    .end local v5    # "invitesArray":Lorg/json/JSONArray;
    .end local v6    # "jsonString":Ljava/lang/String;
    :goto_38
    return-void

    .line 309
    :catch_39
    move-exception v0

    .line 310
    .local v0, "exp":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_38

    .line 314
    .end local v0    # "exp":Lorg/json/JSONException;
    :cond_3e
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$4;->val$getInvitesCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetInvitesCallBack;

    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getCollaborationExceptionFromNetworkResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    invoke-static {v9, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->access$200(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v9

    invoke-interface {v8, v9}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetInvitesCallBack;->onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V

    goto :goto_38
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 7
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 281
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseFromError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    invoke-static {v2, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->access$100(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    move-result-object v1

    .line 282
    .local v1, "response":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    const/4 v0, 0x0

    .line 283
    .local v0, "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    if-eqz v1, :cond_15

    .line 284
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getCollaborationExceptionFromNetworkResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    invoke-static {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->access$200(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v0

    .line 287
    :goto_f
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$4;->val$getInvitesCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetInvitesCallBack;

    invoke-interface {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetInvitesCallBack;->onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V

    .line 289
    return-void

    .line 286
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
