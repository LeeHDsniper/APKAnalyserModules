.class public Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;
.super Landroid/app/Activity;
.source "ImageEditingActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorCrossHatchTask;,
        Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorDoodleTask;,
        Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorSketchTask;,
        Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$GrayscaleCrossHatchTask;,
        Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$GrayscaleDoodleTask;,
        Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$GrayscaleSketchTask;,
        Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;
    }
.end annotation


# static fields
.field public static original:Landroid/graphics/Bitmap;


# instance fields
.field private bitmapView:Landroid/widget/ImageView;

.field private files_to_delete:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private grayscaleBaseLayer:Landroid/graphics/Bitmap;

.field private hsvPixelsOriginal:[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;

.field private progress_dialog:Landroid/app/ProgressDialog;

.field private sketch_option:Landroid/widget/RadioGroup;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 315
    return-void
.end method

.method static synthetic access$1000(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;
    .registers 2
    .param p0, "x0"    # Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->hsvPixelsOriginal:[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;

    return-object v0
.end method

.method static synthetic access$1002(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;)[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;
    .registers 2
    .param p0, "x0"    # Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;
    .param p1, "x1"    # [Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->hsvPixelsOriginal:[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;

    return-object p1
.end method

.method static synthetic access$600(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)Landroid/app/ProgressDialog;
    .registers 2
    .param p0, "x0"    # Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->progress_dialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$700(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)Landroid/widget/ImageView;
    .registers 2
    .param p0, "x0"    # Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->bitmapView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$900(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)Landroid/graphics/Bitmap;
    .registers 2
    .param p0, "x0"    # Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->grayscaleBaseLayer:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method static synthetic access$902(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 2
    .param p0, "x0"    # Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;
    .param p1, "x1"    # Landroid/graphics/Bitmap;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->grayscaleBaseLayer:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method private initializeAdmobBanner()V
    .registers 4

    .prologue
    .line 106
    const v2, 0x7f0f00b3

    invoke-virtual {p0, v2}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/ads/AdView;

    .line 107
    .local v1, "admob_banner":Lcom/google/android/gms/ads/AdView;
    new-instance v2, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;

    invoke-direct {v2, p0, v1}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;Lcom/google/android/gms/ads/AdView;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/ads/AdView;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    .line 116
    new-instance v2, Lcom/google/android/gms/ads/AdRequest$Builder;

    invoke-direct {v2}, Lcom/google/android/gms/ads/AdRequest$Builder;-><init>()V

    invoke-virtual {v2}, Lcom/google/android/gms/ads/AdRequest$Builder;->build()Lcom/google/android/gms/ads/AdRequest;

    move-result-object v0

    .line 117
    .local v0, "adRequest":Lcom/google/android/gms/ads/AdRequest;
    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/AdView;->loadAd(Lcom/google/android/gms/ads/AdRequest;)V

    .line 118
    return-void
.end method

.method private initializeAviaryEditor()V
    .registers 4

    .prologue
    .line 101
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "init"

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent;->createCdsInitIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 102
    .local v0, "cdsIntent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 103
    return-void
.end method

.method private launchAviarySDK(Landroid/net/Uri;)V
    .registers 12
    .param p1, "imageUri"    # Landroid/net/Uri;

    .prologue
    const/16 v9, 0x64

    const/4 v8, 0x1

    .line 186
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 187
    .local v0, "extStorageDirectory":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    const-string v5, "Pencil_Sketch"

    invoke-direct {v2, v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    .local v2, "imageFolder":Ljava/io/File;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pencil_sketch_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".jpg"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 189
    .local v1, "fileName":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 191
    .local v4, "output_file":Ljava/io/File;
    new-instance v5, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    invoke-direct {v5, p0}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, p1}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->setData(Landroid/net/Uri;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "file://"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->withOutput(Landroid/net/Uri;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v5

    sget-object v6, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->withOutputFormat(Landroid/graphics/Bitmap$CompressFormat;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v5

    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->Mp5:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->withOutputSize(Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v5

    invoke-virtual {v5, v8}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->withNoExitConfirmation(Z)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v5

    invoke-virtual {v5, v8}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->saveWithNoChanges(Z)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v5

    invoke-virtual {v5, v8}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->withAutoColorEnabled(Z)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v5

    invoke-virtual {v5, v9}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->withOutputQuality(I)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v5

    invoke-virtual {v5, v8}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->withVibrationEnabled(Z)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->build()Landroid/content/Intent;

    move-result-object v3

    .line 204
    .local v3, "newIntent":Landroid/content/Intent;
    invoke-virtual {p0, v3, v9}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 205
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 10
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 209
    const/4 v2, -0x1

    if-ne p2, v2, :cond_8

    .line 210
    packed-switch p1, :pswitch_data_2e

    .line 220
    :cond_8
    :goto_8
    return-void

    .line 212
    :pswitch_9
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 213
    .local v0, "aviaryImageUri":Landroid/net/Uri;
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 214
    .local v1, "aviaryPath":Ljava/lang/String;
    new-array v2, v3, [Ljava/lang/String;

    aput-object v1, v2, v5

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "image/jpeg"

    aput-object v4, v3, v5

    const/4 v4, 0x0

    invoke-static {p0, v2, v3, v4}, Landroid/media/MediaScannerConnection;->scanFile(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V

    .line 216
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "Image Saved in \"Pencil_Sketch\" Folder!"

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_8

    .line 210
    nop

    :pswitch_data_2e
    .packed-switch 0x64
        :pswitch_9
    .end packed-switch
.end method

.method public onBackPressed()V
    .registers 3

    .prologue
    .line 340
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->files_to_delete:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_17

    .line 342
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->files_to_delete:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 340
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 346
    :cond_17
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->grayscaleBaseLayer:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_20

    .line 348
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->grayscaleBaseLayer:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 350
    :cond_20
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->hsvPixelsOriginal:[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;

    .line 352
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 353
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 16
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const v13, 0x7f0f00b1

    const v12, 0x7f0f00b0

    const/4 v11, 0x0

    const/4 v10, 0x0

    .line 122
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v8

    packed-switch v8, :pswitch_data_e0

    .line 182
    :cond_f
    :goto_f
    :pswitch_f
    return-void

    .line 125
    :pswitch_10
    iget-object v8, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->bitmapView:Landroid/widget/ImageView;

    invoke-virtual {v8}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    check-cast v8, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v8}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v8

    sput-object v8, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->original:Landroid/graphics/Bitmap;

    .line 126
    new-instance v4, Landroid/content/Intent;

    const-class v8, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;

    invoke-direct {v4, p0, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 127
    .local v4, "frameIntent":Landroid/content/Intent;
    invoke-virtual {p0, v4}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_f

    .line 130
    .end local v4    # "frameIntent":Landroid/content/Intent;
    :pswitch_29
    iget-object v8, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->progress_dialog:Landroid/app/ProgressDialog;

    const-string v9, "Black-White Sketching..."

    invoke-virtual {v8, v9}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 132
    iget-object v8, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->sketch_option:Landroid/widget/RadioGroup;

    invoke-virtual {v8}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v8

    if-ne v8, v12, :cond_43

    .line 133
    new-instance v5, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$GrayscaleSketchTask;

    invoke-direct {v5, p0, v10}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$GrayscaleSketchTask;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;)V

    .line 141
    .local v5, "grayscaleTask":Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;
    :goto_3d
    new-array v8, v11, [Ljava/lang/Void;

    invoke-virtual {v5, v8}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_f

    .line 135
    .end local v5    # "grayscaleTask":Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;
    :cond_43
    iget-object v8, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->sketch_option:Landroid/widget/RadioGroup;

    invoke-virtual {v8}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v8

    if-ne v8, v13, :cond_51

    .line 136
    new-instance v5, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$GrayscaleDoodleTask;

    invoke-direct {v5, p0, v10}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$GrayscaleDoodleTask;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;)V

    .restart local v5    # "grayscaleTask":Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;
    goto :goto_3d

    .line 139
    .end local v5    # "grayscaleTask":Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;
    :cond_51
    new-instance v5, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$GrayscaleCrossHatchTask;

    invoke-direct {v5, p0, v10}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$GrayscaleCrossHatchTask;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;)V

    .restart local v5    # "grayscaleTask":Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;
    goto :goto_3d

    .line 144
    .end local v5    # "grayscaleTask":Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;
    :pswitch_57
    iget-object v8, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->progress_dialog:Landroid/app/ProgressDialog;

    const-string v9, "Color Sketching..."

    invoke-virtual {v8, v9}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 146
    iget-object v8, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->sketch_option:Landroid/widget/RadioGroup;

    invoke-virtual {v8}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v8

    if-ne v8, v12, :cond_71

    .line 147
    new-instance v3, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorSketchTask;

    invoke-direct {v3, p0, v10}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorSketchTask;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;)V

    .line 155
    .local v3, "colorTask":Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;
    :goto_6b
    new-array v8, v11, [Ljava/lang/Void;

    invoke-virtual {v3, v8}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_f

    .line 149
    .end local v3    # "colorTask":Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;
    :cond_71
    iget-object v8, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->sketch_option:Landroid/widget/RadioGroup;

    invoke-virtual {v8}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v8

    if-ne v8, v13, :cond_7f

    .line 150
    new-instance v3, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorDoodleTask;

    invoke-direct {v3, p0, v10}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorDoodleTask;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;)V

    .restart local v3    # "colorTask":Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;
    goto :goto_6b

    .line 153
    .end local v3    # "colorTask":Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;
    :cond_7f
    new-instance v3, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorCrossHatchTask;

    invoke-direct {v3, p0, v10}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorCrossHatchTask;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;)V

    .restart local v3    # "colorTask":Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;
    goto :goto_6b

    .line 158
    .end local v3    # "colorTask":Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;
    :pswitch_85
    iget-object v8, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->bitmapView:Landroid/widget/ImageView;

    invoke-virtual {v8}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    check-cast v8, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v8}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 159
    .local v0, "bitmapForEdit":Landroid/graphics/Bitmap;
    invoke-static {p0, v0, v11}, Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;->saveImageOnPhone(Landroid/content/Context;Landroid/graphics/Bitmap;Z)Ljava/io/File;

    move-result-object v6

    .line 160
    .local v6, "temporaryEditFile":Ljava/io/File;
    if-eqz v6, :cond_f

    .line 162
    iget-object v8, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->files_to_delete:Ljava/util/ArrayList;

    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    invoke-static {v6}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->launchAviarySDK(Landroid/net/Uri;)V

    goto/16 :goto_f

    .line 167
    .end local v0    # "bitmapForEdit":Landroid/graphics/Bitmap;
    .end local v6    # "temporaryEditFile":Ljava/io/File;
    :pswitch_a5
    iget-object v8, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->bitmapView:Landroid/widget/ImageView;

    invoke-virtual {v8}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    check-cast v8, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v8}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 168
    .local v1, "bitmapToSave":Landroid/graphics/Bitmap;
    const/4 v8, 0x1

    invoke-static {p0, v1, v8}, Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;->saveImageOnPhone(Landroid/content/Context;Landroid/graphics/Bitmap;Z)Ljava/io/File;

    move-result-object v8

    if-eqz v8, :cond_f

    .line 170
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v8

    const-string v9, "Image Saved in \"Pencil_Sketch\" Folder!"

    invoke-static {v8, v9, v11}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    goto/16 :goto_f

    .line 174
    .end local v1    # "bitmapToSave":Landroid/graphics/Bitmap;
    :pswitch_c7
    iget-object v8, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->bitmapView:Landroid/widget/ImageView;

    invoke-virtual {v8}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    check-cast v8, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v8}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    .line 175
    .local v2, "bitmapToShare":Landroid/graphics/Bitmap;
    invoke-static {p0, v2}, Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;->shareImage(Landroid/content/Context;Landroid/graphics/Bitmap;)Ljava/io/File;

    move-result-object v7

    .line 176
    .local v7, "temporatyShareFile":Ljava/io/File;
    if-eqz v7, :cond_f

    .line 178
    iget-object v8, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->files_to_delete:Ljava/util/ArrayList;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_f

    .line 122
    :pswitch_data_e0
    .packed-switch 0x7f0f00ae
        :pswitch_10
        :pswitch_f
        :pswitch_f
        :pswitch_f
        :pswitch_f
        :pswitch_f
        :pswitch_f
        :pswitch_f
        :pswitch_29
        :pswitch_57
        :pswitch_85
        :pswitch_a5
        :pswitch_c7
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v1, 0x1

    .line 57
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 58
    invoke-virtual {p0, v1}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->requestWindowFeature(I)Z

    .line 59
    const v0, 0x7f030021

    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->setContentView(I)V

    .line 61
    sget-object v0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->original:Landroid/graphics/Bitmap;

    if-nez v0, :cond_1e

    .line 63
    const-string v0, "Error when loading this photo. If the image was from cloud storage, please make sure you have network connected."

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 64
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->finish()V

    .line 87
    :cond_1d
    :goto_1d
    return-void

    .line 69
    :cond_1e
    invoke-direct {p0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->initializeAdmobBanner()V

    .line 72
    invoke-direct {p0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->initializeAviaryEditor()V

    .line 74
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->files_to_delete:Ljava/util/ArrayList;

    .line 75
    const v0, 0x7f0f00af

    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioGroup;

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->sketch_option:Landroid/widget/RadioGroup;

    .line 76
    const-string v0, "Sketching..."

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/dumplingsandwich/pencilsketch/utils/UIUtils;->getLoadingIndicator(Landroid/content/Context;Ljava/lang/String;Z)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->progress_dialog:Landroid/app/ProgressDialog;

    .line 79
    const v0, 0x7f0f00b4

    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->bitmapView:Landroid/widget/ImageView;

    .line 80
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->bitmapView:Landroid/widget/ImageView;

    sget-object v1, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->original:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 82
    invoke-static {}, Lcom/dumplingsandwich/pencilsketch/ads/AdmobInterstitialUtils;->isAdmobInterstitialReady()Z

    move-result v0

    if-eqz v0, :cond_5b

    .line 83
    invoke-static {}, Lcom/dumplingsandwich/pencilsketch/ads/AdmobInterstitialUtils;->displayAdmobInterstitial()V

    goto :goto_1d

    .line 84
    :cond_5b
    invoke-static {}, Lcom/dumplingsandwich/pencilsketch/ads/FacebookInterstitialUtils;->isFacebookInterstitialReady()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 85
    invoke-static {}, Lcom/dumplingsandwich/pencilsketch/ads/FacebookInterstitialUtils;->displayFacebookInterstitialAd()V

    goto :goto_1d
.end method

.method protected onResume()V
    .registers 3

    .prologue
    .line 91
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 93
    sget-object v0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->original:Landroid/graphics/Bitmap;

    if-nez v0, :cond_14

    .line 94
    const-string v0, "Please pick a photo"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 95
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->finish()V

    .line 97
    :cond_14
    return-void
.end method
