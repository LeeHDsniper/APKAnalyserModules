.class public Lcom/behance/sdk/project/validator/BehanceSDKWIPImageModuleValidator;
.super Ljava/lang/Object;
.source "BehanceSDKWIPImageModuleValidator.java"

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
    .line 24
    if-eqz p1, :cond_c

    if-eqz p2, :cond_c

    .line 25
    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 27
    :cond_c
    return-void
.end method

.method private imageMatchesRequirements(Landroid/content/Context;Lcom/behance/sdk/factory/BehanceSDKImageProperties;)Z
    .registers 29
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "params"    # Lcom/behance/sdk/factory/BehanceSDKImageProperties;

    .prologue
    .line 31
    invoke-virtual/range {p2 .. p2}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->getName()Ljava/lang/String;

    move-result-object v6

    .line 32
    .local v6, "fileName":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->getType()Ljava/lang/String;

    move-result-object v5

    .line 33
    .local v5, "fileExtension":Ljava/lang/String;
    invoke-static {}, Lcom/behance/sdk/util/BehanceSDKUtils;->getAllowedFileExtensionsForWIPImage()Ljava/util/ArrayList;

    move-result-object v4

    .line 34
    .local v4, "allowedFileExtensionsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v20, 0x0

    .line 35
    .local v20, "prohibitedFileExtensionsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v5, :cond_8c

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v22

    if-lez v22, :cond_8c

    .line 36
    if-eqz v20, :cond_52

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->isEmpty()Z

    move-result v22

    if-nez v22, :cond_52

    .line 37
    move-object/from16 v0, v20

    invoke-interface {v0, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_52

    .line 38
    sget v22, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_file_type_not_allowed_msg:I

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v6, v23, v24

    const/16 v24, 0x1

    .line 39
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v25

    aput-object v25, v23, v24

    .line 38
    move-object/from16 v0, p1

    move/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    .line 40
    .local v19, "msgToDisplay":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/project/validator/BehanceSDKWIPImageModuleValidator;->displayToastMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 41
    const/16 v22, 0x0

    .line 112
    .end local v19    # "msgToDisplay":Ljava/lang/String;
    :goto_51
    return v22

    .line 45
    :cond_52
    if-eqz v4, :cond_b0

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v22

    if-nez v22, :cond_b0

    .line 46
    invoke-interface {v4, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_b0

    .line 47
    sget v22, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_file_type_allowed_msg:I

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v6, v23, v24

    const/16 v24, 0x1

    .line 48
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v25

    aput-object v25, v23, v24

    .line 47
    move-object/from16 v0, p1

    move/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    .line 49
    .restart local v19    # "msgToDisplay":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/project/validator/BehanceSDKWIPImageModuleValidator;->displayToastMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 50
    const/16 v22, 0x0

    goto :goto_51

    .line 54
    .end local v19    # "msgToDisplay":Ljava/lang/String;
    :cond_8c
    sget v22, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_file_type_invalid_msg:I

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v6, v23, v24

    move-object/from16 v0, p1

    move/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    .line 55
    .restart local v19    # "msgToDisplay":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/project/validator/BehanceSDKWIPImageModuleValidator;->displayToastMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 56
    const/16 v22, 0x0

    goto :goto_51

    .line 59
    .end local v19    # "msgToDisplay":Ljava/lang/String;
    :cond_b0
    invoke-virtual/range {p2 .. p2}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->getWidth()I

    move-result v10

    .line 60
    .local v10, "imageWidth":I
    invoke-virtual/range {p2 .. p2}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->getHeight()I

    move-result v7

    .line 61
    .local v7, "imageHeight":I
    invoke-virtual/range {p2 .. p2}, Lcom/behance/sdk/factory/BehanceSDKImageProperties;->getSize()J

    move-result-wide v8

    .line 63
    .local v8, "imageSizeInBytes":J
    const-wide/16 v16, -0x1

    .line 64
    .local v16, "minImageSizeBytes":J
    const-wide/32 v12, 0xc00000

    .line 65
    .local v12, "maxImageSizeBytes":J
    const-wide/16 v22, 0x0

    cmp-long v22, v8, v22

    if-lez v22, :cond_15d

    .line 66
    const-wide/16 v22, 0x0

    cmp-long v22, v16, v22

    if-lez v22, :cond_112

    cmp-long v22, v8, v16

    if-gez v22, :cond_112

    .line 67
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-wide/32 v24, 0x100000

    div-long v24, v16, v24

    move-object/from16 v0, v22

    move-wide/from16 v1, v24

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " MB"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 68
    .local v21, "sizeInMBStr":Ljava/lang/String;
    sget v22, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_size_less_than_min_required_msg:I

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v21, v23, v24

    move-object/from16 v0, p1

    move/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    .line 69
    .restart local v19    # "msgToDisplay":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/project/validator/BehanceSDKWIPImageModuleValidator;->displayToastMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 70
    const/16 v22, 0x0

    goto/16 :goto_51

    .line 73
    .end local v19    # "msgToDisplay":Ljava/lang/String;
    .end local v21    # "sizeInMBStr":Ljava/lang/String;
    :cond_112
    const-wide/16 v22, 0x0

    cmp-long v22, v12, v22

    if-lez v22, :cond_174

    cmp-long v22, v8, v12

    if-lez v22, :cond_174

    .line 74
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-wide/32 v24, 0x100000

    div-long v24, v12, v24

    move-object/from16 v0, v22

    move-wide/from16 v1, v24

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " MB"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 75
    .restart local v21    # "sizeInMBStr":Ljava/lang/String;
    sget v22, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_size_more_than_max_allowed_msg:I

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v21, v23, v24

    move-object/from16 v0, p1

    move/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    .line 76
    .restart local v19    # "msgToDisplay":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/project/validator/BehanceSDKWIPImageModuleValidator;->displayToastMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 77
    const/16 v22, 0x0

    goto/16 :goto_51

    .line 80
    .end local v19    # "msgToDisplay":Ljava/lang/String;
    .end local v21    # "sizeInMBStr":Ljava/lang/String;
    :cond_15d
    sget v22, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_size_invalid_msg:I

    move-object/from16 v0, p1

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v19

    .line 81
    .restart local v19    # "msgToDisplay":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/project/validator/BehanceSDKWIPImageModuleValidator;->displayToastMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 82
    const/16 v22, 0x0

    goto/16 :goto_51

    .line 85
    .end local v19    # "msgToDisplay":Ljava/lang/String;
    :cond_174
    const/16 v18, 0x280

    .line 86
    .local v18, "minImageWidth":I
    const/16 v15, 0x140

    .line 87
    .local v15, "minImageHeight":I
    const/4 v14, -0x1

    .line 88
    .local v14, "maxImageWidth":I
    const/4 v11, -0x1

    .line 90
    .local v11, "maxImageHeight":I
    if-lez v10, :cond_216

    if-lez v7, :cond_216

    .line 91
    if-lez v18, :cond_1c9

    if-lez v15, :cond_1c9

    .line 92
    move/from16 v0, v18

    if-lt v10, v0, :cond_188

    if-ge v7, v15, :cond_1c9

    .line 93
    :cond_188
    sget v22, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_dimensions_less_than_min_required_msg:I

    const/16 v23, 0x4

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x1

    .line 94
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x2

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x3

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    .line 93
    move-object/from16 v0, p1

    move/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    .line 95
    .restart local v19    # "msgToDisplay":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/project/validator/BehanceSDKWIPImageModuleValidator;->displayToastMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 96
    const/16 v22, 0x0

    goto/16 :goto_51

    .line 100
    .end local v19    # "msgToDisplay":Ljava/lang/String;
    :cond_1c9
    if-lez v14, :cond_212

    if-lez v11, :cond_212

    .line 101
    if-gt v10, v14, :cond_1d1

    if-le v7, v11, :cond_212

    .line 102
    :cond_1d1
    sget v22, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_dimensions_more_than_max_allowed_msg:I

    const/16 v23, 0x4

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x1

    .line 103
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x2

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x3

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    .line 102
    move-object/from16 v0, p1

    move/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    .line 104
    .restart local v19    # "msgToDisplay":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/project/validator/BehanceSDKWIPImageModuleValidator;->displayToastMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 105
    const/16 v22, 0x0

    goto/16 :goto_51

    .line 108
    .end local v19    # "msgToDisplay":Ljava/lang/String;
    :cond_212
    const/16 v22, 0x1

    goto/16 :goto_51

    .line 110
    :cond_216
    sget v22, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_dimensions_invalid_msg:I

    move-object/from16 v0, p1

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v19

    .line 111
    .restart local v19    # "msgToDisplay":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/project/validator/BehanceSDKWIPImageModuleValidator;->displayToastMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 112
    const/16 v22, 0x0

    goto/16 :goto_51
.end method


# virtual methods
.method public validate(Landroid/content/Context;Lcom/behance/sdk/factory/BehanceSDKImageProperties;)Z
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "params"    # Lcom/behance/sdk/factory/BehanceSDKImageProperties;

    .prologue
    .line 20
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/project/validator/BehanceSDKWIPImageModuleValidator;->imageMatchesRequirements(Landroid/content/Context;Lcom/behance/sdk/factory/BehanceSDKImageProperties;)Z

    move-result v0

    return v0
.end method
