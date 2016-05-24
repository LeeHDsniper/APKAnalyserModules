.class public final Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;
.super Ljava/lang/Object;
.source "CredentialsUtils.java"


# static fields
.field private static mApiKey:Ljava/lang/String;

.field private static mApiKeySecret:Ljava/lang/String;

.field private static mBillingKey:Ljava/lang/String;


# direct methods
.method public static getApiKey(Landroid/content/Context;)Ljava/lang/String;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->mApiKey:Ljava/lang/String;

    if-nez v0, :cond_10

    .line 23
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/IAviaryClientCredentials;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/IAviaryClientCredentials;->getClientID()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->mApiKey:Ljava/lang/String;

    .line 28
    :cond_10
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->mApiKey:Ljava/lang/String;

    return-object v0
.end method

.method public static getApiSecret(Landroid/content/Context;)Ljava/lang/String;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->mApiKeySecret:Ljava/lang/String;

    if-nez v0, :cond_10

    .line 33
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/IAviaryClientCredentials;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/IAviaryClientCredentials;->getClientSecret()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->mApiKeySecret:Ljava/lang/String;

    .line 38
    :cond_10
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->mApiKeySecret:Ljava/lang/String;

    return-object v0
.end method

.method public static getBillingKey(Landroid/content/Context;)Ljava/lang/String;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->mBillingKey:Ljava/lang/String;

    if-nez v0, :cond_10

    .line 43
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/IAviaryClientCredentials;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/IAviaryClientCredentials;->getBillingKey()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->mBillingKey:Ljava/lang/String;

    .line 48
    :cond_10
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->mBillingKey:Ljava/lang/String;

    return-object v0
.end method
