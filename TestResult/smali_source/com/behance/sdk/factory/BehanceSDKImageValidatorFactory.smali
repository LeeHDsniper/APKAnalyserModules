.class public Lcom/behance/sdk/factory/BehanceSDKImageValidatorFactory;
.super Ljava/lang/Object;
.source "BehanceSDKImageValidatorFactory.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/behance/sdk/factory/BehanceSDKImageValidatorFactory;
    .registers 1

    .prologue
    .line 16
    new-instance v0, Lcom/behance/sdk/factory/BehanceSDKImageValidatorFactory;

    invoke-direct {v0}, Lcom/behance/sdk/factory/BehanceSDKImageValidatorFactory;-><init>()V

    return-object v0
.end method


# virtual methods
.method public getImageValidator(Ljava/lang/String;)Lcom/behance/sdk/factory/IBehanceSDKImageValidator;
    .registers 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 20
    const-string v0, "PUBLISH_PROJECT_IMAGE_VALIDATOR"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 21
    new-instance v0, Lcom/behance/sdk/project/validator/BehanceSDKProjectImageModuleValidator;

    invoke-direct {v0}, Lcom/behance/sdk/project/validator/BehanceSDKProjectImageModuleValidator;-><init>()V

    .line 25
    :goto_d
    return-object v0

    .line 22
    :cond_e
    const-string v0, "PUBLISH_WIP_IMAGE_VALIDATOR"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 23
    new-instance v0, Lcom/behance/sdk/project/validator/BehanceSDKWIPImageModuleValidator;

    invoke-direct {v0}, Lcom/behance/sdk/project/validator/BehanceSDKWIPImageModuleValidator;-><init>()V

    goto :goto_d

    .line 25
    :cond_1c
    const/4 v0, 0x0

    goto :goto_d
.end method
