.class Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;
.super Landroid/os/AsyncTask;
.source "AdobeCSDKAdobeIdAuthenticatorHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;->getSharedAdobeIdTokenFromAccountManager(Landroid/app/Activity;Landroid/os/Bundle;Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$ICSDKAdobeIdAuthTokenResultHandler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "FetchAuthTokenInBackground"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;

.field final synthetic val$authenticatorOptions:Landroid/os/Bundle;

.field final synthetic val$context:Landroid/app/Activity;

.field final synthetic val$resultHandler:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$ICSDKAdobeIdAuthTokenResultHandler;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;Landroid/app/Activity;Landroid/os/Bundle;Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$ICSDKAdobeIdAuthTokenResultHandler;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 238
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;->val$context:Landroid/app/Activity;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;->val$authenticatorOptions:Landroid/os/Bundle;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;->val$resultHandler:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$ICSDKAdobeIdAuthTokenResultHandler;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method private storeDeviceTokenSharedAESKey(Landroid/content/Context;Landroid/os/Bundle;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "result"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, -0x1

    .line 280
    const-string v2, "adbAuth_device_token_aes_key"

    const/4 v3, 0x0

    invoke-virtual {p2, v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 281
    .local v1, "sharedAESKey":Ljava/lang/String;
    if-nez v1, :cond_b

    .line 290
    :cond_a
    :goto_a
    return-void

    .line 284
    :cond_b
    const-string v2, "adbAuth_authenticator_uid"

    invoke-virtual {p2, v2, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 286
    .local v0, "authenticatorUid":I
    if-eq v0, v4, :cond_a

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->uid:I

    if-eq v0, v2, :cond_a

    .line 289
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;

    move-result-object v2

    invoke-virtual {v2, p1, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->setSharedDeviceTokenAESKey(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_a
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;
    .registers 4
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 295
    const/4 v1, 0x0

    .line 297
    .local v1, "resultData":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;
    :try_start_1
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;->getSharedAdobeIdAuthTokenFromAccountManager()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4} :catch_6

    move-result-object v1

    .line 302
    :goto_5
    return-object v1

    .line 299
    :catch_6
    move-exception v0

    .line 300
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 238
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;->doInBackground([Ljava/lang/Void;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;

    move-result-object v0

    return-object v0
.end method

.method getSharedAdobeIdAuthTokenFromAccountManager()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;
    .registers 20

    .prologue
    .line 243
    const/16 v18, 0x0

    .line 244
    .local v18, "tokenDetails":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;->val$context:Landroid/app/Activity;

    invoke-static {v3}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v2

    .line 246
    .local v2, "accountManager":Landroid/accounts/AccountManager;
    const-string v3, "com.adobe.creativesdk.foundation.auth.adobeID"

    invoke-virtual {v2, v3}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v9

    .line 248
    .local v9, "adobeIdAccounts":[Landroid/accounts/Account;
    const/4 v15, 0x0

    .line 249
    .local v15, "requestCancelled":Z
    if-eqz v9, :cond_5d

    array-length v3, v9

    if-lez v3, :cond_5d

    .line 251
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;->val$context:Landroid/app/Activity;

    invoke-virtual {v3, v5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;->checkAuthenticatorSignature(Landroid/content/Context;)Z

    move-result v11

    .line 253
    .local v11, "authenticatorValid":Z
    if-eqz v11, :cond_5d

    .line 254
    const-string v4, "AdobeID access"

    .line 255
    .local v4, "tokenType":Ljava/lang/String;
    const/4 v3, 0x0

    aget-object v3, v9, v3

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;->val$authenticatorOptions:Landroid/os/Bundle;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;->val$context:Landroid/app/Activity;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v2 .. v8}, Landroid/accounts/AccountManager;->getAuthToken(Landroid/accounts/Account;Ljava/lang/String;Landroid/os/Bundle;Landroid/app/Activity;Landroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;

    move-result-object v13

    .line 259
    .local v13, "futureResult":Landroid/accounts/AccountManagerFuture;, "Landroid/accounts/AccountManagerFuture<Landroid/os/Bundle;>;"
    const/16 v16, 0x0

    .line 260
    .local v16, "result":Landroid/os/Bundle;
    :try_start_39
    invoke-interface {v13}, Landroid/accounts/AccountManagerFuture;->getResult()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Landroid/os/Bundle;

    move-object/from16 v16, v0

    .line 261
    const-string v3, "authtoken"

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 262
    .local v10, "authTokenRaw":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;->getTokenDetailsFromData(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;
    invoke-static {v3, v10}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;->access$000(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;

    move-result-object v18

    .line 263
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;->val$context:Landroid/app/Activity;

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v3, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;->storeDeviceTokenSharedAESKey(Landroid/content/Context;Landroid/os/Bundle;)V
    :try_end_5d
    .catch Landroid/accounts/OperationCanceledException; {:try_start_39 .. :try_end_5d} :catch_6d
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_5d} :catch_77
    .catch Landroid/accounts/AuthenticatorException; {:try_start_39 .. :try_end_5d} :catch_75
    .catch Ljava/lang/Exception; {:try_start_39 .. :try_end_5d} :catch_70

    .line 272
    .end local v4    # "tokenType":Ljava/lang/String;
    .end local v10    # "authTokenRaw":Ljava/lang/String;
    .end local v11    # "authenticatorValid":Z
    .end local v13    # "futureResult":Landroid/accounts/AccountManagerFuture;, "Landroid/accounts/AccountManagerFuture<Landroid/os/Bundle;>;"
    .end local v16    # "result":Landroid/os/Bundle;
    :cond_5d
    :goto_5d
    new-instance v17, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;

    invoke-direct/range {v17 .. v17}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;-><init>()V

    .line 273
    .local v17, "resultData":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;
    move-object/from16 v0, v18

    move-object/from16 v1, v17

    iput-object v0, v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;->tokenDetails:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;

    .line 274
    move-object/from16 v0, v17

    iput-boolean v15, v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;->isRequestCancelled:Z

    .line 276
    return-object v17

    .line 265
    .end local v17    # "resultData":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;
    .restart local v4    # "tokenType":Ljava/lang/String;
    .restart local v11    # "authenticatorValid":Z
    .restart local v13    # "futureResult":Landroid/accounts/AccountManagerFuture;, "Landroid/accounts/AccountManagerFuture<Landroid/os/Bundle;>;"
    .restart local v16    # "result":Landroid/os/Bundle;
    :catch_6d
    move-exception v14

    .local v14, "oce":Landroid/accounts/OperationCanceledException;
    const/4 v15, 0x1

    .line 268
    goto :goto_5d

    .end local v14    # "oce":Landroid/accounts/OperationCanceledException;
    :catch_70
    move-exception v12

    .local v12, "e":Ljava/lang/Exception;
    invoke-virtual {v12}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5d

    .line 267
    .end local v12    # "e":Ljava/lang/Exception;
    :catch_75
    move-exception v3

    goto :goto_5d

    .line 266
    :catch_77
    move-exception v3

    goto :goto_5d
.end method

.method protected onPostExecute(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;)V
    .registers 3
    .param p1, "resultData"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;

    .prologue
    .line 307
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;->val$resultHandler:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$ICSDKAdobeIdAuthTokenResultHandler;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$ICSDKAdobeIdAuthTokenResultHandler;->handleAuthenticatorTokenResult(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;)V

    .line 308
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 238
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;->onPostExecute(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;)V

    return-void
.end method
