.class public Lcom/dumplingsandwich/pencilsketch/application/PencilSketchApplication;
.super Landroid/support/multidex/MultiDexApplication;
.source "PencilSketchApplication.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/IAviaryClientCredentials;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/support/multidex/MultiDexApplication;-><init>()V

    return-void
.end method


# virtual methods
.method public getBillingKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 31
    const-string v0, "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjbRE8+eswhWJC5fD8qDpSuqTakOJBkeBUYd7P9kAkiTkEiJ4xB2G+2E8FgtmyizTOa2m5jb5U5IOtc4BZCBZQpwTq/EqDm1xHQ2BDuOzW8NJkqXI8o2nH3f0HVilMJtZVHyuLN46kNZONjpZE6iedb6lyg1Y/bFbHLlRqxTFsCrvC6/F93toyov+y2BQnC/zzyhwtoqc831/ZUk/gltI++AJOc1t9THo37Ul4VI9c0Fe+tuFDIQhYqzMuOZaiKBrCD+yJkDdfVkN9Thasdu+UCOUXJham3tYrEJEbxpFlPfh97dHDrjpumWUZrYn5YQ74YuRVcp+ZZNOWe3nlz73fwIDAQAB"

    return-object v0
.end method

.method public getClientID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 36
    const-string v0, "5bdd636e3694470fa58e0ea0f195e0d3"

    return-object v0
.end method

.method public getClientSecret()Ljava/lang/String;
    .registers 2

    .prologue
    .line 41
    const-string v0, "89baf2ee-6c90-4c15-ad1c-f7c2b6719753"

    return-object v0
.end method

.method public onCreate()V
    .registers 2

    .prologue
    .line 23
    invoke-super {p0}, Landroid/support/multidex/MultiDexApplication;->onCreate()V

    .line 26
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/application/PencilSketchApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/AdobeCSDKFoundation;->initializeCSDKFoundation(Landroid/content/Context;)V

    .line 27
    return-void
.end method
