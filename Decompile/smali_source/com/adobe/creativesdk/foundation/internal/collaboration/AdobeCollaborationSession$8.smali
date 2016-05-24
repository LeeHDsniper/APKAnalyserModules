.class Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$8;
.super Ljava/lang/Object;
.source "AdobeCollaborationSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->createNewLink(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

.field final synthetic val$createLinkCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    .prologue
    .line 463
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$8;->val$createLinkCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 8
    .param p1, "httpResponse"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    const/4 v5, 0x0

    .line 471
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v2

    const-string v3, "location"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 472
    .local v0, "linkPathComponents":[Ljava/lang/String;
    const-string v2, "https://assets.adobe.com/link/%s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    array-length v4, v0

    add-int/lit8 v4, v4, -0x1

    aget-object v4, v0, v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 473
    .local v1, "publicURL":Ljava/lang/String;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$8;->val$createLinkCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;

    invoke-interface {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;->onComplete(Ljava/lang/String;)V

    .line 474
    return-void
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 4
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 466
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$8;->val$createLinkCallBack:Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getStatusCode()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;->onError(I)V

    .line 467
    return-void
.end method
