.class final Lit/sephiroth/android/library/picasso/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/picasso/Utils$OkHttpLoaderCreator;,
        Lit/sephiroth/android/library/picasso/Utils$BitmapHoneycombMR1;,
        Lit/sephiroth/android/library/picasso/Utils$PicassoThread;,
        Lit/sephiroth/android/library/picasso/Utils$PicassoThreadFactory;,
        Lit/sephiroth/android/library/picasso/Utils$ActivityManagerHoneycomb;
    }
.end annotation


# static fields
.field static final MAIN_THREAD_KEY_BUILDER:Ljava/lang/StringBuilder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sput-object v0, Lit/sephiroth/android/library/picasso/Utils;->MAIN_THREAD_KEY_BUILDER:Ljava/lang/StringBuilder;

    return-void
.end method

.method static calculateDiskCacheSize(Ljava/io/File;)J
    .registers 11
    .param p0, "dir"    # Ljava/io/File;

    .prologue
    .line 267
    const-wide/32 v2, 0x500000

    .line 270
    .local v2, "size":J
    :try_start_3
    new-instance v4, Landroid/os/StatFs;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 271
    .local v4, "statFs":Landroid/os/StatFs;
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockCount()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockSize()I

    move-result v5

    int-to-long v8, v5

    mul-long v0, v6, v8

    .line 273
    .local v0, "available":J
    const-wide/16 v6, 0x32

    div-long v2, v0, v6
    :try_end_1c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_1c} :catch_2b

    .line 278
    .end local v0    # "available":J
    .end local v4    # "statFs":Landroid/os/StatFs;
    :goto_1c
    const-wide/32 v6, 0x3200000

    invoke-static {v2, v3, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    const-wide/32 v8, 0x500000

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    return-wide v6

    .line 274
    :catch_2b
    move-exception v5

    goto :goto_1c
.end method

.method static calculateMemoryCacheSize(Landroid/content/Context;)I
    .registers 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/high16 v5, 0x100000

    .line 282
    const-string v3, "activity"

    invoke-static {p0, v3}, Lit/sephiroth/android/library/picasso/Utils;->getService(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 283
    .local v0, "am":Landroid/app/ActivityManager;
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/2addr v3, v5

    if-eqz v3, :cond_29

    const/4 v1, 0x1

    .line 284
    .local v1, "largeHeap":Z
    :goto_14
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result v2

    .line 285
    .local v2, "memoryClass":I
    if-eqz v1, :cond_24

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-lt v3, v4, :cond_24

    .line 286
    invoke-static {v0}, Lit/sephiroth/android/library/picasso/Utils$ActivityManagerHoneycomb;->getLargeMemoryClass(Landroid/app/ActivityManager;)I

    move-result v2

    .line 289
    :cond_24
    mul-int v3, v5, v2

    div-int/lit8 v3, v3, 0x7

    return v3

    .line 283
    .end local v1    # "largeHeap":Z
    .end local v2    # "memoryClass":I
    :cond_29
    const/4 v1, 0x0

    goto :goto_14
.end method

.method static checkMain()V
    .registers 2

    .prologue
    .line 136
    invoke-static {}, Lit/sephiroth/android/library/picasso/Utils;->isMain()Z

    move-result v0

    if-nez v0, :cond_e

    .line 137
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Method call should happen from the main thread."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 139
    :cond_e
    return-void
.end method

.method static checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 123
    .local p0, "value":Ljava/lang/Object;, "TT;"
    if-nez p0, :cond_8

    .line 124
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 126
    :cond_8
    return-object p0
.end method

.method static closeQuietly(Ljava/io/InputStream;)V
    .registers 2
    .param p0, "is"    # Ljava/io/InputStream;

    .prologue
    .line 222
    if-nez p0, :cond_3

    .line 227
    :goto_2
    return-void

    .line 224
    :cond_3
    :try_start_3
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_6} :catch_7

    goto :goto_2

    .line 225
    :catch_7
    move-exception v0

    goto :goto_2
.end method

.method static createDefaultCacheDir(Landroid/content/Context;)Ljava/io/File;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 258
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "picasso-cache"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 259
    .local v0, "cache":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_18

    .line 261
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 263
    :cond_18
    return-object v0
.end method

.method static createDefaultDownloader(Landroid/content/Context;)Lit/sephiroth/android/library/picasso/Downloader;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 250
    :try_start_0
    const-string v0, "com.squareup.okhttp.OkHttpClient"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 251
    invoke-static {p0}, Lit/sephiroth/android/library/picasso/Utils$OkHttpLoaderCreator;->create(Landroid/content/Context;)Lit/sephiroth/android/library/picasso/Downloader;
    :try_end_8
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_8} :catch_a

    move-result-object v0

    .line 254
    :goto_9
    return-object v0

    .line 252
    :catch_a
    move-exception v0

    .line 254
    new-instance v0, Lit/sephiroth/android/library/picasso/UrlConnectionDownloader;

    invoke-direct {v0, p0}, Lit/sephiroth/android/library/picasso/UrlConnectionDownloader;-><init>(Landroid/content/Context;)V

    goto :goto_9
.end method

.method static createKey(Lit/sephiroth/android/library/picasso/Request;)Ljava/lang/String;
    .registers 4
    .param p0, "data"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    .line 174
    sget-object v1, Lit/sephiroth/android/library/picasso/Utils;->MAIN_THREAD_KEY_BUILDER:Ljava/lang/StringBuilder;

    invoke-static {p0, v1}, Lit/sephiroth/android/library/picasso/Utils;->createKey(Lit/sephiroth/android/library/picasso/Request;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v0

    .line 175
    .local v0, "result":Ljava/lang/String;
    sget-object v1, Lit/sephiroth/android/library/picasso/Utils;->MAIN_THREAD_KEY_BUILDER:Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 176
    return-object v0
.end method

.method static createKey(Lit/sephiroth/android/library/picasso/Request;Ljava/lang/StringBuilder;)Ljava/lang/String;
    .registers 9
    .param p0, "data"    # Lit/sephiroth/android/library/picasso/Request;
    .param p1, "builder"    # Ljava/lang/StringBuilder;

    .prologue
    const/16 v6, 0x78

    const/16 v5, 0xa

    .line 180
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Request;->stableKey:Ljava/lang/String;

    if-eqz v3, :cond_96

    .line 181
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Request;->stableKey:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x32

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->ensureCapacity(I)V

    .line 182
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Request;->stableKey:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    :goto_18
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 193
    iget v3, p0, Lit/sephiroth/android/library/picasso/Request;->rotationDegrees:F

    const/4 v4, 0x0

    cmpl-float v3, v3, v4

    if-eqz v3, :cond_49

    .line 194
    const-string v3, "rotation:"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lit/sephiroth/android/library/picasso/Request;->rotationDegrees:F

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 195
    iget-boolean v3, p0, Lit/sephiroth/android/library/picasso/Request;->hasRotationPivot:Z

    if-eqz v3, :cond_46

    .line 196
    const/16 v3, 0x40

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lit/sephiroth/android/library/picasso/Request;->rotationPivotX:F

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lit/sephiroth/android/library/picasso/Request;->rotationPivotY:F

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 198
    :cond_46
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 200
    :cond_49
    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/Request;->hasSize()Z

    move-result v3

    if-eqz v3, :cond_67

    .line 201
    const-string v3, "resize:"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lit/sephiroth/android/library/picasso/Request;->targetWidth:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lit/sephiroth/android/library/picasso/Request;->targetHeight:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 202
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 204
    :cond_67
    iget-boolean v3, p0, Lit/sephiroth/android/library/picasso/Request;->centerCrop:Z

    if-eqz v3, :cond_ba

    .line 205
    const-string v3, "centerCrop"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 210
    :cond_74
    :goto_74
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Request;->transformations:Ljava/util/List;

    if-eqz v3, :cond_c8

    .line 212
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Request;->transformations:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "count":I
    :goto_7f
    if-ge v1, v0, :cond_c8

    .line 213
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Request;->transformations:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lit/sephiroth/android/library/picasso/Transformation;

    invoke-interface {v3}, Lit/sephiroth/android/library/picasso/Transformation;->key()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 212
    add-int/lit8 v1, v1, 0x1

    goto :goto_7f

    .line 183
    .end local v0    # "count":I
    .end local v1    # "i":I
    :cond_96
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    if-eqz v3, :cond_ae

    .line 184
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    .line 185
    .local v2, "path":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x32

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->ensureCapacity(I)V

    .line 186
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_18

    .line 188
    .end local v2    # "path":Ljava/lang/String;
    :cond_ae
    const/16 v3, 0x32

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->ensureCapacity(I)V

    .line 189
    iget v3, p0, Lit/sephiroth/android/library/picasso/Request;->resourceId:I

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto/16 :goto_18

    .line 206
    :cond_ba
    iget-boolean v3, p0, Lit/sephiroth/android/library/picasso/Request;->centerInside:Z

    if-eqz v3, :cond_74

    .line 207
    const-string v3, "centerInside"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_74

    .line 218
    :cond_c8
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method static flushStackLocalLeaks(Landroid/os/Looper;)V
    .registers 5
    .param p0, "looper"    # Landroid/os/Looper;

    .prologue
    .line 383
    new-instance v0, Lit/sephiroth/android/library/picasso/Utils$1;

    invoke-direct {v0, p0}, Lit/sephiroth/android/library/picasso/Utils$1;-><init>(Landroid/os/Looper;)V

    .line 388
    .local v0, "handler":Landroid/os/Handler;
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 389
    return-void
.end method

.method static getBitmapBytes(Landroid/graphics/Bitmap;)I
    .registers 5
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 111
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xc

    if-lt v1, v2, :cond_25

    .line 112
    invoke-static {p0}, Lit/sephiroth/android/library/picasso/Utils$BitmapHoneycombMR1;->getByteCount(Landroid/graphics/Bitmap;)I

    move-result v0

    .line 116
    .local v0, "result":I
    :goto_a
    if-gez v0, :cond_30

    .line 117
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Negative size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 114
    .end local v0    # "result":I
    :cond_25
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    mul-int v0, v1, v2

    .restart local v0    # "result":I
    goto :goto_a

    .line 119
    :cond_30
    return v0
.end method

.method static getLogIdsForHunter(Lit/sephiroth/android/library/picasso/BitmapHunter;)Ljava/lang/String;
    .registers 2
    .param p0, "hunter"    # Lit/sephiroth/android/library/picasso/BitmapHunter;

    .prologue
    .line 146
    const-string v0, ""

    invoke-static {p0, v0}, Lit/sephiroth/android/library/picasso/Utils;->getLogIdsForHunter(Lit/sephiroth/android/library/picasso/BitmapHunter;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static getLogIdsForHunter(Lit/sephiroth/android/library/picasso/BitmapHunter;Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "hunter"    # Lit/sephiroth/android/library/picasso/BitmapHunter;
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 150
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .local v2, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getAction()Lit/sephiroth/android/library/picasso/Action;

    move-result-object v0

    .line 152
    .local v0, "action":Lit/sephiroth/android/library/picasso/Action;
    if-eqz v0, :cond_14

    .line 153
    iget-object v5, v0, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v5}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    :cond_14
    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getActions()Ljava/util/List;

    move-result-object v1

    .line 156
    .local v1, "actions":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/Action;>;"
    if-eqz v1, :cond_3c

    .line 157
    const/4 v4, 0x0

    .local v4, "i":I
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    .local v3, "count":I
    :goto_1f
    if-ge v4, v3, :cond_3c

    .line 158
    if-gtz v4, :cond_25

    if-eqz v0, :cond_2a

    :cond_25
    const-string v5, ", "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    :cond_2a
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lit/sephiroth/android/library/picasso/Action;

    iget-object v5, v5, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v5}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    add-int/lit8 v4, v4, 0x1

    goto :goto_1f

    .line 162
    .end local v3    # "count":I
    .end local v4    # "i":I
    :cond_3c
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method static getResourceId(Landroid/content/res/Resources;Lit/sephiroth/android/library/picasso/Request;)I
    .registers 12
    .param p0, "resources"    # Landroid/content/res/Resources;
    .param p1, "data"    # Lit/sephiroth/android/library/picasso/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 334
    iget v6, p1, Lit/sephiroth/android/library/picasso/Request;->resourceId:I

    if-nez v6, :cond_a

    iget-object v6, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    if-nez v6, :cond_d

    .line 335
    :cond_a
    iget v1, p1, Lit/sephiroth/android/library/picasso/Request;->resourceId:I

    .line 359
    :goto_c
    return v1

    .line 338
    :cond_d
    iget-object v6, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v6}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v3

    .line 339
    .local v3, "pkg":Ljava/lang/String;
    if-nez v3, :cond_30

    new-instance v6, Ljava/io/FileNotFoundException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "No package provided: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 342
    :cond_30
    iget-object v6, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v6}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    .line 343
    .local v4, "segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v4, :cond_3e

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_59

    .line 344
    :cond_3e
    new-instance v6, Ljava/io/FileNotFoundException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "No path segments: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 345
    :cond_59
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    if-ne v6, v9, :cond_87

    .line 347
    const/4 v6, 0x0

    :try_start_60
    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_69
    .catch Ljava/lang/NumberFormatException; {:try_start_60 .. :try_end_69} :catch_6b

    move-result v1

    .local v1, "id":I
    goto :goto_c

    .line 348
    .end local v1    # "id":I
    :catch_6b
    move-exception v0

    .line 349
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v6, Ljava/io/FileNotFoundException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Last path segment is not a resource ID: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 351
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_87
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    const/4 v7, 0x2

    if-ne v6, v7, :cond_a0

    .line 352
    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 353
    .local v5, "type":Ljava/lang/String;
    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 355
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p0, v2, v5, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 356
    .restart local v1    # "id":I
    goto/16 :goto_c

    .line 357
    .end local v1    # "id":I
    .end local v2    # "name":Ljava/lang/String;
    .end local v5    # "type":Ljava/lang/String;
    :cond_a0
    new-instance v6, Ljava/io/FileNotFoundException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "More than two path segments: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method static getResources(Landroid/content/Context;Lit/sephiroth/android/library/picasso/Request;)Landroid/content/res/Resources;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "data"    # Lit/sephiroth/android/library/picasso/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 363
    iget v3, p1, Lit/sephiroth/android/library/picasso/Request;->resourceId:I

    if-nez v3, :cond_8

    iget-object v3, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    if-nez v3, :cond_d

    .line 364
    :cond_8
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 371
    :goto_c
    return-object v3

    .line 367
    :cond_d
    iget-object v3, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    .line 368
    .local v1, "pkg":Ljava/lang/String;
    if-nez v1, :cond_30

    new-instance v3, Ljava/io/FileNotFoundException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No package provided: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 370
    :cond_30
    :try_start_30
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 371
    .local v2, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {v2, v1}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;
    :try_end_37
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_30 .. :try_end_37} :catch_39

    move-result-object v3

    goto :goto_c

    .line 372
    .end local v2    # "pm":Landroid/content/pm/PackageManager;
    :catch_39
    move-exception v0

    .line 373
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v3, Ljava/io/FileNotFoundException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to obtain resources for package: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method static getService(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "service"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 305
    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static hasPermission(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permission"    # Ljava/lang/String;

    .prologue
    .line 309
    invoke-virtual {p0, p1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method static isAirplaneModeOn(Landroid/content/Context;)Z
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 293
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 295
    .local v0, "contentResolver":Landroid/content/ContentResolver;
    :try_start_5
    const-string v3, "airplane_mode_on"

    const/4 v4, 0x0

    invoke-static {v0, v3, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    :try_end_b
    .catch Ljava/lang/NullPointerException; {:try_start_5 .. :try_end_b} :catch_10

    move-result v3

    if-eqz v3, :cond_f

    const/4 v2, 0x1

    .line 299
    :cond_f
    :goto_f
    return v2

    .line 296
    :catch_10
    move-exception v1

    .line 299
    .local v1, "e":Ljava/lang/NullPointerException;
    goto :goto_f
.end method

.method static isMain()Z
    .registers 2

    .prologue
    .line 142
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method static isWebPFile(Ljava/io/InputStream;)Z
    .registers 9
    .param p0, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x4

    const/16 v4, 0xc

    const/4 v2, 0x0

    .line 323
    new-array v0, v4, [B

    .line 324
    .local v0, "fileHeaderBytes":[B
    const/4 v1, 0x0

    .line 325
    .local v1, "isWebPFile":Z
    invoke-virtual {p0, v0, v2, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    if-ne v3, v4, :cond_2e

    .line 327
    const-string v3, "RIFF"

    new-instance v4, Ljava/lang/String;

    const-string v5, "US-ASCII"

    invoke-direct {v4, v0, v2, v7, v5}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2f

    const-string v3, "WEBP"

    new-instance v4, Ljava/lang/String;

    const/16 v5, 0x8

    const-string v6, "US-ASCII"

    invoke-direct {v4, v0, v5, v7, v6}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 328
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2f

    const/4 v1, 0x1

    .line 330
    :cond_2e
    :goto_2e
    return v1

    :cond_2f
    move v1, v2

    .line 328
    goto :goto_2e
.end method

.method static log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "owner"    # Ljava/lang/String;
    .param p1, "verb"    # Ljava/lang/String;
    .param p2, "logId"    # Ljava/lang/String;

    .prologue
    .line 166
    const-string v0, ""

    invoke-static {p0, p1, p2, v0}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    return-void
.end method

.method static log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p0, "owner"    # Ljava/lang/String;
    .param p1, "verb"    # Ljava/lang/String;
    .param p2, "logId"    # Ljava/lang/String;
    .param p3, "extras"    # Ljava/lang/String;

    .prologue
    .line 170
    const-string v0, "Picasso"

    const-string v1, "%1$-11s %2$-12s %3$s %4$s"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    aput-object p3, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    return-void
.end method

.method static parseResponseSourceHeader(Ljava/lang/String;)Z
    .registers 7
    .param p0, "header"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 231
    if-nez p0, :cond_5

    .line 244
    :cond_4
    :goto_4
    return v3

    .line 234
    :cond_5
    const-string v4, " "

    const/4 v5, 0x2

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 235
    .local v1, "parts":[Ljava/lang/String;
    const-string v4, "CACHE"

    aget-object v5, v1, v3

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_18

    move v3, v2

    .line 236
    goto :goto_4

    .line 238
    :cond_18
    array-length v4, v1

    if-eq v4, v2, :cond_4

    .line 242
    :try_start_1b
    const-string v4, "CONDITIONAL_CACHE"

    const/4 v5, 0x0

    aget-object v5, v1, v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_33

    const/4 v4, 0x1

    aget-object v4, v1, v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_2c
    .catch Ljava/lang/NumberFormatException; {:try_start_1b .. :try_end_2c} :catch_35

    move-result v4

    const/16 v5, 0x130

    if-ne v4, v5, :cond_33

    :goto_31
    move v3, v2

    goto :goto_4

    :cond_33
    move v2, v3

    goto :goto_31

    .line 243
    :catch_35
    move-exception v0

    .line 244
    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_4
.end method

.method static toByteArray(Ljava/io/InputStream;)[B
    .registers 5
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 313
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 314
    .local v1, "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    const/16 v3, 0x1000

    new-array v0, v3, [B

    .line 316
    .local v0, "buffer":[B
    :goto_9
    const/4 v3, -0x1

    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "n":I
    if-eq v3, v2, :cond_15

    .line 317
    const/4 v3, 0x0

    invoke-virtual {v1, v0, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_9

    .line 319
    :cond_15
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3
.end method
