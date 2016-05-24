.class Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$2;
.super Ljava/lang/Object;
.source "AdobeNotificationManager.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeGoogleRegistrationCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->loadAppData(Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    .prologue
    .line 238
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
