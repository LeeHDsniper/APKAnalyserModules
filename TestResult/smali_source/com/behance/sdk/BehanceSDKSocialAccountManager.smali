.class public Lcom/behance/sdk/BehanceSDKSocialAccountManager;
.super Ljava/lang/Object;
.source "BehanceSDKSocialAccountManager.java"


# static fields
.field private static instance:Lcom/behance/sdk/BehanceSDKSocialAccountManager;


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->context:Landroid/content/Context;

    .line 61
    return-void
.end method

.method private areAccountsSame(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z
    .registers 9
    .param p1, "firstAccount"    # Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    .param p2, "secondAccount"    # Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    .prologue
    const/4 v0, 0x0

    .line 85
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_d

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2d

    .line 86
    :cond_d
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_19

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2d

    .line 87
    :cond_19
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2e

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2e

    .line 123
    :cond_2d
    :goto_2d
    return v0

    .line 90
    :cond_2e
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientSecret()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3a

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientSecret()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2d

    .line 91
    :cond_3a
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientSecret()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_46

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientSecret()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2d

    .line 92
    :cond_46
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientSecret()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5a

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientSecret()Ljava/lang/String;

    move-result-object v1

    .line 93
    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientSecret()Ljava/lang/String;

    move-result-object v2

    .line 92
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 96
    :cond_5a
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountDisplayNameResourceId()I

    move-result v1

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountDisplayNameResourceId()I

    move-result v2

    if-ne v1, v2, :cond_2d

    .line 99
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAdditionalData()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_70

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAdditionalData()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2d

    .line 100
    :cond_70
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAdditionalData()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_7c

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAdditionalData()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2d

    .line 101
    :cond_7c
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAdditionalData()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_90

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAdditionalData()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAdditionalData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 104
    :cond_90
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserAuthToken()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_9c

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserAuthToken()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2d

    .line 105
    :cond_9c
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserAuthToken()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_a8

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserAuthToken()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2d

    .line 106
    :cond_a8
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserAuthToken()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_bc

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserAuthToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserAuthToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 109
    :cond_bc
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserAuthTokenExpiryTime()J

    move-result-wide v2

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserAuthTokenExpiryTime()J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-nez v1, :cond_2d

    .line 112
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_d4

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2d

    .line 113
    :cond_d4
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserId()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_e0

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserId()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2d

    .line 114
    :cond_e0
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_f4

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 117
    :cond_f4
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isSharingEnabledLastTime()Z

    move-result v1

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isSharingEnabledLastTime()Z

    move-result v2

    if-ne v1, v2, :cond_2d

    .line 120
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isUserAuthenticated()Z

    move-result v1

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isUserAuthenticated()Z

    move-result v2

    if-ne v1, v2, :cond_2d

    .line 123
    const/4 v0, 0x1

    goto/16 :goto_2d
.end method

.method private getExistingAccountSharedPreference(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Landroid/content/SharedPreferences;
    .registers 4
    .param p1, "accountType"    # Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    .prologue
    .line 153
    invoke-direct {p0, p1}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getSharedPreference(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 154
    .local v0, "sharedPreferences":Landroid/content/SharedPreferences;
    const-string v1, "SP_KEY_ACCOUNT_CLIENT_ID"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 157
    .end local v0    # "sharedPreferences":Landroid/content/SharedPreferences;
    :goto_c
    return-object v0

    .restart local v0    # "sharedPreferences":Landroid/content/SharedPreferences;
    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/behance/sdk/BehanceSDKSocialAccountManager;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 53
    sget-object v0, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->instance:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    if-nez v0, :cond_b

    .line 54
    new-instance v0, Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    invoke-direct {v0, p0}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->instance:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    .line 56
    :cond_b
    sget-object v0, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->instance:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    return-object v0
.end method

.method private getSharedPreference(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Landroid/content/SharedPreferences;
    .registers 6
    .param p1, "accountType"    # Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    .prologue
    .line 147
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "BEHANCE_SDK_SOCIAL_ACCOUNTS_SHARED_PREFERENES_KEY_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 148
    .local v0, "accountFileName":Ljava/lang/String;
    iget-object v2, p0, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->context:Landroid/content/Context;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 149
    .local v1, "sharedPreferences":Landroid/content/SharedPreferences;
    return-object v1
.end method

.method private readAccountFromStorage(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    .registers 9
    .param p1, "accountType"    # Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    .prologue
    const/4 v6, 0x0

    const/4 v2, 0x0

    .line 162
    invoke-direct {p0, p1}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getExistingAccountSharedPreference(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 163
    .local v1, "sharedPreference":Landroid/content/SharedPreferences;
    if-eqz v1, :cond_65

    .line 164
    new-instance v0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-direct {v0}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;-><init>()V

    .line 165
    .local v0, "account":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    const-string v3, "SP_KEY_ACCOUNT_CLIENT_ID"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setAccountClientId(Ljava/lang/String;)V

    .line 166
    const-string v3, "SP_KEY_ACCOUNT_CLIENT_SECRET"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setAccountClientSecret(Ljava/lang/String;)V

    .line 167
    const-string v3, "SP_KEY_ACCOUNT_DISPLAY_NAME_RES_ID"

    const/4 v4, -0x1

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setAccountDisplayNameResourceId(I)V

    .line 168
    invoke-virtual {v0, p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setAccountType(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)V

    .line 169
    const-string v3, "SP_KEY_USER_AUTH_TOKEN"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserAuthToken(Ljava/lang/String;)V

    .line 170
    const-string v3, "SP_KEY_USER_AUTH_TOKEN_EXPIRY_TIME"

    const-wide/16 v4, 0x0

    invoke-interface {v1, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserAuthTokenExpiryTime(J)V

    .line 171
    const-string v3, "SP_KEY_USER_ID"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserId(Ljava/lang/String;)V

    .line 172
    const-string v3, "SP_KEY_ADDITIONAL_DATA"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setAdditionalData(Ljava/lang/String;)V

    .line 173
    const-string v2, "SP_KEY_SHARE_ENABLED_LAST_TIME"

    invoke-interface {v1, v2, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setSharingEnabledLastTime(Z)V

    .line 174
    const-string v2, "SP_KEY_USER_AUTHENTICATED"

    invoke-interface {v1, v2, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserAuthenticated(Z)V

    .line 177
    .end local v0    # "account":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    :goto_64
    return-object v0

    :cond_65
    move-object v0, v2

    goto :goto_64
.end method

.method private removeAccountFromStorage(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Z
    .registers 5
    .param p1, "accountType"    # Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    .prologue
    .line 197
    invoke-direct {p0, p1}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getSharedPreference(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 198
    .local v1, "sharedPreference":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 199
    .local v0, "edit":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 200
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v2

    return v2
.end method

.method private saveAccountToStorage(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z
    .registers 8
    .param p1, "account"    # Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    .prologue
    .line 182
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountType()Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getSharedPreference(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 183
    .local v1, "sharedPreference":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 184
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "SP_KEY_ACCOUNT_CLIENT_ID"

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 185
    const-string v2, "SP_KEY_ACCOUNT_CLIENT_SECRET"

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientSecret()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 186
    const-string v2, "SP_KEY_ACCOUNT_DISPLAY_NAME_RES_ID"

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountDisplayNameResourceId()I

    move-result v3

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 187
    const-string v2, "SP_KEY_USER_AUTH_TOKEN"

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserAuthToken()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 188
    const-string v2, "SP_KEY_USER_AUTH_TOKEN_EXPIRY_TIME"

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserAuthTokenExpiryTime()J

    move-result-wide v4

    invoke-interface {v0, v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 189
    const-string v2, "SP_KEY_USER_ID"

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 190
    const-string v2, "SP_KEY_ADDITIONAL_DATA"

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAdditionalData()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 191
    const-string v2, "SP_KEY_SHARE_ENABLED_LAST_TIME"

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isSharingEnabledLastTime()Z

    move-result v3

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 192
    const-string v2, "SP_KEY_USER_AUTHENTICATED"

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isUserAuthenticated()Z

    move-result v3

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 193
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v2

    return v2
.end method


# virtual methods
.method public addAccount(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z
    .registers 4
    .param p1, "account"    # Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    .prologue
    .line 64
    if-eqz p1, :cond_1e

    .line 65
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountType()Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-result-object v0

    .line 66
    .local v0, "existingAccount":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    if-eqz v0, :cond_19

    .line 67
    invoke-direct {p0, v0, p1}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->areAccountsSame(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z

    move-result v1

    if-nez v1, :cond_17

    .line 68
    invoke-direct {p0, p1}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->saveAccountToStorage(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z

    move-result v1

    .line 76
    .end local v0    # "existingAccount":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    :goto_16
    return v1

    .line 70
    .restart local v0    # "existingAccount":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    :cond_17
    const/4 v1, 0x1

    goto :goto_16

    .line 73
    :cond_19
    invoke-direct {p0, p1}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->saveAccountToStorage(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z

    move-result v1

    goto :goto_16

    .line 76
    .end local v0    # "existingAccount":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    :cond_1e
    const/4 v1, 0x0

    goto :goto_16
.end method

.method public getAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    .registers 3
    .param p1, "accountType"    # Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    .prologue
    .line 127
    invoke-direct {p0, p1}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->readAccountFromStorage(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-result-object v0

    return-object v0
.end method

.method public removeAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Z
    .registers 6
    .param p1, "accountType"    # Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    .prologue
    .line 131
    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->FACEBOOK:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    if-ne p1, v2, :cond_26

    .line 132
    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->FACEBOOK:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {p0, v2}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-result-object v0

    .line 133
    .local v0, "facebookAccount":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    if-eqz v0, :cond_26

    .line 134
    new-instance v2, Lcom/facebook/Session$Builder;

    iget-object v3, p0, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/facebook/Session$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/facebook/Session$Builder;->setApplicationId(Ljava/lang/String;)Lcom/facebook/Session$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/facebook/Session$Builder;->build()Lcom/facebook/Session;

    move-result-object v1

    .line 135
    .local v1, "session":Lcom/facebook/Session;
    invoke-virtual {v1}, Lcom/facebook/Session;->closeAndClearTokenInformation()V

    .line 136
    const/4 v2, 0x0

    invoke-static {v2}, Lcom/facebook/Session;->setActiveSession(Lcom/facebook/Session;)V

    .line 139
    .end local v0    # "facebookAccount":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    .end local v1    # "session":Lcom/facebook/Session;
    :cond_26
    invoke-direct {p0, p1}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->removeAccountFromStorage(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Z

    move-result v2

    return v2
.end method

.method public revokeAccountAccess(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Z
    .registers 3
    .param p1, "accountType"    # Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    .prologue
    .line 143
    invoke-virtual {p0, p1}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->removeAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Z

    move-result v0

    return v0
.end method

.method public updateAccount(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z
    .registers 3
    .param p1, "account"    # Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    .prologue
    .line 80
    invoke-virtual {p0, p1}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->addAccount(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z

    move-result v0

    return v0
.end method
