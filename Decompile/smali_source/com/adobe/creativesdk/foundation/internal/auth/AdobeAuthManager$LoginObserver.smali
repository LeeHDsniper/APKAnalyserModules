.class Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LoginObserver;
.super Ljava/lang/Object;
.source "AdobeAuthManager.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LoginObserver"
.end annotation


# instance fields
.field _loginClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;
    .param p2, "loginClient"    # Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;

    .prologue
    .line 113
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LoginObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LoginObserver;->_loginClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;

    .line 114
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LoginObserver;->_loginClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;

    .line 115
    return-void
.end method


# virtual methods
.method public registerForLogin()V
    .registers 3

    .prologue
    .line 118
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    .line 119
    .local v0, "notificationCenter":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginExternalNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {v0, v1, p0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 120
    return-void
.end method

.method public unregisterForLogin()V
    .registers 3

    .prologue
    .line 123
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    .line 124
    .local v0, "notificationCenter":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginExternalNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {v0, v1, p0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 125
    return-void
.end method

.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 7
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 129
    move-object v1, p2

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    .line 130
    .local v1, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getInfo()Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_27

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getInfo()Ljava/util/Map;

    move-result-object v2

    const-string v3, "Error"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_27

    .line 132
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getInfo()Ljava/util/Map;

    move-result-object v2

    const-string v3, "Error"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    .line 133
    .local v0, "error":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LoginObserver;->_loginClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;

    invoke-interface {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;->onError(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 139
    .end local v0    # "error":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;
    :goto_26
    return-void

    .line 137
    :cond_27
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LoginObserver;->_loginClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LoginObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;->onSuccess(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;)V

    goto :goto_26
.end method
