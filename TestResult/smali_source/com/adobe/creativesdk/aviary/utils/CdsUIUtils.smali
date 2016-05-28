.class public final Lcom/adobe/creativesdk/aviary/utils/CdsUIUtils;
.super Ljava/lang/Object;
.source "CdsUIUtils.java"


# static fields
.field static sPackTypeStringMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 18
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/utils/CdsUIUtils;->sPackTypeStringMap:Ljava/util/HashMap;

    return-void
.end method

.method public static computePreviewAspectRatio(Landroid/content/Context;JLjava/lang/String;Ljava/lang/String;[D)Landroid/database/Cursor;
    .registers 23
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packId"    # J
    .param p3, "packType"    # Ljava/lang/String;
    .param p4, "packPreviewPath"    # Ljava/lang/String;
    .param p5, "outAspectRatio"    # [D

    .prologue
    .line 68
    if-nez p0, :cond_4

    .line 69
    const/4 v8, 0x0

    .line 107
    :goto_3
    return-object v8

    .line 71
    :cond_4
    if-eqz p5, :cond_c

    move-object/from16 v0, p5

    array-length v2, v0

    const/4 v3, 0x1

    if-ge v2, v3, :cond_e

    .line 72
    :cond_c
    const/4 v8, 0x0

    goto :goto_3

    .line 75
    :cond_e
    const-wide/high16 v14, 0x3ff0000000000000L

    .line 77
    .local v14, "previewAspectRatio":D
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "pack/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, p1

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/item/list"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 79
    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "item_id as _id"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "pack_type"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "item_id"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "item_identifier"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string v6, "item_displayName"

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 78
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 84
    .local v8, "cursor":Landroid/database/Cursor;
    if-eqz v8, :cond_9f

    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_9f

    .line 85
    const-string v2, "item_identifier"

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 86
    .local v11, "identifier":Ljava/lang/String;
    new-instance v9, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static/range {p3 .. p3}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds;->getPreviewItemExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-direct {v9, v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .local v9, "file":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    .line 89
    .local v13, "path":Ljava/lang/String;
    new-instance v12, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v12}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 90
    .local v12, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v2, 0x1

    iput-boolean v2, v12, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 91
    invoke-static {v13, v12}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 93
    iget v2, v12, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-eqz v2, :cond_9d

    iget v2, v12, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-nez v2, :cond_a4

    .line 94
    :cond_9d
    const-wide/high16 v14, 0x3ff0000000000000L

    .line 106
    .end local v9    # "file":Ljava/io/File;
    .end local v11    # "identifier":Ljava/lang/String;
    .end local v12    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v13    # "path":Ljava/lang/String;
    :cond_9f
    :goto_9f
    const/4 v2, 0x0

    aput-wide v14, p5, v2

    goto/16 :goto_3

    .line 96
    .restart local v9    # "file":Ljava/io/File;
    .restart local v11    # "identifier":Ljava/lang/String;
    .restart local v12    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v13    # "path":Ljava/lang/String;
    :cond_a4
    const-string v2, "effect"

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_bd

    .line 97
    iget v2, v12, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    int-to-float v2, v2

    const v3, 0x3f5d70a4

    mul-float v10, v2, v3

    .line 98
    .local v10, "finalHeight":F
    iget v2, v12, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    int-to-double v2, v2

    float-to-double v4, v10

    div-double v14, v2, v4

    .line 100
    goto :goto_9f

    .line 101
    .end local v10    # "finalHeight":F
    :cond_bd
    iget v2, v12, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    int-to-double v2, v2

    iget v4, v12, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    int-to-double v4, v4

    div-double v14, v2, v4

    goto :goto_9f
.end method
