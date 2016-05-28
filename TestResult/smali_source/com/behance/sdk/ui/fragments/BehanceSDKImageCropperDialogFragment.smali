.class public Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "BehanceSDKImageCropperDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment$Callbacks;
    }
.end annotation


# instance fields
.field private callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment$Callbacks;

.field private cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

.field private imageHeight:I

.field private imageWidth:I

.field private minLength:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 38
    return-void
.end method

.method public static getInstance(Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment$Callbacks;)Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;
    .registers 5
    .param p0, "cropperDTO"    # Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;
    .param p1, "callbacks"    # Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment$Callbacks;

    .prologue
    .line 43
    new-instance v1, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;

    invoke-direct {v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;-><init>()V

    .line 44
    .local v1, "instance":Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 45
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "ARGS_KEY_IMAGE_CROPPER_DTO"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 46
    invoke-virtual {v1, v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->setArguments(Landroid/os/Bundle;)V

    .line 47
    invoke-virtual {v1, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment$Callbacks;)V

    .line 48
    return-object v1
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 159
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->dismiss()V

    .line 160
    return-void
.end method

.method public cropSaveAndClose()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    const/4 v3, -0x1

    .line 142
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment$Callbacks;

    if-eqz v2, :cond_27

    .line 143
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

    invoke-virtual {v2}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->getCroppedImage()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 144
    .local v0, "bm":Landroid/graphics/Bitmap;
    move-object v1, v0

    .line 145
    .local v1, "covertedFile":Landroid/graphics/Bitmap;
    iget v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->imageHeight:I

    if-eq v2, v3, :cond_20

    iget v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->imageWidth:I

    if-eq v2, v3, :cond_20

    .line 146
    iget v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->imageWidth:I

    iget v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->imageWidth:I

    invoke-static {v0, v2, v3, v5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 147
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 149
    :cond_20
    if-eqz v1, :cond_2b

    .line 150
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment$Callbacks;

    invoke-interface {v2, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment$Callbacks;->onImageCropped(Landroid/graphics/Bitmap;)V

    .line 154
    .end local v0    # "bm":Landroid/graphics/Bitmap;
    .end local v1    # "covertedFile":Landroid/graphics/Bitmap;
    :cond_27
    :goto_27
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->close()V

    .line 155
    return-void

    .line 152
    .restart local v0    # "bm":Landroid/graphics/Bitmap;
    .restart local v1    # "covertedFile":Landroid/graphics/Bitmap;
    :cond_2b
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/behance/sdk/R$string;->bsdk_image_cropper_crop_failed_msg:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_27
.end method

.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 133
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 134
    .local v0, "i":I
    sget v1, Lcom/behance/sdk/R$id;->bsdkCropImageOk:I

    if-ne v0, v1, :cond_c

    .line 135
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->cropSaveAndClose()V

    .line 138
    :cond_b
    :goto_b
    return-void

    .line 136
    :cond_c
    sget v1, Lcom/behance/sdk/R$id;->bsdkCropImageCancel:I

    if-ne v0, v1, :cond_b

    .line 137
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->close()V

    goto :goto_b
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 53
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 54
    const/4 v0, 0x2

    sget v1, Lcom/behance/sdk/R$style;->BsdkPublishWIPToBehanceViewTheme:I

    invoke-virtual {p0, v0, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->setStyle(II)V

    .line 55
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 13
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x0

    .line 59
    sget v5, Lcom/behance/sdk/R$layout;->bsdk_dialog_fragment_image_cropper:I

    const/4 v6, 0x1

    invoke-virtual {p1, v5, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 60
    .local v4, "rootView":Landroid/view/View;
    sget v5, Lcom/behance/sdk/R$id;->crop_image_view:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/behance/sdk/edmodo/cropper/CropImageView;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

    .line 61
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

    const/16 v6, 0xc8

    invoke-virtual {v5, v6}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setMinSize(I)V

    .line 63
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 64
    .local v0, "args":Landroid/os/Bundle;
    if-eqz v0, :cond_62

    .line 65
    const-string v5, "ARGS_KEY_IMAGE_CROPPER_DTO"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;

    .line 67
    .local v2, "cropperDTO":Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;
    invoke-virtual {v2}, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->isIncludeControls()Z

    move-result v5

    if-eqz v5, :cond_36

    .line 68
    sget v5, Lcom/behance/sdk/R$id;->bsdkCropImageControlsWrapper:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v8}, Landroid/view/View;->setVisibility(I)V

    .line 70
    :cond_36
    invoke-virtual {v2}, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->getHeight()I

    move-result v5

    iput v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->imageHeight:I

    .line 71
    invoke-virtual {v2}, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->getWidth()I

    move-result v5

    iput v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->imageWidth:I

    .line 72
    invoke-virtual {v2}, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->getMinSize()I

    move-result v5

    iput v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->minLength:I

    .line 74
    invoke-virtual {v2}, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->getImageModule()Lcom/behance/sdk/project/modules/ImageModule;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->setImage(Lcom/behance/sdk/project/modules/ImageModule;)V

    .line 80
    .end local v2    # "cropperDTO":Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;
    :goto_4f
    sget v5, Lcom/behance/sdk/R$id;->bsdkCropImageOk:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 81
    .local v3, "ok":Landroid/view/View;
    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    sget v5, Lcom/behance/sdk/R$id;->bsdkCropImageCancel:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 83
    .local v1, "cancel":Landroid/view/View;
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 85
    return-object v4

    .line 76
    .end local v1    # "cancel":Landroid/view/View;
    .end local v3    # "ok":Landroid/view/View;
    :cond_62
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    sget v7, Lcom/behance/sdk/R$string;->bsdk_image_cropper_failed_to_open_msg:I

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 77
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->close()V

    goto :goto_4f
.end method

.method public setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment$Callbacks;)V
    .registers 2
    .param p1, "callbacks"    # Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment$Callbacks;

    .prologue
    .line 128
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment$Callbacks;

    .line 129
    return-void
.end method

.method public setImage(Lcom/behance/sdk/project/modules/ImageModule;)V
    .registers 19
    .param p1, "imageModule"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 90
    move-object/from16 v0, p0

    iget v2, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->imageHeight:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_c4

    move-object/from16 v0, p0

    iget v2, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->imageWidth:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_c4

    .line 91
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->imageWidth:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->imageHeight:I

    invoke-virtual {v2, v3, v4}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setAspectRatio(II)V

    .line 92
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setFixedAspectRatio(Z)V

    .line 95
    :goto_25
    move-object/from16 v0, p0

    iget v2, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->minLength:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_37

    .line 96
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->minLength:I

    invoke-virtual {v2, v3}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setMinSize(I)V

    .line 98
    :cond_37
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    .line 99
    .local v9, "cr":Landroid/content/ContentResolver;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "file:///"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/project/modules/ImageModule;->getFile()Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    .line 100
    .local v8, "contentURI":Landroid/net/Uri;
    const/4 v12, 0x0

    .line 102
    .local v12, "in":Ljava/io/InputStream;
    :try_start_5f
    invoke-virtual {v9, v8}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;
    :try_end_62
    .catch Ljava/io/FileNotFoundException; {:try_start_5f .. :try_end_62} :catch_ce

    move-result-object v12

    .line 106
    :goto_63
    new-instance v13, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v13}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 107
    .local v13, "options":Landroid/graphics/BitmapFactory$Options;
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v10

    .line 108
    .local v10, "display":Landroid/view/Display;
    new-instance v15, Landroid/graphics/Point;

    invoke-direct {v15}, Landroid/graphics/Point;-><init>()V

    .line 109
    .local v15, "size":Landroid/graphics/Point;
    invoke-virtual {v10, v15}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 110
    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/project/modules/ImageModule;->getWidth()I

    move-result v2

    iget v3, v15, Landroid/graphics/Point;->x:I

    div-int/2addr v2, v3

    iput v2, v13, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 111
    const/4 v2, 0x0

    invoke-static {v12, v2, v13}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 113
    .local v1, "thumb":Landroid/graphics/Bitmap;
    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/project/modules/ImageModule;->getRotation()I

    move-result v14

    .line 114
    .local v14, "rotation":I
    if-lez v14, :cond_d3

    .line 115
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 116
    new-instance v6, Landroid/graphics/Matrix;

    invoke-direct {v6}, Landroid/graphics/Matrix;-><init>()V

    .line 118
    .local v6, "matrix":Landroid/graphics/Matrix;
    mul-int/lit8 v2, v14, 0x5a

    int-to-float v2, v2

    invoke-virtual {v6, v2}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 119
    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    const/4 v7, 0x1

    invoke-static/range {v1 .. v7}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v16

    .line 120
    .local v16, "updatedImage":Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 124
    .end local v6    # "matrix":Landroid/graphics/Matrix;
    .end local v16    # "updatedImage":Landroid/graphics/Bitmap;
    :goto_bb
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setGuidelines(I)V

    .line 125
    return-void

    .line 94
    .end local v1    # "thumb":Landroid/graphics/Bitmap;
    .end local v8    # "contentURI":Landroid/net/Uri;
    .end local v9    # "cr":Landroid/content/ContentResolver;
    .end local v10    # "display":Landroid/view/Display;
    .end local v12    # "in":Ljava/io/InputStream;
    .end local v13    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v14    # "rotation":I
    .end local v15    # "size":Landroid/graphics/Point;
    :cond_c4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setFixedAspectRatio(Z)V

    goto/16 :goto_25

    .line 103
    .restart local v8    # "contentURI":Landroid/net/Uri;
    .restart local v9    # "cr":Landroid/content/ContentResolver;
    .restart local v12    # "in":Ljava/io/InputStream;
    :catch_ce
    move-exception v11

    .line 104
    .local v11, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v11}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_63

    .line 122
    .end local v11    # "e":Ljava/io/FileNotFoundException;
    .restart local v1    # "thumb":Landroid/graphics/Bitmap;
    .restart local v10    # "display":Landroid/view/Display;
    .restart local v13    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v14    # "rotation":I
    .restart local v15    # "size":Landroid/graphics/Point;
    :cond_d3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

    invoke-virtual {v2, v1}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_bb
.end method
