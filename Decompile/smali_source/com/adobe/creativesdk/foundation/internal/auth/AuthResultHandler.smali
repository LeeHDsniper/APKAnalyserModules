.class abstract Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;
.super Ljava/lang/Object;
.source "AdobeAuthSignInActivity.java"


# instance fields
.field private _hasQueuedResult:Z

.field private _queuedResultData:Ljava/lang/Object;

.field protected mAuthActivity:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 164
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->_hasQueuedResult:Z

    .line 169
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->_hasQueuedResult:Z

    .line 170
    return-void
.end method


# virtual methods
.method protected createImsClientCommon()Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;
    .registers 2

    .prologue
    .line 219
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;)V

    .line 238
    .local v0, "imsClient":Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;
    return-object v0
.end method

.method public abstract handleAuthCodeReceived(Ljava/lang/String;)V
.end method

.method public abstract handleDeviceTokenReceived(Ljava/lang/String;)V
.end method

.method protected handleImsAccountResult(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "adobeId"    # Ljava/lang/String;
    .param p2, "accessToken"    # Ljava/lang/String;

    .prologue
    .line 243
    return-void
.end method

.method protected handleResultFromIMS(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V
    .registers 2
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    .prologue
    .line 214
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->sentResultViaActivity(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 215
    return-void
.end method

.method public hasAnyQueuedResult()Z
    .registers 2

    .prologue
    .line 186
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->_hasQueuedResult:Z

    return v0
.end method

.method protected abstract performProcessQueuedResult(Ljava/lang/Object;)V
.end method

.method public processQueuedResult()V
    .registers 2

    .prologue
    .line 191
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->mAuthActivity:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;

    if-nez v0, :cond_5

    .line 195
    :goto_4
    return-void

    .line 193
    :cond_5
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->_queuedResultData:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->performProcessQueuedResult(Ljava/lang/Object;)V

    .line 194
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->resetQueuedData()V

    goto :goto_4
.end method

.method protected resetQueuedData()V
    .registers 2

    .prologue
    .line 176
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->_hasQueuedResult:Z

    .line 177
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->_queuedResultData:Ljava/lang/Object;

    .line 178
    return-void
.end method

.method protected sentResultViaActivity(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    .prologue
    .line 199
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->mAuthActivity:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;

    if-nez v0, :cond_8

    .line 200
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->sendResultBack(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 205
    :goto_7
    return-void

    .line 203
    :cond_8
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->mAuthActivity:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->handleResult(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    goto :goto_7
.end method

.method public setAuthSingInActivity(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;)V
    .registers 2
    .param p1, "activity"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;

    .prologue
    .line 172
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->mAuthActivity:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;

    .line 173
    return-void
.end method

.method protected setQueuedResultData(Ljava/lang/Object;)V
    .registers 3
    .param p1, "queuedResultData"    # Ljava/lang/Object;

    .prologue
    .line 181
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->_hasQueuedResult:Z

    .line 182
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->_queuedResultData:Ljava/lang/Object;

    .line 183
    return-void
.end method
