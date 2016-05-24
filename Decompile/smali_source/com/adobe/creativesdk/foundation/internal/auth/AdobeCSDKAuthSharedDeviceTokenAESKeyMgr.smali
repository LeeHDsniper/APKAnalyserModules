.class public Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;
.super Ljava/lang/Object;
.source "AdobeCSDKAuthSharedDeviceTokenAESKeyMgr.java"


# static fields
.field private static _sInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;


# instance fields
.field private _bInstanceInitialized:Z

.field private _cipher:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

.field private _deviceTokenAESKey:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_bInstanceInitialized:Z

    .line 36
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_bInstanceInitialized:Z

    .line 37
    return-void
.end method

.method public static LogText(Ljava/lang/String;)V
    .registers 1
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 57
    return-void
.end method

.method public static getInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;
    .registers 1

    .prologue
    .line 29
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;

    if-nez v0, :cond_b

    .line 30
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;

    .line 32
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;

    return-object v0
.end method

.method private initializeCipher()V
    .registers 4

    .prologue
    .line 45
    :try_start_0
    const-string v1, "Creating the Cipher Instance of Key"

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->LogText(Ljava/lang/String;)V

    .line 46
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_deviceTokenAESKey:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->printAESKey(Ljava/lang/String;)V

    .line 47
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_deviceTokenAESKey:Ljava/lang/String;

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/utils/Util;->convertStringToByteArray(Ljava/lang/String;)[B

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;-><init>([B)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_cipher:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_17} :catch_18

    .line 52
    :goto_17
    return-void

    .line 49
    :catch_18
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cipher cretion FAILED with messages :  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "   : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->LogText(Ljava/lang/String;)V

    goto :goto_17
.end method

.method private printAESKey(Ljava/lang/String;)V
    .registers 2
    .param p1, "aes_key"    # Ljava/lang/String;

    .prologue
    .line 98
    return-void
.end method


# virtual methods
.method public createNewAESKeyForSharedDeviceToken(Landroid/content/Context;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 120
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->generateNewAESKey_Common()[B

    move-result-object v2

    .line 122
    .local v2, "new_aes_key":[B
    :try_start_4
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/utils/Util;->convertByteArrayToString([B)Ljava/lang/String;

    move-result-object v0

    .line 123
    .local v0, "aes_key_str":Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->setSharedDeviceTokenAESKey(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_b} :catch_c

    .line 128
    .end local v0    # "aes_key_str":Ljava/lang/String;
    :goto_b
    return-void

    .line 125
    :catch_c
    move-exception v1

    .line 126
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cipher creation FAILED with messages :  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "   : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->LogText(Ljava/lang/String;)V

    goto :goto_b
.end method

.method public decryptData(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_cipher:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

    if-nez v0, :cond_5

    .line 141
    .end local p1    # "val":Ljava/lang/String;
    :goto_4
    return-object p1

    .restart local p1    # "val":Ljava/lang/String;
    :cond_5
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_cipher:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_4
.end method

.method public encryptData(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_cipher:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

    if-nez v0, :cond_5

    .line 148
    .end local p1    # "val":Ljava/lang/String;
    :goto_4
    return-object p1

    .restart local p1    # "val":Ljava/lang/String;
    :cond_5
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_cipher:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_4
.end method

.method public getDeviceTokenSharedAESKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_deviceTokenAESKey:Ljava/lang/String;

    return-object v0
.end method

.method public initializeDeviceTokenAES(Landroid/content/Context;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 61
    const-string v3, "AES initializing the AES"

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->LogText(Ljava/lang/String;)V

    .line 63
    iget-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_bInstanceInitialized:Z

    if-nez v3, :cond_33

    .line 68
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_bInstanceInitialized:Z

    .line 70
    const-string v3, "adb_authenticator_shared_aes_preference"

    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 71
    .local v2, "sharedPreferences":Landroid/content/SharedPreferences;
    const-string v3, "adb_authenticator_shared_aes_devicetoken"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "aes_key_str":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "AES from preferenc is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->LogText(Ljava/lang/String;)V

    .line 73
    if-nez v0, :cond_4c

    .line 85
    .end local v0    # "aes_key_str":Ljava/lang/String;
    .end local v2    # "sharedPreferences":Landroid/content/SharedPreferences;
    :goto_32
    return-void

    .line 64
    :cond_33
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "AESMgr is already initialized - aes key :  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_deviceTokenAESKey:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->LogText(Ljava/lang/String;)V

    goto :goto_32

    .line 76
    .restart local v0    # "aes_key_str":Ljava/lang/String;
    .restart local v2    # "sharedPreferences":Landroid/content/SharedPreferences;
    :cond_4c
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->setApplicationContext(Landroid/content/Context;)V

    .line 77
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v1

    .line 79
    .local v1, "imsService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getCipher()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_deviceTokenAESKey:Ljava/lang/String;

    .line 81
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "AES after decrypting is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_deviceTokenAESKey:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->LogText(Ljava/lang/String;)V

    .line 82
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_deviceTokenAESKey:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->printAESKey(Ljava/lang/String;)V

    .line 84
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->initializeCipher()V

    goto :goto_32
.end method

.method public isInitializationSuccess()Z
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_cipher:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public setSharedDeviceTokenAESKey(Landroid/content/Context;Ljava/lang/String;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "aes_key_str"    # Ljava/lang/String;

    .prologue
    .line 102
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->setApplicationContext(Landroid/content/Context;)V

    .line 103
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v2

    .line 105
    .local v2, "imsService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Setting new key "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->LogText(Ljava/lang/String;)V

    .line 106
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getCipher()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

    move-result-object v4

    invoke-virtual {v4, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 108
    .local v1, "encryptedAESKey":Ljava/lang/String;
    const-string v4, "adb_authenticator_shared_aes_preference"

    const/4 v5, 0x0

    invoke-virtual {p1, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 109
    .local v3, "sharedPreferences":Landroid/content/SharedPreferences;
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 110
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v4, "adb_authenticator_shared_aes_devicetoken"

    invoke-interface {v0, v4, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 111
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 113
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_deviceTokenAESKey:Ljava/lang/String;

    .line 114
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->_deviceTokenAESKey:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->printAESKey(Ljava/lang/String;)V

    .line 115
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr;->initializeCipher()V

    .line 116
    return-void
.end method
