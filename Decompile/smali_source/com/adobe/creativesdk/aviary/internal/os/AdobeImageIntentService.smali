.class public abstract Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;
.super Landroid/app/Service;
.source "AdobeImageIntentService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService$ServiceHandler;
    }
.end annotation


# instance fields
.field private final mName:Ljava/lang/String;

.field private mRedelivery:Z

.field private volatile mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService$ServiceHandler;

.field private volatile mServiceLooper:Landroid/os/Looper;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 77
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 78
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;->mName:Ljava/lang/String;

    .line 79
    return-void
.end method


# virtual methods
.method public clearServiceQueue()V
    .registers 3

    .prologue
    .line 126
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService$ServiceHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService$ServiceHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 127
    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 155
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .registers 4

    .prologue
    .line 105
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 106
    new-instance v0, Landroid/os/HandlerThread;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "IntentService["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;->mName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 107
    .local v0, "thread":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 109
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;->mServiceLooper:Landroid/os/Looper;

    .line 110
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService$ServiceHandler;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;->mServiceLooper:Landroid/os/Looper;

    invoke-direct {v1, p0, v2}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService$ServiceHandler;-><init>(Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService$ServiceHandler;

    .line 111
    return-void
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;->mServiceLooper:Landroid/os/Looper;

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 145
    return-void
.end method

.method protected abstract onHandleIntent(Landroid/content/Intent;)V
.end method

.method public onStart(Landroid/content/Intent;I)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "startId"    # I

    .prologue
    .line 119
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService$ServiceHandler;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService$ServiceHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 120
    .local v0, "msg":Landroid/os/Message;
    iput p2, v0, Landroid/os/Message;->arg1:I

    .line 121
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 122
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService$ServiceHandler;

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService$ServiceHandler;->sendMessage(Landroid/os/Message;)Z

    .line 123
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 138
    invoke-virtual {p0, p1, p3}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;->onStart(Landroid/content/Intent;I)V

    .line 139
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;->mRedelivery:Z

    if-eqz v0, :cond_9

    const/4 v0, 0x3

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x2

    goto :goto_8
.end method
