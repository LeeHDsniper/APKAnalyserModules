.class Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1LoginObserver;
.super Ljava/lang/Object;
.source "AdobeAuthManager.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->reAuthenticate()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LoginObserver"
.end annotation


# instance fields
.field public _result:Z

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

.field final synthetic val$sem:Ljava/util/concurrent/Semaphore;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;Ljava/util/concurrent/Semaphore;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 469
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1LoginObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1LoginObserver;->val$sem:Ljava/util/concurrent/Semaphore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 494
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1LoginObserver;->_result:Z

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 7
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 474
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {v2, v3, p0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    move-object v1, p2

    .line 475
    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    .line 476
    .local v1, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getInfo()Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_1e

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getInfo()Ljava/util/Map;

    move-result-object v2

    const-string v3, "Error"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_27

    .line 478
    :cond_1e
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1LoginObserver;->_result:Z

    .line 491
    :cond_21
    :goto_21
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1LoginObserver;->val$sem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 492
    return-void

    .line 482
    :cond_27
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getInfo()Ljava/util/Map;

    move-result-object v2

    const-string v3, "Error"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    .line 483
    .local v0, "errorObj":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;
    if-eqz v0, :cond_21

    .line 485
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;->getErrorCode()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_INTERACTION_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    if-ne v2, v3, :cond_21

    .line 487
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1LoginObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->handleEmergencyLogOut()V
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->access$200(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;)V

    goto :goto_21
.end method
