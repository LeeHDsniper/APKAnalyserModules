.class public Lcom/behance/sdk/project/validator/BehanceSDKProjectImageModuleValidator;
.super Ljava/lang/Object;
.source "BehanceSDKProjectImageModuleValidator.java"

# interfaces
.implements Lcom/behance/sdk/factory/IBehanceSDKImageValidator;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private displayToastMessage(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "msgToDisplay"    # Ljava/lang/String;

    .prologue
    .line 28
    if-eqz p2, :cond_a

    .line 29
    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 31
    :cond_a
    return-void
.end method

.method private imageMatchesRequirements(Landroid/content/Context;Lcom/behance/sdk/factory/BehanceSDKImageProperties;)Z
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "params"    # Lcom/behance/sdk/factory/BehanceSDKImageProperties;

    .prologue
    .line 35
    invoke-virtual {p2}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->getType()Ljava/lang/String;

    move-result-object v1

    .line 36
    .local v1, "fileExtension":Ljava/lang/String;
    invoke-virtual {p2}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->getName()Ljava/lang/String;

    move-result-object v2

    .line 37
    .local v2, "fileName":Ljava/lang/String;
    invoke-static {}, Lcom/behance/sdk/util/BehanceSDKUtils;->getAllowedFileExtensionsForProjectImage()Ljava/util/ArrayList;

    move-result-object v0

    .line 38
    .local v0, "allowedFileExtensionsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v1, :cond_3a

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_3a

    .line 39
    if-eqz v0, :cond_4b

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_4b

    .line 40
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4b

    .line 41
    sget v8, Lcom/behance/sdk/R$string;->bsdk_publish_project_from_cc_invalid_file_type:I

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v1, v9, v10

    const/4 v10, 0x1

    .line 42
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    .line 41
    invoke-virtual {p1, v8, v9}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 43
    .local v3, "msgToDisplay":Ljava/lang/String;
    invoke-direct {p0, p1, v3}, Lcom/behance/sdk/project/validator/BehanceSDKProjectImageModuleValidator;->displayToastMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 44
    const/4 v8, 0x0

    .line 63
    .end local v3    # "msgToDisplay":Ljava/lang/String;
    :goto_39
    return v8

    .line 48
    :cond_3a
    sget v8, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_file_type_invalid_msg:I

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v2, v9, v10

    invoke-virtual {p1, v8, v9}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 49
    .restart local v3    # "msgToDisplay":Ljava/lang/String;
    invoke-direct {p0, p1, v3}, Lcom/behance/sdk/project/validator/BehanceSDKProjectImageModuleValidator;->displayToastMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 50
    const/4 v8, 0x0

    goto :goto_39

    .line 53
    .end local v3    # "msgToDisplay":Ljava/lang/String;
    :cond_4b
    invoke-virtual {p2}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->getSize()J

    move-result-wide v4

    .line 55
    .local v4, "imageSizeInBytes":J
    const-wide/32 v6, 0x800000

    .line 56
    .local v6, "maxImageSizeBytes":J
    const-wide/16 v8, 0x0

    cmp-long v8, v4, v8

    if-ltz v8, :cond_62

    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-lez v8, :cond_78

    cmp-long v8, v4, v6

    if-lez v8, :cond_78

    .line 58
    :cond_62
    sget v8, Lcom/behance/sdk/R$string;->bsdk_publish_project_from_cc_invalid_image_size:I

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v2, v9, v10

    const/4 v10, 0x1

    const-string v11, "8 MB"

    aput-object v11, v9, v10

    invoke-virtual {p1, v8, v9}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 60
    .restart local v3    # "msgToDisplay":Ljava/lang/String;
    invoke-direct {p0, p1, v3}, Lcom/behance/sdk/project/validator/BehanceSDKProjectImageModuleValidator;->displayToastMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 61
    const/4 v8, 0x0

    goto :goto_39

    .line 63
    .end local v3    # "msgToDisplay":Ljava/lang/String;
    :cond_78
    const/4 v8, 0x1

    goto :goto_39
.end method


# virtual methods
.method public validate(Landroid/content/Context;Lcom/behance/sdk/factory/BehanceSDKImageProperties;)Z
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "params"    # Lcom/behance/sdk/factory/BehanceSDKImageProperties;

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/project/validator/BehanceSDKProjectImageModuleValidator;->imageMatchesRequirements(Landroid/content/Context;Lcom/behance/sdk/factory/BehanceSDKImageProperties;)Z

    move-result v0

    return v0
.end method
