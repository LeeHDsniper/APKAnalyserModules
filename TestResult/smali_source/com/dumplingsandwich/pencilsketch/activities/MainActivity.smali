.class public Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# instance fields
.field private mImageCaptureUri:Landroid/net/Uri;

.field private savedInstanceState:Landroid/os/Bundle;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private decodeCapturedImage(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 8
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 144
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v5

    invoke-interface {v5}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 145
    .local v0, "display":Landroid/view/Display;
    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3}, Landroid/graphics/Point;-><init>()V

    .line 146
    .local v3, "size":Landroid/graphics/Point;
    invoke-virtual {v0, v3}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 147
    iget v4, v3, Landroid/graphics/Point;->x:I

    .line 148
    .local v4, "width":I
    iget v1, v3, Landroid/graphics/Point;->y:I

    .line 150
    .local v1, "height":I
    const/4 v2, 0x0

    .line 151
    .local v2, "result":Landroid/graphics/Bitmap;
    if-eqz p1, :cond_1f

    .line 153
    invoke-static {p0, p1, v4, v1}, Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;->decodeBitmapFile(Landroid/content/Context;Ljava/lang/String;II)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 154
    invoke-static {v2, v4, v1}, Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;->scaleBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 157
    :cond_1f
    return-object v2
.end method

.method private decodeSelectedImage(Landroid/content/Intent;)Landroid/graphics/Bitmap;
    .registers 16
    .param p1, "data"    # Landroid/content/Intent;

    .prologue
    .line 161
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v7

    .line 162
    .local v7, "display":Landroid/view/Display;
    new-instance v12, Landroid/graphics/Point;

    invoke-direct {v12}, Landroid/graphics/Point;-><init>()V

    .line 163
    .local v12, "size":Landroid/graphics/Point;
    invoke-virtual {v7, v12}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 164
    iget v13, v12, Landroid/graphics/Point;->x:I

    .line 165
    .local v13, "width":I
    iget v9, v12, Landroid/graphics/Point;->y:I

    .line 168
    .local v9, "height":I
    invoke-static {p0, p1, v13, v9}, Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;->decodeBitmapStream(Landroid/content/Context;Landroid/content/Intent;II)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 169
    .local v0, "result":Landroid/graphics/Bitmap;
    invoke-static {v0, v13, v9}, Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;->scaleBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 172
    const/4 v10, 0x0

    .line 173
    .local v10, "path":Ljava/lang/String;
    if-eqz v0, :cond_53

    .line 176
    :try_start_1f
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    iput-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->mImageCaptureUri:Landroid/net/Uri;

    .line 177
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->mImageCaptureUri:Landroid/net/Uri;

    invoke-virtual {p0, v1}, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->getRealPathFromURI(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v10

    .line 179
    if-nez v10, :cond_33

    .line 180
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->mImageCaptureUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v10

    .line 182
    :cond_33
    if-eqz v10, :cond_53

    .line 184
    invoke-static {v10}, Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;->necessaryRotation(Ljava/lang/String;)I

    move-result v11

    .line 185
    .local v11, "rotation":I
    if-eqz v11, :cond_53

    .line 187
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 188
    .local v5, "matrix":Landroid/graphics/Matrix;
    int-to-float v1, v11

    invoke-virtual {v5, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 189
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_52} :catch_54

    move-result-object v0

    .line 199
    .end local v5    # "matrix":Landroid/graphics/Matrix;
    .end local v11    # "rotation":I
    :cond_53
    :goto_53
    return-object v0

    .line 193
    :catch_54
    move-exception v8

    .line 195
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_53
.end method


# virtual methods
.method public getRealPathFromURI(Landroid/net/Uri;)Ljava/lang/String;
    .registers 10
    .param p1, "contentUri"    # Landroid/net/Uri;

    .prologue
    const/4 v3, 0x0

    .line 115
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_data"

    aput-object v1, v2, v0

    .line 116
    .local v2, "proj":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    move-object v1, p1

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 118
    .local v7, "cursor":Landroid/database/Cursor;
    if-nez v7, :cond_17

    .line 123
    :goto_16
    return-object v3

    .line 119
    :cond_17
    const-string v0, "_data"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    .line 121
    .local v6, "column_index":I
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 123
    invoke-interface {v7, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_16
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 11
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v6, 0x1

    .line 78
    const/4 v4, -0x1

    if-eq p2, v4, :cond_5

    .line 112
    :goto_4
    return-void

    .line 81
    :cond_5
    const/4 v1, 0x0

    .line 82
    .local v1, "image":Landroid/graphics/Bitmap;
    if-ne p1, v6, :cond_18

    .line 84
    invoke-direct {p0, p3}, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->decodeSelectedImage(Landroid/content/Intent;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 97
    :cond_c
    :goto_c
    if-nez v1, :cond_33

    .line 98
    const-string v4, "Error when loading this photo. If the image was from cloud storage, please make sure you have network connected."

    invoke-static {p0, v4, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_4

    .line 86
    :cond_18
    const/4 v4, 0x2

    if-ne p1, v4, :cond_c

    .line 89
    iget-object v4, p0, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->mImageCaptureUri:Landroid/net/Uri;

    if-eqz v4, :cond_2a

    .line 90
    iget-object v4, p0, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->mImageCaptureUri:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 94
    .local v3, "path":Ljava/lang/String;
    :goto_25
    invoke-direct {p0, v3}, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->decodeCapturedImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_c

    .line 92
    .end local v3    # "path":Ljava/lang/String;
    :cond_2a
    iget-object v4, p0, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->savedInstanceState:Landroid/os/Bundle;

    const-string v5, "PATH"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "path":Ljava/lang/String;
    goto :goto_25

    .line 102
    .end local v3    # "path":Ljava/lang/String;
    :cond_33
    :try_start_33
    sput-object v1, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->current:Landroid/graphics/Bitmap;

    .line 104
    new-instance v2, Landroid/content/Intent;

    const-class v4, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;

    invoke-direct {v2, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 105
    .local v2, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v2}, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_3f} :catch_40

    goto :goto_4

    .line 107
    .end local v2    # "intent":Landroid/content/Intent;
    :catch_40
    move-exception v0

    .line 109
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "Error when loading this photo. If the image was from cloud storage, please make sure you have network connected."

    invoke-static {p0, v4, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_4
.end method

.method public onClick(Landroid/view/View;)V
    .registers 12
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v7, 0x1

    .line 41
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v6

    packed-switch v6, :pswitch_data_8c

    .line 74
    :goto_8
    return-void

    .line 44
    :pswitch_9
    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    .line 45
    .local v5, "intent":Landroid/content/Intent;
    const-string v6, "image/*"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 46
    const-string v6, "android.intent.action.GET_CONTENT"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    const-string v6, "android.intent.category.OPENABLE"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 48
    const-string v6, "Complete action using"

    invoke-static {v5, v6}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {p0, v6, v7}, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_8

    .line 51
    .end local v5    # "intent":Landroid/content/Intent;
    :pswitch_27
    new-instance v0, Landroid/content/Intent;

    const-string v6, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v0, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 53
    .local v0, "camera_intent":Landroid/content/Intent;
    new-instance v3, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "capture_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".jpg"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 55
    .local v3, "file":Ljava/io/File;
    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v6

    iput-object v6, p0, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->mImageCaptureUri:Landroid/net/Uri;

    .line 58
    :try_start_5e
    const-string v6, "output"

    iget-object v7, p0, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->mImageCaptureUri:Landroid/net/Uri;

    invoke-virtual {v0, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 59
    const-string v6, "return-data"

    const/4 v7, 0x1

    invoke-virtual {v0, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 60
    const/4 v6, 0x2

    invoke-virtual {p0, v0, v6}, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_5e .. :try_end_6f} :catch_70

    goto :goto_8

    .line 61
    :catch_70
    move-exception v2

    .line 62
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_8

    .line 66
    .end local v0    # "camera_intent":Landroid/content/Intent;
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "file":Ljava/io/File;
    :pswitch_75
    new-instance v1, Landroid/content/Intent;

    const-class v6, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;

    invoke-direct {v1, p0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 67
    .local v1, "canvasIntent":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_8

    .line 70
    .end local v1    # "canvasIntent":Landroid/content/Intent;
    :pswitch_80
    new-instance v4, Landroid/content/Intent;

    const-class v6, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;

    invoke-direct {v4, p0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 71
    .local v4, "infoIntent":Landroid/content/Intent;
    invoke-virtual {p0, v4}, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_8

    .line 41
    :pswitch_data_8c
    .packed-switch 0x7f0f00c5
        :pswitch_9
        :pswitch_27
        :pswitch_75
        :pswitch_80
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 34
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 35
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->requestWindowFeature(I)Z

    .line 36
    const v0, 0x7f030024

    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->setContentView(I)V

    .line 37
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 139
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 140
    iput-object p1, p0, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->savedInstanceState:Landroid/os/Bundle;

    .line 141
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 129
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->mImageCaptureUri:Landroid/net/Uri;

    if-eqz v0, :cond_f

    .line 131
    const-string v0, "PATH"

    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;->mImageCaptureUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    :cond_f
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 134
    return-void
.end method
