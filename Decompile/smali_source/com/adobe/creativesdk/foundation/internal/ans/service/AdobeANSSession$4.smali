.class Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$4;
.super Ljava/lang/Object;
.source "AdobeANSSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->queryUnreadNotificationCount(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationUnreadCountCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

.field final synthetic val$callback:Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationUnreadCountCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationUnreadCountCallback;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    .prologue
    .line 296
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$4;->val$callback:Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationUnreadCountCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 3
    .param p1, "exp"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 306
    const/4 v0, 0x1

    .line 308
    .local v0, "i":I
    return-void
.end method

.method public onSuccess(Lorg/json/JSONObject;)V
    .registers 4
    .param p1, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 299
    const-string v1, "unread-count"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    .line 300
    .local v0, "count":I
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$4;->val$callback:Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationUnreadCountCallback;

    invoke-interface {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationUnreadCountCallback;->onSuccess(I)V

    .line 302
    return-void
.end method
