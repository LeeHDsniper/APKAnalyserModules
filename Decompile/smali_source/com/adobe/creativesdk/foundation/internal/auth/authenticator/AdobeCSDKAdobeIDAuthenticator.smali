.class public Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;
.super Landroid/accounts/AbstractAccountAuthenticator;
.source "AdobeCSDKAdobeIDAuthenticator.java"


# instance fields
.field private _shouldAllowAccountRemovalInNextCall:Z

.field private final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Landroid/accounts/AbstractAccountAuthenticator;-><init>(Landroid/content/Context;)V

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->_shouldAllowAccountRemovalInNextCall:Z

    .line 49
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->mContext:Landroid/content/Context;

    .line 50
    return-void
.end method

.method public static LogText(Ljava/lang/String;)V
    .registers 1
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 55
    return-void
.end method

.method private checkCallerPermission(Landroid/os/Bundle;)Z
    .registers 6
    .param p1, "options"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, -0x1

    .line 105
    const/4 v1, 0x0

    .line 106
    .local v1, "permissionGranted":Z
    if-eqz p1, :cond_10

    .line 107
    const-string v2, "callerUid"

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 108
    .local v0, "callerUid":I
    if-eq v0, v3, :cond_10

    .line 109
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->doesCallerUidSignatureMatchWithThisAuthenticator(I)Z

    move-result v1

    .line 112
    .end local v0    # "callerUid":I
    :cond_10
    return v1
.end method

.method private doesCallerUidSignatureMatchWithThisAuthenticator(I)Z
    .registers 6
    .param p1, "callerUid"    # I

    .prologue
    .line 95
    const/4 v0, 0x0

    .line 96
    .local v0, "matched":Z
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 97
    .local v1, "packageManager":Landroid/content/pm/PackageManager;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget v2, v3, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 98
    .local v2, "thisAuthenticatorUid":I
    invoke-virtual {v1, v2, p1}, Landroid/content/pm/PackageManager;->checkSignatures(II)I

    move-result v3

    if-nez v3, :cond_16

    .line 99
    const/4 v0, 0x1

    .line 101
    :cond_16
    return v0
.end method

.method private getAuthTokenFromPreference(Landroid/accounts/Account;)Ljava/lang/String;
    .registers 7
    .param p1, "account"    # Landroid/accounts/Account;

    .prologue
    .line 206
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->mContext:Landroid/content/Context;

    invoke-static {v3}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    .line 207
    .local v0, "am":Landroid/accounts/AccountManager;
    invoke-virtual {v0, p1}, Landroid/accounts/AccountManager;->getPassword(Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v2

    .line 209
    .local v2, "encryptedPassword":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "in getAuth : going to decrypt encrypted passwd is  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 210
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->decryptData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 211
    .local v1, "authToken":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "in addAccount : decrypted token is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 213
    return-object v1
.end method

.method private initializeDeviceTokenSharedAESKey()V
    .registers 3

    .prologue
    .line 116
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->initializeDeviceTokenAES(Landroid/content/Context;)V

    .line 117
    return-void
.end method

.method private removeAdobeIDAccount(Landroid/accounts/Account;)V
    .registers 5
    .param p1, "adobeIdAccount"    # Landroid/accounts/Account;

    .prologue
    .line 193
    const-string v0, "in getAuthToken : Remove AdobeId account request - removing the account"

    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 194
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->_shouldAllowAccountRemovalInNextCall:Z

    .line 196
    :try_start_8
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->removeAuthTokenInPreference(Landroid/accounts/Account;)V

    .line 197
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/accounts/AccountManager;->removeAccount(Landroid/accounts/Account;Landroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_16} :catch_17

    .line 202
    :goto_16
    return-void

    .line 199
    :catch_17
    move-exception v0

    goto :goto_16
.end method

.method private removeAuthTokenInPreference(Landroid/accounts/Account;)V
    .registers 5
    .param p1, "account"    # Landroid/accounts/Account;

    .prologue
    const/4 v2, 0x0

    .line 229
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    .line 230
    .local v0, "am":Landroid/accounts/AccountManager;
    iget-object v1, p1, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/accounts/AccountManager;->invalidateAuthToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    invoke-virtual {v0, p1, v2}, Landroid/accounts/AccountManager;->setPassword(Landroid/accounts/Account;Ljava/lang/String;)V

    .line 240
    return-void
.end method

.method private storeAuthTokenInPreference(Landroid/accounts/Account;Ljava/lang/String;)V
    .registers 7
    .param p1, "account"    # Landroid/accounts/Account;
    .param p2, "authToken"    # Ljava/lang/String;

    .prologue
    .line 243
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->mContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    .line 244
    .local v0, "accountManager":Landroid/accounts/AccountManager;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "in addAccount : encrypting the token  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 245
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->encryptData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 246
    .local v1, "encryptedPassword":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "in addAccount : encrypted token  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 248
    invoke-virtual {v0, p1, v1}, Landroid/accounts/AccountManager;->setPassword(Landroid/accounts/Account;Ljava/lang/String;)V

    .line 260
    return-void
.end method


# virtual methods
.method public addAccount(Landroid/accounts/AccountAuthenticatorResponse;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .registers 19
    .param p1, "response"    # Landroid/accounts/AccountAuthenticatorResponse;
    .param p2, "accountType"    # Ljava/lang/String;
    .param p3, "authTokenType"    # Ljava/lang/String;
    .param p4, "requiredFeatures"    # [Ljava/lang/String;
    .param p5, "options"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/accounts/NetworkErrorException;
        }
    .end annotation

    .prologue
    .line 123
    const-string v11, "in addAccount : Trying adding account "

    invoke-static {v11}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 126
    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 128
    .local v6, "bundle":Landroid/os/Bundle;
    move-object/from16 v0, p5

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->checkCallerPermission(Landroid/os/Bundle;)Z

    move-result v8

    .line 129
    .local v8, "permissionGranted":Z
    if-eqz v8, :cond_28

    if-eqz p5, :cond_28

    const-string v11, "adbAuth_adobeId"

    move-object/from16 v0, p5

    invoke-virtual {v0, v11}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_28

    const-string v11, "adbAuth_authtoken"

    .line 130
    move-object/from16 v0, p5

    invoke-virtual {v0, v11}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_34

    .line 132
    :cond_28
    const-string v11, "in addAccount : Permission Denied Or Bad Request - FAIL "

    invoke-static {v11}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 133
    const-string v11, "errorCode"

    const/4 v12, 0x4

    invoke-virtual {v6, v11, v12}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 189
    :goto_33
    return-object v6

    .line 137
    :cond_34
    const-string v11, "in addAccount : Initializing the shared AES Key "

    invoke-static {v11}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 138
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->initializeDeviceTokenSharedAESKey()V

    .line 139
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;

    move-result-object v11

    invoke-virtual {v11}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->isInitializationSuccess()Z

    move-result v11

    if-nez v11, :cond_6a

    .line 141
    const-string v11, "in addAccount :  shared AES Key - Not Initialized "

    invoke-static {v11}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 143
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;

    move-result-object v11

    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->mContext:Landroid/content/Context;

    invoke-virtual {v11, v12}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->createNewAESKeyForSharedDeviceToken(Landroid/content/Context;)V

    .line 144
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;

    move-result-object v11

    invoke-virtual {v11}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->isInitializationSuccess()Z

    move-result v11

    if-nez v11, :cond_6a

    .line 146
    const-string v11, "in addAccount :  shared AES Key Initialization FAILED - Not adding account"

    invoke-static {v11}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 148
    const-string v11, "errorCode"

    const/4 v12, 0x4

    invoke-virtual {v6, v11, v12}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_33

    .line 153
    :cond_6a
    const-string v11, "adbAuth_adobeId"

    move-object/from16 v0, p5

    invoke-virtual {v0, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 154
    .local v3, "accountName":Ljava/lang/String;
    const-string v11, "adbAuth_authtoken"

    move-object/from16 v0, p5

    invoke-virtual {v0, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 157
    .local v5, "authToken":Ljava/lang/String;
    new-instance v1, Landroid/accounts/Account;

    invoke-direct {v1, v3, p2}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .local v1, "account":Landroid/accounts/Account;
    const/4 v10, 0x1

    .line 160
    .local v10, "shouldAddNewAccount":Z
    iget-object v11, p0, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->mContext:Landroid/content/Context;

    invoke-static {v11}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v2

    .line 161
    .local v2, "accountManager":Landroid/accounts/AccountManager;
    const-string v11, "com.adobe.creativesdk.foundation.auth.adobeID"

    invoke-virtual {v2, v11}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v4

    .line 163
    .local v4, "adobeIdAccounts":[Landroid/accounts/Account;
    if-eqz v4, :cond_aa

    array-length v11, v4

    if-lez v11, :cond_aa

    .line 165
    const-string v11, "in addAccount : more than one account - remove the existing one"

    invoke-static {v11}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 166
    const/4 v11, 0x0

    aget-object v11, v4, v11

    iget-object v7, v11, Landroid/accounts/Account;->name:Ljava/lang/String;

    .line 167
    .local v7, "existingAccountName":Ljava/lang/String;
    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_f6

    .line 169
    const-string v11, "in addAccount : existing one same as the new one - so just udpate"

    invoke-static {v11}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 170
    const/4 v10, 0x0

    .line 171
    const/4 v11, 0x0

    aget-object v1, v4, v11

    .line 177
    .end local v7    # "existingAccountName":Ljava/lang/String;
    :cond_aa
    :goto_aa
    if-eqz v10, :cond_e2

    .line 178
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "in addAccount : everything Ok . adding account to Account Manager "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 179
    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual {v2, v1, v11, v12}, Landroid/accounts/AccountManager;->addAccountExplicitly(Landroid/accounts/Account;Ljava/lang/String;Landroid/os/Bundle;)Z

    move-result v9

    .line 180
    .local v9, "resultVal":Z
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "in addAccount : Adding Account Manager  returned "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {v9}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 183
    .end local v9    # "resultVal":Z
    :cond_e2
    invoke-direct {p0, v1, v5}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->storeAuthTokenInPreference(Landroid/accounts/Account;Ljava/lang/String;)V

    .line 185
    const-string v11, "authAccount"

    invoke-virtual {v6, v11, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    const-string v11, "accountType"

    invoke-virtual {v6, v11, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    const-string v11, "authtoken"

    invoke-virtual {v6, v11, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_33

    .line 173
    .restart local v7    # "existingAccountName":Ljava/lang/String;
    :cond_f6
    const/4 v11, 0x0

    aget-object v11, v4, v11

    invoke-direct {p0, v11}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->removeAdobeIDAccount(Landroid/accounts/Account;)V

    goto :goto_aa
.end method

.method public confirmCredentials(Landroid/accounts/AccountAuthenticatorResponse;Landroid/accounts/Account;Landroid/os/Bundle;)Landroid/os/Bundle;
    .registers 5
    .param p1, "response"    # Landroid/accounts/AccountAuthenticatorResponse;
    .param p2, "account"    # Landroid/accounts/Account;
    .param p3, "options"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/accounts/NetworkErrorException;
        }
    .end annotation

    .prologue
    .line 345
    const/4 v0, 0x0

    return-object v0
.end method

.method public editProperties(Landroid/accounts/AccountAuthenticatorResponse;Ljava/lang/String;)Landroid/os/Bundle;
    .registers 4
    .param p1, "response"    # Landroid/accounts/AccountAuthenticatorResponse;
    .param p2, "accountType"    # Ljava/lang/String;

    .prologue
    .line 349
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAuthToken(Landroid/accounts/AccountAuthenticatorResponse;Landroid/accounts/Account;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .registers 11
    .param p1, "response"    # Landroid/accounts/AccountAuthenticatorResponse;
    .param p2, "account"    # Landroid/accounts/Account;
    .param p3, "authTokenType"    # Ljava/lang/String;
    .param p4, "options"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/accounts/NetworkErrorException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x9

    .line 284
    const-string v4, "in getAuthToken : fetch token"

    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 286
    invoke-direct {p0, p4}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->checkCallerPermission(Landroid/os/Bundle;)Z

    move-result v1

    .line 288
    .local v1, "permissionGranted":Z
    if-eqz v1, :cond_15

    const-string v4, "AdobeID access"

    invoke-virtual {p3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_33

    .line 289
    :cond_15
    const-string v4, "in getAuthToken : FAILING due to permission check"

    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 290
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 291
    .local v2, "result":Landroid/os/Bundle;
    const-string v4, "errorCode"

    const/4 v5, 0x7

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 292
    const-string v5, "errorMessage"

    if-nez v1, :cond_30

    const-string v4, "caller UID Different"

    :goto_2b
    invoke-virtual {v2, v5, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    move-object v3, v2

    .line 340
    .end local v2    # "result":Landroid/os/Bundle;
    .local v3, "result":Ljava/lang/Object;
    :goto_2f
    return-object v3

    .line 292
    .end local v3    # "result":Ljava/lang/Object;
    .restart local v2    # "result":Landroid/os/Bundle;
    :cond_30
    const-string v4, "invalid authTokenType"

    goto :goto_2b

    .line 296
    .end local v2    # "result":Landroid/os/Bundle;
    :cond_33
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 314
    .restart local v2    # "result":Landroid/os/Bundle;
    const-string v4, "in getAuthToken : Try getting authtoken from preference"

    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 315
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->initializeDeviceTokenSharedAESKey()V

    .line 316
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->isInitializationSuccess()Z

    move-result v4

    if-nez v4, :cond_59

    .line 320
    const-string v4, "in getAuthToken : AES Mgr initialization failed - Remove Account"

    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 321
    invoke-direct {p0, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->removeAdobeIDAccount(Landroid/accounts/Account;)V

    .line 322
    const-string v4, "errorCode"

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    move-object v3, v2

    .line 323
    .restart local v3    # "result":Ljava/lang/Object;
    goto :goto_2f

    .line 327
    .end local v3    # "result":Ljava/lang/Object;
    :cond_59
    invoke-direct {p0, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->getAuthTokenFromPreference(Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v0

    .line 328
    .local v0, "authToken":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_97

    .line 329
    const-string v4, "in getAuthToken : seems to have a Valid Token"

    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 330
    const-string v4, "authAccount"

    iget-object v5, p2, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 331
    const-string v4, "accountType"

    iget-object v5, p2, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    const-string v4, "authtoken"

    invoke-virtual {v2, v4, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 333
    const-string v4, "adbAuth_device_token_aes_key"

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->getDeviceTokenSharedAESKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    const-string v4, "adbAuth_authenticator_uid"

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v5

    iget v5, v5, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    move-object v3, v2

    .line 335
    .restart local v3    # "result":Ljava/lang/Object;
    goto :goto_2f

    .line 338
    .end local v3    # "result":Ljava/lang/Object;
    :cond_97
    const-string v4, "in getAuthToken : auth Token not present in preference"

    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->LogText(Ljava/lang/String;)V

    .line 339
    const-string v4, "errorCode"

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    move-object v3, v2

    .line 340
    .restart local v3    # "result":Ljava/lang/Object;
    goto :goto_2f
.end method

.method public getAuthTokenLabel(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "authTokenType"    # Ljava/lang/String;

    .prologue
    .line 269
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/adobe/creativesdk/foundation/auth/R$string;->adobe_id_authenticator_accesslabel:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasFeatures(Landroid/accounts/AccountAuthenticatorResponse;Landroid/accounts/Account;[Ljava/lang/String;)Landroid/os/Bundle;
    .registers 7
    .param p1, "response"    # Landroid/accounts/AccountAuthenticatorResponse;
    .param p2, "account"    # Landroid/accounts/Account;
    .param p3, "features"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/accounts/NetworkErrorException;
        }
    .end annotation

    .prologue
    .line 275
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 276
    .local v0, "result":Landroid/os/Bundle;
    const-string v1, "booleanResult"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 277
    return-object v0
.end method

.method public updateCredentials(Landroid/accounts/AccountAuthenticatorResponse;Landroid/accounts/Account;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .registers 6
    .param p1, "response"    # Landroid/accounts/AccountAuthenticatorResponse;
    .param p2, "account"    # Landroid/accounts/Account;
    .param p3, "authTokenType"    # Ljava/lang/String;
    .param p4, "options"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/accounts/NetworkErrorException;
        }
    .end annotation

    .prologue
    .line 353
    const/4 v0, 0x0

    return-object v0
.end method
