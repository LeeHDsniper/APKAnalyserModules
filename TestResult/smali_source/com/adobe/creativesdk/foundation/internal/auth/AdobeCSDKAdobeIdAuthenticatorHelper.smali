.class public Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;
.super Ljava/lang/Object;
.source "AdobeCSDKAdobeIdAuthenticatorHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$ICSDKAdobeIdAuthTokenResultHandler;,
        Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;,
        Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;
    }
.end annotation


# static fields
.field private static _sInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;->getTokenDetailsFromData(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;

    move-result-object v0

    return-object v0
.end method

.method private createCombinedData(Ljava/lang/String;Ljava/util/Date;)Ljava/lang/String;
    .registers 11
    .param p1, "deviceToken"    # Ljava/lang/String;
    .param p2, "deviceExpirationTime"    # Ljava/util/Date;

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 130
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 132
    .local v1, "output":Ljava/lang/StringBuilder;
    new-instance v0, Ljava/util/Formatter;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;Ljava/util/Locale;)V

    .line 133
    .local v0, "formatter":Ljava/util/Formatter;
    const-string v2, "%d %d %d %s"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v7

    const/4 v4, 0x3

    aput-object p1, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 134
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private decryptData(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p1, "encryptedData"    # Ljava/lang/String;

    .prologue
    .line 105
    return-object p1
.end method

.method private encryptData(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p1, "rawData"    # Ljava/lang/String;

    .prologue
    .line 113
    return-object p1
.end method

.method public static getInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;
    .registers 1

    .prologue
    .line 89
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;

    if-nez v0, :cond_b

    .line 90
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;

    .line 92
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;

    return-object v0
.end method

.method private getTokenDetailsFromData(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;
    .registers 11
    .param p1, "combinedRawEncyrptedData"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 180
    if-nez p1, :cond_4

    .line 200
    :cond_3
    :goto_3
    return-object v6

    .line 182
    :cond_4
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;->decryptData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 184
    .local v0, "combinedRawData":Ljava/lang/String;
    new-instance v5, Ljava/util/Scanner;

    invoke-direct {v5, v0}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    .line 186
    .local v5, "scanner":Ljava/util/Scanner;
    invoke-virtual {v5}, Ljava/util/Scanner;->nextInt()I

    move-result v7

    .line 187
    .local v7, "version":I
    const/4 v8, 0x1

    if-gt v7, v8, :cond_3

    .line 190
    invoke-virtual {v5}, Ljava/util/Scanner;->nextInt()I

    move-result v4

    .line 191
    .local v4, "numFields":I
    const/4 v8, 0x2

    if-lt v4, v8, :cond_3

    .line 194
    invoke-virtual {v5}, Ljava/util/Scanner;->nextLong()J

    move-result-wide v2

    .line 195
    .local v2, "deviceExpirationtime":J
    invoke-virtual {v5}, Ljava/util/Scanner;->next()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 196
    .local v1, "devicetoken":Ljava/lang/String;
    new-instance v6, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;

    invoke-direct {v6}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;-><init>()V

    .line 197
    .local v6, "tokenDetails":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;
    iput-object v1, v6, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;->deviceToken:Ljava/lang/String;

    .line 198
    new-instance v8, Ljava/util/Date;

    invoke-direct {v8, v2, v3}, Ljava/util/Date;-><init>(J)V

    iput-object v8, v6, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;->deviceExpirationTime:Ljava/util/Date;

    goto :goto_3
.end method

.method public static isAccountManagerHasSharedAdobeIdAccount(Landroid/content/Context;)Z
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 204
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    .line 205
    .local v0, "accountManager":Landroid/accounts/AccountManager;
    const/4 v2, 0x0

    .line 208
    .local v2, "hasAccounts":Z
    :try_start_5
    const-string v3, "com.adobe.creativesdk.foundation.auth.adobeID"

    invoke-virtual {v0, v3}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v1

    .line 209
    .local v1, "adobeIdAccounts":[Landroid/accounts/Account;
    if-eqz v1, :cond_12

    array-length v3, v1
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_e} :catch_14

    if-lez v3, :cond_12

    const/4 v2, 0x1

    .line 213
    .end local v1    # "adobeIdAccounts":[Landroid/accounts/Account;
    :goto_11
    return v2

    .line 209
    .restart local v1    # "adobeIdAccounts":[Landroid/accounts/Account;
    :cond_12
    const/4 v2, 0x0

    goto :goto_11

    .line 211
    .end local v1    # "adobeIdAccounts":[Landroid/accounts/Account;
    :catch_14
    move-exception v3

    goto :goto_11
.end method

.method public static isSharedDeviceTokenExpired(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;)Z
    .registers 7
    .param p0, "tokenDetails"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;

    .prologue
    .line 435
    const/4 v1, 0x1

    .line 436
    .local v1, "isAboutToExpire":Z
    if-eqz p0, :cond_1a

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;->deviceExpirationTime:Ljava/util/Date;

    if-eqz v2, :cond_1a

    .line 437
    const/16 v0, 0x2710

    .line 438
    .local v0, "expireGracePeriod":I
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;->deviceExpirationTime:Ljava/util/Date;

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v2, v4

    int-to-long v4, v0

    cmp-long v2, v2, v4

    if-gez v2, :cond_1b

    const/4 v1, 0x1

    .line 440
    .end local v0    # "expireGracePeriod":I
    :cond_1a
    :goto_1a
    return v1

    .line 438
    .restart local v0    # "expireGracePeriod":I
    :cond_1b
    const/4 v1, 0x0

    goto :goto_1a
.end method

.method public static removeCurrentSharedAdobeIDFromAccountManager(Landroid/content/Context;)V
    .registers 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 413
    :try_start_0
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    .line 414
    .local v0, "accountManager":Landroid/accounts/AccountManager;
    const-string v3, "com.adobe.creativesdk.foundation.auth.adobeID"

    invoke-virtual {v0, v3}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v1

    .line 415
    .local v1, "adobeIdAccounts":[Landroid/accounts/Account;
    if-eqz v1, :cond_17

    array-length v3, v1

    if-lez v3, :cond_17

    .line 423
    const/4 v3, 0x0

    aget-object v3, v1, v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v4, v5}, Landroid/accounts/AccountManager;->removeAccount(Landroid/accounts/Account;Landroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_17} :catch_18

    .line 430
    .end local v0    # "accountManager":Landroid/accounts/AccountManager;
    .end local v1    # "adobeIdAccounts":[Landroid/accounts/Account;
    :cond_17
    :goto_17
    return-void

    .line 426
    :catch_18
    move-exception v2

    .line 428
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_17
.end method


# virtual methods
.method public addNewAccountDirectlyToAccountManager(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;Z)V
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tokenDetails"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;
    .param p3, "isSignUpAccount"    # Z

    .prologue
    .line 35
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;->checkAuthenticatorSignature(Landroid/content/Context;)Z

    move-result v8

    .line 36
    .local v8, "authenticatorValid":Z
    if-nez v8, :cond_7

    .line 57
    :goto_6
    return-void

    .line 40
    :cond_7
    invoke-static {p1}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    .line 41
    .local v0, "accountManager":Landroid/accounts/AccountManager;
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 42
    .local v4, "options":Landroid/os/Bundle;
    const-string v1, "adbAuth_adobeId"

    iget-object v2, p2, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;->adobeId:Ljava/lang/String;

    invoke-virtual {v4, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    iget-object v1, p2, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;->deviceToken:Ljava/lang/String;

    iget-object v2, p2, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;->deviceExpirationTime:Ljava/util/Date;

    invoke-virtual {p0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;->createCombinedEncryptedDataOfToken(Ljava/lang/String;Ljava/util/Date;)Ljava/lang/String;

    move-result-object v9

    .line 44
    .local v9, "combinedAuthToken":Ljava/lang/String;
    const-string v1, "adbAuth_authtoken"

    invoke-virtual {v4, v1, v9}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    if-eqz p3, :cond_2c

    .line 47
    const-string v1, "adbAuth_addaccount_signup_force"

    const/4 v2, 0x1

    invoke-virtual {v4, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 51
    :cond_2c
    :try_start_2c
    const-string v1, "com.adobe.creativesdk.foundation.auth.adobeID"

    const-string v2, "AdobeID access"

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/accounts/AccountManager;->addAccount(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Landroid/os/Bundle;Landroid/app/Activity;Landroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_37} :catch_38

    goto :goto_6

    .line 54
    :catch_38
    move-exception v10

    .line 55
    .local v10, "e":Ljava/lang/Exception;
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_6
.end method

.method public checkAuthenticatorSignature(Landroid/content/Context;)Z
    .registers 13
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x0

    .line 219
    const/4 v4, 0x0

    .line 220
    .local v4, "authenticatorSameSignature":Z
    invoke-static {p1}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    .line 221
    .local v0, "accountManager":Landroid/accounts/AccountManager;
    invoke-virtual {v0}, Landroid/accounts/AccountManager;->getAuthenticatorTypes()[Landroid/accounts/AuthenticatorDescription;

    move-result-object v2

    .line 222
    .local v2, "authenticatorDescriptions":[Landroid/accounts/AuthenticatorDescription;
    array-length v8, v2

    move v7, v6

    :goto_c
    if-ge v7, v8, :cond_32

    aget-object v1, v2, v7

    .line 223
    .local v1, "authDesc":Landroid/accounts/AuthenticatorDescription;
    iget-object v9, v1, Landroid/accounts/AuthenticatorDescription;->type:Ljava/lang/String;

    const-string v10, "com.adobe.creativesdk.foundation.auth.adobeID"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2d

    .line 224
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    iget-object v5, v9, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 225
    .local v5, "thisAppPackageName":Ljava/lang/String;
    iget-object v3, v1, Landroid/accounts/AuthenticatorDescription;->packageName:Ljava/lang/String;

    .line 226
    .local v3, "authenticatorPackageName":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    invoke-virtual {v9, v5, v3}, Landroid/content/pm/PackageManager;->checkSignatures(Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_30

    const/4 v4, 0x1

    .line 222
    .end local v3    # "authenticatorPackageName":Ljava/lang/String;
    .end local v5    # "thisAppPackageName":Ljava/lang/String;
    :cond_2d
    :goto_2d
    add-int/lit8 v7, v7, 0x1

    goto :goto_c

    .restart local v3    # "authenticatorPackageName":Ljava/lang/String;
    .restart local v5    # "thisAppPackageName":Ljava/lang/String;
    :cond_30
    move v4, v6

    .line 226
    goto :goto_2d

    .line 230
    .end local v1    # "authDesc":Landroid/accounts/AuthenticatorDescription;
    .end local v3    # "authenticatorPackageName":Ljava/lang/String;
    .end local v5    # "thisAppPackageName":Ljava/lang/String;
    :cond_32
    return v4
.end method

.method public createCombinedEncryptedDataOfToken(Ljava/lang/String;Ljava/util/Date;)Ljava/lang/String;
    .registers 5
    .param p1, "deviceToken"    # Ljava/lang/String;
    .param p2, "deviceExpirationTime"    # Ljava/util/Date;

    .prologue
    .line 138
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;->createCombinedData(Ljava/lang/String;Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 139
    .local v0, "combinedData":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;->encryptData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 140
    .local v1, "encryptedData":Ljava/lang/String;
    return-object v1
.end method

.method public getSharedAdobeIdTokenFromAccountManager(Landroid/app/Activity;Landroid/os/Bundle;Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$ICSDKAdobeIdAuthTokenResultHandler;)V
    .registers 6
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "authenticatorOptions"    # Landroid/os/Bundle;
    .param p3, "resultHandler"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$ICSDKAdobeIdAuthTokenResultHandler;

    .prologue
    .line 310
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;Landroid/app/Activity;Landroid/os/Bundle;Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$ICSDKAdobeIdAuthTokenResultHandler;)V

    .line 311
    .local v0, "fetchAuthTokenInBackground":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$1FetchAuthTokenInBackground;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 312
    return-void
.end method
