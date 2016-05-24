.class Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$LoginNotificationObserver;
.super Ljava/lang/Object;
.source "AdobeANSSession.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoginNotificationObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;)V
    .registers 2

    .prologue
    .line 681
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$LoginNotificationObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;
    .param p2, "x1"    # Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$1;

    .prologue
    .line 681
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$LoginNotificationObserver;-><init>(Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;)V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 6
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 684
    move-object v0, p2

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    .line 686
    .local v0, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-ne v1, v2, :cond_c

    .line 692
    :cond_b
    :goto_b
    return-void

    .line 688
    :cond_c
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLogoutNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-ne v1, v2, :cond_b

    goto :goto_b
.end method
