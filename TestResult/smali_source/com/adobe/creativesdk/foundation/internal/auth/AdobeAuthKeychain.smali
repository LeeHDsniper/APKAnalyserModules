.class public Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;
.super Ljava/lang/Object;
.source "AdobeAuthKeychain.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static sharedKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;


# instance fields
.field protected context:Landroid/content/Context;

.field private groupID:Ljava/lang/String;

.field private ims:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

.field protected sharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 32
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;)V
    .registers 8
    .param p1, "ims"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    .prologue
    const/16 v5, 0xa

    const/4 v4, 0x0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const-string v2, ""

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->setGroupID(Ljava/lang/String;)V

    .line 38
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->context:Landroid/content/Context;

    .line 39
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->ims:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    .line 40
    sget-boolean v2, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->$assertionsDisabled:Z

    if-nez v2, :cond_25

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->context:Landroid/content/Context;

    if-nez v2, :cond_25

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 41
    :cond_25
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->context:Landroid/content/Context;

    const-string v3, "Foundation"

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->sharedPreferences:Landroid/content/SharedPreferences;

    .line 42
    sget-boolean v2, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->$assertionsDisabled:Z

    if-nez v2, :cond_3d

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->sharedPreferences:Landroid/content/SharedPreferences;

    if-nez v2, :cond_3d

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 43
    :cond_3d
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->sharedPreferences:Landroid/content/SharedPreferences;

    const-string v3, "KeychainVersion"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 45
    .local v1, "keychainVersion":Ljava/lang/Integer;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ge v2, v5, :cond_6c

    .line 47
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 48
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "EnvironmentIndicator"

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 49
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->resetTokens()V

    .line 50
    const-string v2, "KeychainVersion"

    invoke-interface {v0, v2, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 51
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 53
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->deleteFoundationAuthAESKey()V

    .line 56
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_6c
    return-void
.end method

.method private convertStringtoDate(Ljava/lang/String;)Ljava/util/Date;
    .registers 8
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 177
    if-nez p1, :cond_4

    .line 187
    :goto_3
    return-object v3

    .line 180
    :cond_4
    :try_start_4
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    .line 181
    .local v2, "milliseconds":Ljava/lang/Long;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 182
    .local v0, "cal":Ljava/util/Calendar;
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 183
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_1a} :catch_1c

    move-result-object v3

    goto :goto_3

    .line 185
    .end local v0    # "cal":Ljava/util/Calendar;
    .end local v2    # "milliseconds":Ljava/lang/Long;
    :catch_1c
    move-exception v1

    .line 187
    .local v1, "exp":Ljava/lang/Exception;
    goto :goto_3
.end method

.method public static getSharedKeychain()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;
    .registers 1

    .prologue
    .line 99
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->sharedKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    return-object v0
.end method

.method private hasEnvironmentChanged()Z
    .registers 6

    .prologue
    const/4 v4, -0x1

    .line 237
    const/4 v1, 0x1

    .line 238
    .local v1, "environmentHasChanged":Z
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->sharedPreferences:Landroid/content/SharedPreferences;

    const-string v3, "EnvironmentIndicator"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 240
    .local v0, "environment":I
    if-eq v0, v4, :cond_31

    .line 241
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->ims:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getEnvironment()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->ordinal()I

    move-result v2

    if-eq v0, v2, :cond_2f

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->AdobeAuthIdentityManagementServiceUndefined:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->ims:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    .line 242
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getEnvironment()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    move-result-object v3

    if-eq v2, v3, :cond_2f

    .line 243
    const-string v2, "EnvironmentIndicator"

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->ims:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getEnvironment()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->internalUpdateOrAdd(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;)V

    .line 244
    const/4 v1, 0x1

    .line 252
    :goto_2e
    return v1

    .line 246
    :cond_2f
    const/4 v1, 0x0

    goto :goto_2e

    .line 249
    :cond_31
    const-string v2, "EnvironmentIndicator"

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->ims:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getEnvironment()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->internalUpdateOrAdd(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;)V

    .line 250
    const/4 v1, 0x1

    goto :goto_2e
.end method

.method private internalFindKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "identifier"    # Ljava/lang/String;

    .prologue
    .line 116
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->sharedPreferences:Landroid/content/SharedPreferences;

    const/4 v2, 0x0

    invoke-interface {v1, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 117
    .local v0, "data":Ljava/lang/String;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->ims:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getCipher()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 118
    return-object v0
.end method

.method private internalUpdateOrAdd(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;)V
    .registers 5
    .param p1, "identifier"    # Ljava/lang/String;
    .param p2, "env"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    .prologue
    .line 128
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 129
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->ordinal()I

    move-result v1

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 130
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 131
    return-void
.end method

.method private internalUpdateOrAdd(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 9
    .param p1, "identifier"    # Ljava/lang/String;
    .param p2, "obj"    # Ljava/lang/Object;

    .prologue
    .line 134
    const/4 v4, 0x0

    .line 135
    .local v4, "value":Ljava/lang/String;
    instance-of v5, p2, Ljava/util/Date;

    if-eqz v5, :cond_27

    move-object v0, p2

    .line 136
    check-cast v0, Ljava/util/Date;

    .line 137
    .local v0, "date":Ljava/util/Date;
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    .line 138
    .local v2, "timeSinceEpoch":J
    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    .line 144
    .end local v0    # "date":Ljava/util/Date;
    .end local v2    # "timeSinceEpoch":J
    :goto_10
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->ims:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getCipher()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 146
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 147
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v1, p1, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 148
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 149
    return-void

    .line 141
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_27
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_10
.end method

.method public static setSharedKeychain(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;)V
    .registers 1
    .param p0, "sharedKeychain"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    .prologue
    .line 103
    sput-object p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->sharedKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    .line 104
    return-void
.end method


# virtual methods
.method public deleteKey(Ljava/lang/String;)V
    .registers 4
    .param p1, "identifier"    # Ljava/lang/String;

    .prologue
    .line 59
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 60
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 61
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 62
    return-void
.end method

.method public findKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "identifier"    # Ljava/lang/String;

    .prologue
    .line 107
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->hasEnvironmentChanged()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 108
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->resetTokens()V

    .line 109
    const/4 v0, 0x0

    .line 111
    :goto_a
    return-object v0

    :cond_b
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->internalFindKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method public getAccessToken()Ljava/lang/String;
    .registers 2

    .prologue
    .line 156
    const-string v0, "AccessToken"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAccessTokenExpiration()Ljava/util/Date;
    .registers 2

    .prologue
    .line 173
    const-string v0, "AccessTokenExpiration"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->convertStringtoDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getAdobeID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 152
    const-string v0, "AdobeID"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceToken()Ljava/lang/String;
    .registers 2

    .prologue
    .line 160
    const-string v0, "DeviceToken"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceTokenExpiration()Ljava/util/Date;
    .registers 2

    .prologue
    .line 192
    const-string v0, "DeviceTokenExpiration"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->convertStringtoDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 200
    const-string v0, "DisplayName"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEmailAddress()Ljava/lang/String;
    .registers 2

    .prologue
    .line 212
    const-string v0, "Email"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEnterpriseInfo()Ljava/lang/String;
    .registers 2

    .prologue
    .line 220
    const-string v0, "EnterpriseInfo"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFirstName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 204
    const-string v0, "FirstName"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLastName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 208
    const-string v0, "LastName"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRefreshToken()Ljava/lang/String;
    .registers 2

    .prologue
    .line 164
    const-string v0, "RefreshToken"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRefreshTokenExpiration()Ljava/util/Date;
    .registers 2

    .prologue
    .line 196
    const-string v0, "RefreshTokenExpiration"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->convertStringtoDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public resetTokens()V
    .registers 2

    .prologue
    .line 66
    const-string v0, "AdobeID"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->deleteKey(Ljava/lang/String;)V

    .line 67
    const-string v0, "AccessToken"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->deleteKey(Ljava/lang/String;)V

    .line 68
    const-string v0, "AccessTokenExpiration"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->deleteKey(Ljava/lang/String;)V

    .line 69
    const-string v0, "ContinuationToken"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->deleteKey(Ljava/lang/String;)V

    .line 70
    const-string v0, "DeviceToken"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->deleteKey(Ljava/lang/String;)V

    .line 71
    const-string v0, "DeviceTokenExpiration"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->deleteKey(Ljava/lang/String;)V

    .line 72
    const-string v0, "DisplayName"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->deleteKey(Ljava/lang/String;)V

    .line 73
    const-string v0, "Email"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->deleteKey(Ljava/lang/String;)V

    .line 74
    const-string v0, "EmailVerified"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->deleteKey(Ljava/lang/String;)V

    .line 75
    const-string v0, "Entitlements"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->deleteKey(Ljava/lang/String;)V

    .line 76
    const-string v0, "FirstName"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->deleteKey(Ljava/lang/String;)V

    .line 77
    const-string v0, "LastName"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->deleteKey(Ljava/lang/String;)V

    .line 78
    const-string v0, "RefreshToken"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->deleteKey(Ljava/lang/String;)V

    .line 79
    const-string v0, "RefreshTokenExpiration"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->deleteKey(Ljava/lang/String;)V

    .line 80
    const-string v0, "EnterpriseInfo"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->deleteKey(Ljava/lang/String;)V

    .line 81
    return-void
.end method

.method public setGroupID(Ljava/lang/String;)V
    .registers 2
    .param p1, "groupID"    # Ljava/lang/String;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->groupID:Ljava/lang/String;

    .line 95
    return-void
.end method

.method public updateOrAddKey(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 3
    .param p1, "identifier"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 123
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->hasEnvironmentChanged()Z

    .line 124
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->internalUpdateOrAdd(Ljava/lang/String;Ljava/lang/Object;)V

    .line 125
    return-void
.end method
