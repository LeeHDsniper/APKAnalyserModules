.class public Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;
.super Ljava/lang/Object;
.source "AdobeAccountUserStatus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;
    }
.end annotation


# instance fields
.field private final error:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

.field private final options:Landroid/os/Bundle;

.field private final type:Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;

.field private userProfile:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

.field private final uuid:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;Landroid/content/Intent;)V
    .registers 6
    .param p1, "status"    # Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->type:Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;

    .line 30
    const-string v0, "options"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->options:Landroid/os/Bundle;

    .line 33
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->options:Landroid/os/Bundle;

    if-nez v0, :cond_19

    .line 34
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bundle `options` is missing"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :cond_19
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->options:Landroid/os/Bundle;

    const-string v1, "uuid"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2b

    .line 38
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "String `uuid` is missing from the options Bundle"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_2b
    const-string v0, "error"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3b

    .line 42
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Integer `error` is missing from the options Bundle"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_3b
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->options:Landroid/os/Bundle;

    const-string v1, "uuid"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->uuid:Ljava/lang/String;

    .line 46
    invoke-static {}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->values()[Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    move-result-object v0

    const-string v1, "error"

    sget-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_UNKNOWN_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 47
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ordinal()I

    move-result v2

    .line 46
    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->error:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 49
    const-string v0, "user"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6b

    .line 50
    const-string v0, "user"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->userProfile:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    .line 52
    :cond_6b
    return-void
.end method

.method static getLocalizedErrorMessage(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)Ljava/lang/String;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "code"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .prologue
    .line 85
    sget-object v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_AUTH_MODULE_NOT_INITIALIZED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    if-ne p1, v0, :cond_b

    .line 86
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->adobe_aviary_module_not_initialized:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 106
    :goto_a
    return-object v0

    .line 87
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_OFFLINE:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    if-ne p1, v0, :cond_16

    .line 88
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->common_google_play_services_network_error_title:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 89
    :cond_16
    sget-object v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_CANCELLED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    if-ne p1, v0, :cond_21

    .line 90
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->adobe_aviary_user_cancelled:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 91
    :cond_21
    sget-object v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_INTERACTION_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    if-ne p1, v0, :cond_2c

    .line 92
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->adobe_aviary_user_interaction_required:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 93
    :cond_2c
    sget-object v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USERNAME_AND_PASSWORD_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    if-ne p1, v0, :cond_37

    .line 94
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->adobe_aviary_username_password_required:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 95
    :cond_37
    sget-object v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_DEVICE_ID_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    if-ne p1, v0, :cond_42

    .line 96
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->adobe_aviary_device_id_required:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 97
    :cond_42
    sget-object v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_CLIENT_ID_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    if-ne p1, v0, :cond_4d

    .line 98
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->adobe_aviary_client_id_required:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 99
    :cond_4d
    sget-object v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_CLIENT_SECRET_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    if-ne p1, v0, :cond_58

    .line 100
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->adobe_aviary_client_secret_required:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 101
    :cond_58
    sget-object v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_INVALID_ARGUMENT:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    if-ne p1, v0, :cond_63

    .line 102
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->adobe_aviary_invalid_argument:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 103
    :cond_63
    sget-object v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_NETWORK_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    if-ne p1, v0, :cond_6e

    .line 104
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->common_google_play_services_network_error_title:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 106
    :cond_6e
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->adobe_aviary_unknown_error:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method


# virtual methods
.method public getError()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->error:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    return-object v0
.end method

.method public getErrorMessage(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->getError()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->getLocalizedErrorMessage(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOptions()Landroid/os/Bundle;
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->options:Landroid/os/Bundle;

    return-object v0
.end method

.method public getType()Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->type:Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;

    return-object v0
.end method

.method public getUUID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->uuid:Ljava/lang/String;

    return-object v0
.end method

.method public getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->userProfile:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    return-object v0
.end method

.method public isSuccess()Z
    .registers 3

    .prologue
    .line 59
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->error:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    sget-object v1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_NO_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "UserStatus{type:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->type:Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "success:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 113
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->isSuccess()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "error:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->error:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "options:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 115
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->getOptions()Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/utils/BundleUtils;->toString(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
