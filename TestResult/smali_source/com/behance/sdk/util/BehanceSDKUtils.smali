.class public Lcom/behance/sdk/util/BehanceSDKUtils;
.super Ljava/lang/Object;
.source "BehanceSDKUtils.java"


# static fields
.field private static allowedFileExtensionsForProfileImage:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static allowedFileExtensionsForProjectImages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static allowedFileExtensionsForWIPImage:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static restrictedCharForTagList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static addImageToGallery(Landroid/content/Context;Ljava/lang/String;)V
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 130
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 131
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "datetaken"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 132
    const-string v1, "mime_type"

    const-string v2, "image/jpeg"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    const-string v1, "_data"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 135
    return-void
.end method

.method public static cleanUpTagsString(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p0, "tagsString"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 223
    const/4 v6, 0x1

    new-array v3, v6, [Ljava/lang/String;

    const-string v6, "FF0C"

    aput-object v6, v3, v5

    .line 224
    .local v3, "commasArray":[Ljava/lang/String;
    const-string v4, ""

    .line 225
    .local v4, "finalStr":Ljava/lang/String;
    array-length v6, v3

    :goto_b
    if-ge v5, v6, :cond_23

    aget-object v2, v3, v5

    .line 226
    .local v2, "commaUnicode":Ljava/lang/String;
    const/16 v7, 0x10

    invoke-static {v2, v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v7

    int-to-char v0, v7

    .line 227
    .local v0, "commaChar":C
    invoke-static {v0}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object v1

    .line 228
    .local v1, "commaStr":Ljava/lang/String;
    const-string v7, ","

    invoke-virtual {p0, v1, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 225
    add-int/lit8 v5, v5, 0x1

    goto :goto_b

    .line 230
    .end local v0    # "commaChar":C
    .end local v1    # "commaStr":Ljava/lang/String;
    .end local v2    # "commaUnicode":Ljava/lang/String;
    :cond_23
    return-object v4
.end method

.method public static createTempImageFile()Ljava/io/File;
    .registers 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SimpleDateFormat"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyyMMdd_HHmmss"

    invoke-direct {v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v4, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    .line 63
    .local v3, "timeStamp":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "JPEG_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 64
    .local v1, "imageFileName":Ljava/lang/String;
    sget-object v4, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    invoke-static {v4}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 65
    .local v2, "storageDir":Ljava/io/File;
    const-string v4, ".jpg"

    invoke-static {v1, v4, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    .line 69
    .local v0, "image":Ljava/io/File;
    return-object v0
.end method

.method public static deleteRecursive(Ljava/io/File;)V
    .registers 5
    .param p0, "fileOrDirectory"    # Ljava/io/File;

    .prologue
    .line 359
    if-eqz p0, :cond_21

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_21

    .line 360
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 361
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_14
    if-ge v1, v3, :cond_1e

    aget-object v0, v2, v1

    .line 362
    .local v0, "child":Ljava/io/File;
    invoke-static {v0}, Lcom/behance/sdk/util/BehanceSDKUtils;->deleteRecursive(Ljava/io/File;)V

    .line 361
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 365
    .end local v0    # "child":Ljava/io/File;
    :cond_1e
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 367
    :cond_21
    return-void
.end method

.method public static getAdobeAssetMimeTypes(Ljava/util/List;)Ljava/util/EnumSet;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;",
            ">;"
        }
    .end annotation

    .prologue
    .line 205
    .local p0, "fileExtentions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p0, :cond_58

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_58

    .line 206
    new-instance v0, Ljava/util/HashSet;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/HashSet;-><init>(I)V

    .line 207
    .local v0, "enumSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_15
    :goto_15
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_53

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 208
    .local v1, "extention":Ljava/lang/String;
    const-string v3, "jpg"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_31

    const-string v3, "jpeg"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_37

    .line 209
    :cond_31
    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_JPEG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_15

    .line 210
    :cond_37
    const-string v3, "png"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_45

    .line 211
    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_15

    .line 212
    :cond_45
    const-string v3, "gif"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 213
    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_GIF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_15

    .line 216
    .end local v1    # "extention":Ljava/lang/String;
    :cond_53
    invoke-static {v0}, Ljava/util/EnumSet;->copyOf(Ljava/util/Collection;)Ljava/util/EnumSet;

    move-result-object v2

    .line 218
    .end local v0    # "enumSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;>;"
    :goto_57
    return-object v2

    :cond_58
    const/4 v2, 0x0

    goto :goto_57
.end method

.method public static getAllowedFileExtensionsForProfileImage()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 190
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProfileImage:Ljava/util/ArrayList;

    if-nez v0, :cond_43

    .line 191
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProfileImage:Ljava/util/ArrayList;

    .line 192
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProfileImage:Ljava/util/ArrayList;

    const-string v1, "jpg"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 193
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProfileImage:Ljava/util/ArrayList;

    const-string v1, "JPG"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 194
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProfileImage:Ljava/util/ArrayList;

    const-string v1, "jpeg"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 195
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProfileImage:Ljava/util/ArrayList;

    const-string v1, "JPEG"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 196
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProfileImage:Ljava/util/ArrayList;

    const-string v1, "png"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 197
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProfileImage:Ljava/util/ArrayList;

    const-string v1, "PNG"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 198
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProfileImage:Ljava/util/ArrayList;

    const-string v1, "gif"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 199
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProfileImage:Ljava/util/ArrayList;

    const-string v1, "GIF"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 201
    :cond_43
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProfileImage:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static getAllowedFileExtensionsForProjectImage()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 156
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProjectImages:Ljava/util/ArrayList;

    if-nez v0, :cond_43

    .line 157
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProjectImages:Ljava/util/ArrayList;

    .line 158
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProjectImages:Ljava/util/ArrayList;

    const-string v1, "jpg"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 159
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProjectImages:Ljava/util/ArrayList;

    const-string v1, "JPG"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 160
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProjectImages:Ljava/util/ArrayList;

    const-string v1, "jpeg"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 161
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProjectImages:Ljava/util/ArrayList;

    const-string v1, "JPEG"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 162
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProjectImages:Ljava/util/ArrayList;

    const-string v1, "png"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProjectImages:Ljava/util/ArrayList;

    const-string v1, "PNG"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 164
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProjectImages:Ljava/util/ArrayList;

    const-string v1, "gif"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 165
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProjectImages:Ljava/util/ArrayList;

    const-string v1, "GIF"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    :cond_43
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForProjectImages:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static getAllowedFileExtensionsForWIPImage()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 173
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForWIPImage:Ljava/util/ArrayList;

    if-nez v0, :cond_43

    .line 174
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForWIPImage:Ljava/util/ArrayList;

    .line 175
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForWIPImage:Ljava/util/ArrayList;

    const-string v1, "jpg"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 176
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForWIPImage:Ljava/util/ArrayList;

    const-string v1, "JPG"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 177
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForWIPImage:Ljava/util/ArrayList;

    const-string v1, "jpeg"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 178
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForWIPImage:Ljava/util/ArrayList;

    const-string v1, "JPEG"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForWIPImage:Ljava/util/ArrayList;

    const-string v1, "png"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 180
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForWIPImage:Ljava/util/ArrayList;

    const-string v1, "PNG"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 181
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForWIPImage:Ljava/util/ArrayList;

    const-string v1, "gif"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 182
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForWIPImage:Ljava/util/ArrayList;

    const-string v1, "GIF"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 184
    :cond_43
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKUtils;->allowedFileExtensionsForWIPImage:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static getCreativeFieldsString(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "seperator"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 86
    .local p0, "strings":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    if-eqz p0, :cond_33

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_33

    .line 87
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 88
    .local v1, "finalString":Ljava/lang/StringBuffer;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;

    .line 89
    .local v0, "field":Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    if-lez v3, :cond_26

    .line 90
    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 91
    :cond_26
    invoke-virtual {v0}, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_11

    .line 93
    .end local v0    # "field":Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;
    :cond_2e
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 95
    .end local v1    # "finalString":Ljava/lang/StringBuffer;
    :goto_32
    return-object v2

    :cond_33
    const/4 v2, 0x0

    goto :goto_32
.end method

.method public static getFileExtension(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "filePath"    # Ljava/lang/String;

    .prologue
    const/4 v5, -0x1

    .line 138
    if-nez p0, :cond_5

    .line 139
    const/4 v5, 0x0

    .line 149
    :goto_4
    return-object v5

    .line 141
    :cond_5
    const/16 v6, 0x2e

    invoke-virtual {p0, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 142
    .local v1, "extensionPos":I
    const/16 v6, 0x2f

    invoke-virtual {p0, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    .line 143
    .local v3, "lastUnixPos":I
    const/16 v6, 0x5c

    invoke-virtual {p0, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    .line 144
    .local v4, "lastWindowsPos":I
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 145
    .local v2, "lastSeparator":I
    if-le v2, v1, :cond_23

    move v0, v5

    .line 146
    .local v0, "extensionIndex":I
    :goto_1e
    if-ne v0, v5, :cond_25

    .line 147
    const-string v5, ""

    goto :goto_4

    .end local v0    # "extensionIndex":I
    :cond_23
    move v0, v1

    .line 145
    goto :goto_1e

    .line 149
    .restart local v0    # "extensionIndex":I
    :cond_25
    add-int/lit8 v5, v0, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_4
.end method

.method public static isTagValidForProjectAndWIP(Ljava/lang/String;)Z
    .registers 5
    .param p0, "tagStr"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 234
    if-eqz p0, :cond_10d

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_10d

    const-string v2, "-?\\d+(\\.\\d+)?"

    invoke-virtual {p0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_10d

    .line 235
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    if-nez v2, :cond_f5

    .line 236
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    sput-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    .line 237
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "~"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 238
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "`"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 239
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "!"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 240
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "@"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 241
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "#"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 242
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "$"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 243
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "%"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 244
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "^"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 245
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 246
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "*"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 247
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 248
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 249
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 251
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "+"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 252
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 253
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 254
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 255
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "{"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 256
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "}"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 257
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "|"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 258
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "\\"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 259
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, ";"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 260
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 261
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 262
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 263
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "<"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 264
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, ">"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 265
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 266
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 267
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "?"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 268
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 270
    :cond_f5
    sget-object v2, Lcom/behance/sdk/util/BehanceSDKUtils;->restrictedCharForTagList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_fb
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_10e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 271
    .local v0, "restrictedChar":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_fb

    .line 277
    .end local v0    # "restrictedChar":Ljava/lang/String;
    :cond_10d
    :goto_10d
    return v1

    .line 275
    :cond_10e
    const/4 v1, 0x1

    goto :goto_10d
.end method

.method public static setContentViewDimensions(Landroid/content/Context;Landroid/view/View;)V
    .registers 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "contentView"    # Landroid/view/View;

    .prologue
    .line 99
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    sget v7, Lcom/behance/sdk/R$bool;->bsdk_show_view_full_screen:I

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    .line 100
    .local v3, "displayContentViewInFullScreen":Z
    if-nez v3, :cond_30

    .line 101
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    .line 102
    .local v4, "displayMetrics":Landroid/util/DisplayMetrics;
    iget v2, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 103
    .local v2, "deviceWidth":I
    iget v1, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 105
    .local v1, "deviceHeight":I
    if-lez v2, :cond_30

    if-lez v1, :cond_30

    .line 106
    int-to-float v6, v2

    const v7, 0x3f4ccccd

    mul-float/2addr v6, v7

    float-to-int v0, v6

    .line 107
    .local v0, "contentContainerWidth":I
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    .line 108
    .local v5, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v5, :cond_30

    .line 109
    iput v0, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 110
    const/4 v6, -0x2

    iput v6, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 111
    invoke-virtual {p1, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    .end local v0    # "contentContainerWidth":I
    .end local v1    # "deviceHeight":I
    .end local v2    # "deviceWidth":I
    .end local v4    # "displayMetrics":Landroid/util/DisplayMetrics;
    .end local v5    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    :cond_30
    return-void
.end method

.method public static setContentViewPaddings(Landroid/content/Context;Landroid/view/View;F)V
    .registers 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "contentView"    # Landroid/view/View;
    .param p2, "precentageScreenWidth"    # F

    .prologue
    .line 118
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 119
    .local v2, "displayMetrics":Landroid/util/DisplayMetrics;
    iget v1, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 120
    .local v1, "deviceWidth":I
    iget v0, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 122
    .local v0, "deviceHeight":I
    if-lez v1, :cond_24

    if-lez v0, :cond_24

    .line 123
    int-to-float v4, v1

    mul-float/2addr v4, p2

    float-to-int v4, v4

    sub-int v3, v1, v4

    .line 124
    .local v3, "totalPadding":I
    div-int/lit8 v4, v3, 0x2

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    div-int/lit8 v6, v3, 0x2

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v7

    invoke-virtual {p1, v4, v5, v6, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 126
    .end local v3    # "totalPadding":I
    :cond_24
    return-void
.end method

.method public static validateImageForWIP(Lcom/behance/sdk/project/modules/ImageModule;)Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;
    .registers 11
    .param p0, "imageModule"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 286
    if-eqz p0, :cond_6a

    .line 287
    invoke-virtual {p0}, Lcom/behance/sdk/project/modules/ImageModule;->getFile()Ljava/io/File;

    move-result-object v3

    .line 288
    .local v3, "imageFile":Ljava/io/File;
    if-eqz v3, :cond_6a

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_6a

    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v8

    if-eqz v8, :cond_6a

    .line 289
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    .line 291
    .local v2, "fileName":Ljava/lang/String;
    invoke-static {v2}, Lcom/behance/sdk/util/BehanceSDKUtils;->getFileExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 292
    .local v1, "fileExtension":Ljava/lang/String;
    if-eqz v1, :cond_39

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_39

    .line 293
    invoke-static {}, Lcom/behance/sdk/util/BehanceSDKUtils;->getAllowedFileExtensionsForWIPImage()Ljava/util/ArrayList;

    move-result-object v0

    .line 294
    .local v0, "allowedFileExtensionsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v0, :cond_3c

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_3c

    .line 295
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3c

    .line 296
    sget-object v8, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->INVALID_FILE_TYPE:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    .line 318
    .end local v0    # "allowedFileExtensionsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v1    # "fileExtension":Ljava/lang/String;
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "imageFile":Ljava/io/File;
    :goto_38
    return-object v8

    .line 300
    .restart local v1    # "fileExtension":Ljava/lang/String;
    .restart local v2    # "fileName":Ljava/lang/String;
    .restart local v3    # "imageFile":Ljava/io/File;
    :cond_39
    sget-object v8, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->INVALID_FILE_TYPE:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    goto :goto_38

    .line 303
    .restart local v0    # "allowedFileExtensionsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_3c
    invoke-virtual {p0}, Lcom/behance/sdk/project/modules/ImageModule;->getSizeInBytes()J

    move-result-wide v6

    .line 305
    .local v6, "imageSizeInBytes":J
    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-lez v8, :cond_4d

    const-wide/32 v8, 0xc00000

    cmp-long v8, v6, v8

    if-lez v8, :cond_50

    .line 306
    :cond_4d
    sget-object v8, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->INVALID_SIZE:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    goto :goto_38

    .line 309
    :cond_50
    invoke-virtual {p0}, Lcom/behance/sdk/project/modules/ImageModule;->getWidth()I

    move-result v5

    .line 310
    .local v5, "imageWidth":I
    invoke-virtual {p0}, Lcom/behance/sdk/project/modules/ImageModule;->getHeight()I

    move-result v4

    .line 311
    .local v4, "imageHeight":I
    if-lez v5, :cond_64

    if-lez v4, :cond_64

    const/16 v8, 0x280

    if-lt v5, v8, :cond_64

    const/16 v8, 0x140

    if-ge v4, v8, :cond_67

    .line 313
    :cond_64
    sget-object v8, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->INVALID_IMAGE_DIMENSIONS:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    goto :goto_38

    .line 315
    :cond_67
    sget-object v8, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->VALID:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    goto :goto_38

    .line 318
    .end local v0    # "allowedFileExtensionsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v1    # "fileExtension":Ljava/lang/String;
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "imageFile":Ljava/io/File;
    .end local v4    # "imageHeight":I
    .end local v5    # "imageWidth":I
    .end local v6    # "imageSizeInBytes":J
    :cond_6a
    sget-object v8, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->INVALID:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    goto :goto_38
.end method
