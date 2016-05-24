.class Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment$NetWorkObserver;
.super Ljava/lang/Object;
.source "AdobeAuthSignInActivity.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "NetWorkObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    .prologue
    .line 938
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment$NetWorkObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 7
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 942
    move-object v0, p2

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    .line 943
    .local v0, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeNetworkStatusChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-eq v1, v2, :cond_15

    .line 945
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v2, "Authentication"

    const-string v3, "Expected a network status changed message!"

    invoke-static {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 957
    :goto_14
    return-void

    .line 949
    :cond_15
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment$NetWorkObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->_netReachability:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->access$300(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;)Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->isOnline()Z

    move-result v1

    if-nez v1, :cond_27

    .line 951
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment$NetWorkObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->_wentOffline()V
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->access$400(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;)V

    goto :goto_14

    .line 955
    :cond_27
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment$NetWorkObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->_cameOnline()V
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->access$500(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;)V

    goto :goto_14
.end method
