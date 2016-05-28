.class Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;
.super Ljava/lang/Object;
.source "IabHelper.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->startSetup(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

.field final synthetic val$listener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    .prologue
    .line 225
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->val$listener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 10
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    const/4 v6, 0x0

    .line 234
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    iget-boolean v3, v3, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mDisposed:Z

    if-eqz v3, :cond_8

    .line 282
    :cond_7
    :goto_7
    return-void

    .line 235
    :cond_8
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    const-string v4, "Billing service connected."

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 236
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    invoke-static {p2}, Lcom/android/vending/billing/IInAppBillingService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/vending/billing/IInAppBillingService;

    move-result-object v4

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mService:Lcom/android/vending/billing/IInAppBillingService;

    .line 237
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 239
    .local v1, "packageName":Ljava/lang/String;
    :try_start_1f
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    const-string v4, "Checking for in-app billing 3 support."

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 242
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mService:Lcom/android/vending/billing/IInAppBillingService;

    const/4 v4, 0x3

    const-string v5, "inapp"

    invoke-interface {v3, v4, v1, v5}, Lcom/android/vending/billing/IInAppBillingService;->isBillingSupported(ILjava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 243
    .local v2, "response":I
    if-eqz v2, :cond_67

    .line 244
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->val$listener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;

    if-eqz v3, :cond_43

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->val$listener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;

    new-instance v4, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    const-string v5, "Error checking for billing v3 support."

    invoke-direct {v4, v2, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;->onIabSetupFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;)V

    .line 251
    :cond_43
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    const/4 v4, 0x0

    iput-boolean v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mSubscriptionsSupported:Z
    :try_end_48
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_48} :catch_49

    goto :goto_7

    .line 266
    .end local v2    # "response":I
    :catch_49
    move-exception v0

    .line 267
    .local v0, "e":Landroid/os/RemoteException;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->val$listener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;

    if-eqz v3, :cond_5c

    .line 268
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->val$listener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;

    new-instance v4, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    const/16 v5, -0x3e9

    const-string v6, "RemoteException while setting up in-app billing."

    invoke-direct {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;->onIabSetupFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;)V

    .line 274
    :cond_5c
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    const-string v4, "handled exception"

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 275
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_7

    .line 254
    .end local v0    # "e":Landroid/os/RemoteException;
    .restart local v2    # "response":I
    :cond_67
    :try_start_67
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "In-app billing version 3 supported for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 257
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mService:Lcom/android/vending/billing/IInAppBillingService;

    const/4 v4, 0x3

    const-string v5, "subs"

    invoke-interface {v3, v4, v1, v5}, Lcom/android/vending/billing/IInAppBillingService;->isBillingSupported(ILjava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 258
    if-nez v2, :cond_af

    .line 259
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    const-string v4, "Subscriptions AVAILABLE."

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 260
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    const/4 v4, 0x1

    iput-boolean v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mSubscriptionsSupported:Z

    .line 265
    :goto_98
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    const/4 v4, 0x1

    iput-boolean v4, v3, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mSetupDone:Z
    :try_end_9d
    .catch Landroid/os/RemoteException; {:try_start_67 .. :try_end_9d} :catch_49

    .line 279
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->val$listener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;

    if-eqz v3, :cond_7

    .line 280
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->val$listener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;

    new-instance v4, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    const-string v5, "Setup successful."

    invoke-direct {v4, v6, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;->onIabSetupFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;)V

    goto/16 :goto_7

    .line 262
    :cond_af
    :try_start_af
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Subscriptions NOT AVAILABLE. Response: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V
    :try_end_c7
    .catch Landroid/os/RemoteException; {:try_start_af .. :try_end_c7} :catch_49

    goto :goto_98
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 4
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 228
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    const-string v1, "Billing service disconnected."

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 229
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mService:Lcom/android/vending/billing/IInAppBillingService;

    .line 230
    return-void
.end method
