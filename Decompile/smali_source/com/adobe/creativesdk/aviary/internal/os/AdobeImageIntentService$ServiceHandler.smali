.class final Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService$ServiceHandler;
.super Landroid/os/Handler;
.source "AdobeImageIntentService.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "HandlerLeak"
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ServiceHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;Landroid/os/Looper;)V
    .registers 3
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService$ServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;

    .line 61
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 62
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 66
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService$ServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/content/Intent;

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;->onHandleIntent(Landroid/content/Intent;)V

    .line 67
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService$ServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;

    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;->stopSelf(I)V

    .line 68
    return-void
.end method
