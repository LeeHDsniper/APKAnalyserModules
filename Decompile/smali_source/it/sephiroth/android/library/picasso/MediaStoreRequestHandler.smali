.class Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler;
.super Lit/sephiroth/android/library/picasso/ContentStreamRequestHandler;
.source "MediaStoreRequestHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;
    }
.end annotation


# static fields
.field private static final CONTENT_ORIENTATION:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 39
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "orientation"

    aput-object v2, v0, v1

    sput-object v0, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler;->CONTENT_ORIENTATION:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/picasso/ContentStreamRequestHandler;-><init>(Landroid/content/Context;)V

    .line 45
    return-void
.end method

.method static getExifOrientation(Landroid/content/ContentResolver;Landroid/net/Uri;)I
    .registers 11
    .param p0, "contentResolver"    # Landroid/content/ContentResolver;
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v8, 0x0

    .line 105
    const/4 v6, 0x0

    .line 107
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_2
    sget-object v2, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler;->CONTENT_ORIENTATION:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 108
    if-eqz v6, :cond_15

    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_12
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_12} :catch_27
    .catchall {:try_start_2 .. :try_end_12} :catchall_2f

    move-result v0

    if-nez v0, :cond_1c

    .line 116
    :cond_15
    if-eqz v6, :cond_1a

    .line 117
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_1a
    move v0, v8

    :cond_1b
    :goto_1b
    return v0

    .line 111
    :cond_1c
    const/4 v0, 0x0

    :try_start_1d
    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_20
    .catch Ljava/lang/RuntimeException; {:try_start_1d .. :try_end_20} :catch_27
    .catchall {:try_start_1d .. :try_end_20} :catchall_2f

    move-result v0

    .line 116
    if-eqz v6, :cond_1b

    .line 117
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_1b

    .line 112
    :catch_27
    move-exception v7

    .line 116
    .local v7, "ignored":Ljava/lang/RuntimeException;
    if-eqz v6, :cond_2d

    .line 117
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_2d
    move v0, v8

    goto :goto_1b

    .line 116
    .end local v7    # "ignored":Ljava/lang/RuntimeException;
    :catchall_2f
    move-exception v0

    if-eqz v6, :cond_35

    .line 117
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_35
    throw v0
.end method

.method static getPicassoKind(II)Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;
    .registers 3
    .param p0, "targetWidth"    # I
    .param p1, "targetHeight"    # I

    .prologue
    .line 96
    sget-object v0, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;->MICRO:Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;

    iget v0, v0, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;->width:I

    if-gt p0, v0, :cond_f

    sget-object v0, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;->MICRO:Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;

    iget v0, v0, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;->height:I

    if-gt p1, v0, :cond_f

    .line 97
    sget-object v0, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;->MICRO:Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;

    .line 101
    :goto_e
    return-object v0

    .line 98
    :cond_f
    sget-object v0, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;->MINI:Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;

    iget v0, v0, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;->width:I

    if-gt p0, v0, :cond_1e

    sget-object v0, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;->MINI:Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;

    iget v0, v0, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;->height:I

    if-gt p1, v0, :cond_1e

    .line 99
    sget-object v0, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;->MINI:Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;

    goto :goto_e

    .line 101
    :cond_1e
    sget-object v0, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;->FULL:Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;

    goto :goto_e
.end method


# virtual methods
.method public canHandleRequest(Lit/sephiroth/android/library/picasso/Request;)Z
    .registers 5
    .param p1, "data"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    .line 48
    iget-object v0, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    .line 49
    .local v0, "uri":Landroid/net/Uri;
    const-string v1, "content"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    const-string v1, "media"

    .line 50
    invoke-virtual {v0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    const/4 v1, 0x1

    :goto_1b
    return v1

    :cond_1c
    const/4 v1, 0x0

    goto :goto_1b
.end method

.method public load(Lit/sephiroth/android/library/picasso/Request;I)Lit/sephiroth/android/library/picasso/RequestHandler$Result;
    .registers 20
    .param p1, "request"    # Lit/sephiroth/android/library/picasso/Request;
    .param p2, "networkPolicy"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    move-object/from16 v0, p0

    iget-object v2, v0, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    .line 55
    .local v9, "contentResolver":Landroid/content/ContentResolver;
    move-object/from16 v0, p1

    iget-object v2, v0, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-static {v9, v2}, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler;->getExifOrientation(Landroid/content/ContentResolver;Landroid/net/Uri;)I

    move-result v10

    .line 57
    .local v10, "exifOrientation":I
    move-object/from16 v0, p1

    iget-object v2, v0, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v9, v2}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v15

    .line 58
    .local v15, "mimeType":Ljava/lang/String;
    if-eqz v15, :cond_50

    const-string v2, "video/"

    invoke-virtual {v15, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_50

    const/4 v11, 0x1

    .line 60
    .local v11, "isVideo":Z
    :goto_23
    invoke-virtual/range {p1 .. p1}, Lit/sephiroth/android/library/picasso/Request;->hasSize()Z

    move-result v2

    if-eqz v2, :cond_a1

    .line 61
    move-object/from16 v0, p1

    iget v3, v0, Lit/sephiroth/android/library/picasso/Request;->targetWidth:I

    move-object/from16 v0, p1

    iget-boolean v2, v0, Lit/sephiroth/android/library/picasso/Request;->resizeByMaxSide:Z

    if-eqz v2, :cond_52

    move-object/from16 v0, p1

    iget v2, v0, Lit/sephiroth/android/library/picasso/Request;->targetWidth:I

    :goto_37
    invoke-static {v3, v2}, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler;->getPicassoKind(II)Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;

    move-result-object v16

    .line 63
    .local v16, "picassoKind":Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;
    if-nez v11, :cond_57

    sget-object v2, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;->FULL:Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;

    move-object/from16 v0, v16

    if-ne v0, v2, :cond_57

    .line 64
    new-instance v2, Lit/sephiroth/android/library/picasso/RequestHandler$Result;

    const/4 v3, 0x0

    invoke-virtual/range {p0 .. p1}, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler;->getInputStream(Lit/sephiroth/android/library/picasso/Request;)Ljava/io/InputStream;

    move-result-object v4

    sget-object v5, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->DISK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    invoke-direct {v2, v3, v4, v5, v10}, Lit/sephiroth/android/library/picasso/RequestHandler$Result;-><init>(Landroid/graphics/Bitmap;Ljava/io/InputStream;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;I)V

    .line 92
    .end local v16    # "picassoKind":Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;
    :goto_4f
    return-object v2

    .line 58
    .end local v11    # "isVideo":Z
    :cond_50
    const/4 v11, 0x0

    goto :goto_23

    .line 61
    .restart local v11    # "isVideo":Z
    :cond_52
    move-object/from16 v0, p1

    iget v2, v0, Lit/sephiroth/android/library/picasso/Request;->targetHeight:I

    goto :goto_37

    .line 67
    .restart local v16    # "picassoKind":Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;
    :cond_57
    move-object/from16 v0, p1

    iget-object v2, v0, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-static {v2}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v12

    .line 69
    .local v12, "id":J
    invoke-static/range {p1 .. p1}, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler;->createBitmapOptions(Lit/sephiroth/android/library/picasso/Request;)Landroid/graphics/BitmapFactory$Options;

    move-result-object v6

    .line 70
    .local v6, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v2, 0x1

    iput-boolean v2, v6, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 72
    move-object/from16 v0, p1

    iget v2, v0, Lit/sephiroth/android/library/picasso/Request;->targetWidth:I

    move-object/from16 v0, p1

    iget v3, v0, Lit/sephiroth/android/library/picasso/Request;->targetHeight:I

    move-object/from16 v0, v16

    iget v4, v0, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;->width:I

    move-object/from16 v0, v16

    iget v5, v0, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;->height:I

    move-object/from16 v7, p1

    invoke-static/range {v2 .. v7}, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler;->calculateInSampleSize(IIIILandroid/graphics/BitmapFactory$Options;Lit/sephiroth/android/library/picasso/Request;)V

    .line 77
    if-eqz v11, :cond_98

    .line 80
    sget-object v2, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;->FULL:Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;

    move-object/from16 v0, v16

    if-ne v0, v2, :cond_93

    const/4 v14, 0x1

    .line 81
    .local v14, "kind":I
    :goto_84
    invoke-static {v9, v12, v13, v14, v6}, Landroid/provider/MediaStore$Video$Thumbnails;->getThumbnail(Landroid/content/ContentResolver;JILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v8

    .line 87
    .end local v14    # "kind":I
    .local v8, "bitmap":Landroid/graphics/Bitmap;
    :goto_88
    if-eqz v8, :cond_a1

    .line 88
    new-instance v2, Lit/sephiroth/android/library/picasso/RequestHandler$Result;

    const/4 v3, 0x0

    sget-object v4, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->DISK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    invoke-direct {v2, v8, v3, v4, v10}, Lit/sephiroth/android/library/picasso/RequestHandler$Result;-><init>(Landroid/graphics/Bitmap;Ljava/io/InputStream;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;I)V

    goto :goto_4f

    .line 80
    .end local v8    # "bitmap":Landroid/graphics/Bitmap;
    :cond_93
    move-object/from16 v0, v16

    iget v14, v0, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;->androidKind:I

    goto :goto_84

    .line 83
    :cond_98
    move-object/from16 v0, v16

    iget v2, v0, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;->androidKind:I

    .line 84
    invoke-static {v9, v12, v13, v2, v6}, Landroid/provider/MediaStore$Images$Thumbnails;->getThumbnail(Landroid/content/ContentResolver;JILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v8

    .restart local v8    # "bitmap":Landroid/graphics/Bitmap;
    goto :goto_88

    .line 92
    .end local v6    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v8    # "bitmap":Landroid/graphics/Bitmap;
    .end local v12    # "id":J
    .end local v16    # "picassoKind":Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler$PicassoKind;
    :cond_a1
    new-instance v2, Lit/sephiroth/android/library/picasso/RequestHandler$Result;

    const/4 v3, 0x0

    invoke-virtual/range {p0 .. p1}, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler;->getInputStream(Lit/sephiroth/android/library/picasso/Request;)Ljava/io/InputStream;

    move-result-object v4

    sget-object v5, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->DISK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    invoke-direct {v2, v3, v4, v5, v10}, Lit/sephiroth/android/library/picasso/RequestHandler$Result;-><init>(Landroid/graphics/Bitmap;Ljava/io/InputStream;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;I)V

    goto :goto_4f
.end method
