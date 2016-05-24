.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeCSDKInternalClientsPreferences;
.super Ljava/lang/Object;
.source "AdobeCSDKInternalClientsPreferences.java"


# static fields
.field private static _sShouldEnableMyAccountsOption:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 16
    const/4 v0, 0x0

    sput-boolean v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeCSDKInternalClientsPreferences;->_sShouldEnableMyAccountsOption:Z

    return-void
.end method

.method public static hasClientPreferenceToEnableMyAccountOption()Z
    .registers 1

    .prologue
    .line 20
    sget-boolean v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeCSDKInternalClientsPreferences;->_sShouldEnableMyAccountsOption:Z

    return v0
.end method

.method public static setClientPreferenceEnableMyAccount(Z)V
    .registers 1
    .param p0, "shouldEnableMyAccountOption"    # Z

    .prologue
    .line 41
    sput-boolean p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeCSDKInternalClientsPreferences;->_sShouldEnableMyAccountsOption:Z

    .line 42
    return-void
.end method
