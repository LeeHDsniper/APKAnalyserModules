.class public Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;
.super Ljava/lang/Object;
.source "AdobeCSDKAuthAESKeyMgr.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;
    }
.end annotation


# static fields
.field private static _sInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;


# instance fields
.field private final FOUNDATION_AUTH_AES_KEY_PREFERENCE:Ljava/lang/String;

.field private final FOUNDATION_AUTH_AES_SECRET_KEY:Ljava/lang/String;

.field private final SHARED_DEVICETOKEN_AUTH_AES_SECRET_KEY:Ljava/lang/String;

.field private _aeskey_Encryptor:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;

.field private _foundationAuth_AES_key:[B


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    const-string v0, "adb_foundation_auth_aes_preference"

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->FOUNDATION_AUTH_AES_KEY_PREFERENCE:Ljava/lang/String;

    .line 59
    const-string v0, "adb_foundation_auth_aes_secret_key"

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->FOUNDATION_AUTH_AES_SECRET_KEY:Ljava/lang/String;

    .line 60
    const-string v0, "adb_shareddevicetoken_auth_aes_secret_key"

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->SHARED_DEVICETOKEN_AUTH_AES_SECRET_KEY:Ljava/lang/String;

    .line 74
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->_aeskey_Encryptor:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;

    .line 75
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->getAuthFoundation_Encrypted_AES_Key_fromPreference()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static generateNewAESKey_Common()[B
    .registers 5

    .prologue
    .line 153
    :try_start_0
    const-string v3, "AES"

    invoke-static {v3}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    move-result-object v1

    .line 154
    .local v1, "keyGen":Ljavax/crypto/KeyGenerator;
    const/16 v3, 0x80

    invoke-virtual {v1, v3}, Ljavax/crypto/KeyGenerator;->init(I)V

    .line 155
    invoke-virtual {v1}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;

    move-result-object v2

    .line 156
    .local v2, "secretKey":Ljavax/crypto/SecretKey;
    invoke-interface {v2}, Ljavax/crypto/SecretKey;->getEncoded()[B
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_12} :catch_14

    move-result-object v3

    return-object v3

    .line 158
    .end local v2    # "secretKey":Ljavax/crypto/SecretKey;
    :catch_14
    move-exception v0

    .line 159
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Auth Foundation : Auth AESKeyMgr : Failed to generate an AES key"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private getAESKeyFromPreference_Common(Ljava/lang/String;)[B
    .registers 6
    .param p1, "prefrenceKeyName"    # Ljava/lang/String;

    .prologue
    .line 174
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->getStringFromAuthAESFoundationPreference(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 176
    .local v1, "aes_key_str":Ljava/lang/String;
    if-nez v1, :cond_8

    .line 177
    const/4 v2, 0x0

    .line 182
    :goto_7
    return-object v2

    .line 179
    :cond_8
    const/4 v3, 0x2

    invoke-static {v1, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    .line 180
    .local v0, "aes_key_bytes":[B
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->_aeskey_Encryptor:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;

    invoke-virtual {v3, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->deCryptData([B)[B

    move-result-object v2

    .line 182
    .local v2, "decrypted_aes_key":[B
    goto :goto_7
.end method

.method private getAuthFoundation_Encrypted_AES_Key_fromPreference()Ljava/lang/String;
    .registers 2

    .prologue
    .line 170
    const-string v0, "adb_foundation_auth_aes_secret_key"

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->getStringFromAuthAESFoundationPreference(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getFoundation_AESKey_fromPreference()[B
    .registers 2

    .prologue
    .line 186
    const-string v0, "adb_foundation_auth_aes_secret_key"

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->getAESKeyFromPreference_Common(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method static getInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;
    .registers 1

    .prologue
    .line 66
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;

    if-nez v0, :cond_b

    .line 67
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;

    .line 69
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;

    return-object v0
.end method

.method private getStringFromAuthAESFoundationPreference(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "keyName"    # Ljava/lang/String;

    .prologue
    .line 164
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 165
    .local v0, "appContext":Landroid/content/Context;
    const-string v2, "adb_foundation_auth_aes_preference"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 166
    .local v1, "sharedPreferences":Landroid/content/SharedPreferences;
    const/4 v2, 0x0

    invoke-interface {v1, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private storeAESKeyInPreference_Common([BLjava/lang/String;)V
    .registers 10
    .param p1, "aesKeySecret"    # [B
    .param p2, "preferenceKey"    # Ljava/lang/String;

    .prologue
    .line 136
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->_aeskey_Encryptor:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;

    invoke-virtual {v5, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->encyrptData([B)[B

    move-result-object v3

    .line 137
    .local v3, "encrypted_aes_key_byte_data":[B
    const/4 v5, 0x2

    invoke-static {v3, v5}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    .line 139
    .local v2, "encodedKeyString":Ljava/lang/String;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 140
    .local v0, "appContext":Landroid/content/Context;
    const-string v5, "adb_foundation_auth_aes_preference"

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 141
    .local v4, "sharedPreferences":Landroid/content/SharedPreferences;
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 142
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v1, p2, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 143
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 144
    return-void
.end method

.method private storeFoundatationAuth_AESKey_InPreference([B)V
    .registers 3
    .param p1, "foundationAuth_aes_key"    # [B

    .prologue
    .line 147
    const-string v0, "adb_foundation_auth_aes_secret_key"

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->storeAESKeyInPreference_Common([BLjava/lang/String;)V

    .line 148
    return-void
.end method


# virtual methods
.method public deleteFoundationAuthAESKey()V
    .registers 6

    .prologue
    .line 108
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 109
    .local v0, "appContext":Landroid/content/Context;
    const-string v3, "adb_foundation_auth_aes_preference"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 110
    .local v2, "sharedPreferences":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 111
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v3, "adb_foundation_auth_aes_secret_key"

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 112
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 113
    return-void
.end method

.method public getFoundationAuthAESKey()[B
    .registers 3

    .prologue
    .line 117
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->_foundationAuth_AES_key:[B

    if-eqz v0, :cond_7

    .line 118
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->_foundationAuth_AES_key:[B

    .line 131
    :goto_6
    return-object v0

    .line 120
    :cond_7
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->getFoundation_AESKey_fromPreference()[B

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->_foundationAuth_AES_key:[B

    .line 122
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->_foundationAuth_AES_key:[B

    if-nez v0, :cond_20

    .line 123
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->generateNewAESKey_Common()[B

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->_foundationAuth_AES_key:[B

    .line 124
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->_foundationAuth_AES_key:[B

    if-eqz v0, :cond_23

    .line 125
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->_foundationAuth_AES_key:[B

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->storeFoundatationAuth_AESKey_InPreference([B)V

    .line 131
    :cond_20
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->_foundationAuth_AES_key:[B

    goto :goto_6

    .line 128
    :cond_23
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "CSDK Foundation Auth AES Key is null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
