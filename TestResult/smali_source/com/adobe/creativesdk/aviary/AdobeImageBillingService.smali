.class public Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
.super Landroid/app/Service;
.source "AdobeImageBillingService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/AdobeImageBillingService$MyBinder;
    }
.end annotation


# static fields
.field static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

.field private final mBinder:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService$MyBinder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 32
    const-string v0, "AdobeImageContentManagerService"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 37
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 33
    new-instance v0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService$MyBinder;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService$MyBinder;-><init>(Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBinder:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService$MyBinder;

    .line 38
    return-void
.end method


# virtual methods
.method public handleActivityResult(IILandroid/content/Intent;)Z
    .registers 6
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 156
    const-string v0, "IabHelper"

    const-string v1, "handleActivityResult for AdobeImageBillingService"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->handleActivityResult(IILandroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method public isAuthenticated()Z
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->isAuthenticated()Z

    move-result v0

    return v0
.end method

.method public isSetupDone()Z
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->isSetupDone()Z

    move-result v0

    return v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 6
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 70
    sget-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onBind: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 71
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBinder:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService$MyBinder;

    return-object v0
.end method

.method public onCreate()V
    .registers 3

    .prologue
    .line 63
    sget-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onCreate"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 64
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 65
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->create(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .line 66
    return-void
.end method

.method public onDestroy()V
    .registers 3

    .prologue
    .line 94
    sget-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onDestroy"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 95
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->dispose()V

    .line 96
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .line 97
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 98
    return-void
.end method

.method public onRebind(Landroid/content/Intent;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 82
    sget-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onRebind"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 83
    invoke-super {p0, p1}, Landroid/app/Service;->onRebind(Landroid/content/Intent;)V

    .line 84
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 9
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 88
    sget-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onStartCommand: %s, %d, %d"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 89
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v0

    return v0
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 76
    sget-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onUnbind"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 77
    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method public purchase(Landroid/app/Activity;IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/Observable;
    .registers 20
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "requestCode"    # I
    .param p3, "packid"    # J
    .param p5, "identifier"    # Ljava/lang/String;
    .param p6, "packType"    # Ljava/lang/String;
    .param p7, "trackerName"    # Ljava/lang/String;
    .param p8, "price"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "IJ",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/Observable",
            "<",
            "Landroid/util/Pair",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 140
    const/4 v10, -0x1

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-wide v4, p3

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    invoke-virtual/range {v1 .. v10}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->purchase(Landroid/app/Activity;IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public purchase(Landroid/app/Activity;IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lrx/Observable;
    .registers 21
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "requestCode"    # I
    .param p3, "packid"    # J
    .param p5, "identifier"    # Ljava/lang/String;
    .param p6, "packType"    # Ljava/lang/String;
    .param p7, "trackerName"    # Ljava/lang/String;
    .param p8, "price"    # Ljava/lang/String;
    .param p9, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "IJ",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I)",
            "Lrx/Observable",
            "<",
            "Landroid/util/Pair",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 147
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    move-object v2, p1

    move v3, p2

    move-wide v4, p3

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move/from16 v10, p9

    invoke-virtual/range {v1 .. v10}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->requestPurchase(Landroid/app/Activity;IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public queryPurchases(Ljava/util/Map;)Lrx/Observable;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;)",
            "Lrx/Observable",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 133
    .local p1, "list":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->queryPurchases(Ljava/util/Map;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public requestLogin(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 4
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->requestLogin(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 106
    return-void
.end method

.method public requestSignUp(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 4
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->requestSignUp(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 110
    return-void
.end method

.method public restore(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/Observable;
    .registers 13
    .param p1, "packid"    # J
    .param p3, "identifier"    # Ljava/lang/String;
    .param p4, "packType"    # Ljava/lang/String;
    .param p5, "whereFrom"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/Observable",
            "<+",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 152
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->requestRestore(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public startSetup()Lrx/Observable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Landroid/util/Pair",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 101
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->startSetup()Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public subscribeToCdsFinised(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;
    .registers 4
    .param p1, "from"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lrx/functions/Action1",
            "<-",
            "Ljava/lang/Integer;",
            ">;)",
            "Lrx/Subscription;"
        }
    .end annotation

    .prologue
    .line 50
    .local p2, "action":Lrx/functions/Action1;, "Lrx/functions/Action1<-Ljava/lang/Integer;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->subscribeToCdsFinised(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public subscribeToPackDownloadStatusChanged(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;
    .registers 4
    .param p1, "from"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lrx/functions/Action1",
            "<-",
            "Landroid/content/Intent;",
            ">;)",
            "Lrx/Subscription;"
        }
    .end annotation

    .prologue
    .line 54
    .local p2, "action":Lrx/functions/Action1;, "Lrx/functions/Action1<-Landroid/content/Intent;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->subscribeToPackDownloadStatusChanged(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public subscribeToPackInstalled(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;
    .registers 4
    .param p1, "from"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lrx/functions/Action1",
            "<-",
            "Landroid/content/Intent;",
            ">;)",
            "Lrx/Subscription;"
        }
    .end annotation

    .prologue
    .line 58
    .local p2, "action":Lrx/functions/Action1;, "Lrx/functions/Action1<-Landroid/content/Intent;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->subscribeToPackInstalled(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public subscribeToPackPurchased(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;
    .registers 4
    .param p1, "from"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lrx/functions/Action1",
            "<-",
            "Landroid/content/Intent;",
            ">;)",
            "Lrx/Subscription;"
        }
    .end annotation

    .prologue
    .line 41
    .local p2, "action":Lrx/functions/Action1;, "Lrx/functions/Action1<-Landroid/content/Intent;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->subscribeToPackPurchased(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public subscribeToUserStatusChange(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;
    .registers 4
    .param p1, "from"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lrx/functions/Action1",
            "<-",
            "Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;",
            ">;)",
            "Lrx/Subscription;"
        }
    .end annotation

    .prologue
    .line 46
    .local p2, "action":Lrx/functions/Action1;, "Lrx/functions/Action1<-Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->mBillingFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->subscribeToUserStatusChange(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v0

    return-object v0
.end method
