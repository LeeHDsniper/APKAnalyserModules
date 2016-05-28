.class Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;
.super Ljava/lang/Object;
.source "AdobeAccountConnection.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;

.field final synthetic val$subscriber:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;Lrx/Subscriber;)V
    .registers 3
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;

    .prologue
    .line 134
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->val$subscriber:Lrx/Subscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 7
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    const/4 v3, 0x0

    .line 137
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    const-string v1, "--- connect.onConnected"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 138
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    check-cast p2, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService$MyBinder;

    .end local p2    # "service":Landroid/os/IBinder;
    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService$MyBinder;->getService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v1

    # setter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mService:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$202(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    .line 139
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # setter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mConnecting:Z
    invoke-static {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$602(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;Z)Z

    .line 140
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    const/4 v1, 0x1

    # setter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mConnected:Z
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$102(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;Z)Z

    .line 141
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->connectionSubject:Lrx/subjects/PublishSubject;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$300(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lrx/subjects/PublishSubject;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mService:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$200(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    .line 142
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_59

    .line 143
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->val$subscriber:Lrx/Subscriber;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mService:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$200(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 144
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 146
    :cond_59
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mSemaphore:Ljava/util/concurrent/Semaphore;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$400(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Ljava/util/concurrent/Semaphore;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 147
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 7
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 151
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    const-string v1, "--- connect.onDisconnected"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 152
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # setter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mConnecting:Z
    invoke-static {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$602(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;Z)Z

    .line 153
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # setter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mConnected:Z
    invoke-static {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$102(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;Z)Z

    .line 154
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->connectionSubject:Lrx/subjects/PublishSubject;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$300(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lrx/subjects/PublishSubject;

    move-result-object v0

    invoke-virtual {v0, v4}, Lrx/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    .line 156
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_3c

    .line 157
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0, v4}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 158
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 160
    :cond_3c
    return-void
.end method
