.class public Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;
.super Ljava/lang/Object;
.source "IabHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;,
        Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;
    }
.end annotation


# instance fields
.field mAsyncOperation:Ljava/lang/String;

.field mContext:Landroid/content/Context;

.field mDebugLog:Z

.field mDebugTag:Ljava/lang/String;

.field mDisposed:Z

.field mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

.field mPurchasingItemType:Ljava/lang/String;

.field mRequestCode:I

.field mService:Lcom/android/vending/billing/IInAppBillingService;

.field mServiceConn:Landroid/content/ServiceConnection;

.field mSetupDone:Z

.field mSignatureBase64:Ljava/lang/String;

.field mSubscriptionsSupported:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "base64PublicKey"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mDebugLog:Z

    .line 77
    const-string v0, "IabHelper"

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mDebugTag:Ljava/lang/String;

    .line 80
    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mSetupDone:Z

    .line 83
    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mDisposed:Z

    .line 86
    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mSubscriptionsSupported:Z

    .line 94
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mAsyncOperation:Ljava/lang/String;

    .line 110
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mSignatureBase64:Ljava/lang/String;

    .line 167
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mContext:Landroid/content/Context;

    .line 168
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mSignatureBase64:Ljava/lang/String;

    .line 169
    const-string v0, "IAB helper created."

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 170
    return-void
.end method

.method private checkNotDisposed()V
    .registers 3

    .prologue
    .line 343
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mDisposed:Z

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "IabHelper was disposed of, so it cannot be used."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 344
    :cond_c
    return-void
.end method

.method public static getResponseDesc(I)Ljava/lang/String;
    .registers 6
    .param p0, "code"    # I

    .prologue
    .line 800
    const-string v3, "0:OK/1:User Canceled/2:Unknown/3:Billing Unavailable/4:Item unavailable/5:Developer Error/6:Error/7:Item Already Owned/8:Item not owned"

    const-string v4, "/"

    .line 801
    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 802
    .local v0, "iabMsgs":[Ljava/lang/String;
    const-string v3, "0:OK/-1001:Remote exception during initialization/-1002:Bad response received/-1003:Purchase signature verification failed/-1004:Send intent failed/-1005:User cancelled/-1006:Unknown purchase response/-1007:Missing token/-1008:Unknown error/-1009:Subscriptions not available/-1010:Invalid consumption attempt"

    const-string v4, "/"

    .line 805
    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 807
    .local v1, "iabhelperMsgs":[Ljava/lang/String;
    const/16 v3, -0x3e8

    if-gt p0, v3, :cond_36

    .line 808
    rsub-int v2, p0, -0x3e8

    .line 809
    .local v2, "index":I
    if-ltz v2, :cond_1e

    array-length v3, v1

    if-ge v2, v3, :cond_1e

    aget-object v3, v1, v2

    .line 812
    .end local v2    # "index":I
    :goto_1d
    return-object v3

    .line 810
    .restart local v2    # "index":I
    :cond_1e
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":Unknown IAB Helper Error"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1d

    .line 811
    .end local v2    # "index":I
    :cond_36
    if-ltz p0, :cond_3b

    array-length v3, v0

    if-lt p0, v3, :cond_53

    :cond_3b
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":Unknown"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1d

    .line 812
    :cond_53
    aget-object v3, v0, p0

    goto :goto_1d
.end method


# virtual methods
.method checkSetupDone(Ljava/lang/String;)V
    .registers 5
    .param p1, "operation"    # Ljava/lang/String;

    .prologue
    .line 818
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mSetupDone:Z

    if-nez v0, :cond_39

    .line 819
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Illegal state for operation ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "): IAB helper is not set up."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 820
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "IAB helper is not set up. Can\'t perform operation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 822
    :cond_39
    return-void
.end method

.method public dispose()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 323
    const-string v1, "Disposing."

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 324
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mSetupDone:Z

    .line 325
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mServiceConn:Landroid/content/ServiceConnection;

    if-eqz v1, :cond_1d

    .line 326
    const-string v1, "Unbinding from service."

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 327
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mContext:Landroid/content/Context;

    if-eqz v1, :cond_1d

    .line 329
    :try_start_16
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mServiceConn:Landroid/content/ServiceConnection;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_1d
    .catch Ljava/lang/Throwable; {:try_start_16 .. :try_end_1d} :catch_29

    .line 335
    :cond_1d
    :goto_1d
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mDisposed:Z

    .line 336
    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mContext:Landroid/content/Context;

    .line 337
    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mServiceConn:Landroid/content/ServiceConnection;

    .line 338
    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mService:Lcom/android/vending/billing/IInAppBillingService;

    .line 339
    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    .line 340
    return-void

    .line 330
    :catch_29
    move-exception v0

    .line 331
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1d
.end method

.method flagEndAsync()V
    .registers 3

    .prologue
    .line 865
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Ending async operation: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mAsyncOperation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 866
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mAsyncOperation:Ljava/lang/String;

    .line 868
    return-void
.end method

.method flagStartAsync(Ljava/lang/String;)V
    .registers 5
    .param p1, "operation"    # Ljava/lang/String;

    .prologue
    .line 855
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mAsyncOperation:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/adobe/creativesdk/aviary/internal/utils/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_33

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can\'t start async operation ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") because another async operation("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mAsyncOperation:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") is in progress."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 859
    :cond_33
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mAsyncOperation:Ljava/lang/String;

    .line 861
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Starting async operation: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 862
    return-void
.end method

.method getResponseCodeFromBundle(Landroid/os/Bundle;)I
    .registers 6
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 826
    const-string v1, "RESPONSE_CODE"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 827
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_f

    .line 828
    const-string v1, "Bundle with null response code, assuming OK (known issue)"

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 829
    const/4 v1, 0x0

    .line 831
    .end local v0    # "o":Ljava/lang/Object;
    :goto_e
    return v1

    .line 830
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_f
    instance-of v1, v0, Ljava/lang/Integer;

    if-eqz v1, :cond_1a

    check-cast v0, Ljava/lang/Integer;

    .end local v0    # "o":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_e

    .line 831
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_1a
    instance-of v1, v0, Ljava/lang/Long;

    if-eqz v1, :cond_26

    check-cast v0, Ljava/lang/Long;

    .end local v0    # "o":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    long-to-int v1, v2

    goto :goto_e

    .line 833
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_26
    const-string v1, "Unexpected type for bundle response code."

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 834
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 835
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected type for bundle response code: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method getResponseCodeFromIntent(Landroid/content/Intent;)I
    .registers 6
    .param p1, "i"    # Landroid/content/Intent;

    .prologue
    .line 841
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "RESPONSE_CODE"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 842
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_13

    .line 843
    const-string v1, "Intent with no response code, assuming OK (known issue)"

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 844
    const/4 v1, 0x0

    .line 846
    .end local v0    # "o":Ljava/lang/Object;
    :goto_12
    return v1

    .line 845
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_13
    instance-of v1, v0, Ljava/lang/Integer;

    if-eqz v1, :cond_1e

    check-cast v0, Ljava/lang/Integer;

    .end local v0    # "o":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_12

    .line 846
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_1e
    instance-of v1, v0, Ljava/lang/Long;

    if-eqz v1, :cond_2a

    check-cast v0, Ljava/lang/Long;

    .end local v0    # "o":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    long-to-int v1, v2

    goto :goto_12

    .line 848
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_2a
    const-string v1, "Unexpected type for intent response code."

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 849
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 850
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected type for intent response code: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public handleActivityResult(IILandroid/content/Intent;)Z
    .registers 16
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 482
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "handleActivityResult: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 484
    iget v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mRequestCode:I

    if-ne p1, v8, :cond_1c

    if-nez p1, :cond_1e

    :cond_1c
    const/4 v8, 0x0

    .line 560
    :goto_1d
    return v8

    .line 486
    :cond_1e
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->checkNotDisposed()V

    .line 487
    const-string v8, "handleActivityResult"

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->checkSetupDone(Ljava/lang/String;)V

    .line 490
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->flagEndAsync()V

    .line 492
    if-eqz p3, :cond_31

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v8

    if-nez v8, :cond_4b

    .line 493
    :cond_31
    const-string v8, "Null data in IAB activity result."

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 494
    new-instance v6, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    const/16 v8, -0x3ea

    const-string v9, "Null data in IAB result"

    invoke-direct {v6, v8, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 495
    .local v6, "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_49

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V

    .line 496
    :cond_49
    const/4 v8, 0x1

    goto :goto_1d

    .line 499
    .end local v6    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    :cond_4b
    invoke-virtual {p0, p3}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->getResponseCodeFromIntent(Landroid/content/Intent;)I

    move-result v5

    .line 500
    .local v5, "responseCode":I
    const-string v8, "INAPP_PURCHASE_DATA"

    invoke-virtual {p3, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 501
    .local v4, "purchaseData":Ljava/lang/String;
    const-string v8, "INAPP_DATA_SIGNATURE"

    invoke-virtual {p3, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 503
    .local v0, "dataSignature":Ljava/lang/String;
    const/4 v8, -0x1

    if-ne p2, v8, :cond_188

    if-nez v5, :cond_188

    .line 504
    const-string v8, "Successful resultcode from purchase activity."

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 505
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Purchase data: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 506
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Data signature: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 507
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Extras: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 508
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Expected item type: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchasingItemType:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 510
    if-eqz v4, :cond_c7

    if-nez v0, :cond_100

    .line 511
    :cond_c7
    const-string v8, "BUG: either purchaseData or dataSignature is null."

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 512
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Extras: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v9

    invoke-virtual {v9}, Landroid/os/Bundle;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 513
    new-instance v6, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    const/16 v8, -0x3f0

    const-string v9, "IAB returned null purchaseData or dataSignature"

    invoke-direct {v6, v8, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 514
    .restart local v6    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_fd

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V

    .line 515
    :cond_fd
    const/4 v8, 0x1

    goto/16 :goto_1d

    .line 518
    .end local v6    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    :cond_100
    const/4 v2, 0x0

    .line 520
    .local v2, "purchase":Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;
    :try_start_101
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchasingItemType:Ljava/lang/String;

    invoke-direct {v3, v8, v4, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_108
    .catch Lorg/json/JSONException; {:try_start_101 .. :try_end_108} :catch_169

    .line 521
    .end local v2    # "purchase":Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;
    .local v3, "purchase":Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;
    :try_start_108
    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;->getSku()Ljava/lang/String;

    move-result-object v7

    .line 524
    .local v7, "sku":Ljava/lang/String;
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mSignatureBase64:Ljava/lang/String;

    invoke-static {v8, v4, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Security;->verifyPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_150

    .line 525
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Purchase signature verification FAILED for sku "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 526
    new-instance v6, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    const/16 v8, -0x3eb

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Signature verification failed for sku "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v6, v8, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 527
    .restart local v6    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_14d

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    invoke-interface {v8, v6, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V

    .line 528
    :cond_14d
    const/4 v8, 0x1

    goto/16 :goto_1d

    .line 530
    .end local v6    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    :cond_150
    const-string v8, "Purchase signature successfully verified."

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V
    :try_end_155
    .catch Lorg/json/JSONException; {:try_start_108 .. :try_end_155} :catch_224

    .line 539
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_166

    .line 540
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    new-instance v9, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    const/4 v10, 0x0

    const-string v11, "Success"

    invoke-direct {v9, v10, v11}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    invoke-interface {v8, v9, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V

    .line 560
    .end local v3    # "purchase":Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;
    .end local v7    # "sku":Ljava/lang/String;
    :cond_166
    :goto_166
    const/4 v8, 0x1

    goto/16 :goto_1d

    .line 531
    .restart local v2    # "purchase":Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;
    :catch_169
    move-exception v1

    .line 532
    .local v1, "e":Lorg/json/JSONException;
    :goto_16a
    const-string v8, "Failed to parse purchase data."

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 533
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 534
    new-instance v6, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    const/16 v8, -0x3ea

    const-string v9, "Failed to parse purchase data."

    invoke-direct {v6, v8, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 535
    .restart local v6    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_185

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V

    .line 536
    :cond_185
    const/4 v8, 0x1

    goto/16 :goto_1d

    .line 542
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v2    # "purchase":Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;
    .end local v6    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    :cond_188
    const/4 v8, -0x1

    if-ne p2, v8, :cond_1b7

    .line 544
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Result code was OK but in-app billing response was not OK: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 545
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_166

    .line 546
    new-instance v6, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    const-string v8, "Problem purchashing item."

    invoke-direct {v6, v5, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 547
    .restart local v6    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V

    goto :goto_166

    .line 549
    .end local v6    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    :cond_1b7
    if-nez p2, :cond_1e7

    .line 550
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Purchase canceled - Response: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 551
    new-instance v6, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    const/16 v8, -0x3ed

    const-string v9, "User canceled."

    invoke-direct {v6, v8, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 552
    .restart local v6    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_166

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V

    goto :goto_166

    .line 554
    .end local v6    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    :cond_1e7
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Purchase failed. Result code: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 555
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ". Response: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 554
    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 557
    new-instance v6, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    const/16 v8, -0x3ee

    const-string v9, "Unknown purchase response."

    invoke-direct {v6, v8, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 558
    .restart local v6    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_166

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V

    goto/16 :goto_166

    .line 531
    .end local v6    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    .restart local v3    # "purchase":Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;
    :catch_224
    move-exception v1

    move-object v2, v3

    .end local v3    # "purchase":Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;
    .restart local v2    # "purchase":Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;
    goto/16 :goto_16a
.end method

.method public isAvailable()Z
    .registers 2

    .prologue
    .line 181
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mDisposed:Z

    if-nez v0, :cond_a

    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mSetupDone:Z

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isDisposed()Z
    .registers 2

    .prologue
    .line 177
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mDisposed:Z

    return v0
.end method

.method public isSetupDone()Z
    .registers 2

    .prologue
    .line 173
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mSetupDone:Z

    return v0
.end method

.method public launchPurchaseFlow(Landroid/app/Activity;Ljava/lang/String;ILcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;)V
    .registers 11
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "sku"    # Ljava/lang/String;
    .param p3, "requestCode"    # I
    .param p4, "listener"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    .prologue
    .line 374
    const-string v5, ""

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->launchPurchaseFlow(Landroid/app/Activity;Ljava/lang/String;ILcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;Ljava/lang/String;)V

    .line 375
    return-void
.end method

.method public launchPurchaseFlow(Landroid/app/Activity;Ljava/lang/String;ILcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;Ljava/lang/String;)V
    .registers 13
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "sku"    # Ljava/lang/String;
    .param p3, "requestCode"    # I
    .param p4, "listener"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;
    .param p5, "extraData"    # Ljava/lang/String;

    .prologue
    .line 379
    const-string v3, "inapp"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->launchPurchaseFlow(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ILcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;Ljava/lang/String;)V

    .line 380
    return-void
.end method

.method public launchPurchaseFlow(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ILcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;Ljava/lang/String;)V
    .registers 21
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "sku"    # Ljava/lang/String;
    .param p3, "itemType"    # Ljava/lang/String;
    .param p4, "requestCode"    # I
    .param p5, "listener"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;
    .param p6, "extraData"    # Ljava/lang/String;

    .prologue
    .line 411
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->checkNotDisposed()V

    .line 412
    const-string v1, "launchPurchaseFlow"

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->checkSetupDone(Ljava/lang/String;)V

    .line 413
    const-string v1, "launchPurchaseFlow"

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->flagStartAsync(Ljava/lang/String;)V

    .line 416
    const-string v1, "subs"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_30

    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mSubscriptionsSupported:Z

    if-nez v1, :cond_30

    .line 417
    new-instance v11, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    const/16 v1, -0x3f1

    const-string v2, "Subscriptions are not available."

    invoke-direct {v11, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 420
    .local v11, "r":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->flagEndAsync()V

    .line 421
    if-eqz p5, :cond_2f

    const/4 v1, 0x0

    move-object/from16 v0, p5

    invoke-interface {v0, v11, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V

    .line 465
    .end local v11    # "r":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    :cond_2f
    :goto_2f
    return-void

    .line 426
    :cond_30
    :try_start_30
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Constructing buy intent for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p2

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", item type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p3

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 427
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mService:Lcom/android/vending/billing/IInAppBillingService;

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p6

    invoke-interface/range {v1 .. v6}, Lcom/android/vending/billing/IInAppBillingService;->getBuyIntent(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v8

    .line 428
    .local v8, "buyIntentBundle":Landroid/os/Bundle;
    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->getResponseCodeFromBundle(Landroid/os/Bundle;)I

    move-result v12

    .line 429
    .local v12, "response":I
    if-eqz v12, :cond_cc

    .line 430
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to buy item, Error response: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v12}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 431
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->flagEndAsync()V

    .line 432
    new-instance v13, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    const-string v1, "Unable to buy item"

    invoke-direct {v13, v12, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 433
    .local v13, "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    if-eqz p5, :cond_2f

    const/4 v1, 0x0

    move-object/from16 v0, p5

    invoke-interface {v0, v13, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V
    :try_end_99
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_30 .. :try_end_99} :catch_9a
    .catch Landroid/os/RemoteException; {:try_start_30 .. :try_end_99} :catch_130

    goto :goto_2f

    .line 450
    .end local v8    # "buyIntentBundle":Landroid/os/Bundle;
    .end local v12    # "response":I
    .end local v13    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    :catch_9a
    move-exception v9

    .line 451
    .local v9, "e":Landroid/content/IntentSender$SendIntentException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SendIntentException while launching purchase flow for sku "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p2

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 452
    invoke-virtual {v9}, Landroid/content/IntentSender$SendIntentException;->printStackTrace()V

    .line 453
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->flagEndAsync()V

    .line 455
    new-instance v13, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    const/16 v1, -0x3ec

    const-string v2, "Failed to send intent."

    invoke-direct {v13, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 456
    .restart local v13    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    if-eqz p5, :cond_2f

    const/4 v1, 0x0

    move-object/from16 v0, p5

    invoke-interface {v0, v13, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V

    goto/16 :goto_2f

    .line 437
    .end local v9    # "e":Landroid/content/IntentSender$SendIntentException;
    .end local v13    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    .restart local v8    # "buyIntentBundle":Landroid/os/Bundle;
    .restart local v12    # "response":I
    :cond_cc
    :try_start_cc
    const-string v1, "BUY_INTENT"

    invoke-virtual {v8, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v10

    check-cast v10, Landroid/app/PendingIntent;

    .line 438
    .local v10, "pendingIntent":Landroid/app/PendingIntent;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Launching buy intent for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p2

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ". Request code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v0, p4

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 439
    move/from16 v0, p4

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mRequestCode:I

    .line 440
    move-object/from16 v0, p5

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchaseListener:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;

    .line 441
    move-object/from16 v0, p3

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mPurchasingItemType:Ljava/lang/String;

    .line 443
    invoke-virtual {v10}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v2

    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    const/4 v1, 0x0

    .line 446
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v1, 0x0

    .line 447
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/4 v1, 0x0

    .line 448
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v7

    move-object v1, p1

    move/from16 v3, p4

    .line 442
    invoke-virtual/range {v1 .. v7}, Landroid/app/Activity;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V
    :try_end_12e
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_cc .. :try_end_12e} :catch_9a
    .catch Landroid/os/RemoteException; {:try_start_cc .. :try_end_12e} :catch_130

    goto/16 :goto_2f

    .line 457
    .end local v8    # "buyIntentBundle":Landroid/os/Bundle;
    .end local v10    # "pendingIntent":Landroid/app/PendingIntent;
    .end local v12    # "response":I
    :catch_130
    move-exception v9

    .line 458
    .local v9, "e":Landroid/os/RemoteException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "RemoteException while launching purchase flow for sku "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p2

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 459
    invoke-virtual {v9}, Landroid/os/RemoteException;->printStackTrace()V

    .line 460
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->flagEndAsync()V

    .line 462
    new-instance v13, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    const/16 v1, -0x3e9

    const-string v2, "Remote exception while starting purchase flow"

    invoke-direct {v13, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 463
    .restart local v13    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    if-eqz p5, :cond_2f

    const/4 v1, 0x0

    move-object/from16 v0, p5

    invoke-interface {v0, v13, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V

    goto/16 :goto_2f
.end method

.method logDebug(Ljava/lang/String;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 1054
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mDebugLog:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mDebugTag:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1055
    :cond_9
    return-void
.end method

.method logError(Ljava/lang/String;)V
    .registers 5
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 1058
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mDebugTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "In-app billing error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1059
    return-void
.end method

.method logWarn(Ljava/lang/String;)V
    .registers 5
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 1062
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mDebugTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "In-app billing warning: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1063
    return-void
.end method

.method public queryInventory(ZLjava/util/List;)Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    .registers 4
    .param p1, "querySkuDetails"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;
        }
    .end annotation

    .prologue
    .line 565
    .local p2, "moreSkus":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->queryInventory(ZLjava/util/List;Ljava/util/List;)Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    move-result-object v0

    return-object v0
.end method

.method public queryInventory(ZLjava/util/List;Ljava/util/List;)Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    .registers 10
    .param p1, "querySkuDetails"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;
        }
    .end annotation

    .prologue
    .line 584
    .local p2, "moreItemSkus":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p3, "moreSubsSkus":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->checkNotDisposed()V

    .line 585
    const-string v3, "queryInventory"

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->checkSetupDone(Ljava/lang/String;)V

    .line 587
    :try_start_8
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    invoke-direct {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;-><init>()V

    .line 588
    .local v1, "inv":Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    const-string v3, "inapp"

    invoke-virtual {p0, v1, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->queryPurchases(Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;Ljava/lang/String;)I

    move-result v2

    .line 589
    .local v2, "r":I
    if-eqz v2, :cond_28

    .line 590
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;

    const-string v4, "Error refreshing inventory (querying owned items)."

    invoke-direct {v3, v2, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;-><init>(ILjava/lang/String;)V

    throw v3
    :try_end_1d
    .catch Landroid/os/RemoteException; {:try_start_8 .. :try_end_1d} :catch_1d
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_1d} :catch_3a
    .catch Ljava/lang/IllegalStateException; {:try_start_8 .. :try_end_1d} :catch_59

    .line 616
    .end local v1    # "inv":Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    .end local v2    # "r":I
    :catch_1d
    move-exception v0

    .line 617
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;

    const/16 v4, -0x3e9

    const-string v5, "Remote exception while refreshing inventory."

    invoke-direct {v3, v4, v5, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;-><init>(ILjava/lang/String;Ljava/lang/Exception;)V

    throw v3

    .line 593
    .end local v0    # "e":Landroid/os/RemoteException;
    .restart local v1    # "inv":Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    .restart local v2    # "r":I
    :cond_28
    if-eqz p1, :cond_45

    .line 594
    :try_start_2a
    const-string v3, "inapp"

    invoke-virtual {p0, v3, v1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->querySkuDetails(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;Ljava/util/List;)I

    move-result v2

    .line 595
    if-eqz v2, :cond_45

    .line 596
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;

    const-string v4, "Error refreshing inventory (querying prices of items)."

    invoke-direct {v3, v2, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;-><init>(ILjava/lang/String;)V

    throw v3
    :try_end_3a
    .catch Landroid/os/RemoteException; {:try_start_2a .. :try_end_3a} :catch_1d
    .catch Lorg/json/JSONException; {:try_start_2a .. :try_end_3a} :catch_3a
    .catch Ljava/lang/IllegalStateException; {:try_start_2a .. :try_end_3a} :catch_59

    .line 618
    .end local v1    # "inv":Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    .end local v2    # "r":I
    :catch_3a
    move-exception v0

    .line 619
    .local v0, "e":Lorg/json/JSONException;
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;

    const/16 v4, -0x3ea

    const-string v5, "Error parsing JSON response while refreshing inventory."

    invoke-direct {v3, v4, v5, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;-><init>(ILjava/lang/String;Ljava/lang/Exception;)V

    throw v3

    .line 601
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v1    # "inv":Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    .restart local v2    # "r":I
    :cond_45
    :try_start_45
    iget-boolean v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mSubscriptionsSupported:Z

    if-eqz v3, :cond_76

    .line 602
    const-string v3, "subs"

    invoke-virtual {p0, v1, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->queryPurchases(Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;Ljava/lang/String;)I

    move-result v2

    .line 603
    if-eqz v2, :cond_64

    .line 604
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;

    const-string v4, "Error refreshing inventory (querying owned subscriptions)."

    invoke-direct {v3, v2, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;-><init>(ILjava/lang/String;)V

    throw v3
    :try_end_59
    .catch Landroid/os/RemoteException; {:try_start_45 .. :try_end_59} :catch_1d
    .catch Lorg/json/JSONException; {:try_start_45 .. :try_end_59} :catch_3a
    .catch Ljava/lang/IllegalStateException; {:try_start_45 .. :try_end_59} :catch_59

    .line 620
    .end local v1    # "inv":Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    .end local v2    # "r":I
    :catch_59
    move-exception v0

    .line 621
    .local v0, "e":Ljava/lang/IllegalStateException;
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;

    const/16 v4, -0x3f0

    const-string v5, "Unknown Error"

    invoke-direct {v3, v4, v5, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;-><init>(ILjava/lang/String;Ljava/lang/Exception;)V

    throw v3

    .line 607
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    .restart local v1    # "inv":Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    .restart local v2    # "r":I
    :cond_64
    if-eqz p1, :cond_76

    .line 608
    :try_start_66
    const-string v3, "subs"

    invoke-virtual {p0, v3, v1, p3}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->querySkuDetails(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;Ljava/util/List;)I

    move-result v2

    .line 609
    if-eqz v2, :cond_76

    .line 610
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;

    const-string v4, "Error refreshing inventory (querying prices of subscriptions)."

    invoke-direct {v3, v2, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;-><init>(ILjava/lang/String;)V

    throw v3
    :try_end_76
    .catch Landroid/os/RemoteException; {:try_start_66 .. :try_end_76} :catch_1d
    .catch Lorg/json/JSONException; {:try_start_66 .. :try_end_76} :catch_3a
    .catch Ljava/lang/IllegalStateException; {:try_start_66 .. :try_end_76} :catch_59

    .line 615
    :cond_76
    return-object v1
.end method

.method queryPurchases(Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;Ljava/lang/String;)I
    .registers 19
    .param p1, "inv"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    .param p2, "itemType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 873
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->checkNotDisposed()V

    .line 874
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Querying owned items, item type: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 875
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Package name: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 876
    const/4 v12, 0x0

    .line 877
    .local v12, "verificationFailed":Z
    const/4 v1, 0x0

    .line 880
    .local v1, "continueToken":Ljava/lang/String;
    :cond_3f
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Calling getPurchases with continuation token: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 881
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mService:Lcom/android/vending/billing/IInAppBillingService;

    const/4 v14, 0x3

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mContext:Landroid/content/Context;

    .line 882
    invoke-virtual {v15}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v15

    .line 881
    move-object/from16 v0, p2

    invoke-interface {v13, v14, v15, v0, v1}, Lcom/android/vending/billing/IInAppBillingService;->getPurchases(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v3

    .line 885
    .local v3, "ownedItems":Landroid/os/Bundle;
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->getResponseCodeFromBundle(Landroid/os/Bundle;)I

    move-result v8

    .line 886
    .local v8, "response":I
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Owned items response: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 887
    if-eqz v8, :cond_ab

    .line 888
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "getPurchases() failed: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 934
    .end local v8    # "response":I
    :goto_aa
    return v8

    .line 891
    .restart local v8    # "response":I
    :cond_ab
    const-string v13, "INAPP_PURCHASE_ITEM_LIST"

    invoke-virtual {v3, v13}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_c3

    const-string v13, "INAPP_PURCHASE_DATA_LIST"

    invoke-virtual {v3, v13}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_c3

    const-string v13, "INAPP_DATA_SIGNATURE_LIST"

    .line 892
    invoke-virtual {v3, v13}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_cd

    .line 893
    :cond_c3
    const-string v13, "Bundle returned from getPurchases() doesn\'t contain required fields."

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 894
    const/16 v8, -0x3ea

    goto :goto_aa

    .line 897
    :cond_cd
    const-string v13, "INAPP_PURCHASE_ITEM_LIST"

    invoke-virtual {v3, v13}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    .line 900
    .local v4, "ownedSkus":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v13, "INAPP_PURCHASE_DATA_LIST"

    invoke-virtual {v3, v13}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    .line 903
    .local v7, "purchaseDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v13, "INAPP_DATA_SIGNATURE_LIST"

    invoke-virtual {v3, v13}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v10

    .line 907
    .local v10, "signatureList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_e0
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-ge v2, v13, :cond_18b

    .line 908
    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 909
    .local v6, "purchaseData":Ljava/lang/String;
    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 910
    .local v9, "signature":Ljava/lang/String;
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 911
    .local v11, "sku":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mSignatureBase64:Ljava/lang/String;

    invoke-static {v13, v6, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Security;->verifyPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_152

    .line 912
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Sku is owned: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 913
    new-instance v5, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;

    move-object/from16 v0, p2

    invoke-direct {v5, v0, v6, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 915
    .local v5, "purchase":Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;
    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;->getToken()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_14a

    .line 916
    const-string v13, "BUG: empty/null token!"

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logWarn(Ljava/lang/String;)V

    .line 917
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Purchase data: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 921
    :cond_14a
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->addPurchase(Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V

    .line 907
    .end local v5    # "purchase":Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;
    :goto_14f
    add-int/lit8 v2, v2, 0x1

    goto :goto_e0

    .line 923
    :cond_152
    const-string v13, "Purchase signature verification **FAILED**. Not adding item."

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logWarn(Ljava/lang/String;)V

    .line 924
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "   Purchase data: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 925
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "   Signature: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 926
    const/4 v12, 0x1

    goto :goto_14f

    .line 930
    .end local v6    # "purchaseData":Ljava/lang/String;
    .end local v9    # "signature":Ljava/lang/String;
    .end local v11    # "sku":Ljava/lang/String;
    :cond_18b
    const-string v13, "INAPP_CONTINUATION_TOKEN"

    invoke-virtual {v3, v13}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 931
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Continuation token: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 932
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_3f

    .line 934
    if-eqz v12, :cond_1b6

    const/16 v13, -0x3eb

    :goto_1b3
    move v8, v13

    goto/16 :goto_aa

    :cond_1b6
    const/4 v13, 0x0

    goto :goto_1b3
.end method

.method querySkuDetails(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;Ljava/util/List;)I
    .registers 27
    .param p1, "itemType"    # Ljava/lang/String;
    .param p2, "inv"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 938
    .local p3, "moreSkus":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v19, "Querying SKU details."

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 939
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 941
    .local v15, "skuList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz p3, :cond_2a

    .line 942
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :cond_14
    :goto_14
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_2a

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 943
    .local v13, "sku":Ljava/lang/String;
    invoke-virtual {v15, v13}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_14

    .line 944
    invoke-virtual {v15, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_14

    .line 949
    .end local v13    # "sku":Ljava/lang/String;
    :cond_2a
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v19

    if-nez v19, :cond_3b

    .line 950
    const-string v19, "queryPrices: nothing to do because there are no SKUs."

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 951
    const/4 v10, 0x0

    .line 1003
    :goto_3a
    return v10

    .line 955
    :cond_3b
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 957
    .local v8, "packs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v19

    div-int/lit8 v7, v19, 0x14

    .line 958
    .local v7, "n":I
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v19

    rem-int/lit8 v6, v19, 0x14

    .line 959
    .local v6, "mod":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_4d
    if-ge v5, v7, :cond_80

    .line 960
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 961
    .local v17, "tempList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    mul-int/lit8 v19, v5, 0x14

    mul-int/lit8 v20, v5, 0x14

    add-int/lit8 v20, v20, 0x14

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v15, v0, v1}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_66
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_78

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 962
    .local v12, "s":Ljava/lang/String;
    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_66

    .line 964
    .end local v12    # "s":Ljava/lang/String;
    :cond_78
    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 959
    add-int/lit8 v5, v5, 0x1

    goto :goto_4d

    .line 967
    .end local v17    # "tempList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_80
    if-eqz v6, :cond_b0

    .line 968
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 969
    .restart local v17    # "tempList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    mul-int/lit8 v19, v7, 0x14

    mul-int/lit8 v20, v7, 0x14

    add-int v20, v20, v6

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v15, v0, v1}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_99
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_ab

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 970
    .restart local v12    # "s":Ljava/lang/String;
    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_99

    .line 972
    .end local v12    # "s":Ljava/lang/String;
    :cond_ab
    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 975
    .end local v17    # "tempList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_b0
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :cond_b4
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_192

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/ArrayList;

    .line 976
    .local v16, "skuPartList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Processing chunk of "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " items"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 977
    new-instance v9, Landroid/os/Bundle;

    invoke-direct {v9}, Landroid/os/Bundle;-><init>()V

    .line 978
    .local v9, "querySkus":Landroid/os/Bundle;
    const-string v20, "ITEM_ID_LIST"

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    invoke-virtual {v9, v0, v1}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 979
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mService:Lcom/android/vending/billing/IInAppBillingService;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mContext:Landroid/content/Context;

    move-object/from16 v22, v0

    .line 980
    invoke-virtual/range {v22 .. v22}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v22

    .line 979
    move-object/from16 v0, v20

    move/from16 v1, v21

    move-object/from16 v2, v22

    move-object/from16 v3, p1

    invoke-interface {v0, v1, v2, v3, v9}, Lcom/android/vending/billing/IInAppBillingService;->getSkuDetails(ILjava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v14

    .line 983
    .local v14, "skuDetails":Landroid/os/Bundle;
    const-string v20, "DETAILS_LIST"

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v20

    if-nez v20, :cond_14f

    .line 984
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->getResponseCodeFromBundle(Landroid/os/Bundle;)I

    move-result v10

    .line 985
    .local v10, "response":I
    if-eqz v10, :cond_142

    .line 986
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "getSkuDetails() failed: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-static {v10}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    goto/16 :goto_3a

    .line 989
    :cond_142
    const-string v19, "getSkuDetails() returned a bundle with neither an error nor a detail list."

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 990
    const/16 v10, -0x3ea

    goto/16 :goto_3a

    .line 994
    .end local v10    # "response":I
    :cond_14f
    const-string v20, "DETAILS_LIST"

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v11

    .line 997
    .local v11, "responseList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :goto_15b
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_b4

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    .line 998
    .local v18, "thisResponse":Ljava/lang/String;
    new-instance v4, Lcom/adobe/creativesdk/aviary/internal/cds/util/SkuDetails;

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-direct {v4, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/SkuDetails;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 999
    .local v4, "d":Lcom/adobe/creativesdk/aviary/internal/cds/util/SkuDetails;
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "Got sku details: "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 1000
    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->addSkuDetails(Lcom/adobe/creativesdk/aviary/internal/cds/util/SkuDetails;)V

    goto :goto_15b

    .line 1003
    .end local v4    # "d":Lcom/adobe/creativesdk/aviary/internal/cds/util/SkuDetails;
    .end local v9    # "querySkus":Landroid/os/Bundle;
    .end local v11    # "responseList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v14    # "skuDetails":Landroid/os/Bundle;
    .end local v16    # "skuPartList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v18    # "thisResponse":Ljava/lang/String;
    :cond_192
    const/4 v10, 0x0

    goto/16 :goto_3a
.end method

.method public startSetup(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;)V
    .registers 9
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 220
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->checkNotDisposed()V

    .line 221
    iget-boolean v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mSetupDone:Z

    if-eqz v5, :cond_11

    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "IAB helper is already set up."

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 224
    :cond_11
    const-string v5, "Starting in-app billing setup."

    invoke-virtual {p0, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 225
    new-instance v5, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;

    invoke-direct {v5, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;)V

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mServiceConn:Landroid/content/ServiceConnection;

    .line 285
    new-instance v2, Landroid/content/Intent;

    const-string v5, "com.android.vending.billing.InAppBillingService.BIND"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 286
    .local v2, "serviceIntent":Landroid/content/Intent;
    const-string v5, "com.android.vending"

    invoke-virtual {v2, v5}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 289
    const/4 v1, 0x0

    .line 293
    .local v1, "listIsNotEmpty":Z
    :try_start_2a
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v2, v6}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z
    :try_end_38
    .catch Ljava/lang/NullPointerException; {:try_start_2a .. :try_end_38} :catch_48

    move-result v5

    if-nez v5, :cond_46

    move v1, v3

    .line 299
    :goto_3c
    if-eqz v1, :cond_4e

    .line 301
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mServiceConn:Landroid/content/ServiceConnection;

    invoke-virtual {v4, v2, v5, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 314
    :cond_45
    :goto_45
    return-void

    :cond_46
    move v1, v4

    .line 293
    goto :goto_3c

    .line 294
    :catch_48
    move-exception v0

    .line 295
    .local v0, "e":Ljava/lang/NullPointerException;
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    .line 296
    const/4 v1, 0x0

    goto :goto_3c

    .line 304
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :cond_4e
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->mServiceConn:Landroid/content/ServiceConnection;

    .line 305
    if-eqz p1, :cond_45

    .line 306
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    const/4 v4, 0x3

    const-string v5, "Billing service unavailable on device."

    invoke-direct {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    invoke-interface {p1, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;->onIabSetupFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;)V

    goto :goto_45
.end method
